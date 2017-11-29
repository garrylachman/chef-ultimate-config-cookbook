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
file_content expect to Hash or Attributes (its the same...).
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

### Supported action:
* create
* edit
* create_or_edit
* delete
* replace
