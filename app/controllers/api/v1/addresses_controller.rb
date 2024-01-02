class Api::V1::AddressesController < ApplicationController
  def new
    @address = Address.new
  end

  def create
    @person = Person.find_by(dni: params[:person_id])
    @address = @person.addresses.build(address_params)

    if @address.save
      render json: {
        status: 'SUCCESS',
        message: 'Direccion Creada',
        data: @address.as_json
      }, status: :ok
    else
      render json: {
        status: 'ERROR',
        message: 'No se pudo crear la nueva direccion',
        data: @address.errors.full_messages
      }, status: :unprocessable_entity
    end
  end

  private

  def address_params
    params.require(:address).permit(:calle, :numero, :ciudad, :person_dni)
  end
end
