function x = polar_encode_prime(u, frozen_bits_indicator)

N = length(u);

n = log2(N);

if N ~= 2^n
  error('wrong length of input');    
end

u(frozen_bits_indicator == 1) = 0;

G_2 = [1, 0; 1, 1];

G = G_2;

for index = 1:(n-1)
  G = kron(G_2, G);
end

bit_reverted_list = bit_revert(0:(N-1), n) + 1;

x = mod(u(bit_reverted_list) * G, 2);

end