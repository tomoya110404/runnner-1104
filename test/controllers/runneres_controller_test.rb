require 'test_helper'

class RunneresControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get runneres_index_url
    assert_response :success
  end

end
