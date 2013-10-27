function test_fscache
%TEST_FSCACHE Test the functionality of fscache.
  current_hash = fscache.hash();
  fscache.hash(true);
  test1();
  fscache.hash(false);
  test1();
  fscache.hash(current_hash);
end

function status = test1()
%TEST_PUTEXISTGETDELETE
  status = true;
  try
    fscache.put('my_pets', 'bow', struct('type', 'dog', 'age', 2));
    if ~fscache.exist('my_pets', 'chi')
      fscache.put('my_pets', 'chi', struct('type', 'cat', 'age', 1));
    end
    bow = fscache.get('my_pets', 'bow');
    assert(isstruct(bow) && isscalar(bow));
    fscache.delete('my_pets', 'chi');
    assert(isempty(fscache.get('my_pets', 'chi')));
    keys = fscache.keys('my_pets');
    map = fscache.export('my_pets');
    fscache.clear('my_pets');
    fscache.import('my_pets', map);
  catch e
    disp(e.getReport);
    status = false;
  end
  fscache.clear('my_pets');
  if status
    disp('PASS');
  else
    disp('FAIL');
  end
end