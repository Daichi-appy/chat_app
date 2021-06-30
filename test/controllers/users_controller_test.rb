require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  def setup
    @user = users(:john)
    sign_in @user
    @post = Post.new(title: "Lorem ipsum", body: "foo bar", user_id: @user.id)
  end

end
