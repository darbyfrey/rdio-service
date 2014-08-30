class SearchApi < Grape::API
  resource :search do
    desc 'Get a collection of artists, albums, and tracks for the given q'
    params do
      requires :q, type: String, desc: 'The query string for the search'
      optional :types, type: Array, desc: 'An array of object types to search on (i.e. types[]=album&types[]=artist)'
      optional :type, type: String, desc: 'A type to search on (i.e. type=album)'
    end
    get do
      if RDIO_TYPES.include?(params.type.try(:titlecase))
        types = params.type.titlecase
      elsif params.types && (RDIO_TYPES & params.types.map{|p| p.titlecase}).any?
        types = params.types.map{|p| p.titlecase}.join(',')
      else
        types = RDIO_TYPES.join(',')
      end

      search = RDIO.search(query: params.q, types: types, count: 100)
      represent search.results, with: SearchResultRepresenter
    end
  end
end
