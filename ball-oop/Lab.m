classdef Lab<handle
    %UNTITLED2 Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        numBalls = 2;
        size = 1e5;
        num_itterations;
        r = 1 ;  % collision radius
        all_balls;
        masses;
        balls_speeds;
        opening_pos
    end
    
    methods
        function obj = Lab(num_balls, size, itterations, mass_vec, speed_vec,x0_vec)
            % Constructor
            obj.size = size;
            obj.numBalls = num_balls;
            obj.num_itterations = itterations;
            obj.masses = mass_vec;
            obj.balls_speeds = speed_vec;
            obj.opening_pos = x0_vec;
            obj.all_balls = obj.initialize_balls();
        end
        
        function all_balls  = initialize_balls(obj)
            % initialize fish vector, called from the constructor
            all_balls = cell(1, obj.numBalls);
            for ii = 1:obj.numBalls
                all_balls{ii} = Ball(obj.masses(ii),obj.balls_speeds(ii),obj.opening_pos(ii));
            end
        end
          
%         function collision(obj1, obj2 , r)
        function collision(balls_array , r)
            ball1 = balls_array{1};
            ball2 = balls_array{2};
            if abs(ball1.location - ball2.location)<r
                v1 = ball1.speed;
                m1 = ball1.mass;
                v2 = ball2.speed;
                m2 = ball2.mass;
                u1 = (v1*(m1-m2)+2*m2*v2)/(m1+m2);
                u2 = (v2*(m2-m1)+2*m1*v1)/(m1+m2);
                balls_array{1}.speed = u1;
                balls_array{2}.speed = u2;
                
            end
        end
        
         function run_simulation(obj)
            % Move the fish around
            for ii = 1:obj.num_itterations
                obj.collision(obj.all_balls , 5)
                cla
                hold on
                for jj = 1:length(obj.all_balls)
                    ball = obj.all_balls{jj};
                    ball.move();
                    ball.plot();
                    
                end
            end
        end
 
    
    end
end

