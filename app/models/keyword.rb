class Keyword < ApplicationRecord
	validates :name, uniqueness: true
    # test
	class << self
	  def suggest_keywords(search_param)
		where('name like :query', query: "#{search_param}%").map{ |k| {label: k.name, value: k.name, related: k.and_related } }
      end
    end
end
