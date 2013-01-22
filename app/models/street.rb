# coding: utf-8
class Street < ActiveRecord::Base
  attr_accessible :city, :city_id, :street
  belongs_to :city
  validates_associated :city
  validates :city, :presence => true
  validates :street, :presence => true
  validates :street, :length => { :minimum => 6 }
  validates :street, :length => { :maximum => 20 }
  validates :street, :format => { :with => /^[А-Я][а-я\-\s]+$/, :message => I18n.t(:validate_text_street) }

  def to_label
    "#{street}"
  end

  def to_s
    return to_label
  end
end
