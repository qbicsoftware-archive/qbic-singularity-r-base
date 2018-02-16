QBiC Singularity R v3.2.2
====================

This is a containerized version of `R v3.2.2` running on an ``Ubuntu 16.04``. Find a list of packages in `rpackages.txt`. 

.. contents:: Table of Contents
   :depth: 3


Usage
-----

First of all, you need to have *Singularity* running on your system. Please check http://singularity.lbl.gov/all-releases for further instructions.

Pull from Singularity Hub
~~~~~~~
The easiest way to use this container is to pull it `from Singularity Hub`_ directly

.. _Hub: https://singularity-hub.org/

.. code-block:: bash
   
   singularity pull shub://qbicsoftware/qbic-singularity-r-v3.2:latest

or a particular version (i.e. ``v1.0``):

.. code-block:: bash
  
  singularity pull shub://qbicsoftware/qbic-singularity-r-v3.2:v1.0
  # Give it a new name locally
  singularity pull --name "mycontainer.simg" shub://qbicsoftware/qbic-singularity-r-v3.2:v1.0

Build from bootstrap file
~~~~~~~
You can also build the container yourself by just providing the bootstrap file (i.e. ``Singularity.lastest``). You will need to have ``sudo`` rights for doing so:

.. code-block:: bash
  
  sudo singularity build myawesomecontainer.simg Singularity.latest
  sudo singularity build myawesomecontainer.simg Singularity.latest &> build.log

Start R from within the container
~~~~~~~
You can access the R console by just running:

.. code-block:: bash
  
  singularity exec myawesomecontainer.simg R


Author
-------

`Sven Fillinger`_ (https://github.com/sven1103)
