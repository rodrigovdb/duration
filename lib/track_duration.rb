# frozen_string_literal: true

require_relative 'track_duration/version'

class TrackDuration
  attr_reader :seconds

  def initialize(param)
    initialize_param(param)
  end

  def to_s
    # @to_s ||= Time.at(seconds).utc.strftime(string_format)
    @to_s ||= seconds_to_hms
  end

  private

  def seconds_to_hms
    if seconds >= 3600
      format('%02d:%02d:%02d', seconds / 3600, seconds / 60 % 60, seconds % 60)
    else
      format('%02d:%02d', seconds / 60 % 60, seconds % 60)
    end
  end

  def string_format
    response = '%M:%S'
    response = "%H:#{response}" if seconds >= 3600

    response
  end

  def initialize_param(param)
    @seconds = param and return if param.is_a?(Integer)

    @seconds = param
               .split(':')
               .map(&:to_i)
               .inject(0) { |response, item| (response * 60) + item }
  end
end
