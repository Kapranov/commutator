class StatportsController < ApplicationController
  before_filter :require_user

  def export_authorized?(record = nil)
    authorized_for?(:action => :update)
  end

  def show_export_authorized?(record = nil)
    export_authorized?
  end

  active_scaffold :statport do |conf|
    conf.search.live = true
    conf.list.per_page = 10
    conf.columns[:created_at].options[:format] = "%d %b %Y %I:%M:%S"
    conf.columns[:updated_at].options[:format] = "%d %b %Y %I:%M:%S"
    conf.list.always_show_search = true
    conf.list.columns.add [ :id ]
    conf.list.columns = [:id, :city, :city_id, :street, :model, :ip, :pfree, :pbad, :pbadlist, :phome, :pleased, :g1free, :g1cli, :g1leased, :g1trunk, :sigport]
    conf.actions = [:search, :create, :list, :show, :update, :delete]
    conf.create.columns = [:city, :street, :model, :ip, :sigport, :pbad, :pbadlist]
    conf.show.columns = [:city, :street, :model, :ip, :sigport, :pfree, :pbad, :pbadlist, :phome, :pleased, :g1free, :g1cli, :g1leased, :g1trunk, :created_at, :updated_at]
    conf.update.columns = [:city, :street, :model, :ip, :sigport, :pfree, :pbad, :pbadlist, :phome, :pleased, :g1free, :g1cli, :g1leased, :g1trunk]
    conf.list.columns.exclude :city_id
    conf.columns[:city].clear_link
    conf.columns[:street].clear_link
    #conf.columns[:model].clear_link
    conf.columns[:city].actions_for_association_links = [:show]
    conf.columns[:street].actions_for_association_links = [:show]
    conf.columns[:model].actions_for_association_links = [:list]
    #conf.columns[:model].set_links :list
    conf.columns[:ip].set_link :show
    #conf.columns[:model].set_link :show
    conf.columns[:id].description = I18n.t(:text_statport_id)
    conf.columns[:city].description = I18n.t(:text_statport_city)
    conf.columns[:city_id].description = I18n.t(:text_statport_city_id)
    conf.columns[:street].description = I18n.t(:text_statport_street)
    conf.columns[:model].description = I18n.t(:text_statport_model)
    conf.columns[:ip].description = I18n.t(:text_statport_ip)
    conf.columns[:pfree].description = I18n.t(:text_statport_pfree)
    conf.columns[:pbad].description = I18n.t(:text_statport_pbad)
    conf.columns[:pbadlist].description = I18n.t(:text_statport_pbadlist)
    conf.columns[:phome].description = I18n.t(:text_statport_phome)
    conf.columns[:pleased].description = I18n.t(:text_statport_pleased)
    conf.columns[:g1free].description = I18n.t(:text_statport_g1free)
    conf.columns[:g1cli].description = I18n.t(:text_statport_g1cli)
    conf.columns[:g1leased].description = I18n.t(:text_statport_g1leased)
    conf.columns[:g1trunk].description = I18n.t(:text_statport_g1trunk)
    conf.columns[:sigport].description = I18n.t(:text_statport_sigport)
    #conf.update.link.page = false
    #conf.delete.link.page = false
    conf.show.link.page = true
    #conf.show.link.inline = false
    # This removes the show link from the list view, but still allows the show function to be used.
    #conf.show.link = true
    # #This sets the update link to open in its own page.
    #conf.show.link.inline = true
    #
    conf.actions.add :export
    conf.export.columns = [ :id, :city, :street, :model, :ip, :sigport, :pfree, :pbad, :pbadlist, :phome, :pleased, :g1free, :g1cli, :g1leased, :g1trunk ]
    conf.export.default_deselected_columns = [ :id, :city, :street, :model, :ip, :sigport, :pfree, :pbad, :pbadlist, :phome, :pleased, :g1free, :g1cli, :g1leased, :g1trunk ]
    conf.export.default_delimiter = ';'
    conf.export.force_quotes = true
  end
end
