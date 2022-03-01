require_relative "room"

class Hotel
    attr_reader :rooms
    def initialize(name, hash)
        @rooms = {}
        @name = name
        hash.each do |k,v|

            @rooms[k] = Room.new(v)
        end
  
    end

        def name
            @name.split.map {|word| word.capitalize}.join(" ")
        end

        def room_exists?(name)

            @rooms[name] != nil
        end

        def check_in(person,room)

            if room_exists?(room)
                
                if @rooms[room].add_occupant(person)
                    print 'check in successful'
                else
                    print 'sorry, room is full'
                end

              

            else
                print 'sorry, room does not exist' 
            end
        end

        def has_vacancy?
            
            # @rooms.each {| _ ,v|  return true if !v.full? }
            @rooms.values.any? {|v| !v.full?}
            # false asdfdas
        end

        def list_rooms

        end
end
