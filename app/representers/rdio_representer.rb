class RdioRepresenter < Napa::Representer
  def id
    represented['key']
  end

  def type
    case represented.type
    when 'r'
      'artist'
    when 'a'
      'album'
    when 't'
      'track'
    end
  end
end