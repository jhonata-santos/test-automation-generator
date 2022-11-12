# Module responsible for writing files
module FileCommons
  def write_file(file_path, file_name, content)
    File.open("#{file_path}/#{file_name}", 'w') do |file|
      file.write(content)
      file.close
    end
  end
end
