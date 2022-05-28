# frozen_string_literal: true

# Статус запрашиваемых инструментов
# https://tinkoff.github.io/investAPI/marketdata/#candleinterval
class InvestTinkoff::V2::InstrumentStatus
  # Значение не определено
  UNSPECIFIED = 0

  # Базовый список инструментов (по умолчанию).
  # Инструменты доступные для торговли через TINKOFF INVEST API.
  BASE = 1

  # Список всех инструментов
  ALL = 2
end
