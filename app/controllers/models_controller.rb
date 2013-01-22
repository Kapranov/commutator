class ModelsController < ApplicationController
  before_filter :require_user

  active_scaffold :model do |conf|
    conf.search.live = false
    conf.columns[:created_at].options[:format] = "%d %b %Y %I:%M:%S"
    conf.columns[:updated_at].options[:format] = "%d %b %Y %I:%M:%S"
    conf.list.per_page = 17
    conf.list.columns.add [ :id ]
    conf.list.columns = [:id, :manufacturer, :model, :created_at, :updated_at]
    conf.columns[:id].description = I18n.t(:text_model_id)
    conf.columns[:manufacturer].description = I18n.t(:text_model_manufacturer)
    conf.columns[:model].description = I18n.t(:text_model_model)
    conf.actions = [:create, :list, :update, :delete]
  end
end
