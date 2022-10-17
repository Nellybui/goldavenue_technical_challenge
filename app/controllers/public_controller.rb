class PublicController < ApplicationController

  def index
    @jewelers = Jeweler.order(:id)
    @material_types = MaterialType.order(:id).preload(:jewels)
    @stone_types = StoneType.order(:id).preload(:jewels)
  end

  def routing_error
    render_not_found
  end

end
