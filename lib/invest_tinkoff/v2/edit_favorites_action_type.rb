# frozen_string_literal: true

# Тип действия со списком избранных инструментов
# https://tinkoff.github.io/investAPI/instruments/#editfavoritesactiontype
class InvestTinkoff::V2::EditFavoritesActionType
  # Тип не определён
  UNSPECIFIED = 0

  # Добавить в список
  ADD = 1

  # Удалить из списка
  DEL = 2
end
