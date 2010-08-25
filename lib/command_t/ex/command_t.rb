require 'command_t/finder'
class VER::Executor::ExCommandT < VER::Executor::Entry
  def pwd
    @pwd || Dir.pwd
  end
  attr_writer :pwd

  def options
    @options || {}
  end
  attr_writer :options

  def finder
    @finder ||= CommandT::Finder.new(pwd, options)
  end

  def choices(text)
    finder.sorted_matches_for(text, options)
  end

  def action(selected)
    if selected
      throw :invalid if File.directory? selected
      VER.find_or_create_buffer(selected)
    else
      tree.children.each do |child|
        path = Array(child).first # if more is added later
        next if File.directory? path
        VER.find_or_create_buffer path
      end
    end
    callback.destroy(false)
  end
end
