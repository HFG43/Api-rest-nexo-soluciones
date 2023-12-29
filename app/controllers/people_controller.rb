class PeopleController < ApplicationController
  def index
    @person = filtered_people
    render json: @person.as_json(except: %i[created_at updated_at], include: { addresses: { only: %i[id calle numero ciudad] } })
  end

  private

  def filtered_people
    people = Person.all

    people = people.where(dni: params[:dni]) if params[:dni].present?
    people = people.where(nombre: params[:nombre]) if params[:nombre].present?
    people = people.where(edad: params[:edad]) if params[:edad].present?

    people
  end
end
