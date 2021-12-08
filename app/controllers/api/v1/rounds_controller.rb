class Api::V1::RoundsController < Api::V1::GraphitiController
  def index
    rounds = RoundResource.all(params)
    respond_with(rounds)
  end

  def show
    round = RoundResource.find(params)
    respond_with(round)
  end

  def create
    round = RoundResource.build(params)

    if round.save
      render jsonapi: round, status: 201
    else
      render jsonapi_errors: round
    end
  end

  def update
    round = RoundResource.find(params)

    if round.update_attributes
      render jsonapi: round
    else
      render jsonapi_errors: round
    end
  end

  def destroy
    round = RoundResource.find(params)

    if round.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: round
    end
  end
end
