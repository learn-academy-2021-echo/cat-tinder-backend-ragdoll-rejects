require 'rails_helper'

RSpec.describe "Cats", type: :request do
  describe "GET /index" do
    it 'shows a list with all the cats' do
      #make a moc cat
      Cat.create(
        name: 'Voldemort',
        age: 6,
        enjoys: 'Talking to snakes',
        image: 'https://www.google.com/search?q=black+cat+jpg&tbm=isch&ved=2ahUKEwjx25Kh3Ob1AhWfAjQIHdgaCqQQ2-cCegQIABAA&oq=black+cat+jpg&gs_lcp=CgNpbWcQAzIFCAAQgAQ6BwgjEO8DECc6BAgAEEM6BwgAELEDEEM6CggAELEDEIMBEEM6CAgAEIAEELEDOgYIABAKEBhQrSxY8kVgm0hoAHAAeACAAZIBiAGdDpIBBDAuMTSYAQCgAQGqAQtnd3Mtd2l6LWltZ8ABAQ&sclient=img&ei=J3b9YbGsIJ-F0PEP2LWooAo&bih=853&biw=1600#imgrc=FJMEVJFcH_6fZM')

        # make request to the index
        get '/cats'
        # parse the data from request into json
        cat = JSON.parse(response.body)
        #check that the response code is 200
        kitty = Cat.first
        expect(response).to have_http_status(200)
        # check the payload
        expect(cat.length).to eq 1
        expect(kitty.age).to eq 6
        expect(kitty.name).to eq('Voldemort')

    end
  end

  describe "POST /create" do
    it 'makes a new kitten' do
      # make a moc cat and save to a variable
      cat_params = {
        cat: {
          name: 'Voldemort',
          age: 6,
          enjoys: 'Talking to snakes',
          image: 'https://www.google.com/search?q=black+cat+jpg&tbm=isch&ved=2ahUKEwjx25Kh3Ob1AhWfAjQIHdgaCqQQ2-cCegQIABAA&oq=black+cat+jpg&gs_lcp=CgNpbWcQAzIFCAAQgAQ6BwgjEO8DECc6BAgAEEM6BwgAELEDEEM6CggAELEDEIMBEEM6CAgAEIAEELEDOgYIABAKEBhQrSxY8kVgm0hoAHAAeACAAZIBiAGdDpIBBDAuMTSYAQCgAQGqAQtnd3Mtd2l6LWltZ8ABAQ&sclient=img&ei=J3b9YbGsIJ-F0PEP2LWooAo&bih=853&biw=1600#imgrc=FJMEVJFcH_6fZM'
        }
      }

      #create the request
      post '/cats', params: cat_params

      # check the response code
      expect(response). to have_http_status(200)
      # save the first instance of cat to a variable
      cat = Cat.first

      # check the payload
      expect(cat.name).to eq('Voldemort')
      expect(cat.age).to eq(6)
      expect(cat.enjoys).to eq('Talking to snakes')
      expect(cat.image).to eq('https://www.google.com/search?q=black+cat+jpg&tbm=isch&ved=2ahUKEwjx25Kh3Ob1AhWfAjQIHdgaCqQQ2-cCegQIABAA&oq=black+cat+jpg&gs_lcp=CgNpbWcQAzIFCAAQgAQ6BwgjEO8DECc6BAgAEEM6BwgAELEDEEM6CggAELEDEIMBEEM6CAgAEIAEELEDOgYIABAKEBhQrSxY8kVgm0hoAHAAeACAAZIBiAGdDpIBBDAuMTSYAQCgAQGqAQtnd3Mtd2l6LWltZ8ABAQ&sclient=img&ei=J3b9YbGsIJ-F0PEP2LWooAo&bih=853&biw=1600#imgrc=FJMEVJFcH_6fZM')
    end
  end
  describe "PATCH /update" do
    it 'makes cahnges to a cat' do
      # make a moc cat
      cat_params = {
        cat: {
          name: 'Voldemort',
          age: 6,
          enjoys: 'Talking to snakes',
          image: 'https://www.google.com/search?q=black+cat+jpg&tbm=isch&ved=2ahUKEwjx25Kh3Ob1AhWfAjQIHdgaCqQQ2-cCegQIABAA&oq=black+cat+jpg&gs_lcp=CgNpbWcQAzIFCAAQgAQ6BwgjEO8DECc6BAgAEEM6BwgAELEDEEM6CggAELEDEIMBEEM6CAgAEIAEELEDOgYIABAKEBhQrSxY8kVgm0hoAHAAeACAAZIBiAGdDpIBBDAuMTSYAQCgAQGqAQtnd3Mtd2l6LWltZ8ABAQ&sclient=img&ei=J3b9YbGsIJ-F0PEP2LWooAo&bih=853&biw=1600#imgrc=FJMEVJFcH_6fZM'
        }
      }
      post '/cats', params: cat_params
      cat = Cat.first

      # make update to the cat
      updated_cat_params = {
        cat: {
          name: 'Harry',
          age: 2,
          enjoys: 'Receiving unearned brownie points'
        }
      }
      patch "/cats/#{cat.id}", params: updated_cat_params

      # make a new variable to store the id of the updated cat
      updated_cat = Cat.find(cat.id)

      # check the response
      expect(response).to have_http_status(200)
      # check the payload
      expect(updated_cat.name).to eq('Harry')
      expect(updated_cat.age).to eq(2)
      expect(updated_cat.enjoys).to eq('Receiving unearned brownie points')
    end
  end

  describe "DELETE /destroy" do
    it 'deletes a cat from the database' do
      # make a moc cat
      cat_params = {
        cat: {
          name: 'Voldemort',
          age: 6,
          enjoys: 'Talking to snakes',
          image: 'https://www.google.com/search?q=black+cat+jpg&tbm=isch&ved=2ahUKEwjx25Kh3Ob1AhWfAjQIHdgaCqQQ2-cCegQIABAA&oq=black+cat+jpg&gs_lcp=CgNpbWcQAzIFCAAQgAQ6BwgjEO8DECc6BAgAEEM6BwgAELEDEEM6CggAELEDEIMBEEM6CAgAEIAEELEDOgYIABAKEBhQrSxY8kVgm0hoAHAAeACAAZIBiAGdDpIBBDAuMTSYAQCgAQGqAQtnd3Mtd2l6LWltZ8ABAQ&sclient=img&ei=J3b9YbGsIJ-F0PEP2LWooAo&bih=853&biw=1600#imgrc=FJMEVJFcH_6fZM'
        }
      }
      post '/cats', params: cat_params
      cat = Cat.first
      delete "/cats/#{cat.id}"

      # test the response
      expect(response).to have_http_status(200)

      cats = Cat.all
      # test the payload
      expect(cats).to be_empty
    end
  end
end
