class PeopleController < ApplicationController
  def new
    @person = Person.new
  end

  def create
    @person = Person.new(person_params)

    if @person.save
      render json: @person, status: :created
    else
      render json: @person.errors, status: :unprocessable_entity
    end
  end

  def index
    @person = filtered_people
    render json: @person.as_json(except: %i[created_at updated_at], include: { addresses: { only: %i[id calle numero ciudad] } })
  end

  def show
    @person = Person.find_by(dni: params[:id])
  end

  def destroy
    person = Person.find_by(dni: params[:id])

    if person.destroy
      render json: person
    else
      render json: { errors: person.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def filtered_people
    people = Person.all

    people = people.where(dni: params[:dni]) if params[:dni].present?
    people = people.where(nombre: params[:nombre]) if params[:nombre].present?
    people = people.where(edad: params[:edad]) if params[:edad].present?

    people
  end

  def person_params
    params.require(:person).permit(:dni, :nombre, :apellido, :edad, :foto)
  end
end
