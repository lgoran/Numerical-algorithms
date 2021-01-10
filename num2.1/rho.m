function [x]=rho(x,n)
binarni=dec2bin(x,n);
obrnuto=fliplr(binarni);
x=bin2dec(obrnuto);
end