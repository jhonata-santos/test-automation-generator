require_relative 'support/env'

# Class responsible for the main orchestration
class AutomationGenerator
  include RequestCommons
  include ExtractData

  attr_accessor :doc, :data_squad, :data_api, :data_scenarios

  def initialize(url)
    @doc = get_doc_api(url)

    @data_squad = Squad.new(extract_data_squad)
    @data_api = Feature.new(extract_data_for_feature(@doc))

    @data_scenarios = []
    scenarios = extract_data_for_scenarios(@doc)
    scenarios.each do |scenario|
      @data_scenarios << Scenario.new(scenario)
    end
  end

  def main
    feature = FeatureTemplate.new(@data_squad, @data_api, @data_scenarios)
    feature.build
  end
end

Ui.new

#  urls = ['https://fakerestapi.azurewebsites.net/swagger/v1/swagger.json',
#           'https://api.portaldatransparencia.gov.br/v2/api-docs',
#           'https://petstore.swagger.io/v2/swagger.json'
#         ]
urls = ['https://fakerestapi.azurewebsites.net/swagger/v1/swagger.json']
urls.each { |url| AutomationGenerator.new(url).main }
