HCC Conda Recipes
=================

Recipes for the [conda] (http://conda.pydata.org) build system.

How to use:
-----------

If you don't have a copy of the repo, clone it first:

`git clone git@git.unl.edu:hcc/hcc-conda-recipes.git`

If you've already cloned it, do a pull to make sure you're up to date:

`git checkout master`
`git pull`

Create a new branch to add your recipe to.  For example, if you're adding
mypackage version 1.0,

`git checkout -b mypackage-1.0`

To build a package, run:

`conda build <recipe directory>`

See http://docs.continuum.io/conda/build.html for details on how to 
create a recipe.  Be sure to include an adequate test section in the recipe.
For packages that need compiled, be sure to include `gcc` in the build section
and `libgcc` in the run section of the recipe.

After adding a new recipe or version, run

`git add <recipe dir>`

Then commit the changes to your local repo:

`git commit`

Then push your new branch back up:

`git push origin mypackage-1.0` 

A CI job will automatically be created to build and test your recipe.  If the
build fails, add any fixes to your branch and do a push which will trigger another
build.  Rinse and repeat until everything works.

Create a merge request on the repo page to merge your branch into master.  Upon merge,
another CI job will be triggered to build and upload the package automatically to the
HCC channel at [https://anaconda.org/hcc](https://anaconda.org/hcc).

Once merged, you can update your local repo and delete the branch:

`git checkout master`
`git pull origin master`
`git branch -d mypackage-1.0`
