class Scenario
  attr_accessor :tag_endpoint_name
  attr_accessor :endpoint_name
  attr_accessor :endpoint_verb
  attr_accessor :swagger_section
  attr_accessor :scenarios

  def initialize(data_scenario)
    @tag_endpoint_name = data_scenario.tag_endpoint
    @endpoint_name = data_scenario.endpoint
    @endpoint_verb = data_scenario.verb
    @swagger_section = data_scenario.section
  end
end
