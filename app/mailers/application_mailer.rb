# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'soporte@jombo.es'
  layout 'mailer'
end
