require "test_helper"

class PostTest < ActiveSupport::TestCase
  include Devise::Test::IntegrationHelpers

  def setup
    @user = users(:john)
    # sign_in @user
    @post = @user.posts.build(title: "Lorem ipsum", body: "foo bar")
    @user1 = User.new(name: "Example User", email: "user@example.com",
                  password: "foobar", password_confirmation: "foobar")
  end

  test "保存できていること" do
    assert @post.valid? 
  end

  test "titleが空欄だと保存できないこと" do
    @post.title = " "
    assert_not @post.valid?
  end

  test "bodyが空欄だと保存できないこと" do
    @post.body = " "
    assert_not @post.valid?
  end

  test "投稿日時が新しいものが最初に来ること" do
    assert_equal posts(:most_recent), Post.first
  end

  test "ユーザーの削除で紐づいた投稿も削除" do
    @user1.save
    @user1.posts.create!(title: "Hello", body: "goodbye")
    assert_difference 'Post.count', -1 do
      @user1.destroy
    end
  end
end
