clear all

[s0,f0] = audioread('1.wav');
key = dtmf(s0,f0);


%_________________________________________________________%


[phone, f_phone] = audioread('phone_number.wav');
 N = 8;
 L = length(phone)/N;
 
 signals = zeros(L,N);

 
 for i = 1:N
     signals(:,i) = phone(1 + (i-1)*L:i*L);
 end
 
 key1 = dtmf(signals(:,1),f_phone);
 key2 = dtmf(signals(:,2),f_phone);
 key3 = dtmf(signals(:,3),f_phone);
 key4 = dtmf(signals(:,4),f_phone);
 key5 = dtmf(signals(:,5),f_phone);
 key6 = dtmf(signals(:,6),f_phone);
 key7 = dtmf(signals(:,7),f_phone);
 key8 = dtmf(signals(:,8),f_phone);
 
 keys = [key1, key2, key3, key4, key5, key6, key7, key8];
 disp(keys);