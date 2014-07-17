# -*- encoding : utf-8 -*-
require 'test_helper'

class WelcomeControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get about" do
    get :about
    assert_response :success
  end

  test "should get jobs" do
    get :jobs
    assert_response :success
  end

  test "should get media" do
    get :media
    assert_response :success
  end

end
