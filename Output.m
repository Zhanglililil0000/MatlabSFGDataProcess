function Output(OutputPath,Signal,SampleName)
    FinalName = [SampleName,'-Normalized']; 
    OutputName = [OutputPath,FinalName,'.csv'];
    writematrix(Signal(:,3),OutputName);
end
