class Arson
	class << self
		# +package+ is expected to be a Hash, matching the structure the AUR
		# RPC returns.
		# TODO: Add automatic dependency tracking (gleaned parsing the PKGBUILD)
		def download(package, depends=false)
			begin
				real_download("http://aur.archlinux.org"+package['URLPath'])
			rescue Errno::EEXIST => e
				warn e.message
				exit 2
			end
		end

		private

		# The real downloading code, the parameter is expected to be a valid
		# URL. No error checking is done.
		#
		# After the file is downloaded, it is attempted to be unpacked using
		# tar and gunzip formats.
		def real_download(url)
			Dir.chdir(Arson::Config["dir"]) do
				open(url) do |tar|
					# Write the stream to a file, b (binary) is JIC
					File.open(File.basename(url), "wb") do |file|
						file.write(tar.read)
					end
				end
				tgz = Zlib::GzipReader.new(File.open(File.basename(url), 'rb'))
				# Extract pkg.tar.gz to `pwd`, instead of `pwd`/pkg
				Archive::Tar::Minitar.unpack(tgz, Dir.pwd)
				FileUtils.mv File.basename(url), File.join(Dir.pwd, File.basename(url)[0..-8])
			end
		end
	end
end
