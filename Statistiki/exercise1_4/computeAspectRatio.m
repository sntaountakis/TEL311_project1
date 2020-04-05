function aRatio = computeAspectRatio(image)
    [image_number, num_rows, num_cols] = size(image);
     
    colormap(gray);
    
    
    height_start = 0; 
    
    for h=1:num_rows
        for w=1:num_cols
            if image(image_number,h,w) ~= 0
                height_start = h;
                break; 
            end
        end
        if height_start ~= 0 
            break; 
        end
    end
       
    width_start = 0; 
    
    for w=1:num_cols
        for h=1:num_rows
            if image(image_number,h,w) ~= 0
                width_start = w; 
                break; 
            end
        end
        if width_start ~= 0 
            break; 
        end
    end
    
    height_end=0;
    
    for h=num_rows:-1:1
        for w=num_cols:-1:1
            if image(image_number,h,w) ~= 0
                height_end= h;
                break; 
            end
        end
        if height_end~= 0 
            break; 
        end
    end
       
    width_end= 0; 
    
    for w=num_cols:-1:1
        for h=num_rows:-1:1
            if image(image_number,h,w) ~= 0
                width_end= w; 
                break; 
            end
        end
        if width_end~= 0 
            break; 
        end
    end
    % Fill your code
    
    height = height_end - height_start+1;
    width = width_end-width_start+1;
    
    aRatio = width/height; 
    
end

