class Api::V1::ShotsController < Api::V1::GraphitiController
  def index
    shots = ShotResource.all(params)
    respond_with(shots)
  end

  def show
    shot = ShotResource.find(params)
    respond_with(shot)
  end

  def create
    shot = ShotResource.build(params)

    if shot.save
      render jsonapi: shot, status: 201
    else
      render jsonapi_errors: shot
    end
  end

  def update
    shot = ShotResource.find(params)

    if shot.update_attributes
      render jsonapi: shot
    else
      render jsonapi_errors: shot
    end
  end

  def destroy
    shot = ShotResource.find(params)

    if shot.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: shot
    end
  end
end
