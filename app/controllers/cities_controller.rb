class CitiesController < ApplicationController
  before_filter :require_user

  active_scaffold :city do |conf|
    conf.search.live = false
    conf.columns[:created_at].options[:format] = "%d %b %Y %I:%M:%S"
    conf.columns[:updated_at].options[:format] = "%d %b %Y %I:%M:%S"
    conf.list.always_show_search = false 
    conf.list.columns.add [ :id ]
    conf.list.columns = [:id, :city, :created_at, :updated_at]
    conf.actions = [:search, :create, :list, :update, :delete]
    conf.actions.exclude :search
    conf.columns[:id].description = I18n.t(:text_city_id)
    conf.columns[:city].description = I18n.t(:text_city)
  end
end
