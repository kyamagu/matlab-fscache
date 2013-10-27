function root_dir = root(root_dir)
%ROOT Root directory for fscache.
%
% To set a cache directory:
%
%    fscache.root('/path/to/cache')
%
% To get the current cache directory:
%
%    fscache.root()
%
% See also fscache
  persistent root_dir_;
  if isempty(root_dir_)
    root_dir_ = '';
  end
  if nargin > 0
    if ~ischar(root_dir)
      error('root_dir must be a string: %s', class(root_dir));
    end
    root_dir_ = root_dir;
  end
  root_dir = root_dir_;
end