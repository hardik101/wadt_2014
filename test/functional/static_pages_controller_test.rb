require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test "should get format" do
    get :format
    assert_response :success
  end

  test "should get speakers" do
    get :speakers
    assert_response :success
  end

  test "should get submission" do
    get :submission
    assert_response :success
  end

  test "should get abstracts" do
    get :abstracts
    assert_response :success
  end

  test "should get proceedings" do
    get :proceedings
    assert_response :success
  end

  test "should get program" do
    get :program
    assert_response :success
  end

  test "should get grants" do
    get :grants
    assert_response :success
  end

  test "should get sponsorships" do
    get :sponsorships
    assert_response :success
  end

  test "should get travel" do
    get :travel
    assert_response :success
  end

  test "should get contact" do
    get :contact
    assert_response :success
  end

end
