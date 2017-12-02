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

properties_file '/tmp/4.properties' do action :delete end
properties_file '/tmp/5.properties' do action :delete end
properties_file '/tmp/6.properties' do action :delete end

properties_file '/tmp/4.properties' do
  file_content node.default['config2']
  action :create
end

edit_content = {
  "first_key" => "val1",
  "key_2" => "val2",
  "key_key" => "val3"
}

properties_file '/tmp/3.properties' do
  file_content edit_content
  action :create
end

properties_file '/tmp/4.properties' do
  file_content edit_content
  action :edit
end

properties_file '/tmp/5.properties' do
  file_content node.default['config2']
  action :create_or_edit
end

properties_file '/tmp/6.properties' do
  file_content edit_content
  action :create_or_edit
end

properties_file '/tmp/6.properties' do
  action :delete
end

properties_file '/tmp/5.properties' do
  file_content edit_content
  action :replace
end
