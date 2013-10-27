function varargout = export(name)
%EXPORT Export key-value pairs.
%
%    mapObj = fscache.export(name)
%    [keys, values] = fscache.export(name)
%
% FACACHE.EXPORT exports key-value pairs to a containers.Map class object or
% to a cell array of KEYS and VALUES from a collection specified by NAME.
%
% See also fscache
  error(nargchk(1, 1, nargin, 'struct'));
  error(nargoutchk(0, 2, nargout, 'struct'));
  keys = fscache.keys(name);
  values = cell(size(keys));
  for i = 1:numel(keys)
    values{i} = fscache.get(name, keys{i});
  end
  if nargout <= 1
    varargout{1} = containers.Map(keys, values);
  elseif nargout == 2
    varargout{1} = keys;
    varargout{2} = values;
  end
end