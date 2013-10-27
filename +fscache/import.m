function import(name, varargin)
%IMPORT Import key-value pairs.
%
%    fscache.import(name, mapObj)
%    fscache.import(name, keys, values)
%
% FACACHE.IMPORT imports key-value pairs from a containers.Map class object or
% from a cell array of KEYS and VALUES into a collection specified by NAME.
%
% See also fscache
  error(nargchk(2, 3, nargin, 'struct'));
  if nargin == 2 && isa(varargin{1}, 'containers.Map')
    keys = varargin{1}.keys;
    values = varargin{1}.values;
  elseif nargin == 3 && iscell(varargin{1}) && iscell(varargin{2})
    keys = varargin{1};
    values = varargin{2};
  else
    error('Invalid input.');
  end
  assert(numel(keys) == numel(values));
  for i = 1:numel(keys)
    fscache.put(name, keys{i}, values{i});
  end
end