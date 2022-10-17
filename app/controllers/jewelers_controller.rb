class JewelersController < ApplicationController

  before_action :find_jeweler, only: [:show, :edit, :update, :destroy]

  def index
    @jewelers = Jeweler.order(:id)
  end

  def show
    @jewels = @jeweler.jewels.order(:id)
  end

  def new
    @jeweler = Jeweler.new
  end

  def create
    @jeweler = Jeweler.new(jeweler_params)

    if @jeweler.save
      redirect_to jewelers_path
    else
      render_error_messages(@jeweler)
    end
  end

  def edit
    render 'new'
  end

  def update
    if @jeweler.update(jeweler_params)
      redirect_to jewelers_path
    else
      render_error_messages(@jeweler)
    end
  end

  def destroy
    @jeweler.destroy
    redirect_to jewelers_path
  end

private

  def jeweler_params
    params.require(:jeweler).permit(:name)
  end

  def find_jeweler
    render_not_found unless @jeweler = Jeweler.find_by_id(params[:id])
  end

end
