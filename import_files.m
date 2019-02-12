function [tbl] = import_files(filenames,filesIds,frequencies)
%
if ~exist('filesIds','var')
     filesIds = 0;
end

if ~exist('frequencies','var')
    frequencies = 0;
end

switch filenames
    case 'MB'
        filenames = [cellstr('elements_table_e-.txt'); ...
                     cellstr('elements_table_e+.txt')] ;
    case 'DB'
        filenames = [cellstr('DBRC_Start_3TeV.txt') ; ...
                     % cellstr(DL file missing ; ...
                     cellstr('DelayLoop_Long_corrected_3TeV.txt'); ...
                     cellstr('TransferLine1_3TeV.txt'); ...
                     cellstr('CombinerRing1_Part1_3TeV.txt'); ...
                     cellstr('CombinerRing1_Part2_3TeV.txt'); ...
                     cellstr('TransferLine2_3TeV.txt'); ...
                     cellstr('CombinerRing2_Part1_3TeV.txt'); ...
                     cellstr('CombinerRing2_Part2_3TeV.txt'); ...
                     % cellstr(Vert_line file missing ; ...
                     % cellstr(Vert_line file missing ; ...
                     % cellstr(Time delay line file missing ; ...
                     cellstr('LongTransferLine_380GeV.txt'); ...
                     cellstr('TurnAround_380GeV.txt'); ...
                     cellstr('TurnAround_380GeV.txt'); ...
                     cellstr('TurnAround_380GeV.txt'); ...
                     cellstr('TurnAround_380GeV.txt'); ...
                     cellstr('TurnAround_380GeV.txt'); ...
                     cellstr('TurnAround_380GeV.txt'); ...
                     cellstr('TurnAround_380GeV.txt'); ...
                     cellstr('TurnAround_380GeV.txt'); ...
                     cellstr('TurnAround_380GeV.txt'); ...
                     cellstr('TurnAround_380GeV.txt'); ...
                     cellstr('DBRC_End_3TeV.txt') ];
    case 'all'
        filenames = [cellstr('elements_table_e-.txt'); ...
                     cellstr('elements_table_e+.txt'); ...
                     cellstr('DBRC_Start_3TeV.txt') ; ...
                     % cellstr(DL file missing ; ...
                     cellstr('DelayLoop_Long_corrected_3TeV.txt'); ...
                     cellstr('TransferLine1_3TeV.txt'); ...
                     cellstr('CombinerRing1_Part1_3TeV.txt'); ...
                     cellstr('CombinerRing1_Part2_3TeV.txt'); ...
                     cellstr('TransferLine2_3TeV.txt'); ...
                     cellstr('CombinerRing2_Part1_3TeV.txt'); ...
                     cellstr('CombinerRing2_Part2_3TeV.txt'); ...
                     % Vert_line file missing ; ...
                     % Vert_line file missing ; ...
                     % Time delay line file missing ; ...
                     cellstr('LongTransferLine_380GeV.txt'); ...
                     cellstr('TurnAround_380GeV.txt'); ...
                     cellstr('TurnAround_380GeV.txt'); ...
                     cellstr('TurnAround_380GeV.txt'); ...
                     cellstr('TurnAround_380GeV.txt'); ...
                     cellstr('TurnAround_380GeV.txt'); ...
                     cellstr('TurnAround_380GeV.txt'); ...
                     cellstr('TurnAround_380GeV.txt'); ...
                     cellstr('TurnAround_380GeV.txt'); ...
                     cellstr('TurnAround_380GeV.txt'); ...
                     cellstr('TurnAround_380GeV.txt'); ...
                     cellstr('DBRC_End_3TeV.txt') ];
end

max_columns = 21 ;
tbl = [] ;
for i = 1:size(filenames,1)
    tmp = readtable(char(filenames(i))) ;
    tmp = table2cell(tmp) ;
    tmp = delete_rows(tmp) ;
    while (size(tmp,2)<max_columns)
        tmp = [ tmp cell(size(tmp,1),1) ];
    end
    tbl = [tbl; tmp] ;
end

end
