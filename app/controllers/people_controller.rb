class PeopleController < ApplicationController
  def index
    @person = Person.all
    @address = @person.addresses.find_by(dni: params[:dni])
    render json: @person.as_json(except: %i[created_at updated_at])
  end
end
