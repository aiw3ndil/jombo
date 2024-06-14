# frozen_string_literal: true

module ApplicationHelper
  def switch_locale_text
    I18n.locale == :en ? 'Spanish' : 'English'
  end
  
  def switch_locale_path
    I18n.locale == :en ? nil : 'en'
  end
end
