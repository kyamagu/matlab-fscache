function clear(name)
%CLEAR Clear a collection.
%
%    fscache.clear(name)
%
% FSCACHE.CLEAR removes a a collection specified by NAME.
%
% See also fscache.
  error(nargchk(1, 1, nargin, 'struct'));
  dirname = fullfile(fscache.root, name);
  if exist(dirname, 'file')
    rmdir(dirname, 's');
  end
end