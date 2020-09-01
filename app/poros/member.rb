class Member

  def self.house_members(house)
    response = Faraday.get('https://www.potterapi.com/v1/characters') do |f|
      f.params['key'] = ENV['POTTER_KEY']
      f.params['house'] = house
      f.params['orderOfThePhoenix'] = true
    end
    members = JSON.parse(response.body, symbolize_names: true)
    members.map do |member_data|
      Member.new(member_data)
    end
  end

  attr_reader :name, :house, :role, :patronus

  def initialize(member_data)
    @name = member_data[:name]
    @house = member_data[:house]
    @role = member_data[:role]
    @patronus = member_data[:patronus]
  end
end
