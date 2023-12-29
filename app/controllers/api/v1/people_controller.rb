class Api::V1::PeopleController < ApplicationController
  def create; end

  private

  def people_params
    params.require(:person).permit(:dni, :nombre, :apellido, :edad, :foto)
  end
end
