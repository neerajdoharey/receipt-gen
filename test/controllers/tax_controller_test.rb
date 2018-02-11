require 'test_helper'

class TaxControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get tax_index_url
    assert_response :success
  end

  test "should get new" do
    get tax_new_url
    assert_response :success
  end

  test "should get edit" do
    get tax_edit_url
    assert_response :success
  end

end
