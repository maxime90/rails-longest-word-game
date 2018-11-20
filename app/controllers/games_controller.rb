require 'open-uri'
require 'json'


class GamesController < ApplicationController
  def new
    @letters = ('a'..'z').to_a.sample(10)
  end

  def score
    user_input = params[:guess]
    @result = english_verification(user_input)
    if @result
      @message = "Congratualation"
    else
      @message = "GAME OVER"
    end
  end

  private

  def english_verification(input)
    request_uri = "https://wagon-dictionary.herokuapp.com/#{input}"
    result = JSON.parse(open(request_uri).read)
    result["found"]
    end

  def user_input_grid(user_input_grid)
    user_input
  end

  def scoring
  end

end
