class Member

  def house_members(house)
    response = Faraday.get('https://www.potterapi.com/v/characters') do |f|
      f.params['key'] = ENV['POTTER_KEY']
      f.params['house'] = house
      f.params['OrderOfThePhoenix'] = true
    end
    members = JSON.parse(responde.body, symbolize_names: true)
    members.map do |member|
      Member.new(member)
    end
  end

  attr_reader :name, :house, :role, :patronus

  def initialize(member)
    @name = member[:name]
    @house = member[:house]
    @role = member[:role]
    @patronus = member[:patronus]
  end
end
