class Squad
  attr_accessor :bu_name
  attr_accessor :tribe_name
  attr_accessor :tag_squad_name
  attr_accessor :title_squad_name

  def initialize(data_for_feature)
    @bu_name = data_for_feature.bu_name
    @tribe_name = data_for_feature.tribe_name
    @tag_squad_name = data_for_feature.tag_squad_name
    @title_squad_name = data_for_feature.title_squad_name
  end
end
