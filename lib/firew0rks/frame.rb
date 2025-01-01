

class Frame
  def initialize
    @dir = File.dirname(__FILE__)
  end

  def get_name_order(name_path)
    if name_path
      return File.basename(name_path, ".txt").to_i
    end
  end

  def get_frames
    frame_files = Dir.glob(File.join(@dir, "frames", "*.txt").to_s)

    frame_files = frame_files.sort do |a, b|
      get_name_order(a) <=> get_name_order(b)
    end

    frame_contents = frame_files.map do |frame_files|
      File.open(frame_files, 'r').read
    end

    return frame_contents
  end
end
