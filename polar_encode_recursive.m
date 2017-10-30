function y = polar_encode_recursive(u)

N = length(u);

n = log2(N);

if N ~= 2^n
  error('wrong length of input');    
end

if N == 2
  y = mod(u * [1, 0; 1, 1], 2);
  return
end    

u_1 = zeros(1, N);

u_1(1:2:end) = bitxor(u(1:2:end), u(2:2:end));
u_1(2:2:end) = u(2:2:end);

u_2 = [u_1(1:2:end), u_1(2:2:end)];

y_1 = polar_encode_recursive(u_2(1:N/2));
y_2 = polar_encode_recursive(u_2((N/2+1):end));

y = [y_1, y_2];

end