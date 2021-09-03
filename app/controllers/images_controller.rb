class ImagesController < SecuredController
  skip_before_action :authorize_request, only: %i[index show]

  def index
    images = Image.all
    render json: images
  end

  def show
    image = Image.find(params[:id])
    render json: image
  rescue ActiveRecord::RecordNotFound
    head :not_found
  end

  def create
    image = Image.create!(image_params)
    render json: image, status: :created
  end

  def destroy
    image = Image.find(params[:id])
    image.delete
    head :no_content
  end

  private

  def image_params
    params.permit(:url, :country_id)
  end
end
