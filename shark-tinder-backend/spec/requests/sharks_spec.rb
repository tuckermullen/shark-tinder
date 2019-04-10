require 'rails_helper'

describe "Sharks API" do
  it "gets a list of Sharks" do
    # Create a new shark in the Test Database (not the same one as development)
    Shark.create(name: 'Jows', age: 24, enjoys: 'Night time hunts by the reef.')

    # Make a request to the API
    get '/sharks'

    # Convert the response into a Ruby Hash
    json = JSON.parse(response.body)

    # Assure that we got a successful response
    expect(response).to be_success

    # Assure that we got one result back as expected
    expect(json.length).to eq 1
  end

  it "creates a shark" do
    # The params we are going to send with the request
    shark_params = {
      shark: {
        name: 'Buster',
        age: 4,
        enjoys: 'Shark Mix, and plenty of sunshine.'
      }
    }

    # Send the request to the server
    post '/sharks', params: shark_params

    # Assure that we get a success back
    expect(response).to be_success

    # Look up the shark we expect to be created in the Database
    new_shark = Shark.first

    # Assure that the created shark has the correct attributes
    expect(new_shark.name).to eq('Buster')
  end

  it "doesn't create a shark without a name" do
      shark_params = {
        shark: {
          age: 13,
          enjoys: 'Shark Mix, and plenty of sunshine.'
        }
      }

      post '/sharks', params: shark_params

      # This is a new test to make sure that our status is correct when the record can't be created
      # You can read more about HTTP response codes here: https://en.wikipedia.org/wiki/List_of_HTTP_status_codes
      expect(response.status).to eq 422

      # We also want to check that the API lets us know what is wrong, so the frontend can prompt the user to fix it.
      json = JSON.parse(response.body)
      # Errors are returned as an array because there could be more than one, if there are more than one validation failures on an attribute.
      expect(json['name']).to include "can't be blank"
    end

    it "doesn't create a shark without a age" do
      shark_params = {
        shark: {
          name: 'Trevor',
          enjoys: 'Shark Mix, and plenty of sunshine.'
        }
      }

      post '/sharks', params: shark_params

      # This is a new test to make sure that our status is correct when the record can't be created
      # You can read more about HTTP response codes here: https://en.wikipedia.org/wiki/List_of_HTTP_status_codes
      expect(response.status).to eq 422

      # We also want to check that the API lets us know what is wrong, so the frontend can prompt the user to fix it.
      json = JSON.parse(response.body)
      # Errors are returned as an array because there could be more than one, if there are more than one validation failures on an attribute.
      expect(json['age']).to include "can't be blank"
    end

    it "doesn't create a shark without a enjoys" do
      shark_params = {
        shark: {
          name: 'Trevor',
          age: 13
        }
      }

      post '/sharks', params: shark_params

      # This is a new test to make sure that our status is correct when the record can't be created
      # You can read more about HTTP response codes here: https://en.wikipedia.org/wiki/List_of_HTTP_status_codes
      expect(response.status).to eq 422

      # We also want to check that the API lets us know what is wrong, so the frontend can prompt the user to fix it.
      json = JSON.parse(response.body)
      # Errors are returned as an array because there could be more than one, if there are more than one validation failures on an attribute.
      expect(json['enjoys']).to include "can't be blank"
    end

    it "doesn't create a shark without enjoy being 10 or more characters" do
      shark_params = {
        shark: {
          name: 'Trevor',
          age: 13,
          enjoys: 'Booze'
        }
      }

      post '/sharks', params: shark_params

      # This is a new test to make sure that our status is correct when the record can't be created
      # You can read more about HTTP response codes here: https://en.wikipedia.org/wiki/List_of_HTTP_status_codes
      expect(response.status).to eq 422

      # We also want to check that the API lets us know what is wrong, so the frontend can prompt the user to fix it.
      json = JSON.parse(response.body)
      # Errors are returned as an array because there could be more than one, if there are more than one validation failures on an attribute.
      expect(json['enjoys']).to include "too short"
    end
end