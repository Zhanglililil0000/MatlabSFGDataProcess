function Data = GetData(FilePath,FileName)
%%读取CSV文件
    Name = [FilePath,FileName];
    Data = readmatrix(Name);
end
