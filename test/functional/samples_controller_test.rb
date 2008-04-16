require File.dirname(__FILE__) + '/../test_helper'

class SamplesControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:sample)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_sample
    assert_difference('Sample.count') do
      post :create, :sample => { }
    end

    assert_redirected_to sample_path(assigns(:sample))
  end

  def test_should_show_sample
    get :show, :id => sample(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => sample(:one).id
    assert_response :success
  end

  def test_should_update_sample
    put :update, :id => sample(:one).id, :sample => { }
    assert_redirected_to sample_path(assigns(:sample))
  end

  def test_should_destroy_sample
    assert_difference('Sample.count', -1) do
      delete :destroy, :id => sample(:one).id
    end

    assert_redirected_to sample_path
  end
end
