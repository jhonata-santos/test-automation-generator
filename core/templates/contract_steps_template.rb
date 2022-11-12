class ContractStepsTemplate
  include FileCommons

  def initialize()

  end

  def set_step_file_name(step)
    section = I18n.transliterate(step)
    "#{section}_steps.rb"
  end

  def set_path_out
    path = I18n.transliterate()
    file_path = File.absolute_path("./output/steps/#{path}/")
    FileUtils.mkdir_p(file_path) unless Dir.exist?(file_path)
    file_path
  end

  def build_given_content
%(
  Dado('ter uma massa configurada do endpoint #{}.#{} para o cenário {string}') do |type|
    #{} = OpenStruct.new

    # TODO: popular os devidos parametros
    if type.eql?('positivo')
    
    else

    end
  end
)
  end

  def build_when_content
%(
  Quando('chamar o endpoint #{}.#{}') do
  begin
    @#{}_#{}.response = #{}.#{}(#{}.body)
  rescue StandardError => error
    @#{}_#{}.error = error
  end
)
  end

  def build_then_content
%(
  Entao('validar o retorno do endpoint #{}.#{} para o cenario {string}') do |type|
    expect(#{}.error).to be_nil

    response = @#{}.response
    if type.eql?('positivo')
      # TODO: fazer as validacoes necessarias para o cenario positivo
      expect(response.code).to eql 200
      expect(response.body).not_to be_nil
    else
      # TODO: fazer as validacoes necessarias para o cenario negativo
      expect(response.code).to eql 500
    end
  end
)
  end
end
