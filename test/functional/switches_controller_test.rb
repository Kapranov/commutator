require 'test_helper'

class SwitchesControllerTest < ActionController::TestCase
  setup do
    @switch = switches(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:switches)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create switch" do
    assert_difference('Switch.count') do
      post :create, switch: { active: @switch.active, city_id: @switch.city_id, house: @switch.house, install: @switch.install, login: @switch.login, mac: @switch.mac, model_id: @switch.model_id, multicast: @switch.multicast, num: @switch.num, password: @switch.password, porch: @switch.porch, pos: @switch.pos, serial: @switch.serial, snmpw: @switch.snmpw, statport_id: @switch.statport_id, street_id: @switch.street_id }
    end

    assert_redirected_to switch_path(assigns(:switch))
  end

  test "should show switch" do
    get :show, id: @switch
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @switch
    assert_response :success
  end

  test "should update switch" do
    put :update, id: @switch, switch: { active: @switch.active, city_id: @switch.city_id, house: @switch.house, install: @switch.install, login: @switch.login, mac: @switch.mac, model_id: @switch.model_id, multicast: @switch.multicast, num: @switch.num, password: @switch.password, porch: @switch.porch, pos: @switch.pos, serial: @switch.serial, snmpw: @switch.snmpw, statport_id: @switch.statport_id, street_id: @switch.street_id }
    assert_redirected_to switch_path(assigns(:switch))
  end

  test "should destroy switch" do
    assert_difference('Switch.count', -1) do
      delete :destroy, id: @switch
    end

    assert_redirected_to switches_path
  end
end
