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

toml_file '/tmp/4.toml' do action :delete end
toml_file '/tmp/5.toml' do action :delete end
toml_file '/tmp/6.toml' do action :delete end

toml_file '/tmp/4.toml' do
  file_content node.default['config1']
  action :create
end

edit_content = {
  "integer" => 1,
  "float" => 3.14159,
  "true" => true,
  "false" => false,
  "string" => "hi",
  "array" => [[1], [2], [3]],
  "key" => {
    "group" => {
      "value" => "lol"
    }
  }
}

toml_file '/tmp/4.toml' do
  file_content edit_content
  action :edit
end

toml_file '/tmp/5.toml' do
  file_content node.default['config1']
  action :create_or_edit
end

toml_file '/tmp/6.toml' do
  file_content edit_content
  action :create_or_edit
end

toml_file '/tmp/6.toml' do
  action :delete
end

toml_file '/tmp/5.toml' do
  file_content edit_content
  action :replace
end