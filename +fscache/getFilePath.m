function filepath = getFilePath(name, key)
%GETFILEPATH Compute a file path for the given name and key.
%
%    filepath = fscache.getFilePath(name, key)
%
% See also fscache
  if ~ischar(name)
    error('name must be a string: %s', class(name));
  end
  if isscalar(key) && (isnumeric(key) || islogical(key))
    key = num2str(key);
  elseif ~ischar(key)
    error('key must be a string or a scalar numeric value: %s', class(key));
  end
  filepath = fullfile(fscache.root, ...
                      name, ...
                      feval(fscache.hash, key), ...
                      [key, '.mat']);
end
