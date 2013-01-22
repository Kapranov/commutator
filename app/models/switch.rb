# coding: utf-8
class Switch < ActiveRecord::Base
  attr_accessible :active, :city_id, :house, :install, :login, :mac, :model_id, :multicast, :num, :password, :porch, :pos, :serial, :snmpw, :statport_id, :street_id
  attr_readonly :login
  has_one :city, :through => :street
  has_one :street, :through => :statport
  has_one :model, :through => :statport
  belongs_to :statport

  validates_associated :street
  validates_associated :model
  validates_associated :statport

  validates :active, :presence => true
  validates :house, :presence => true
  validates :install, :presence => true
  validates :login, :presence => true
  validates :mac, :presence => true
  validates :multicast, :presence => true
  validates :num, :presence => true
  validates :password, :presence => true
  validates :porch, :presence => true
  validates :pos, :presence => true
  validates :serial, :presence => true
  validates :snmpw, :presence => true
  validates :statport_id, :presence => true
  validates :porch, :numericality => { :only_integer => true, :message => I18n.t(:validate_text_switch_porch) }
  validates :num, :numericality => { :only_integer => true, :message => I18n.t(:validate_text_switch_num) }
  validates :pos, :numericality => { :only_integer => true, :message => I18n.t(:validate_text_switch_pos) }
  validates :house, :format => { :with => /^[0-9\/А-Я]+$/, :message => I18n.t(:validate_text_switch_house) }
  validates :login, :format => { :with => /^admin$/, :message => I18n.t(:validate_text_switch_login) }
  validates :password, :format => { :with => /^[0-9a-zA-Z]+$/, :message => I18n.t(:validate_text_switch_password) }
  validates :snmpw, :format => { :with => /^[0-9a-zA-Z]+$/, :message => I18n.t(:validate_text_switch_snmp) }
  validates :serial, :format => { :with => /^[0-9A-Z]+$/, :message => I18n.t(:validate_text_switch_serial) }

  validates :active, :inclusion => { :in => %w(nonworking prepared working), :message => I18n.t(:validate_text_switch_active) }
  validates :multicast, :inclusion => { :in => %w(checked userchecked must troubles checkno usercheckno unknown), :message => I18n.t(:validate_text_switch_multicast) }

  def to_label
    statport " #{id}"
  end

  ACTIVE = %w(nonworking prepared working)
  validates_inclusion_of :active, :in => ACTIVE

  MULTICAST = %w(checked userchecked must troubles checkno usercheckno unknown)
  validates_inclusion_of :multicast, :in => MULTICAST

  before_validation :format_mac_string

  # 20:cf:30:ee:99:7a 20-cf-30-ee-99-7a 20cf.30ee.997a
  validates :mac, :format => { :with => /^([0-9a-fA-F][0-9a-fA-F]:){5}([0-9a-fA-F][0-9a-fA-F])$|^([0-9a-fA-F][0-9a-fA-F]-){5}([0-9a-fA-F][0-9a-fA-F])$|^([0-9a-fA-F][0-9a-fA-F][0-9a-fA-F][0-9a-fA-F].){2}([0-9a-fA-F][0-9a-fA-F][0-9a-fA-F][0-9a-fA-F])$/, :message => I18n.t(:validate_text_switch_mac) }

  protected

  def format_mac_string
    self.mac = self.mac.scan(/[0-9a-fA-F]{2}/).join(':').downcase if self.mac != nil
  end

end
