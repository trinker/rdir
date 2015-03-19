NEWS
====

Versioning
----------

Releases will be numbered with the following semantic versioning format:

&lt;major&gt;.&lt;minor&gt;.&lt;patch&gt;

And constructed with the following guidelines:

* Breaking backward compatibility bumps the major (and resets the minor
  and patch)
* New additions without breaking backward compatibility bumps the minor
  (and resets the patch)
* Bug fixes and misc changes bumps the patch


rdir 0.0.1
----------------------------------------------------------------

This package is designed to perform operations related to directories and files
on Windows machines.

&lt;b&gt;BUG FIXES&lt;/b&gt;

&lt;b&gt;NEW FEATURES&lt;/b&gt;

* `WP` added for reorienting Windows path backslashes to forward slashes.

&lt;b&gt;MINOR FEATURES&lt;/b&gt;

IMPROVEMENTS

* Removed **reports** dependency.

&lt;b&gt;CHANGES&lt;/b&gt;

* Renamed `dir_tree_win` to `tree_`.  Ut gains a print method and behaves
  similar to `path_`.