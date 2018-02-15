require 'open-uri'
class HomeController < ApplicationController

  def homepage

    page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
    currencies=page.xpath('//td[2]/a')
    @list_cur=[]
    currencies.each do |currency|
      @list_cur << currency.text
    end
    @list_cur.sort!

  end

  def cours
    $results = Crypto.new(currency_params).get_cours_cryptocurrencies
    $currency = currency_params
    p $currency
    redirect_to root_path
  end

  def currency_params
    params[:money][:currency]
  end
end
