class ScenarioTemplate
  include FileCommons

  attr_accessor :tag_endpoint_name, :endpoint_name, :endpoint_verb

  def initialize(data_scenario)
    @tag_endpoint_name = data_scenario.tag_endpoint_name
    @endpoint_name = data_scenario.endpoint_name
    @endpoint_verb = data_scenario.endpoint_verb
  end

  def build_scenario_content
%(
  @wip
  @contract
  @tag_responsible
  @#{@tag_endpoint_name}.#{@endpoint_verb}
  Esquema do Cenário: [CONTRACT] Validar o endpoint #{@endpoint_name}.#{@endpoint_verb} <type>
    Dado que tenho uma massa configurada do enpoint #{@endpoint_name}.#{@endpoint_verb} para o cenário "<type>"
      | client | <type_person> |
    Quando chamar o endpoint #{@endpoint_name}.#{@endpoint_verb}
    Então verifico o retorno do endpoint #{@endpoint_name}.#{@endpoint_verb} para o cenário "<type>"

    @zephyr-????
    Exemplos:
      | type     |
      | positive |

    @zephyr-????
    Exemplos:
      | type     |
      | negative |
)
  end
end
