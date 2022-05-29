# frozen_string_literal: true

# Тип стоп-заявки
class InvestTinkoff::V2::StopOrderType
  # Значение не указано
  UNSPECIFIED = 0

  # Take-profit заявка
  TAKE_PROFIT = 1

  # Stop-loss заявка
  STOP_LOSS = 2

  # Stop-limit заявка
  STOP_LIMIT = 3
end
