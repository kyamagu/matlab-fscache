function value = get(name, key)
%GET Get a value.
%
%    value = fscache.get(name, key)
%
% FSCACHE.GET attempts to load a VALUE specified by a KEY in a collection
% specified by NAME. If there is no record, an empty result is returned.
%
% See also fscache
  error(nargchk(2, inf, nargin, 'struct'));
  filename = fscache.getFilePath(name, key);
  if ~exist(filename, 'file')
    value = [];
  else
    load(filename, 'value');
  end
end