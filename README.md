HCC Conda Recipes
=================

Recipes for the [conda] (http://conda.pydata.org) build system.

How to use:
-----------

### Setup your build environment

Create a VM on Anvil to use.  Since Docker is required, it needs to
be EL7 or better.  Here, Fedora 25 is used as an example since it's
the most recent and has a relatively new version of Docker in the
default repo.

#### Install Docker

An EL6-based Docker container is used for the builds.  In order to
test builds locally before pushing, a `simulate-gitlabci.py` script
is provided in the repo which will do the build within the same
EL6-based container.

Docker is provided in the standard Fedora repo, so install via dnf:

`sudo dnf install docker`

By default in F25, Docker is only runable as root or via sudo.  To run as the
`fedora` user, do:

```
sudo groupadd docker
sudo gpasswd -a ${USER} docker 
sudo systemctl restart docker
newgrp docker
```

If everything is setup properly, you should be able to run the `docker info`
command as the fedora user and have it return config information.

#### Clone the repo

If you don't have a copy of the repo, clone it first:

`git clone git@git.unl.edu:hcc/hcc-conda-recipes.git`

#### Install Conda and do initial setup

Install Conda via the MiniConda installer:

```
curl -O https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh
sudo bash Miniconda3-latest-$tag-x86_64.sh -b -p /anaconda
sudo chown -R $USER /anaconda
export PATH=/anaconda/bin:$PATH
```

Add the last line to the fedora user's `~/.bashrc` so the `PATH` setting is 
persistent.  The `simulate-gitlabci.py` script can then be run to install needed 
dependencies and set the correct channel order.

```
./simulate-gitlabci.py --set-channel-order
./simulate-gitlabci.py --install-requirements
```

### Build and test a recipe

If you've already cloned the repo, do a pull to make sure you're up to date:

`git checkout master`

`git pull`

Create a directory for your new package under `recipes`.  The directory
structure should be `recipes/<package name>/<package version>`, i.e.
`recipes/mypackage/1.0`.

To build a package without using Docker for initial testing, run:

`conda build <recipe directory>`

*See http://docs.continuum.io/conda/build.html for details on how to 
create a recipe.  Be sure to include an adequate test section in the recipe.
For packages that need compiled, be sure to include `gcc` in the build section
and `libgcc` in the run section of the recipe.*

To test a particular recipe (package) using Docker, run

`./simulate-gitlabci.py --loglevel=debug --packages=<package name>/<package version>`

i.e.,

`./simulate-gitlabci.py --loglevel=debug --packages=mypackage/1.0`

### Create a new branch and add your recipe

Once the new recipe works, create a new branch to add your recipe to.  
For example, if you're adding mypackage version 1.0,

`git checkout -b mypackage-1.0`

After adding a new recipe or version, run

`git add <recipe dir>`

Then commit the changes to your local repo:

`git commit`

Then push your new branch back up:

`git push origin mypackage-1.0` 

A CI job will automatically be created to build and test your recipe.  If the
build fails, add any fixes to your branch and do a push which will trigger another
build.  Rinse and repeat until everything works.

### Create a merge request

Create a merge request on the repo page to merge your branch into master.  Upon merge,
another CI job will be triggered to build and upload the package automatically to the
HCC channel at [https://anaconda.org/hcc](https://anaconda.org/hcc).

Once merged, you can update your local repo and delete the branch:

`git checkout master`

`git pull origin master`

`git branch -d mypackage-1.0`

