function list = keys(name)
%KEYS Get a list of keys in the cache.
%
%    list = fscache.keys(name)
%
% FACACHE.KEYS returns keys of existing entries in a collection NAME.
%
% See also fscache
  if fscache.hash
    list = textscan(ls(fullfile(fscache.root, name, '*', '*.mat')), '%s');
    list = regexprep(list{1}', '^.*/(.*)\.mat$', '$1');
  else
    list = dir(fullfile(fscache.root, name, '*.mat'));
    list = strrep({list.name}, '.mat', '');
  end
  list = sort(list);
end