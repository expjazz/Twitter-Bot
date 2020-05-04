require 'json'
require 'uri'
require 'net/http'
require 'openssl'

require_relative '../keys'

class Corona
  attr_reader :data, :confirmed, :recovered
  def initialize
    url = URI('https://covid-19-coronavirus-statistics.p.rapidapi.com/v1/total?country=Brazil')

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Get.new(url)
    request['x-rapidapi-host'] = 'covid-19-coronavirus-statistics.p.rapidapi.com'
    request['x-rapidapi-key'] = Covid

    response = http.request(request)
    @data = JSON.parse(response.read_body)
    @confirmed = @data['data']['confirmed']
    @recovered = @data['data']['recovered']
  end
end
