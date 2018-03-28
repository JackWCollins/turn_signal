class ApplicationController < ActionController::API

  def not_found_error(record_type)
    "Sorry, we could not find that #{record_type}."
  end

  def validation_errors(record)
    {errors: record.messages&.values&.flatten}
  end
end
