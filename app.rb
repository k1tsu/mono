require 'flammarion'
f = Flammarion::Engraving.new


f.orientation = :horizontal
f.puts File.expand_path('~')
errors = []



class Array
  def zoink
    new = self - ["."]
    new = new - [".."]
    return new
  end
end


dir_array = Dir.entries(File.expand_path('~')) - [".."]
dir_array = dir_array - ["."]
p dir_array
dir_array.each do |directory|
  f.button(directory) do |n_dir|
    f.pane("mic").clear
    begin
      file = "#{File.expand_path('~')}/#{directory}"
      Dir.entries(file).zoink.each do |dir|
        f.pane("mic").button dir
    end
  rescue
    f.alert "Fatal Error: File #{file} could not be opened."
    end
  end
end


f.break


 f.wait_until_closed
