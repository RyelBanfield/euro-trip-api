class CountriesController < SecuredController
  skip_before_action :authorize_request, only: [:index, :show]

  def index
    countries = Country.all
    render json: countries, include: [:images]
  end

  def show
    country = Country.find(params[:id])
    render json: country, include: [:images]
  rescue ActiveRecord::RecordNotFound
    head :not_found
  end

  def create
    country = Country.create!(country_params)
    render json: country, status: :created
  end

  def destroy
    country = Country.find(params[:id])
    country.delete
    head :no_content
  end

  private

  def country_params
    params.permit(:name, :captial, :population, :language, :currency, :flag)
  end
end