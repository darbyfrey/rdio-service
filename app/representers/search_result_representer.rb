class SearchResultRepresenter < RdioRepresenter
  property :object_type, getter: 'search_result'
  property :id, exec_context: :decorator
  property :name
  property :base_icon
  property :has_radio
  property :url
  property :top_songs_key
  property :short_url
  property :length
  property :radioKey, as: :radio_id
  property :type, exec_context: :decorator
  property :embed_url
  property :icon
end
