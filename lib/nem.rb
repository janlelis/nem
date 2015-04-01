require_relative "nem/version"

require "json"

class Nem
  def initialize(tty = false, *keywords)
    @keywords = keywords
    @tty = tty

    if @tty
      @gemspec_file = Dir['*.gemspec'].first

      unless File.file?(@gemspec_file)
        raise ArgumentError, "no gemspec in your current directory found"
      end

      gemspec_content = File.read(@gemspec_file)
    else
      @gemspec_file = '-'
      gemspec_content = $stdin.read
    end

    @gemspec = eval gemspec_content, binding, @gemspec_file
  end

  def validate
    unless @gemspec.runtime_dependencies.empty?
      raise ArgumentError, 'dependencies are not supported'
    end

    if @gemspec.executables.empty?
      raise ArgumentError, "you must specify at least one executable"
    end
  end

  def run
    validate
    if @tty
      File.write "package.json", generate
      puts "Converted #@gemspec_file to package.json"
    else
      puts generate
    end
  end

  def generate
    JSON.pretty_generate(
      "name" => @gemspec.name,
      "version" => @gemspec.version,
      "description" => @gemspec.description,
      "homepage" => @gemspec.homepage,
      "author" => {
        "name" => @gemspec.author || Array(@gemspec.authors).first,
        "email" => Array(@gemspec.email).first,
      },
      "keywords" => ["nem", *@keywords],
      "preferGlobal" => true,
      "bin" => Hash[@gemspec.executables.map{ |bin|
        [File.basename(bin), "bin/#{File.basename(bin)}"]
      }],
      "license" => @gemspec.license
    )
  end
end

