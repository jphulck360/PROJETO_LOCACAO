require 'test_helper'

class ModelCarsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @model_car = model_cars(:one)
  end

  test "should get index" do
    get model_cars_url
    assert_response :success
  end

  test "should get new" do
    get new_model_car_url
    assert_response :success
  end

  test "should create model_car" do
    assert_difference('ModelCar.count') do
      post model_cars_url, params: { model_car: { modelo_desc: @model_car.modelo_desc } }
    end

    assert_redirected_to model_car_url(ModelCar.last)
  end

  test "should show model_car" do
    get model_car_url(@model_car)
    assert_response :success
  end

  test "should get edit" do
    get edit_model_car_url(@model_car)
    assert_response :success
  end

  test "should update model_car" do
    patch model_car_url(@model_car), params: { model_car: { modelo_desc: @model_car.modelo_desc } }
    assert_redirected_to model_car_url(@model_car)
  end

  test "should destroy model_car" do
    assert_difference('ModelCar.count', -1) do
      delete model_car_url(@model_car)
    end

    assert_redirected_to model_cars_url
  end
end
