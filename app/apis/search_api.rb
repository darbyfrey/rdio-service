class SearchApi < Grape::API
  resource :search do
    desc 'Get a collection of artists, albums, and tracks for the given q'
    params do
      requires :q, type: String, desc: 'The query string for the search'
    end
    get do
      search = RDIO.search(query: params.q, types: 'Album,Artist,Track', count: 100)
      represent search.results, with: SearchResultRepresenter
    end
  end
end
