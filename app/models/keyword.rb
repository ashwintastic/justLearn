class Keyword < ApplicationRecord
	validates :name, uniqueness: true

	class << self
	  def suggest_keywords(search_param)
		where('name like :query', query: "#{search_param}%").map{ |k| {label: k.name, value: k.name} }
      end
    end
end
