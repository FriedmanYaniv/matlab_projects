classdef Fish < handle
    properties
        size;
        speed = 1;
        location;
        direction;
        p_change_direction;
        aquarium_size;
        color;
        is_alive;
    end
    methods
        function obj = Fish(aquarium_size)
            obj.aquarium_size = aquarium_size;
            obj.p_change_direction = 0.1;
            obj.size = rand*5 + 1;
            obj.location = aquarium_size*rand(1,3);
            obj.is_alive = true;
            obj.color = rand(1, 3);
            obj.direction = 2*pi*rand(1, 3);
        end
        function display_data(obj)
            disp(['Speed: ' num2str(obj.speed) ...
                ', Size: ' num2str(obj.size)]);
        end
        function new_size = increase_size(obj, increase_factor)
            new_size = obj.size * increase_factor;
            obj.size = new_size;
        end
        function plot(obj)
            if obj.is_alive
                plot3(obj.location(1), obj.location(2), obj.location(3),...
                    'MarkerSize',obj.size,'Marker','>','Color',obj.color);
            end
        end
        function move(obj)
            if rand < obj.p_change_direction
                obj.direction = 2*pi*rand(1, 3);
            end
            obj.location = obj.location + obj.speed*cos(obj.direction);
            obj.location = min(obj.aquarium_size*ones(1, 3), obj.location);
            obj.location = max(obj.aquarium_size*zeros(1, 3), obj.location);
        end
        
        function interact(obj, other, r)
            if sum((obj.location - other.location).^2) < r
               if obj.size >  other.size
                  obj.eat(other); 
               else
                   other.eat(obj);
               end
            end
        end
        
        function eat(obj, other)
           obj.size = obj.size + other.size;
           other.is_alive = false;
        end
    end
end


