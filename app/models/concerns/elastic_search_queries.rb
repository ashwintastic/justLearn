require 'elasticsearch/model'
module ElasticSearchQueries
  extend ActiveSupport::Concern


  module ClassMethods

    def all_
      __elasticsearch__.search(
          query: {
              match_all: {}
          }
      )
    end


  def search_(query)
    __elasticsearch__.search(
        {
            query: {
                multi_match: {
                    query: query,
                    fields: %w(name desc)
                }
            },
            highlight: {
                pre_tags: ['<em>'],
                post_tags: ['</em>'],
                fields: {
                    title: {},
                    text: {}
                }
            }
        }
    )
  end

  def suggestions(q)
    suggested_text = __elasticsearch__.search(
        {
            suggest: {
                text: q,
                suggested_name: {
                    term: {
                        field: 'name',
                        sort:'score',
                        analyzer: 'my_analyzer'
                    }
                },
                suggested_desc:{
                    term:{
                        field: 'desc',
                        sort: 'score',
                        analyzer: 'my_analyzer'
                    }
                }
            }
        }
    ).suggestions
    text_extractor_from_suggestions(suggested_text, q)
  end

  def text_extractor_from_suggestions(suggestions, q)
    # TODO ::x at first hit suggestions is blank
    suggestions_given = {
        'keyword' => q,
        'is_suggested' => true
    }
    suggestions.keys.map do |k|
      suggestions_given[k] = suggestions[k][0].options.map(&:text).join(',')
      suggestions[k][0].options.map(&:text)
    end
    # TODO::x suggestions_given log somewhere in db
    suggestions_given
  end

end
end
