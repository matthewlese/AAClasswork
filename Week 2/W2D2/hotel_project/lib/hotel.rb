require_relative "room"

class Hotel
  def initialize(name, hash)
    @name = name
    @rooms = Hash.new()
    hash.each do |k, v|
      @rooms[k] = Room.new(v)
    end
  end

  attr_reader :rooms

  def name
    @name.split(" ").map(&:capitalize).join(" ")
  end

  def room_exists?(room_name)
    @rooms.has_key?(room_name)
  end

  def check_in(person, room_name)
    if !self.room_exists?(room_name)
      puts "sorry, room does not exist"
    else
      if @rooms[room_name].add_occupant(person)
        puts "check in successful"
      else
        puts "sorry, room is full"
      end
    end
  end

  def has_vacancy?
    @rooms.keys.any? { |room| !@rooms[room].full? }
  end

  def list_rooms
    @rooms.keys.each do |room|
      puts room + ": " + @rooms[room].available_space.to_s
    end
  end
end
