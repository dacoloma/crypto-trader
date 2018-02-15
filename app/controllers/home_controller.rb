class HomeController < ApplicationController

  def homepage

  end

  def cours
    $results = Crypto.new(params[:money][:currency]).get_cours_cryptocurrencies
    p "=======>"
    p $results
  end
end
