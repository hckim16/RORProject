module ApplicationHelper

    def active_link_to (nav_link, contrl, action, url, style)
        if controller_name == contrl && action_name == action
            return link_to nav_link, url, id: style
        else
            return link_to nav_link, url, class: style
        end
    end

    def all_country
        countries = [
            " ",
            "Austria",
            "China",
            "Germany",
            "Japan",
            "Korea",
            "New Zealand",
            "Philippines",
            "Spain",
            "United States"
        ]
        countries.each do |country|
            single_country = "#{country}"
        end

        # each_country = options_for_select(['Countr1', 'Countr2', 'Countr3', 'Countr4'])
        return countries
    end
end
