require 'test_helper'

class SupportRequestsControllerTest < ActionController::TestCase
  setup do
    @support_request = support_requests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:support_requests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create support_request" do
    assert_difference('SupportRequest.count') do
      post :create, support_request: { balance_due: @support_request.balance_due, cpanel_user: @support_request.cpanel_user, customer_email: @support_request.customer_email, domain: @support_request.domain, ip_address: @support_request.ip_address, name: @support_request.name, notes: @support_request.notes, paid: @support_request.paid, phone: @support_request.phone, registrar: @support_request.registrar, transaction_params: @support_request.transaction_params, want_to_cancel: @support_request.want_to_cancel, whois: @support_request.whois }
    end

    assert_redirected_to support_request_path(assigns(:support_request))
  end

  test "should show support_request" do
    get :show, id: @support_request
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @support_request
    assert_response :success
  end

  test "should update support_request" do
    patch :update, id: @support_request, support_request: { balance_due: @support_request.balance_due, cpanel_user: @support_request.cpanel_user, customer_email: @support_request.customer_email, domain: @support_request.domain, ip_address: @support_request.ip_address, name: @support_request.name, notes: @support_request.notes, paid: @support_request.paid, phone: @support_request.phone, registrar: @support_request.registrar, transaction_params: @support_request.transaction_params, want_to_cancel: @support_request.want_to_cancel, whois: @support_request.whois }
    assert_redirected_to support_request_path(assigns(:support_request))
  end

  test "should destroy support_request" do
    assert_difference('SupportRequest.count', -1) do
      delete :destroy, id: @support_request
    end

    assert_redirected_to support_requests_path
  end
end
