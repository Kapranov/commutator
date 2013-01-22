class SwitchesController < ApplicationController
  before_filter :require_user

  #
  #{column_name}_authorized_for_#{crud_type}?
  #def authorized_for_read?(options = [:house])
  #
  #def show_authorized?(record = nil)
  #  authorized_for?(:action => :update)
  #end
  #def login_authorized_for_show?(record = nil)
  #  return true unless existing_record_check?
  #  return false if userrights != 'admin'
  #  return true
  #end
  #
  #
  #
  def export_authorized?(record = nil)
    authorized_for?(:action => :update)
  end

  def show_export_authorized?(record = nil)
    export_authorized?
  end

  def authorized_for_read?
    return true if self.new_record? 
    self.is_owner?
  end

  active_scaffold :switch do |conf|
    conf.search.live = true
    conf.columns[:created_at].options[:format] = "%d %b %Y %I:%M:%S"
    conf.columns[:updated_at].options[:format] = "%d %b %Y %I:%M:%S"
    conf.list.always_show_search = true
    conf.list.per_page = 16
    #conf.field_search.action_group = true
    #conf.field_search.columns = :street, :house, :active, :multicast, :statport, :install
    conf.list.columns.add [ :id ]
    # conf.list.columns = [:id, :city, :street, :house, :porch, :active, :multicast, :statport, :pos, :num, :install, :login, :password, :mac, :serial, :snmpw]
    conf.list.columns = [:id, :city, :street, :house, :porch, :active, :multicast, :statport, :pos, :num, :install]
    conf.columns[:id].description = I18n.t(:text_switch_id)
    conf.columns[:city].description = I18n.t(:text_switch_city)
    conf.columns[:street].description = I18n.t(:text_switch_street)
    conf.columns[:house].description = I18n.t(:text_switch_house)
    conf.columns[:porch].description = I18n.t(:text_switch_porch)
    conf.columns[:active].description = I18n.t(:text_switch_active)
    conf.columns[:multicast].description = I18n.t(:text_switch_multicast)
    conf.columns[:statport].description = I18n.t(:text_switch_statport)
    conf.columns[:pos].description = I18n.t(:text_switch_pos)
    conf.columns[:num].description = I18n.t(:text_switch_num)
    conf.columns[:install].description = I18n.t(:text_switch_install)
    conf.columns[:login].description = I18n.t(:text_switch_login)
    conf.columns[:password].description = I18n.t(:text_switch_password)
    conf.columns[:mac].description = I18n.t(:text_switch_mac)
    conf.columns[:serial].description = I18n.t(:text_switch_serial)
    conf.columns[:snmpw].description = I18n.t(:text_switch_snmp)
    conf.columns[:active].form_ui = :select
    conf.columns[:active].options = {:options => Switch::ACTIVE.map(&:to_sym)}
    conf.columns[:multicast].form_ui = :select
    conf.columns[:multicast].options = {:options => Switch::MULTICAST.map(&:to_sym)}
    conf.create.columns = [:statport, :house, :porch, :pos, :num, :active, :multicast, :install, :login, :password, :mac, :serial, :snmpw]
    conf.actions = [:create, :nested, :list, :show, :update, :delete, :search]
    conf.columns[:statport].actions_for_association_links = [:show]
    conf.columns[:active].clear_link
    conf.columns[:street].clear_link
    conf.columns[:city].clear_link
    conf.update.columns = [:house, :porch, :install, :pos, :num, :active, :multicast, :login, :password, :mac, :serial, :snmpw]
    conf.show.columns = [:city, :street, :house, :porch, :active, :multicast, :statport, :pos, :num, :install, :login, :password, :mac, :serial, :snmpw, :created_at, :updated_at]
    conf.nested.add_link(:statport, :label => I18n.t("switches"), :page => false, :position => :after, :popup => false, :crud_type=> :update)
    conf.update.link.page = true
    conf.delete.link.page = true
    conf.show.link.page = true
    #conf.show.link = false 
    conf.actions.add :export
    conf.export.columns = [:id, :install, :city, :street, :house, :portch, :active, :multicast, :statport, :pos, :num]
    conf.export.default_deselected_columns = [:id, :install, :city, :street, :house, :portch, :active, :multicast, :statport, :pos, :num]
    conf.export.default_delimiter = ';'
    conf.export.force_quotes = true
  end
end
