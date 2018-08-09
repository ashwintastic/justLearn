class KeywordController < ApplicationController

  def auto_suggestions
    resp = Keyword.suggest_keywords(params[:keyword])
    render json: { options: resp }
  end
end