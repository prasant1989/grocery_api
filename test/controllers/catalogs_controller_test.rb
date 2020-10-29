require 'test_helper'

class CatalogsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @catalog = catalogs(:one)
  end

  test "should get index" do
    get catalogs_url, as: :json
    assert_response :success
  end

  test "should create catalog" do
    assert_difference('Catalog.count') do
      post catalogs_url, params: { catalog: { name: @catalog.name, unit: @catalog.unit } }, as: :json
    end

    assert_response 201
  end

  test "should show catalog" do
    get catalog_url(@catalog), as: :json
    assert_response :success
  end

  test "should update catalog" do
    patch catalog_url(@catalog), params: { catalog: { name: @catalog.name, unit: @catalog.unit } }, as: :json
    assert_response 200
  end

  test "should destroy catalog" do
    assert_difference('Catalog.count', -1) do
      delete catalog_url(@catalog), as: :json
    end

    assert_response 204
  end
end
