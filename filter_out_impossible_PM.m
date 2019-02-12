function [filtered_data] = filter_out_impossible_PM(data,dip_max_strength,quad_max_strength,sext_max_strength)
%
c = 1 ;
k = [] ;
for i = 1:size(data,1)
    switch char(data(i,2))
        case 'DIPOLE'
            max_strength = dip_max_strength ;
        case 'SBEND'
            max_strength = dip_max_strength ;
        case 'QUADRUPOLE'
            max_strength = quad_max_strength ;
        case 'SEXTUPOLE'
            max_strength = sext_max_strength ;
    end
    % Lenght char, Strength num
    if and(ischar(cell2mat(data(i,4))),~ischar(cell2mat(data(i,14))))
        if (abs( double(cell2mat(data(i,14))) / str2double(cell2mat(data(i,4))) ) > max_strength  )
            k = [k i] ;
        end
    % Length num, Strength char
    elseif and(~ischar(cell2mat(data(i,4))),ischar(cell2mat(data(i,14))))
        if (abs( str2double(cell2mat(data(i,14))) / double(cell2mat(data(i,4))) ) > max_strength  )
            k = [k i] ;
        end
    % Both char
    elseif and(ischar(cell2mat(data(i,4))),ischar(cell2mat(data(i,14))))
        if (abs( str2double(cell2mat(data(i,14))) / str2double(cell2mat(data(i,4))) ) > max_strength  )
            k = [k i] ;
        end
    % Both num
    elseif and(~ischar(cell2mat(data(i,4))),~ischar(cell2mat(data(i,14))))
        if (abs( double(cell2mat(data(i,14))) / double(cell2mat(data(i,4))) ) > max_strength  )
            k = [k i] ;
        end
    else
        disp('Something went wrong with the input files format.')
    end
%     if ischar(cell2mat(data(i,14)))
% %         disp(['It is a char ' num2str(i)]);
%         if (abs( str2double(cell2mat(data(i,14))) / str2double(cell2mat(data(i,4))) ) > max_strength )
%             k = [k i] ;
%         end
%     elseif (abs( double(cell2mat(data(i,14))) / str2double(cell2mat(data(i,4))) ) > max_strength )
%         k = [k i] ;
% %         disp(['Not a char ' num2str(i)])
%     elseif isnan( abs( double(cell2mat(data(i,14))) / str2double(cell2mat(data(i,4))) ) )
% %         disp(['It is NaN! ' num2str(i) ', ' num2str(c)])
%         c = c + 1 ;
%     else
%         disp(['Nothing ' num2str(i)])
%     end
end
filtered_data = data;
filtered_data(k,:) = [] ;

% disp(['Filtered files (impossible PM design): ' size(filtered_data,1)]) ;

end

