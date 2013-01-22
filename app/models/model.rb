class Model < ActiveRecord::Base
  attr_accessible :model, :manufacturer
  validates :manufacturer, :presence => true
  validates :model, :presence => true
  validates :manufacturer, :length => { :minimum => 5 }
  validates :manufacturer, :length => { :maximum => 7 }
  validates :model, :length => { :minimum => 7 }
  validates :model, :length => { :maximum => 13 }
  validates :manufacturer, :format => { :with => /^[A-Z][a-z]+$/, :message => I18n.t(:validate_text_manufacturer) }
  validates :model, :format => { :with => /^[A-Z0-9][A-Z0-9\-]+$/, :message => I18n.t(:validate_text_model) }

  def to_label
    "#{manufacturer} #{model}"
  end

  def to_s
    return to_label
  end
end
