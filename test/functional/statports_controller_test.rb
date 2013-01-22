require 'test_helper'

class StatportsControllerTest < ActionController::TestCase
  setup do
    @statport = statports(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:statports)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create statport" do
    assert_difference('Statport.count') do
      post :create, statport: { city_id: @statport.city_id, g1cli: @statport.g1cli, g1free: @statport.g1free, g1leased: @statport.g1leased, g1trunk: @statport.g1trunk, ip: @statport.ip, model_id: @statport.model_id, pbad: @statport.pbad, pbadlist: @statport.pbadlist, pfree: @statport.pfree, phome: @statport.phome, pleased: @statport.pleased, sigport: @statport.sigport, street_id: @statport.street_id }
    end

    assert_redirected_to statport_path(assigns(:statport))
  end

  test "should show statport" do
    get :show, id: @statport
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @statport
    assert_response :success
  end

  test "should update statport" do
    put :update, id: @statport, statport: { city_id: @statport.city_id, g1cli: @statport.g1cli, g1free: @statport.g1free, g1leased: @statport.g1leased, g1trunk: @statport.g1trunk, ip: @statport.ip, model_id: @statport.model_id, pbad: @statport.pbad, pbadlist: @statport.pbadlist, pfree: @statport.pfree, phome: @statport.phome, pleased: @statport.pleased, sigport: @statport.sigport, street_id: @statport.street_id }
    assert_redirected_to statport_path(assigns(:statport))
  end

  test "should destroy statport" do
    assert_difference('Statport.count', -1) do
      delete :destroy, id: @statport
    end

    assert_redirected_to statports_path
  end
end
