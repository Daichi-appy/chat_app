require "test_helper"

class PostsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  def setup
    @user = users(:john)
  end

  # test "正常にアクセスできること" do
  #   sign_in @user
  #   get root_path
  #   assert_response :success
  # end
end
