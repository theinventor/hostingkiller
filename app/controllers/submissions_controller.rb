class SubmissionsController < ApplicationController
  before_action :set_support_request, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token, only: [:notify]

  # GET /support_requests
  # GET /support_requests.json
  def index
  end

  # GET /support_requests/1
  # GET /support_requests/1.json
  def show
  end

  def notify
    puts params
    sr = SupportRequest.find_by_domain params[:item_number]
    if sr
      sr.update_attributes(paid: true, paypal_params: params)
      begin
        SupportMailer.comment(sr,"We just got a payment, you are good to go!\n\nDomain: #{sr.domain}").deliver
      rescue => ex
      end
      render text: 'Success' and return
    else
      render text: 'Not Found' and return
    end
  end

  def existing

  end

  # GET /support_requests/new
  def new
    @support_request = SupportRequest.new
  end

  # GET /support_requests/1/edit
  def edit
  end

  # POST /support_requests
  # POST /support_requests.json
  def create
    @support_request = SupportRequest.new(support_request_params)

    respond_to do |format|
      if @support_request.save
        format.html { redirect_to submission_path(@support_request.token), notice: 'Support request was successfully created.' }
        format.json { render action: 'show', status: :created, location: @support_request }
      else
        format.html { render action: 'new' }
        format.json { render json: @support_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /support_requests/1
  # PATCH/PUT /support_requests/1.json
  def update
    respond_to do |format|
      if @support_request.update(support_request_params)
        format.html { redirect_to submission_path(@support_request.token), notice: 'Support request was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @support_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /support_requests/1
  # DELETE /support_requests/1.json
  def destroy
    @support_request.destroy
    respond_to do |format|
      format.html { redirect_to support_requests_url }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_support_request
    @support_request = SupportRequest.find_by_token(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def support_request_params
    params.require(:support_request).permit(:domain, :customer_email, :name, :phone, :want_to_cancel, :balance_due, :paid, :paypal_params, :registrar, :whois, :ip_address, :cpanel_user, :notes)
  end

end
