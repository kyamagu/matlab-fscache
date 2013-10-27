FSCACHE
=======

File-system based cache for Matlab values. It implements a key-value persistent
storage using Matlab's built-in `load` and `save` functions. It does not offer
the best performance compared to a key-value database system, but works in any
platform supported by Matlab.

Some API depends on Java functionality.

API
---

    clear       - Clear a collection.
    delete      - Delete a value.
    exist       - Check if a key exists.
    export      - Export key-value pairs.
    get         - Get a value.
    getFilePath - Compute a file path for the given name and key.
    hash        - Set/get a hash function.
    import      - Import key-value pairs.
    keys        - Get a list of keys in the cache.
    put         - Put a value.
    root        - Set/get a root directory for fscache.

Usage
-----

Here is a quick usage example.

    fscache.put('my_pets', 'bow', struct('type', 'dog', 'age', 2));
    if ~fscache.exist('my_pets', 'chi')
      fscache.put('my_pets', 'chi', struct('type', 'cat', 'age', 1));
    end
    bow = fscache.get('my_pets', 'bow');
    fscache.delete('my_pets', 'chi');

The `fscache.root` function allows you to change the storage location, which by
default is set at `tmp` in the current directory.

    fscache.root('/path/to/cache');
    current_root = fscache.root;

The `fscache.hash` function controls how to generate a storage path. By
default, fscache generates a storage path with at most 256 hash entries in
each collection. When the number of cache entries are smaller than ~1000,
it is probably better to turn off the hash function.

    fscache.hash(false);
