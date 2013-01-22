# coding: utf-8
class City < ActiveRecord::Base
  attr_accessible :city

  validates :city, :presence => true
  validates :city, :length => { :minimum => 4 }
  validates :city, :length => { :maximum => 16 }
  validates :city, :format => { :with => /^[А-Я][а-я]+$/, :message => I18n.t(:validate_text_city) }

  def to_label
    "#{city}"
  end

  def to_s
    return to_label
  end
end
