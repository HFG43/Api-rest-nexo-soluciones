class PeopleController < ApplicationController
  def new
    @person = Person.new
  end

  def create
    @person = Person.new(person_params)

    if @person.save
      render json: {
        status: 'SUCCESS',
        message: 'Persona Creada',
        data: @person.as_json
      }, status: :ok
    else
      render json: {
        status: 'ERROR',
        message: 'No se pudo crear la nueva persona',
        data: @person.errors.full_messages
      }, status: :unprocessable_entity
    end
  end

  def index
    @people = filtered_people.order('created_at DESC')
    render json: {
      status: 'SUCCESS',
      message: 'Listado de Personas',
      data: @people.as_json(
        except: %i[created_at updated_at],
        include: {
          addresses: { only: %i[id calle numero ciudad] }
        }
      )
    }, status: :ok
  end

  def show
    @person = Person.find_by(dni: params[:id])
    render json: {
      status: 'SUCCESS',
      message: 'Persona por DNI',
      data: @person.as_json(
        except: %i[created_at updated_at],
        include: {
          addresses: { only: %i[id calle numero ciudad] }
        }
      )
    }, status: :ok
  end

  def update
    @person = Person.find_by(dni: params[:id])

    if @person.update(person_params)
      render json: {
        status: 'SUCCESS',
        message: 'Persona Actualizada',
        data: @person.as_json
      }, status: :ok
    else
      render json: {
        status: 'ERROR',
        message: 'No se pudo actualizar la informacion de la persona',
        data: @person.errors.full_messages
      }, status: :unprocessable_entity
    end
  end

  def destroy
    person = Person.find_by(dni: params[:id])

    if person.destroy
      render json: {
        status: 'SUCCESS',
        message: 'Persona Eliminada de la Base',
        data: @person.as_json
      }, status: :ok
    else
      render json: {
        status: 'ERROR',
        message: 'No se pudo eliminar la persona',
        data: @person.errors.full_messages
      }, status: :unprocessable_entity
    end
  end

  private

  def filtered_people
    people = Person.all

    people = people.where(nombre: params[:nombre]) if params[:nombre].present?
    people = people.where(edad: params[:edad]) if params[:edad].present?

    people
  end

  def person_params
    params.require(:person).permit(:dni, :nombre, :apellido, :edad, :foto)
  end
end
