class Statport < ActiveRecord::Base
  attr_accessible :city_id, :g1cli, :g1free, :g1leased, :g1trunk, :ip, :model_id, :pbad, :pbadlist, :pfree, :phome, :pleased, :sigport, :street_id
  has_one :city, :through => :street
  belongs_to :street
  belongs_to :model

  validates_associated :street
  validates_associated :model
  validates :g1cli, :presence => true
  validates :g1free, :presence => true
  validates :g1leased, :presence => true
  validates :g1trunk, :presence => true
  validates :ip, :presence => true
  validates :pbad, :presence => true
  validates :pbadlist, :presence => true
  validates :pfree, :presence => true
  validates :phome, :presence => true
  validates :pleased, :presence => true
  validates :sigport, :presence => true
  validates :g1cli, :numericality => { :only_integer => true, :message => I18n.t(:validate_text_statport_g1cli) }
  validates :g1free, :numericality => { :only_integer => true, :message => I18n.t(:validate_text_statport_g1free) }
  validates :pleased, :numericality => { :only_integer => true, :message => I18n.t(:validate_text_statport_pleased) }
  validates :g1trunk, :numericality => { :only_integer => true, :message => I18n.t(:validate_text_statport_g1trunk) }
  validates :pfree, :numericality => { :only_integer => true, :message => I18n.t(:validate_text_statport_pfree) }
  validates :phome, :numericality => { :only_integer => true, :message => I18n.t(:validate_text_statport_phome) }
  validates :pleased, :numericality => { :only_integer => true, :message => I18n.t(:validate_text_statport_pleased) }
  validates :ip, :length => { :minimum => 7 }
  validates :ip, :length => { :maximum => 15 }
  validates :pbadlist, :length => { :minimum => 1 }
  validates :pbadlist, :length => { :maximum => 10 }
  validates :ip, :format => { :with => /^\d+\.\d+\.\d+\.\d+$/, :message => I18n.t(:validate_text_statport_ip) }
  validates :sigport, :numericality => { :only_integer => true, :message => I18n.t(:validate_text_statport_sigport) }
  validates :pbad, :numericality => { :only_integer => true, :message => I18n.t(:validate_text_statport_pbad) }
  validates :pbadlist, :format => { :with => /^[0-9,\-]+$/, :message => I18n.t(:validate_text_statport_pbadlist) } 

  def to_label
    "#{model}"+' '+' '+ "#{ip}"
  end

  def to_s
    return to_label
  end
end
