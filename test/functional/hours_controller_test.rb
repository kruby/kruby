# -*- encoding : utf-8 -*-
require File.dirname(__FILE__) + '/../test_helper'

class HoursControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:hours)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_hour
    assert_difference('Hour.count') do
      post :create, :hour => { }
    end

    assert_redirected_to hour_path(assigns(:hour))
  end

  def test_should_show_hour
    get :show, :id => hours(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => hours(:one).id
    assert_response :success
  end

  def test_should_update_hour
    put :update, :id => hours(:one).id, :hour => { }
    assert_redirected_to hour_path(assigns(:hour))
  end

  def test_should_destroy_hour
    assert_difference('Hour.count', -1) do
      delete :destroy, :id => hours(:one).id
    end

    assert_redirected_to hours_path
  end
end
