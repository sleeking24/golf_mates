class Api::V1::HolesOverviewsController < Api::V1::GraphitiController
  def index
    holes_overviews = HolesOverviewResource.all(params)
    respond_with(holes_overviews)
  end

  def show
    holes_overview = HolesOverviewResource.find(params)
    respond_with(holes_overview)
  end

  def create
    holes_overview = HolesOverviewResource.build(params)

    if holes_overview.save
      render jsonapi: holes_overview, status: :created
    else
      render jsonapi_errors: holes_overview
    end
  end

  def update
    holes_overview = HolesOverviewResource.find(params)

    if holes_overview.update_attributes
      render jsonapi: holes_overview
    else
      render jsonapi_errors: holes_overview
    end
  end

  def destroy
    holes_overview = HolesOverviewResource.find(params)

    if holes_overview.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: holes_overview
    end
  end
end
