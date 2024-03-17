# Button Interface / Abstract Class
class Button
  def render
    raise NotImplementedError
  end

  def click
    raise NotImplementedError
  end
end

# Dialog Interface / Abstract Class
class Dialog
  # Factory Method
  def create_button
    raise NotImplementedError
  end

  def render
    # core business logic
    button = create_button
    button.render
  end
end

class HTMLButton < Button
  def render
  end

  def click
  end
end

class WindowsButton < Button
  def render
  end

  def click
  end
end

class WebDialog < Dialog
  def create_button
    HTMLButton.new
  end
end

class WindowsDialog < Dialog
  def create_button
    WindowsButton.new
  end
end

class Application
  attr_accessor :dialog

  def initialize
    config = read_application_config_file

    if config.OS == "Windows"
      @dialog = WindowsDialog.new
    elsif config.OS == "Web"
      @dialog = WebDialog.new
    else
      raise StandardError, "Error! Unknown operating system."
    end
  end

  def main
    dialog.render
  end
end
