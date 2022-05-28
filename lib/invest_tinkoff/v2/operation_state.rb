# frozen_string_literal: true

# Статус запрашиваемых операций
class InvestTinkoff::V2::OperationState
  # Значение не указано
  UNSPECIFIED = 0

  # Исполнена
  EXECUTED = 1

  # Отменена
  CANCELED = 2
end
