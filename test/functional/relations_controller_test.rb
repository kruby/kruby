# -*- encoding : utf-8 -*-
require File.dirname(__FILE__) + '/../test_helper'

class RelationsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:relations)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_relation
    assert_difference('Relation.count') do
      post :create, :relation => { }
    end

    assert_redirected_to relation_path(assigns(:relation))
  end

  def test_should_show_relation
    get :show, :id => relations(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => relations(:one).id
    assert_response :success
  end

  def test_should_update_relation
    put :update, :id => relations(:one).id, :relation => { }
    assert_redirected_to relation_path(assigns(:relation))
  end

  def test_should_destroy_relation
    assert_difference('Relation.count', -1) do
      delete :destroy, :id => relations(:one).id
    end

    assert_redirected_to relations_path
  end
end
