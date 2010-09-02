require 'yard'
class VER::Executor::ExCommandTYARD < VER::Executor::Entry
  def choices(text)
    @matcher.sorted_matches_for(text, {})
  end
  
  def setup
    Registry.load!('.yardoc') # TODO use load_files
    @matcher = CommandT::Matcher.new(Registry, always_show_dot_files: true)
  end

  def action(selected)
    obj = Registry.path_hash[selected] or throw :invalid
    VER.find_or_create_buffer(obj.file, obj.line)
    callback.destroy(false)
  end

  module ::YARD::Registry
    # @param [Array<String>] YARD database paths to load
    def self.load_files(files=[]) # TODO test it
      files.each do |file|
        if @store.load(file)
          @store.load_yardoc
          @store.instance_variable_set(:@available_objects, 1/0.0) # Infinity
          @store.load_all
        end
      end
    end

    def self.paths
      @paths ||= all.map(&:path)
    end

    def self.path_hash
      @path_hash ||= Hash[all.map(&:path).zip(all)]
    end
  end
  
  Registry = ::YARD::Registry

end
