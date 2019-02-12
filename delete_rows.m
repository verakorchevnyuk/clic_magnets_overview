function tbl = delete_rows(tbl)

k = [] ;
%tmp = '' ;

for i = 1:size(tbl,1)
    if isempty(tbl{i,16}) 
        k = [k i] ;
    end
end

% k = any(isempty(tbl{:,16}),2);
tbl(k,:) = [] ;

% tmp = ['Labelled rows [#]: ' num2str(size(tbl,1))] ;
% disp(tmp) ;

end
