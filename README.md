HCC Conda Recipes
=================

Recipes for the [conda] (http://conda.pydata.org) build system.

How to use:
-----------

If you don't have a copy of the repo, clone it first:

`git clone git@git.unl.edu:hcc/hcc-conda-recipes.git`

If you've already cloned it, do a pull to make sure you're up to date:

`git pull`

To build a package, run:

`conda build <recipe directory>`

See http://docs.continuum.io/conda/build.html for details on how to 
create a recipe.

After adding a new recipe or version, run

`git add <recipe dir>`

Then commit the changes to your local repo:

`git commit -a`

Then push the changes back up:

`git push` 
