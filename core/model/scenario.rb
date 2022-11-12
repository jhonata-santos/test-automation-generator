# Class responsible for initializing scenario items
class Scenario
  attr_accessor :tag_endpoint_name, :endpoint_name, :endpoint_verb, :swagger_section, :scenarios

  def initialize(data_scenario)
    @tag_endpoint_name = data_scenario.tag_endpoint
    @endpoint_name = data_scenario.endpoint
    @endpoint_verb = data_scenario.verb
    @swagger_section = data_scenario.section
  end
end
