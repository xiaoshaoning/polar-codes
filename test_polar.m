function test_polar(n)

if nargin == 0
  n = 3;
elseif nargin > 1
  disp('usage: test_polar(n)');  
end

N = 2^n;

u = randi([0, 1], 1, N);

frozen_bits_indicator = randi([0, 1], 1, N);

x = polar_encode(u, frozen_bits_indicator);
x_prime = polar_encode_prime(u, frozen_bits_indicator);

if isequal(x, x_prime)
  disp('polar encoding test passed.');
end

symbols = 1 - 2*x;

snr = 0.2;

waveform = symbols + snr * randn(1, N);

demodulated_symbols = waveform;

decoded_bits = polar_decode(demodulated_symbols, frozen_bits_indicator);

u(frozen_bits_indicator == 1) = 0;

if isequal(decoded_bits, u)
  disp('polar decoding test passed.');
else
  disp('polar decoding test failed.');  
end

end