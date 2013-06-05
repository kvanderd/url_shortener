helpers do
  def error_template
    if @errors
      :_errors
    else
      :_no_errors
    end
  end
end