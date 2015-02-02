module FlightStats
  class Airline < Resource
    attr_accessor :fs,
                  :iata,
                  :icao,
                  :short_name,
                  :name,
                  :phone_number,
                  :active,
                  :category
  
    @@base_path = "/flex/airlines/rest/v1/json"
  
    class << self
      def actives(options = {})
          from_response API.get("#{base_path}/active", {}, options), 'airlines'
      end
      
      def all(options = {})
        from_response API.get("#{base_path}/all", {}, options), 'airlines'
      end

      def on_date
        from_response API.get("#{base_path}/#{year}/#{month}/#{day}", {}, options), 'airlines'
      end
      
      def by_flight_stats_code(flight_stats_code, options = {})
        from_response API.get("#{base_path}/fs/#{flight_stats_code}", {}, options), 'airline'
      end
      
      def by_iata_code(iata_code, options = {})
        from_response API.get("#{base_path}/iata/#{iata_code}", {}, options), 'airline'
      end

      def by_iata_code_on_date(iata_code, year, month, day, options = {})
        from_response API.get("#{base_path}/iata/#{iata_code}/#{year}/#{month}/#{day}", {}, options), 'airline'
      end

      def by_icao_code(icao_code, options = {})
        from_response API.get("#{base_path}/icao/#{icao_code}", {}, options), 'airline'
      end

      def by_icao_code_on_date(icao_code, year, month, day, options = {})
        from_response API.get("#{base_path}/icao/#{icao_code}/#{year}/#{month}/#{day}", {}, options), 'airline'
      end
      
      def base_path
        @@base_path
      end
    end
  end
end
