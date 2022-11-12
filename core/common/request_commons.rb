# Module responsible for rest requests
module RequestCommons
  def get_doc_api(api_url)
    Excon.get(api_url)
  end
end
