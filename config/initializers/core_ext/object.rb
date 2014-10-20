class Object

  def app_log msg
    puts "[#{Rails.application.class.parent_name}]: " + msg
  end

end