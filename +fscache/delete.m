function delete(name, key)
%DELETE Delete a value.
%
%    fscache.delete(name, key)
%
% FSCACHE.DELETE removes a record specified by the KEY from a collection
% specified by NAME.
%
% See also fscache.
  error(nargchk(2, 2, nargin, 'struct'));
  filename = fscache.getFilePath(name, key);
  if exist(filename, 'file')
    delete(filename);
  end
end