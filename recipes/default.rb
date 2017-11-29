ini_file 'ini create' do
  file_path '/tmp/4.ini'
  file_content node.default['config1']
  action :create
end

edit_content = {
  'sec1' => { 'garry' => 'edited' },
  'sec2' => { 'adding' => 'new' }
}

ini_file 'ini edit' do
  file_path '/tmp/4.ini'
  file_content edit_content
  action :edit
end
