class Member

  def house_members(house)
    response = Faraday.get('https://www.potterapi.com/v/characters') do |f|
      f.params['key'] = ENV['POTTER_KEY']
      f.params['house'] = house
      f.params['OrderOfThePhoenix'] = true
    end
    member_info = JSON.parse(responde.body, symbolize_names: true)
  end
end
