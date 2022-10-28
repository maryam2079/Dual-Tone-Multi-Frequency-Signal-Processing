function keyboard = dtmf(y,fs)
    HF = [1209,1336,1477,1633];
    LF = [697,770,852,941];
    
    F0 = [HF(2), LF(4)];
    F1 = [HF(1), LF(1)];
    F2 = [HF(2), LF(1)];
    F3 = [HF(3), LF(1)];
    F4 = [HF(1), LF(2)];
    F5 = [HF(2), LF(2)];
    F6 = [HF(3), LF(2)];
    F7 = [HF(1), LF(3)];
    F8 = [HF(2), LF(3)];
    F9 = [HF(3), LF(3)];
    FA = [HF(4), LF(1)];
    FB = [HF(4), LF(2)];
    FC = [HF(4), LF(3)];
    FD = [HF(4), LF(4)];
    F_star = [HF(1), LF(4)];
    F_hash = [HF(3), LF(4)];
    
    N = 16;
    F = cat(N,F0,F1,F2,F3,F4,F5,F6,F7,F8,F9,FA,FB,FC,FD,F_star,F_hash);
    charachters = ['0','1','2','3','4','5','6','7','8','9','A','B','C','D','*','#'];
    L = length(y);
    f = (-L/2:L/2-1)*(fs/L); 
    Y = fft(y);
    amp = abs(fftshift(Y));
    [peak, freq] = findpeaks(amp,f);
    [~,idx] = sort(peak,'descend');
    freq_high = 0; freq_low = 0;
    if freq(idx(2)) > freq(idx(4))
        freq_high = freq(idx(2));
        freq_low = freq(idx(4));
    else
        freq_high = freq(idx(4));
        freq_low = freq(idx(2));
    end
    err1 = abs(freq_high - HF);
    [~,ind1] = min(err1);
    err2 = abs(freq_low - LF);
    [~,ind2] = min(err2);
    key_freq = [HF(ind1), LF(ind2)];
    key_temp = 0;
    for i = 1:N
        if(key_freq(1)==F(1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,i) && key_freq(2)==F(1,2,1,1,1,1,1,1,1,1,1,1,1,1,1,i))
            key_temp = charachters(i);
        end

    end 
    keyboard = key_temp;
end