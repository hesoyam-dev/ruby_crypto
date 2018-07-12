require 'open3'

class RubyCryptoManager
  attr_accessor :command, :options

  def initialize(command:, options:)
    @command = command
    @options = options
  end

  # def parse_options
  #   @options_line = command
  #   save_file
  #   options.each_pair { |k, v| @options_line << " --#{k} '#{v}'" }
  # end
  #
  # def process
  #   result = Hash.new
  #   parse_options
  #   stdout, stderr, status = Open3.capture3("ruby_crypto #{@options_line}")
  #   if stdout
  #     result[:stdout] = stdout
  #   elsif stderr
  #     result[:stderr] = stderr
  #   end
  #   result
  # end

  def save_file
    if options.key?('file')
      upload_dir = File.expand_path(__dir__).gsub('app/services', 'public/uploaded')
      path = File.join(upload_dir, options[:file][:filename])
      File.open(path, 'wb') { |f| f.write(options[:file][:tempfile].read) }
      options[:file] = path if File.exist?(path)
    end
  end



end
