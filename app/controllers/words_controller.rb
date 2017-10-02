class WordsController < ApplicationController

  def index
    @random_words = []
    10.times do
      response = HTTParty.get('http://setgetgo.com/randomword/get.php')
      @random_words << {:random_word => response.body}
    end

    render json:
      @random_words.each do |name, word|
        { name: word }
      end
  end

end
