class StoneTypesController < ApplicationController

  before_action :find_stone_type, only: [:edit, :update, :destroy]

  def index
    @stone_types = StoneType.left_joins(:stones).select("stone_types.*, COUNT(stones.id) AS stones_count").group("stone_types.id").order(:id)
  end

  def new
    @stone_type = StoneType.new
  end

  def create
    @stone_type = StoneType.new(stone_type_params)

    if @stone_type.save
      redirect_to stone_types_path
    else
      render_error_messages(@stone_type)
    end
  end

  def edit
    render 'new'
  end

  def update
    if @stone_type.update(stone_type_params)
      redirect_to stone_types_path
    else
      render_error_messages(@stone_type)
    end
  end

  def destroy
    @stone_type.destroy
    redirect_to stone_types_path
  end

private

  def stone_type_params
    params.require(:stone_type).permit(:name)
  end

  def find_stone_type
    render_not_found unless @stone_type = StoneType.find_by_id(params[:id])
  end

end
