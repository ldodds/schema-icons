require 'rubygems'
require 'open-uri'
require 'zip/zip'

if !File.exists?("icons")
	Dir.mkdir("icons")
end

$stderr.puts("Caching icons")

File.open("icons/index.html", "w") do |index|
	#create index.html
	index.puts("<html><body><h1>Type Mappings</h1><table>")
	index.puts("<tr><th>Type</th><th>Icon</th></tr>")

	#process each mapping
	File.open("icon-mapping.csv").each do |line|
		type, page, name, number, icon_page, download = line.split(",")
		#skip header
		if type != "Type Name"
			begin
				#cache zipped svg locally
				temp = Tempfile.new(type)
				$stderr.puts("Fetching #{name} (#{number})...")
				temp.write( open( download ).read )
				temp.close    

				#unzip into local directory
				Zip::ZipFile.open( temp.path ) do |zipfile|
					#extract just the file we want
					entry = zipfile.get_entry("noun_project_#{number}.svg")
					zipfile.get_input_stream(entry) do |stream|
						#preserve filename
						File.open("icons/noun_project_#{number}.svg", "w") do |f|
							f.write( stream.read )
						end		
					end
				end
				#add mapping to index.html
				index.puts("<tr><td>#{type}</td><td><img src='noun_project_#{number}.svg' /></td></tr>")
			rescue StandardError => e
				$stderr.puts("Unable to cache icon #{name} (#{number})")
				$stderr.puts e
				$stderr.puts e.backtrace
			end
		end
		#be nice
		sleep(5)
	end
	index.puts("</table></body></html>")
end

$stderr.puts("Caching complete")

