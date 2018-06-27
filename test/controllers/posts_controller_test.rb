require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:michael)
    @post = posts(:orange)
  end

  test "should get index" do
    get posts_url
    assert_response :success
  end

  test "should get new" do
    log_in_as(@user)
    get new_post_url
    assert_response :success
  end


  test "should create post" do
    log_in_as(@user)
    assert_difference('Post.count') do
      post posts_url, params: { post: {title: @post.title, content: @post.content, user_id: @post.user_id } }
    end

    #assert_redirected_to post_url(Post.last)
  end

  test "should show post" do
    get post_url(@post)
    assert_response :success
  end

  test "should get edit" do
    get edit_post_url(@post)
    assert_response :success
  end

=begin
  test "should update post" do
    patch post_url(@post), params: { post: { content: @post.content, user_id: @post.user_id } }
    assert_redirected_to post_url(@post)
  end
=end

  test "should destroy post" do
    assert_difference('Post.count', -1) do
      log_in_as(@user)
      delete post_url(@post)
    end

    assert_redirected_to posts_url
  end
end
