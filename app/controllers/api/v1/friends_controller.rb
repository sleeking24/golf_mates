class Api::V1::FriendsController < Api::V1::GraphitiController
  def index
    friends = FriendResource.all(params)
    respond_with(friends)
  end

  def show
    friend = FriendResource.find(params)
    respond_with(friend)
  end

  def create
    friend = FriendResource.build(params)

    if friend.save
      render jsonapi: friend, status: :created
    else
      render jsonapi_errors: friend
    end
  end

  def update
    friend = FriendResource.find(params)

    if friend.update_attributes
      render jsonapi: friend
    else
      render jsonapi_errors: friend
    end
  end

  def destroy
    friend = FriendResource.find(params)

    if friend.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: friend
    end
  end
end
