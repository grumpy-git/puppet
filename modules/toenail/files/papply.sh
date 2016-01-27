#!/bin/sh
sudo puppet apply /home/paul/aws/puppet/manifests/site.pp --modulepath=/home/paul/aws/puppet/modules/ $*
