module Arelastic
  module Builders
    class Query < Struct.new :name
      class << self
        def [](field)
          new(field)
        end
        def constant_score(filter_or_query)
          query Arelastic::Queries::ConstantScore.new(filter_or_query)
        end

        def filtered(query, filter)
          query Arelastic::Queries::Filtered.new(query, filter)
        end

        def match_all
          query Arelastic::Queries::MatchAll.new
        end

        private
          def query value
            Arelastic::Searches::Query.new value
          end
      end

      def field other
        Arelastic::Queries::Field.new name, other
      end

      def term other
        Arelastic::Queries::Term.new name, other
      end

      def terms other
        Arelastic::Queries::Terms.new name, other
      end
    end
  end
end