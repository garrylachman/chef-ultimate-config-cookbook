# ultimate_config_cookbook

## Example
Use attributes or Hash for your config.
```
default['config1']['section1']['prop1'] = 'val1'
default['config1']['section1']['prop2'] = 'val2'
default['config1']['section2']['prop3'] = 'val3'
```
Or
```
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
* file_content - config hash, can be referanced to attribute or just Hash, for ini the use the fist level for sections.
* action - Supported actions:
  * create
  * edit
  * create_or_edit
  * delete
  * replace
#### INI Example
```
ini_file '/tmp/4.ini' do
  file_content node.default['config1']
  action :create
end
```
#### JSON Example
```
json_file '/tmp/4.ini' do
  file_content node.default['config1']
  action :create
end
```


![CHEF](https://www.chef.io/wp-content/uploads/2017/02/chef-logo.png "CHEF")
