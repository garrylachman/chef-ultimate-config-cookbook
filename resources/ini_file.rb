resource_name :ini_file

property :file_path, String

action :create do
  file "#{new_resource.file_path}" do
    content "file content"
  end
end
