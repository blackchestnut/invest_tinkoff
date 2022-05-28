# frozen_string_literal: true

# Тип экспирации стоп-заявки
class InvestTinkoff::V2::StopOrderExpirationType
  # Значение не указано
  UNSPECIFIED = 0

  # Действительно до отмены
  GOOD_TILL_CANCEL = 1

  # Действительно до даты снятия
  GOOD_TILL_DATE = 2
end
