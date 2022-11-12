# Module responsible for extracting data
module ExtractData
  def extract_data_squad
    data_yml = YAML.load_file('core/templates/_require_fields.yml')

    data = OpenStruct.new
    data.bu_name = data_yml['bu_name']
    data.tribe_name = data_yml['tribe_name']
    data.tag_squad_name = data_yml['tag_squad_name']
    data.title_squad_name = data_yml['tag_squad_name'].gsub('_', ' ').upcase
    data
  end

  def extract_data_for_feature(doc)
    body = JSON.parse(doc.body)

    data = OpenStruct.new
    data.title_api_name = body['info']['title'].gsub('.', ' ').upcase
    data.tag_api_name = body['info']['title'].gsub('.', '_').gsub(' ', '_').downcase
    data.swagger_url = "#{@doc.host}/index.html"
    data
  end

  def extract_data_for_scenarios(doc)
    body = JSON.parse(doc.body)

    datas = []
    endpoints = body['paths'].keys
    endpoints.size.times do |index|
      results = body['paths'][endpoints[index]]

      results.each do |verb|
        endpoint = adjust_string_endpoint(endpoints[index])

        data = OpenStruct.new
        data.section = results.first[1].first[1].first
        data.endpoint = endpoint.pascal_case
        data.tag_endpoint = endpoint.snake_case
        data.verb = verb.first
        datas << data
      end
    end

    datas
  end

  private

  def adjust_string_endpoint(endpoint)
    endpoint_array = endpoint.split('/')
    if endpoint_array.last.include?('{')
      "#{endpoint_array[endpoint_array.size - 2]}#{endpoint_array.last.delete('{').delete('}').capitalize}"
    else
      endpoint_array.last
    end
  end
end
