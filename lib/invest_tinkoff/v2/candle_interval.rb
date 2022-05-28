# frozen_string_literal: true

# Интервал свечей
# https://tinkoff.github.io/investAPI/marketdata/#candleinterval
class InvestTinkoff::V2::CandleInterval
  # Интервал не определён
  UNSPECIFIED = 0

  # 1 минута
  MIN_1 = 1

  # 5 минут
  MIN_5 = 2

  # 15 минут
  MIN_15 = 3

  # 1 час
  HOUR = 4

  # 1 день
  DAY = 5
end
