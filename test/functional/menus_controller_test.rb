# -*- encoding : utf-8 -*-
require File.dirname(__FILE__) + '/../test_helper'

class MenusControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:menus)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_menu
    assert_difference('Menu.count') do
      post :create, :menu => { }
    end

    assert_redirected_to menu_path(assigns(:menu))
  end

  def test_should_show_menu
    get :show, :id => menus(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => menus(:one).id
    assert_response :success
  end

  def test_should_update_menu
    put :update, :id => menus(:one).id, :menu => { }
    assert_redirected_to menu_path(assigns(:menu))
  end

  def test_should_destroy_menu
    assert_difference('Menu.count', -1) do
      delete :destroy, :id => menus(:one).id
    end

    assert_redirected_to menus_path
  end
end
