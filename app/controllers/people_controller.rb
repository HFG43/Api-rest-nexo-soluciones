class PeopleController < ApplicationController
  def index
    @person = Person.all
    render json: @person.as_json(except: %i[created_at updated_at], include: { addresses: { only: %i[id calle numero ciudad] } })
  end
end
