import os
from parcel import tools
from fabric.api import task, env, sudo, settings, hide, cd, execute
from loom.utils import upload_dir
from loom.tasks import *
from loom import puppet

env.puppet_module_dir = 'puppet/modules/'
env.roledefs = {
    'workstation': ['sherzberg@localhost'],
}

@task
def provision():
    execute(puppet.update)
    execute(puppet.apply)
