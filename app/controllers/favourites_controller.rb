class FavouritesController < SecuredController
  skip_before_action :authorize_request, only: %i[index show]

  def index
    favourites = Favourite.all
    render json: favourites
  end

  def show
    favourite = Favourite.find(params[:id])
    render json: favourite
  rescue ActiveRecord::RecordNotFound
    head :not_found
  end

  def create
    favourite = Favourite.create!(favourite_params)
    render json: favourite, status: :created
  end

  def destroy
    favourite = Favourite.find(params[:id])
    favourite.delete
    head :no_content
  end

  private

  def favourite_params
    params.permit(:user_id, :country_id)
  end
end
