require 'test_helper'

class MachinesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @machine = machines(:one)
  end

  test "should get index" do
    get machines_url
    assert_response :success
  end

  test "should get new" do
    get new_machine_url
    assert_response :success
  end

  test "should create machine" do
    assert_difference('Machine.count') do
      post machines_url, params: { machine: { annotation: @machine.annotation, conclusion: @machine.conclusion, evaluation_point: @machine.evaluation_point, feature: @machine.feature, introduction_date: @machine.introduction_date, introduction_season: @machine.introduction_season, judgment: @machine.judgment, kana: @machine.kana, manufacturer: @machine.manufacturer, name: @machine.name, other: @machine.other, overview: @machine.overview, problem: @machine.problem, pros_and_cons: @machine.pros_and_cons, spec: @machine.spec, type: @machine.type } }
    end

    assert_redirected_to machine_url(Machine.last)
  end

  test "should show machine" do
    get machine_url(@machine)
    assert_response :success
  end

  test "should get edit" do
    get edit_machine_url(@machine)
    assert_response :success
  end

  test "should update machine" do
    patch machine_url(@machine), params: { machine: { annotation: @machine.annotation, conclusion: @machine.conclusion, evaluation_point: @machine.evaluation_point, feature: @machine.feature, introduction_date: @machine.introduction_date, introduction_season: @machine.introduction_season, judgment: @machine.judgment, kana: @machine.kana, manufacturer: @machine.manufacturer, name: @machine.name, other: @machine.other, overview: @machine.overview, problem: @machine.problem, pros_and_cons: @machine.pros_and_cons, spec: @machine.spec, type: @machine.type } }
    assert_redirected_to machine_url(@machine)
  end

  test "should destroy machine" do
    assert_difference('Machine.count', -1) do
      delete machine_url(@machine)
    end

    assert_redirected_to machines_url
  end
end
