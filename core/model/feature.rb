class Feature
  attr_accessor :title_api_name
  attr_accessor :tag_api_name
  attr_accessor :swagger_url

  def initialize(data_for_feature)
    @title_api_name = data_for_feature.title_api_name
    @tag_api_name = data_for_feature.tag_api_name
    @swagger_url = data_for_feature.swagger_url
  end
end