classdef Ball < handle
%      this is ball comment
    %UNTITLED Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        mass;
        speed;
        location;
        color;
    end
    
    methods
        function obj = Ball(m, v_0, x_0)
            obj.mass = m;
            obj.speed = v_0;
            obj.location = x_0;
            obj.color = rand(1,3);
        end
        
        function move(obj)
            obj.location = obj.location + obj.speed ;
            if obj.location< 0 
               obj.location = abs(obj.location);
               obj.speed = abs(obj.speed);
            end
        end
        %
        %         function collision(obj, other,r)
        %             if abs(obj.location - other.location)<r
        %                 v1 = obj.speed;
        %                 m1 = obj.mass;
        %                 v2 = other.speed;
        %                 m2 = other.mass;
        %                 u1 = (v1*(m1-m2)+2*m2*v2)/(m1+m2);
        %                 u2 = (v2*(m2-m1)+2*m1*v1)/(m1+m2);
        %                 obj.speed = u1;
        %                 other.speed = u2;
        %
        %             end
        %
        %         end
        function plot(obj)
                plot(obj.location, 1 ,'MarkerSize',obj.mass * 10,'Marker','.','Color',obj.color);
        end
        
        
    end
    
end

