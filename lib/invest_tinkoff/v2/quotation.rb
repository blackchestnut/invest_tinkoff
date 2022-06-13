# frozen_string_literal: true

InvestTinkoff::V2::Quotation = Struct.new(
  :units,
  :nano
)

class InvestTinkoff::V2::Quotation
  def self.create price
    units = price.to_i
    nano = ((price.to_d - units) * 1_000_000_000).to_i
    new(
      "#{price.positive? ? '' : '-'}#{units.abs}",
      nano
    )
  end
end
