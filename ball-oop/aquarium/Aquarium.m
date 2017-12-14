classdef Aquarium
    %AQUARIUM  Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        size;
        number_of_fish;
        number_of_iterations;
        all_fish;
        interaction_radius = 1;
    end
    
    methods
        function obj = Aquarium(size, number_of_fish, number_of_iterations)
            % Constructor
            obj.size = size;
            obj.number_of_fish = number_of_fish;
            obj.number_of_iterations = number_of_iterations;
            obj.all_fish = obj.initialize_fish();
        end
        
        function all_fish  = initialize_fish(obj)
            % initialize fish vector, called from the constructor
            all_fish = cell(1, obj.number_of_fish);
            for ii = 1:obj.number_of_fish
                all_fish{ii} = Fish(obj.size);
            end
        end
        
        function run_simulation(obj)
            % Move the fish around
            for ii = 1:obj.number_of_iterations
                cla
                hold on
                for jj = 1:length(obj.all_fish)
                    fish = obj.all_fish{jj};
                    fish.move();
                    fish.plot();
                end
                grid on;
                view(3);
                pause(0.1);
                xlim([0 obj.size]);
                ylim([0 obj.size]);
                zlim([0 obj.size]);
                obj.interact_all_fish();
            end
        end
        
        function interact_all_fish(obj)
            for ii = 1:(length(obj.all_fish)-1)
                current_fish = obj.all_fish{ii};
                if current_fish.is_alive
                    for jj = (ii+1):length(obj.all_fish)
                        other_fish = obj.all_fish{jj};
                        if other_fish.is_alive
                            current_fish.interact(other_fish, obj.interaction_radius);
                        end
                    end
                end
            end            
        end
    end
end

