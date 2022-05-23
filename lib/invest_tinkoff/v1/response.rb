# frozen_string_literal: true

InvestTinkoff::V1::Response = Struct.new(
  :tracking_id,
  :status,
  :payload,
  :http_code
)

class InvestTinkoff::V1::Response
  def self.create response
    attributes = response.parsed_response || {}
    new(
      attributes['trackingId'],
      attributes['status'],
      attributes['payload'],
      response.code
    )
  end

  def success?
    status == 'Ok'
  end
end
