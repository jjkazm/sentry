# frozen_string_literal: true

class PagesController < ApplicationController
  def home; end

  def error
    1 / 0
  rescue ZeroDivisionError => e
    Raven.capture_exception(e)
  end
end
