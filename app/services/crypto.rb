require 'open-uri'
class Crypto

  def initialize(currency)
    @currency = currency
  end

  def get_cours_cryptocurrencies

    page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))

    array_cours=[]

    currency=page.xpath('//td[2]/a')
    cours = page.xpath('//td[5]/a')


      register={}
      cours.each do |node|
          register[currency[cours.index(node)].text]=node.text
      end
      array_cours << register
      puts array_cours[array_cours.length-1]
      sleep(3600)
  
  end

end
