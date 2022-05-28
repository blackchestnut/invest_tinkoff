# frozen_string_literal: true

# Тип идентификатора инструмента
# https://tinkoff.github.io/investAPI/instruments/#instrumentidtype
class InvestTinkoff::V2::InstrumentIdType
  # Значение не определено
  UNSPECIFIED = 0

  # Figi
  FIGI = 1

  # Ticker
  TICKER = 2

  # Уникальный идентификатор
  UID = 3
end
