require "test_helper"

class ContactUsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get contact_us_new_url
    assert_response :success
  end

  test "should get create" do
    get contact_us_create_url
    assert_response :success
  end
end
