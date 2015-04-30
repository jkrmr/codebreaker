# Messenger double for standard out
class Messenger

  def messenger
    @messenger ||= StringIO.new
  end

  def messages
    @messenger.string.split("\n")
  end

end

def stdout
  @output ||= Messenger.new
end
