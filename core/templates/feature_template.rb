class FeatureTemplate
  include FileCommons

  attr_accessor :bu_name, :tribe_name, :tag_squad_name, :tag_api_name, :title_squad_name,
                :title_api_name, :swagger_url, :content, :scenarios, :section

  def initialize(data_squad, data_api, data_scenarios)
    @content = ''

    @bu_name = data_squad.bu_name
    @tribe_name = data_squad.tribe_name
    @tag_squad_name = data_squad.tag_squad_name
    @title_squad_name = data_squad.title_squad_name

    @tag_api_name = data_api.tag_api_name
    @title_api_name = data_api.title_api_name
    @swagger_url = data_api.swagger_url

    @scenarios = data_scenarios
  end

  def build
    puts '-----------[INFO] Gerando arquivo de feature, aguarde...'

    @section = nil
    @scenarios.each do |scenario|
      @content << build_feature_header if @section.nil?

      if section.nil? || !@section.eql?(scenario.swagger_section)
        @section = scenario.swagger_section

        scenario_template = ScenarioTemplate.new(scenario)
        @content << scenario_template.build_scenario_content
      else
        write_file(set_path_out, set_feature_file_name(@section.snake_case), @content)
      end
    end

    puts '-----------[INFO] Arquivo de feature gerado com sucesso!'
  end

  def set_feature_file_name(section)
    section = I18n.transliterate(section)
    "#{section}.feature"
  end

  def set_path_out
    path = I18n.transliterate(@tag_api_name)
    file_path = File.absolute_path("./output/specs/#{path}/")
    FileUtils.mkdir_p(file_path) unless Dir.exist?(file_path)
    file_path
  end

  def build_feature_header
%(# language:pt

@full_smoke
@#{@bu_name}
@#{@tribe_name}
@#{@tag_squad_name}
@#{@tag_api_name}
Funcionalidade: #{@title_squad_name} - API #{@title_api_name} - SECTION XXXXXXXX
  Eu como usuário do serviço #{@title_api_name.downcase.gsub('api', '')}
  Quero que ao requisitar os endpoints
  Seja seja retornado os devidos valores esperados

  Swagger: 'https://#{@swagger_url}'
)
  end
end
