HCC Conda Recipes
=================

Recipes for the [conda](https://conda.io) build system.
All the recipes are licensed with the BSD 3-Clause License.

> [!NOTE]
> Please use EL8 Anvil VM for development to avoid any GLIBC errors when building packages and set `CONDA_OVERRIDE_GLIBC="2.28"`.

How to use:
-----------

### Setup your build environment

Create a VM on Anvil to use. Since Docker is required, it needs to
be EL7 or better. Here, Fedora is used as an example since it's
more modern and has a relatively new version of Docker in the
default repo.

To avoid a multitude of problems, disable SELinux by editing 
`/etc/sysconfig/selinux` and change the line

`SELINUX=enforcing`

to

`SELINUX=disabled`.

After editing the file, reboot your VM for the change to take effect.  
The `getenforce` command should return `Disabled` then.

If you are using Fedora or Centos 7, add the `/bin` directory to the `PATH`
variable in `~/.bashrc`   
`export PATH=$PATH:/bin`
and then type `source ~/.bashrc`.

#### Install Docker

An EL6-based Docker container is used for the builds. In order to
test builds locally before pushing, the `bioconda-utils` package
can be used to do the build within the same EL6-based container.

Docker is provided in the standard Fedora repo, so install it via dnf:

`sudo dnf install docker`

By default in Fedora, Docker is only runable as root or via sudo. To run as the
`fedora` user, do:

```
sudo groupadd docker
sudo gpasswd -a ${USER} docker 
sudo systemctl restart docker
newgrp docker
```

If everything is setup properly, you should be able to run the `docker info`
command as the fedora user and have it return config information. To have
Docker start on boot, run:

`sudo chkconfig docker on`

#### Clone the repo

If you don't have a copy of the repo, clone it first:

`git clone git@git.unl.edu:hcc/hcc-conda-recipes.git`

#### Install Conda and do initial setup

Install Conda via the Miniconda installer:

```
curl -OL https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
sudo bash Miniconda3-latest-Linux-x86_64.sh -b -p /anaconda
sudo chown -R $USER /anaconda
source /anaconda/etc/profile.d/conda.sh
conda init bash
```

Close and re-open your shell for the changes to take effect.
Next, set the channel order and install the `bioconda-utils`
dependencies:

```
conda config --add channels bioconda
conda config --add channels conda-forge
conda config --add channels hcc
conda install -y --file https://raw.githubusercontent.com/acaprez/bioconda-utils/gitlabci-master/bioconda_utils/bioconda_utils-requirements.txt
```

Then, install the HCC-modified `bioconda-utils` package:

```
pip install --force-reinstall git+https://github.com/acaprez/bioconda-utils.git@gitlabci-master
```

Next, configure the local channel:

```
mkdir -p /anaconda/conda-bld/{noarch,linux-64,osx-64}
conda index /anaconda/conda-bld/
conda config --system --add channels file://anaconda/conda-bld
```

Finally, clean unused packages and caches:

```
conda clean -y --all
```

### Build and test a recipe

If you've already cloned the repo, do a pull to make sure you're up to date:

`git checkout master`

`git pull`

Create a directory for your new package under `recipes`. The directory
structure should be `recipes/<package name>/<package version>`, i.e.
`recipes/mypackage/1.0`.

To build a package without using Docker for initial testing, run:

`conda build <recipe directory>`

from the recipe directory.

*See [this link](https://docs.conda.io/projects/conda-build/en/latest/user-guide/tutorials/build-pkgs.html) for details on how to 
create a recipe. Be sure to include an adequate test section in the recipe.
The [bioconda documentation](https://bioconda.github.io/contributor/index.html) may also
be helpful for creating the recipe.*

To test a particular recipe (package) using Docker, run

`bioconda-utils build recipes config.yml --docker --loglevel=debug --packages=<package name>/<package version>`

i.e.,

`bioconda-utils build recipes config.yml --docker --loglevel=debug --packages=mypackage/1.0`

from the root of the repo.

Once your recipe builds, but before you add it to git, you should *lint* it. Linting
checks the recipe for form and consistency. To lint it, run

`bioconda-utils lint recipes config.yml --docker --loglevel=debug --packages=mypackage/1.0`

from the root of the repo.

If there are issues, the output will list them along with a suggested fix. For more details,
see https://bioconda.github.io/contributor/linting.html.

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

A CI job will automatically be created to build and test your recipe. If the
build fails, add any fixes to your branch and do a push which will trigger another
build. Rinse and repeat until everything works.

### Create a merge request

Create a merge request on the repo page to merge your branch into master. Upon merge,
another CI job will be triggered to build and upload the package automatically to the
HCC channel at [https://anaconda.org/hcc](https://anaconda.org/hcc).

Once merged, you can update your local repo and delete the branch:

`git checkout master`

`git pull origin master`

`git branch -d mypackage-1.0`
