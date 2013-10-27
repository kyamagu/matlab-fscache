function flag = exist(name, key)
%EXIST Check if a key exists.
%
%    flag = fscache.exist(name, key)
%
% FSCACHE.EXIST checks if a record exists at a specified KEY in a collection
% specified by NAME. Return true if it exists.
%
% See also fscache
  error(nargchk(2, 2, nargin, 'struct'));
  flag = exist(fscache.getFilePath(name, key), 'file') > 0;
end