class UsersController < SecuredController
  skip_before_action :authorize_request, only: [:index, :show]
  def index
    users = User.all
    render json: users, include: [:favourites]
  end

  def show
    user = User.find(params[:id])
    render json: user, include: [:favourites]
  rescue ActiveRecord::RecordNotFound
    head :not_found
  end

  def create
    user = User.create!(chirp_params)
    render json: user, status: :created
  end

  def destroy
    user = User.find(params[:id])
    user.delete
    head :no_content
  end

  private

  def chirp_params
    params.permit(:sub, :email, :name, :given_name, :family_name, :picture)
  end
end