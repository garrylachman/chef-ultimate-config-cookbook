resource_name :ini_file

property :file_path, String
property :file_content, Hash, {}

action :create do
  require 'inifile'
  ini_file = IniFile.new(:filename => new_resource.file_path, :content => new_resource.file_content)
  ini_file.save
end

action :edit do
  require 'inifile'
  ini_file = IniFile.load(new_resource.file_path)
  ini_file = ini_file.merge(new_resource.file_content)
  ini_file.save
end
