helpers do
  def normalize(url)
    unless url.start_with?('http://')
      url.prepend('http://')
    else
      url
    end
  end
end
