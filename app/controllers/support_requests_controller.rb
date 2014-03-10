class SupportRequestsController < ApplicationController
  before_action :set_support_request, only: [:show, :edit, :update, :destroy, :recheck, :add_comment]
  before_filter :authenticate!

  # GET /support_requests
  # GET /support_requests.json
  def index
    @support_requests = SupportRequest.order('updated_at DESC').where(disabled: false)
  end

  # GET /support_requests/1
  # GET /support_requests/1.json
  def show

  end

  def recheck
    @support_request.recheck
    redirect_to @support_request
  end

  def add_comment
    @comment = @support_request.comments.new(comment_params)
    respond_to do |format|
      if @comment.save
        format.html { redirect_to (request.referrer || @support_request), notice: 'Comment was successfully created.' }
        format.js {}
        format.json { render action: 'show', status: :created, location: @comment }
      else
        format.html { render action: 'new' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end

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
        format.html { redirect_to @support_request, notice: 'Support request was successfully created.' }
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
        format.html { redirect_to @support_request, notice: 'Support request was successfully updated.' }
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
    @support_request.update_column :disabled, true
    respond_to do |format|
      format.html { redirect_to support_requests_url }
      format.json { head :no_content }
    end
  end

  private
# Use callbacks to share common setup or constraints between actions.
  def set_support_request
    @support_request = SupportRequest.find(params[:id])
  end

# Never trust parameters from the scary internet, only allow the white list through.
  def support_request_params
    params.require(:support_request).permit(:domain, :customer_email, :name, :phone, :want_to_cancel, :balance_due, :paid, :paypal_params, :registrar, :whois, :ip_address, :cpanel_user, :notes)
  end
  def comment_params
    params.require(:comment).permit(:support_request_id, :from, :body)
  end
end
