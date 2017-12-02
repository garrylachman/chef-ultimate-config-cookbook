# Ultimate Config Cookbook for CHEF

[Ultimate Config Cookbook @ CHEF Supermarket](https://supermarket.chef.io/cookbooks/ultimate_config_cookbook)


Supported formats:

* INI
* JSON
* YAML
* TOML
* Java Properties
* Plist

## Install

### Knife

```bash
knife cookbook site install ultimate_config_cookbook
```
```bash
knife cookbook site download ultimate_config_cookbook
```
### Policyfile

```bash
cookbook 'ultimate_config_cookbook', '~> 0.1.0', :supermarket
```
### Berkshelf/Librarian

```bash
cookbook 'ultimate_config_cookbook', '~> 0.1.0'
```

## Example

### Datasource

Use attributes or Hash for your config.
For INI files use first level for section name and 2nd level for `key=value`.

#### Attributes example

```ruby
default['config1']['section1']['prop1'] = 'val1'
default['config1']['section1']['prop2'] = 'val2'
default['config1']['section2']['prop3'] = 'val3'
```

#### Hash example

```ruby
config = {
  'section1' => {
    'prop1' => 'val1',
    'prop2' => 'val2'
  },
  'section2' => {
    'prop3' => 'val3'
  }
}
```

### Recipe

properties:

* `file_content` - config hash, can be a reference to attribute or just Hash, for ini the use the fist level for sections.
* `action` - supported actions:
  * ***create***
  * ***edit***
  * ***create_or_edit***
  * ***delete***
  * ***replace***

#### INI Example

```ruby
ini_file '/tmp/4.ini' do
  file_content node.default['config1']
  action :create
end
```

#### JSON Example

```ruby
json_file '/tmp/4.json' do
  file_content node.default['config1']
  action :create
end
```

#### YAML Example

```ruby
yaml_file '/tmp/4.yaml' do
  file_content node.default['config1']
  action :create
end
```

#### TOML Example

```ruby
toml_file '/tmp/4.toml' do
  file_content node.default['config1']
  action :create
end
```

#### Java Properties Example

```ruby
properties_file '/tmp/4.properties' do
  file_content node.default['config1']
  action :create
end
```

#### Plist Example

##### Plist config example

```ruby
plist_config = {
  "first_key" => "val1",
  "int" => 1,
  "float" => 1.2343,
  "boolean" => true,
  "time" => Time.now,
  "date" => Date.today,
  "datetime" => DateTime.now,
  "strings" => ["a", "b", "c"],
  "ints" => [1,2,3],
  "hashes" => [{:a => "a"}, {:b => "b"}, {:c => "c"}]
}
```

##### Plist execute example

```ruby
plist_file '/tmp/4.plist' do
  file_content plist_config
  action :create
end
```

## Changelog

* 0.1.7 - Plist
* 0.1.6 - Java Properties Support
* 0.1.4 - TOML Support
* 0.1.3 - YAML Support

## License and Authors

```
The MIT License (MIT)

Copyright:: 2017, Garry Lachman
https://github.com/garrylachman/chef-ultimate-config-cookbook

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:
The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
```

![CHEF](https://www.chef.io/wp-content/uploads/2017/02/chef-logo.png "CHEF")
