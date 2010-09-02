# All the ver integration stuff is in here.
require 'ver'
require 'command_t/ex/command_t'
require 'command_t/ex/command_t_yard'

VER::Executor::ExLabel::COMPLETERS.merge!(
  'command_t' => :ExCommandT,
  'command_t_yard' => :ExCommandTYARD
)

VER::startup_hook do
  module VER
    minor_mode :open do
      handler Methods::Control
      map [:ex, :command_t], '<Control-t>'
    end
  end
end
