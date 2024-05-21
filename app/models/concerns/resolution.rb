module Resolution
  extend ActiveSupport::Concern
  included do
    enum resolution: {year: 0, month: 0}, _suffix: 'r'

    def resolution_text
      resolution&.titleize
    end

    def resolution_format
      resolution == 'year' ? "%Y" : "%b-%Y"
    end

    def resolution_duration
      resolution == 'year' ? 1.year : 1.month
    end

    def date_by_resolution
      date.strftime(resolution_format)
    end

  end

  class_methods do
    def resolutions_for_select
      [
        ['Yearly', :year],
        ['Monthly', :month]
      ]
    end
  end
end
