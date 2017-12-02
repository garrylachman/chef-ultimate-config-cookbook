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

resource_name :toml_file

property :file_path, String, name_property: true
property :file_content, Hash, {}

require 'toml'
require 'json/ext'

class ::Hash
    def deep_merge(second)
        merger = proc { |key, v1, v2| Hash === v1 && Hash === v2 ? v1.merge(v2, &merger) : v2 }
        self.merge(second, &merger)
    end
end

action :create do
  if not ::File.exist?(new_resource.file_path)
    toml_file = ::File.new(new_resource.file_path, "w")
    toml_file.puts TOML::Generator.new(new_resource.file_content).body
    toml_file.close
  end
end

action :edit do
  if ::File.exist?(new_resource.file_path)
    toml_file = ::File.open(new_resource.file_path, "r+")
    current_content = TOML::Parser.new(toml_file.read().to_s).parsed
    new_content = current_content.deep_merge(new_resource.file_content)
    toml_file.truncate(0)
    toml_file.puts TOML::Generator.new(new_content).body
    toml_file.close
  end
end

action :create_or_edit do
  action_create
  action_edit
end

action :delete do
  if ::File.exist?(new_resource.file_path)
    ::File.delete(new_resource.file_path)
  end
end

action :replace do
  action_delete
  action_create
end
