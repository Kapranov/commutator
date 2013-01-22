class StreetsController < ApplicationController
  before_filter :require_user

  active_scaffold :street do |conf|
    conf.search.live = false 
    conf.columns[:created_at].options[:format] = "%d %b %Y %I:%M:%S"
    conf.columns[:updated_at].options[:format] = "%d %b %Y %I:%M:%S"
    conf.list.columns = [:id, :city, :city_id, :street, :created_at, :updated_at]
    conf.columns[:city].form_ui = :select
    conf.actions = [:search, :create, :list, :update, :delete, :show]
    conf.columns[:city].actions_for_association_links = [:show]
    conf.columns[:city_id].set_link :show
    conf.update.link.page = false
    conf.delete.link.page = false
    conf.show.link.page = false
    conf.columns[:id].description = I18n.t(:text_street_id)
    conf.columns[:city_id].description = I18n.t(:text_city_id)
    conf.columns[:city].description = I18n.t(:text_street_city)
    conf.columns[:street].description = I18n.t(:text_street)
  end
end
