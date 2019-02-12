function [] = plot_data(data,magnets)
%
switch char(magnets)
    case 'all' %%% TODO
        
        dip_data = select_type(data, 'DIPOLE') ;
        quad_data = select_type(data, 'QUADRUPOLE') ;
        sext_data = select_type(data, 'SEXTUPOLE') ;
        
        % Dipoles
        dip_xx = 1:size(dip_data,1);
        dip_yy = zeros(1,size(dip_data,1)) ;
        for j = 1:size(dip_data,1)
            if ischar(cell2mat(dip_data(j,14)))
                dip_data{j,22} = abs(str2double(cell2mat(dip_data(j,14)))/str2double(cell2mat(dip_data(j,4))));
            else
                dip_data{j,22} = abs(double(cell2mat(dip_data(j,14)))/str2double(cell2mat(dip_data(j,4))));
            end
        end
        % sorting
        dip_data = sortrows(dip_data,[22, 16]) ;
        for j = 1:size(dip_data,1)
            if ischar(cell2mat(dip_data(j,22)))
               dip_yy (j) = str2double(cell2mat(dip_data(j,22)));
            else
                dip_yy (j) = cell2mat(dip_data(j,22));
            end
        end
        % ploting
        if ~isempty(dip_yy)
            figure
            plot(dip_xx,dip_yy,'o')
            grid on
            title(['All Dipoles - Total: ' num2str(length(dip_yy))])
            xlabel('Magnet [#]')
            ylabel('Central field [T]')
        end
        
        % Quadrupoles
        quad_xx = 1:size(quad_data,1);
        quad_yy = zeros(1,size(quad_data,1)) ;
        for j = 1:size(quad_data,1)
            if ischar(cell2mat(quad_data(j,14)))
                quad_data{j,22} = abs(str2double(cell2mat(quad_data(j,14)))/str2double(cell2mat(quad_data(j,4))));
            else
                quad_data{j,22} = abs(double(cell2mat(quad_data(j,14)))/str2double(cell2mat(quad_data(j,4))));
            end
        end
        % sorting
        quad_data = sortrows(quad_data,[22, 16]) ;
        for j = 1:size(quad_data,1)
            if ischar(cell2mat(quad_data(j,22)))
               quad_yy (j) = str2double(cell2mat(quad_data(j,22)));
            else
               quad_yy (j) = cell2mat(quad_data(j,22));
            end
        end
        % ploting
        if ~isempty(quad_yy)
            figure
            plot(quad_xx,quad_yy,'o')
            grid on
            title(['All Quadrupoles - Total: ' num2str(length(quad_yy))])
            xlabel('Magnet [#]')
            ylabel('Gradient [T/m]')
        end
        
        % Sextupoles
        sext_xx = 1:size(sext_data,1);
        sext_yy = zeros(1,size(sext_data,1)) ;
        for j = 1:size(sext_data,1)
            if ischar(cell2mat(sext_data(j,14)))
                sext_data{j,22} = abs(str2double(cell2mat(sext_data(j,14)))/str2double(cell2mat(sext_data(j,4))));
            else
                sext_data{j,22} = abs(double(cell2mat(sext_data(j,14)))/str2double(cell2mat(sext_data(j,4))));
            end
        end
        % sorting
        sext_data = sortrows(sext_data,[22, 16]) ;
        for j = 1:size(sext_data,1)
            if ischar(cell2mat(sext_data(j,22)))
               sext_yy (j) = str2double(cell2mat(sext_data(j,22)));
            else
               sext_yy (j) = cell2mat(sext_data(j,22));
            end
        end
        % ploting
        if ~isempty(sext_yy)
            figure
            plot(sext_xx,sext_yy,'o')
            grid on
            title(['All Sextupoles - Total: ' num2str(length(sext_yy))])
            xlabel('Magnet [#]')
            ylabel('Strength [T/m^2]')
        end
        
    otherwise
        for i = 1:size(magnets,1)
            dataOfInterest = select_data(data,magnets(i,:));
            xx = 1:size(dataOfInterest,1);
            for j = 1:size(dataOfInterest,1)
                if ischar(cell2mat(dataOfInterest(j,14)))
                    yy(j) = abs(str2double(cell2mat(dataOfInterest(j,14)))/str2double(cell2mat(dataOfInterest(j,4))));
                else
                    yy(j) = abs(double(cell2mat(dataOfInterest(j,14)))/str2double(cell2mat(dataOfInterest(j,4))));
                end
            end
            if (size(dataOfInterest,1) == 0)
                disp([magnets(i,:) ' does not exist in the chosen subset. Please try again.'])
                break
            end
            figure
            plot(xx,yy,'o') ;
            grid on
            plotTitle = ['Magnet family: ' magnets(i,:) 'Total number magnets: ' num2str(size(dataOfInterest,1)) ];
            title(plotTitle) ;
            xlabel('Magnet [#]')
            ylabel('Strength [T, T/m, T/m^2]')
            clear xx yy
        end
end

end

