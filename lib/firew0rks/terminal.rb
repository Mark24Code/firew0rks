# ANSI_escape_code
# Ref: https://xn--rpa.cc/irl/term.html
# https://en.wikipedia.org/wiki/ANSI_escape_code#CSIsection

class Terminal
  class << self

    def clear_buffer
      print "\x1b[3J"
    end

    def clear_screen
      print "\x1b[2J"
    end

    def hide_cursor
      print "\x1b[?25l"
    end

    def show_cursor
      print "\x1b[?25h"
    end

    def open_buffer
      # 打开特殊缓存
      print "\x1b[?1049h"
    end

    def close_buffer
      # 关闭特殊缓存
      print "\x1b[?1049l"
    end
  end
end
