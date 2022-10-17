class MaterialTypesController < ApplicationController

  before_action :find_material_type, only: [:edit, :update, :destroy]

  def index
    @material_types = MaterialType.left_joins(:materials).select("material_types.*, COUNT(materials.id) AS materials_count").group("material_types.id").order(:id)
  end

  def new
    @material_type = MaterialType.new
  end

  def create
    @material_type = MaterialType.new(material_type_params)

    if @material_type.save
      redirect_to material_types_path
    else
      render_error_messages(@material_type)
    end
  end

  def edit
    render 'new'
  end

  def update
    if @material_type.update(material_type_params)
      redirect_to material_types_path
    else
      render_error_messages(@material_type)
    end
  end

  def destroy 
    @material_type.destroy
    redirect_to material_types_path
  end

private

  def material_type_params
    params.require(:material_type).permit(:name)
  end

  def find_material_type
    render_not_found unless @material_type = MaterialType.find_by_id(params[:id])
  end

end
