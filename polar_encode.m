function x = polar_encode(u, frozen_bits_indicator)

N = length(u);

n = log2(N);

if N ~= 2^n
  error('wrong length of input');    
end

u(frozen_bits_indicator == 1) = 0;

x = polar_encode_recursive(u);

end