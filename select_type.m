function [data,k] = select_type(data,magnet_type)
%

k = [] ;
for i = 1:size(data,1)
    if strcmp(char(data(i,2)),'SBEND')
        data(i,2) = {'DIPOLE'} ;
    end
    if strcmp(char(data(i,2)),magnet_type)
        k = [k i] ;
    end
end

data = data(k,:) ;

end

