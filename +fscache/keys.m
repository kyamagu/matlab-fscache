function list = keys(name)
%KEYS Get a list of keys in the cache.
%
%    list = fscache.keys(name)
%
% FACACHE.KEYS returns keys of existing entries in a collection NAME.
%
% See also fscache
  if ~isempty(feval(fscache.hash, 'x'))
    list = dir(fullfile(fscache.root, name));
    list(cellfun(@(x)x(1)=='.', {list.name})) = [];
    for i = 1:numel(list)
      sublist = dir(fullfile(fscache.root, name, list(i).name, '*.mat'));
      list(i).name = strrep({sublist.name}, '.mat', '');
    end
    list = [list.name];
  else
    list = dir(fullfile(fscache.root, name, '*.mat'));
    list = strrep({list.name}, '.mat', '');
  end
  list = sort(list);
end