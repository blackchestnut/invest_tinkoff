# frozen_string_literal: true

InvestTinkoff::V2::Response = Struct.new(
  :payload,
  :http_code
)

class InvestTinkoff::V2::Response
  def self.create response
    attributes = response.parsed_response || {}
    new(
      attributes,
      response.code
    )
  end

  def success?
    http_code == 200
  end
end
