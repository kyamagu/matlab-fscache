function put(name, key, value)
%PUT Put a value.
%
%    fscache.put(name, key, value)
%
% FSCACHE.PUT saves a VALUE with a KEY in a collection specified by NAME.
%
% See also fscache
  error(nargchk(3, inf, nargin, 'struct'));
  filename = fscache.getFilePath(name, key);
  if ~exist(fileparts(filename), 'dir')
    mkdir(fileparts(filename));
  end
  save(filename, 'value');
end