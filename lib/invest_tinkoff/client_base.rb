# frozen_string_literal: true

module InvestTinkoff
  class ClientBase
    include HTTParty

    def initialize token:, broker_account_id:, logger: nil
      @token = token
      @broker_account_id = broker_account_id
      @logger = logger
    end

    private

    def get_api_request path, query = nil
      response = self.class.get(
        path,
        query: query || base_query,
        logger: @logger,
        headers: headers
      )
      parse_response response
    end

    def post_api_request path, body: {}, query: {}
      response = self.class.post(
        path,
        query: base_query.merge(query),
        body: body.to_json,
        logger: @logger,
        headers: headers
      )
      parse_response response
    end

    def headers
      {
        'Authorization' => "Bearer #{@token}",
        'Content-Type' => 'application/json'
      }
    end

    def base_query
      return {} if @broker_account_id.nil?

      { brokerAccountId: @broker_account_id }
    end

    def parse_response response
      response.parsed_response
    end
  end
end
