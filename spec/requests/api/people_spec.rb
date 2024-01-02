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
          Person.create(dni: Faker::Number.unique.number(digits: 8), nombre: 'Hernan', apellido: 'Guemes', edad: 44,
                        foto: 'subitufoto.com').dni
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
          dni: { type: :integer },
          nombre: { type: :string },
          apellido: { type: :string },
          edad: { type: :integer },
          foto: { type: :string }
        },
        required: %w[dni nombre apellido edad foto]
      }

      response '200', 'Persona Creada' do
        let(:person) do
          { dni: 11_111_111, nombre: 'Nombre Test', apellido: 'Apellido Test',
            edad: 40, foto: 'subitufoto.com' }
        end
        run_test!
      end
    end
  end

  path '/api/v1/people/{dni}' do # rubocop:disable Metrics/BlockLength
    get 'Retrieves an specific Person' do # rubocop:disable Metrics/BlockLength
      tags 'Person'
      produces 'application/json'
      parameter name: :dni, in: :path, type: :string

      response '200', 'Persona por DNI' do
        schema type: :object,
               properties: {
                 status: { type: :string, example: 'SUCCESS' }, message: { type: :string, example: 'Listado de Personas' }, # rubocop:disable Layout/LineLength
                 data: {
                   type: :object,
                   properties: {
                     dni: { type: :bigserial }, nombre: { type: :string }, apellido: { type: :string }, edad: { type: :integer }, foto: { type: :string }, # rubocop:disable Layout/LineLength
                     addresses: {
                       type: :array,
                       items: {
                         type: :object,
                         properties: {
                           id: { type: :integer },
                           calle: { type: :string },
                           numero: { type: :integer },
                           ciudad: { type: :string }
                         },
                         required: %w[id calle numero ciudad]
                       }
                     }
                   },
                   required: %w[dni nombre apellido edad foto addresses]
                 }
               },
               required: %w[status message data]

        let(:dni) do
          Person.create(dni: Faker::Number.unique.number(digits: 8), nombre: 'Hernan', apellido: 'Guemes', edad: 44,
                        foto: 'subitufoto.com', addresses: []).dni
        end
        run_test!
      end
    end
  end

  path '/api/v1/people/{dni}' do
    delete 'Deletes an specific Person' do
      tags 'Person'
      produces 'application/json'
      parameter name: :dni, in: :path, type: :string

      response '200', 'Persona Eliminada de la Base' do
        schema type: :object,
               properties: {
                 status: { type: :string, example: 'SUCCESS' },
                 message: { type: :string, example: 'Persona Eliminada de la Base' },
                 data: {
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

        let(:dni) do
          Person.create(dni: Faker::Number.unique.number(digits: 8), nombre: 'Hernan', apellido: 'Guemes', edad: 44,
                        foto: 'subitufoto.com').dni
        end
        run_test!
      end
    end
  end

  # path '/api/v1/people/{dni}' do
  #   patch 'Updates an specific Person' do
  #     tags 'Person'
  #     consumes 'application/json'
  #     parameter name: :dni, in: :path, type: :string
  #     schema type: :object,
  #            properties: {
  #              status: { type: :string, example: 'SUCCESS' },
  #              message: { type: :string, example: 'Persona Actualizada' },
  #              data: {
  #                type: :object,
  #                properties: {
  #                  dni: { type: :integer },
  #                  nombre: { type: :string },
  #                  apellido: { type: :string },
  #                  edad: { type: :integer },
  #                  foto: { type: :string }
  #                },
  #                required: %w[dni nombre apellido edad foto]
  #              }
  #            }

  #     response '200', 'Persona Actualizada' do
  #       let(:person) do
  #         { dni: 11_111_111, nombre: 'Nombre Test', apellido: 'Apellido Test',
  #           edad: 40, foto: 'subitufoto.com' }
  #       end
  #       run_test!
  #     end
  #   end
  # end
end
