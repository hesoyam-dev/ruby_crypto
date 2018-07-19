require 'open3'

class RubyCryptoManager
  attr_accessor :command, :options

  def initialize(command:, options:)
    @command = command
    @options = options
  end

  def save_file
    if options.key?('file')
      upload_dir = File.expand_path(__dir__).gsub('app/services', 'public/uploaded')
      path = File.join(upload_dir, options[:file][:filename])
      File.open(path, 'wb') { |f| f.write(options[:file][:tempfile].read) }
      options[:file] = path if File.exist?(path)
    end
  end



end
