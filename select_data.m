function filteredData = select_data(data, magnets)

switch char(magnets)
    case 'all'
        tmp = data ;
        [~,idx] = select_type(tmp, 'KICKER') ;
        filteredData = data ;
        filteredData(idx,:) = [] ;
    otherwise
        k = [] ;
        
        for j = 1:size(magnets,1)
            for i = 1:size(data,1)
                if strcmp(char(data(i,16)), magnets(j,:))
                    k = [k i] ;
                end
            end
        end
        
        %data(k,:) = [] ;
        filteredData = data(k,:);
        tmp = data(k,:) ;
        
        [~,idx] = select_type(tmp, 'KICKER') ;
%         filteredData = data ;
        filteredData(idx,:) = [] ;
        
        % disp(['Selected elements (family, part of machine) [#]: ' num2str(size(filteredData,1)) ]) ;
end

end

