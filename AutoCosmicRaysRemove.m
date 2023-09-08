function w = AutoCosmicRaysRemove(w, factor)
    % w: 输入的波形数据
    % factor: 余辐射点检测阈值
    
    wdim = length(w) - 7;
    
    cosmicrays = zeros(8, 1);
    
    flag = 1;
    
    while flag
        flag = 0;
        m = 8;
        
        while m < wdim
            cosmicrays(1:4) = w(m - 4 : m - 1);
            cosmicrays(5:8) = w(m + 1 : m + 4);
            
            V_avg = mean(cosmicrays);
            V_sdev = std(cosmicrays);
            
            if (w(m) - V_avg) > (factor * V_sdev)
                w(m) = V_avg;
                flag = 1;
            end
            
            m = m + 1;
        end
    end
end