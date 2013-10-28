function value = hash(hash_function)
%HASH Set/get a hash function.
%
%     fscache.hash(hash_function)
%     hash_function = fscache.hash()
%
% FSCACHE.HASH returns a hash function used by the FSCACHE library. A hash
% function must take a single string argument and also return a string.
% The function can also accept a scalar logical value. When `true` is given,
% FSCACHE.HASH resets the hash function to default. When `false` is given,
% FSCACHE.HASH disables a hash functionarity in FSCACHE library.
%
% Example:
%
%    fscache.hash(false); % Disable hash.
%    fscache.hash(true);  % Reset to default.
%    fscache.hash(@(x)x(1:min(2, numel(x)))); % Custom hash function.
%    hash_value = feval(fscache.hash, 'foo');
%
% See also fscache feval
  persistent hash_function_;
  if isnumeric(hash_function_) && isempty(hash_function_)
    hash_function_ = @default_hash;
  end
  if nargin > 0
    if isa(hash_function, 'function_handle')
      hash_function_ = hash_function;
    elseif islogical(hash_function) && isscalar(hash_function)
      if hash_function
        hash_function_ = @default_hash;
      else
        hash_function_ = @(key) '';
      end
    else
      error('hash_function must be a logical or a handle: %s', ...
            class(hash_function));
    end
  end
  value = hash_function_;
end

function value = default_hash(key)
%DEFAULT_HASH Default hash function.
  hash_value = typecast(int32(java.lang.String(key).hashCode()), 'uint32');
  value = sprintf('%02x', bitand(hash_value, uint32(255)));
end