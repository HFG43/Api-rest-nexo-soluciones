require 'swagger_helper'
require 'faker'

RSpec.describe 'api/people', type: :request do
  path '/api/v1/people' do
    get 'Retrieves all Person' do
      produces 'application/json'

      response '200', 'Listado de Personas' do
        schema type: :object,
               properties: {
                 status: { type: :string, example: 'SUCCESS' },
                 message: { type: :string, example: 'Listado de Personas' },
                 data: {
                   type: :array,
                   items: {
                     type: :object,
                     properties: {
                       dni: { type: :bigserial },
                       nombre: { type: :string },
                       apellido: { type: :string },
                       edad: { type: :integer },
                       foto: { type: :string }
                     },
                     required: %w[dni nombre apellido edad foto]
                   }
                 }
               },
               required: %w[status message data]

        let(:id) do
          Person.create(dni: 28_311_542, nombre: 'Hernan', apellido: 'Guemes', edad: 44, foto: 'subitufoto.com').dni
        end
        run_test!
      end
    end
  end

  path '/api/v1/people' do
    post 'Creates a Person' do
      tags 'Person'
      consumes 'application/json'
      parameter name: :person, in: :body, schema: {
        type: :object,
        properties: {
          dni: { type: :bigserial },
          nombre: { type: :string },
          apellido: { type: :string },
          edad: { type: :integer },
          foto: { type: :string }
        },
        required: %w[dni nombre apellido edad foto]
      }

      response '200', 'Persona Creada' do
        let(:person) do
          Person.new(dni: Faker::Number.unique.number(digits: 8), nombre: 'Nombre Test', apellido: 'Apellido Test', edad: 40, foto: 'subitufoto.com')
        end
        run_test!
      end
    end
  end
end
