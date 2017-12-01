# Cookbook:: ultimate_config_cookbook
#
# The MIT License (MIT)
#
# Copyright:: 2017, Garry Lachman
# https://github.com/garrylachman/chef-ultimate-config-cookbook
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.

name 'ultimate_config_cookbook'
maintainer 'Garry Lachman'
maintainer_email 'garry@lachman.co'
license 'MIT'
source_url 'https://github.com/garrylachman/chef-ultimate-config-cookbook'
issues_url 'https://github.com/garrylachman/ultimate_config_cookbook/issues'
description 'Installs/Configures ultimate_config_cookbook'
long_description 'Installs/Configures ultimate_config_cookbook'
version '0.1.1'
chef_version '>= 12.1' if respond_to?(:chef_version)

gem 'inifile'
