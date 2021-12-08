class Api::V1::HolesResultsController < Api::V1::GraphitiController
  def index
    holes_results = HolesResultResource.all(params)
    respond_with(holes_results)
  end

  def show
    holes_result = HolesResultResource.find(params)
    respond_with(holes_result)
  end

  def create
    holes_result = HolesResultResource.build(params)

    if holes_result.save
      render jsonapi: holes_result, status: :created
    else
      render jsonapi_errors: holes_result
    end
  end

  def update
    holes_result = HolesResultResource.find(params)

    if holes_result.update_attributes
      render jsonapi: holes_result
    else
      render jsonapi_errors: holes_result
    end
  end

  def destroy
    holes_result = HolesResultResource.find(params)

    if holes_result.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: holes_result
    end
  end
end
