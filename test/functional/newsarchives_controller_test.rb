# -*- encoding : utf-8 -*-
require File.dirname(__FILE__) + '/../test_helper'

class NewsarchivesControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:newsarchives)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_newsarchive
    assert_difference('Newsarchive.count') do
      post :create, :newsarchive => { }
    end

    assert_redirected_to newsarchive_path(assigns(:newsarchive))
  end

  def test_should_show_newsarchive
    get :show, :id => newsarchives(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => newsarchives(:one).id
    assert_response :success
  end

  def test_should_update_newsarchive
    put :update, :id => newsarchives(:one).id, :newsarchive => { }
    assert_redirected_to newsarchive_path(assigns(:newsarchive))
  end

  def test_should_destroy_newsarchive
    assert_difference('Newsarchive.count', -1) do
      delete :destroy, :id => newsarchives(:one).id
    end

    assert_redirected_to newsarchives_path
  end
end
