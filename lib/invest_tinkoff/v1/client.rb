# frozen_string_literal: true

class InvestTinkoff::V1::Client < InvestTinkoff::ClientBase
  base_uri 'https://api-invest.tinkoff.ru/openapi/'

  TIME_FORMAT = '%FT%T%:z'
  CANDLES_INTERVALS = %w[1min 2min 3min 5min 10min 15min 30min hour day week month]

  attr_accessor :broker_account_id

  # token - рабочий API token
  # broker_account_id (опционально) - идентификатор счета
  # logger (опиционально) - например: Rails.logger
  def initialize token:, broker_account_id: nil, logger: nil
    super(
      token: token,
      broker_account_id: broker_account_id,
      logger: logger
    )
  end

  # ==========================================
  # Операции с заявками
  # ==========================================

  # Получение списка активных заявок
  def orders
    get_api_request '/orders'
  end

  # Создание лимитной заявки
  # Пример figi: 'BBG000B9XRY4'
  # Пример operation: :buy, :sell
  def orders_limit_order figi:, operation:, lots:, price:
    post_api_request(
      '/orders/limit-order',
      body: {
        lots: lots,
        operation: operation.to_s.capitalize,
        price: price
      },
      query: { figi: figi }
    )
  end

  # Создание рыночной заявки
  # Пример figi: 'BBG000B9XRY4'
  # Пример operation: :buy, :sell
  def orders_market_order figi:, operation:, lots:
    post_api_request(
      '/orders/market-order',
      body: {
        lots: lots,
        operation: operation.to_s.capitalize
      },
      query: { figi: figi }
    )
  end

  # Отмена заявки
  def orders_cancel id
    post_api_request '/orders/cancel', query: { orderId: id }
  end

  # ==========================================
  # Операции с портфелем пользователя
  # ==========================================

  # Получение портфеля клиента
  def portfolio
    get_api_request '/portfolio'
  end

  # Получение валютных активов клиента
  def portfolio_currencies
    get_api_request '/portfolio/currencies'
  end

  # ==========================================
  # Получении информации по бумагам
  # ==========================================

  # Получение списка акций
  def market_stocks
    get_api_request '/market/stocks'
  end

  # Получение списка облигаций
  def market_bonds
    get_api_request '/market/bonds'
  end

  # Получение списка ETF
  def market_etfs
    get_api_request '/market/etfs'
  end

  # Получение списка валютных пар
  def market_currencies
    get_api_request '/market/currencies'
  end

  # Получение стакана по FIGI
  # Пример figi: 'BBG000B9XRY4'
  def market_orderbook figi:, depth: 20
    get_api_request '/market/orderbook', { figi: figi, depth: depth }
  end

  # Получение исторических свечей по FIGI
  # Пример figi: 'BBG000B9XRY4'
  # Пример from: Time.zone.now.beginning_of_week
  # Пример to: Time.zone.now
  # Пример interval: :1min, :2min, :3min, :5min, :10min, :15min, :30min, :hour, :day, :week, :month
  def market_candles figi:, from:, to:, interval:
    raise ArgumentError, 'interval' unless CANDLES_INTERVALS.include? interval.to_s

    get_api_request(
      '/market/candles',
      {
        figi: figi,
        from: from.strftime(TIME_FORMAT),
        to: to.strftime(TIME_FORMAT),
        interval: interval
      }
    )
  end

  # Получение инструмента по FIGI
  # Пример figi: 'BBG000B9XRY4'
  def market_search_by_figi figi
    get_api_request '/market/search/by-figi', { figi: figi }
  end

  # Получение инструмента по тикеру
  # Пример tiker: 'AAPL'
  def market_search_by_ticker ticker
    get_api_request '/market/search/by-ticker', { ticker: ticker }
  end

  # ==========================================
  # Получении информации по операциям
  # ==========================================

  # Получение списка операций
  # Пример from: Time.zone.now.beginning_of_week
  # Пример to: Time.zone.now
  # Пример figi (опиционально): 'BBG000B9XRY4'
  def operations from:, to:, figi: nil
    query = {
      from: from.strftime(TIME_FORMAT),
      to: to.strftime(TIME_FORMAT)
    }
    query.merge! figi: figi if figi.present?
    get_api_request '/operations', query
  end

  # ==========================================
  # Получении информации по брокерским счетам
  # ==========================================

  # Получение брокерских счетов клиента
  def user_accounts
    get_api_request '/user/accounts'
  end

  private

  def parse_response response
    InvestTinkoff::V1::Response.create response
  end
end
