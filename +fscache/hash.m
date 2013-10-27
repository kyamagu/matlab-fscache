function flag = hash(flag)
%HASH Set/get a flag to add a hash to the file path.
%
% To enable/disable:
%
%    fscache.hash('/path/to/cache')
%
% To disable:
%
%    fscache.root()
%
% See also fscache
  persistent flag_;
  if isempty(flag_)
    flag_ = true;
  end
  if nargin > 0
    if ~isscalar(flag)
      error('flag must be a scalar logical: %s', class(flag));
    end
    flag_ = logical(flag);
  end
  flag = flag_;
end