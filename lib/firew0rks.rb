# frozen_string_literal: true
require "io/console"
require_relative "firew0rks/version"
require_relative "firew0rks/frame"
require_relative "firew0rks/error"
require_relative "firew0rks/terminal"


class Fireworks
  def initialize
    @first_frame = true
    @frames = Frame.new.get_frames
    @backspace_adjust =  "\033[A" * (@frames[0].split("\n").length + 1)
  end


  def clear_screen
    Terminal.clear_buffer
  end

  def init_screen
    clear_screen
  end

  def render
    loop do
      @frames.each do |content|
        if !@first_frame
          $stdout.print @backspace_adjust
        end
        clear_screen
        $stdout.print content
        @first_frame = false
        sleep(0.05)
      end
    end
  end

  def run
    init_screen
    render
  end
end
