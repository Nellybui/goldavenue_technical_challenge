class JewelsController < ApplicationController

  before_action :find_jeweler
  before_action :find_jewel, only: [:show, :edit, :update, :destroy]
  before_action :find_material_types, only: [:new, :edit]
  before_action :find_stone_types, only: [:new, :edit]

  def show
    @material = @jewel.material
    @stones = @jewel.stones.preload(:stone_type)
  end

  def new
    @jewel = @jeweler.jewels.new
    @jewel.material = Material.new
  end

  def create
    @jewel = @jeweler.jewels.new(jewel_params)
    if JewelCreateOrUpdate.call(@jewel)
      redirect_to jeweler_path(@jeweler)
    else
      render_error_messages(@jewel)
    end
  end

  def edit
    render 'new'
  end

  def update
    @jewel.attributes = jewel_params
    if JewelCreateOrUpdate.call(@jewel)
      redirect_to jeweler_path(@jeweler)
    else
      render_error_messages(@jewel)
    end
  end

  def destroy
    JewelDestroy.call(@jewel)
    redirect_to jeweler_path(@jeweler)
  end

private

  def jewel_params
    params.require(:jewel).permit(
      :name,
      material_attributes: [:id, :name, :base_cost, :material_type_id, :_destroy],
      stones_attributes: [:id, :name, :price, :stone_type_id, :_destroy]
    )
  end

  def find_jeweler
    @jeweler = Jeweler.find_by_id(params[:jeweler_id])
  end

  def find_jewel
    @jewel = @jeweler.jewels.find_by_id(params[:id])
  end

  def find_material_types
    @material_types = MaterialType.order(:id)
  end

  def find_stone_types
    @stone_types = StoneType.order(:id)
  end

end
