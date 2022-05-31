# frozen_string_literal: true

class InvestTinkoff::V2::Client < InvestTinkoff::ClientBase
  base_uri 'https://invest-public-api.tinkoff.ru/rest/'

  TIME_FORMAT = '%Y-%m-%dT%H:%m:%S.000Z'

  def initialize token:, logger: nil
    super(
      token: token,
      logger: logger
    )
  end

  # ==========================================
  # InstrumentsService
  # ==========================================

  # Метод получения облигации по её идентификатору.
  # https://tinkoff.github.io/investAPI/instruments/#bondby
  #
  # @id_type: InvestTinkoff::V2::InstrumentIdType
  # @id: String
  # @class_code: String (Обязателен при id_type = TICKER)
  #
  # client.bond_by id_type: InvestTinkoff::V2::InstrumentIdType::FIGI, id: 'BBG00T22WKV5'
  def bond_by id_type:, id:, class_code: nil
    body = { idType: id_type, classCode: class_code, id: id }
    instrument_request '/BondBy', body
  end

  # Метод получения списка облигаций.
  # https://tinkoff.github.io/investAPI/instruments/#bonds
  #
  # @instrument_status: InvestTinkoff::V2::InstrumentStatus
  def bonds instrument_status: InvestTinkoff::V2::InstrumentStatus::BASE
    instrument_request '/Bonds', { instrumentStatus: instrument_status }
  end

  # Метод получения списка валют.
  # https://tinkoff.github.io/investAPI/instruments/#currencies
  #
  # @instrument_status: InvestTinkoff::V2::InstrumentStatus
  def currencies instrument_status: InvestTinkoff::V2::InstrumentStatus::BASE
    instrument_request '/Currencies', { instrumentStatus: instrument_status }
  end

  # Метод получения валюты по её идентификатору.
  # https://tinkoff.github.io/investAPI/instruments/#currencyby
  #
  # @id_type: InvestTinkoff::V2::InstrumentIdType
  # @id: String
  # @class_code: String (Обязателен при id_type = TICKER)
  #
  # client.currency_by id_type: InvestTinkoff::V2::InstrumentIdType::FIGI, id: 'BBG0013HQ5F0'
  # client.currency_by id_type: InvestTinkoff::V2::InstrumentIdType::TICKER, id: 'GBPRUB_TOM', class_code: 'CETS'
  def currency_by id_type:, id:, class_code: nil
    body = { idType: id_type, classCode: class_code, id: id }
    instrument_request '/CurrencyBy', body
  end

  # Метод редактирования избранных инструментов.
  # https://tinkoff.github.io/investAPI/instruments/#editfavorites
  #
  # @figis: String, пример: ['BBG000B9XRY4', 'BBG000BWXBC2']
  # @action_type: InvestTinkoff::V2::EditFavoritesActionType
  def edit_favorites figis:, action_type: InvestTinkoff::V2::EditFavoritesActionType::ADD
    body = {
      instruments: figis.map { |v| { figi: v } },
      actionType: action_type
    }
    instrument_request '/EditFavorites', body
  end

  # Метод получения инвестиционного фонда по его идентификатору.
  # https://tinkoff.github.io/investAPI/instruments/#etfby
  #
  # @id_type: InvestTinkoff::V2::InstrumentIdType
  # @id: String
  # @class_code: String (Обязателен при id_type = TICKER)
  #
  # client.etf_by id_type: InvestTinkoff::V2::InstrumentIdType::FIGI, id: 'BBG005DXDPK9'
  def etf_by id_type:, id:, class_code: nil
    body = { idType: id_type, classCode: class_code, id: id }
    instrument_request '/EtfBy', body
  end

  # Метод получения списка инвестиционных фондов.
  # https://tinkoff.github.io/investAPI/instruments/#etfs
  #
  # @instrument_status: InvestTinkoff::V2::InstrumentStatus
  def etfs instrument_status: InvestTinkoff::V2::InstrumentStatus::BASE
    instrument_request '/Etfs', { instrumentStatus: instrument_status }
  end

  # Метод получения фьючерса по его идентификатору.
  # https://tinkoff.github.io/investAPI/instruments/#futureby
  #
  # @id_type: InvestTinkoff::V2::InstrumentIdType
  # @id: String
  # @class_code: String (Обязателен при id_type = TICKER)
  #
  # client.future_by id_type: InvestTinkoff::V2::InstrumentIdType::FIGI, id: 'FUTNL0422000'
  def future_by id_type:, id:, class_code: nil
    body = { idType: id_type, classCode: class_code, id: id }
    instrument_request '/FutureBy', body
  end

  # Метод получения списка фьючерсов.
  # https://tinkoff.github.io/investAPI/instruments/#futures
  #
  # @instrument_status: InvestTinkoff::V2::InstrumentStatus
  def futures instrument_status: InvestTinkoff::V2::InstrumentStatus::BASE
    instrument_request '/Futures', { instrumentStatus: instrument_status }
  end

  # Метод получения накопленного купонного дохода по облигации.
  # https://tinkoff.github.io/investAPI/instruments/#getaccruedinterests
  #
  # @figi: String, пример: 'BBG00X6ZGSY7'
  # @from: Time, пример: 1.year.ago
  # @to: Time, пример: 2.months.from_now
  def accrued_interests figi:, from:, to:
    body = {
      figi: figi,
      from: from.strftime(TIME_FORMAT),
      to: to.strftime(TIME_FORMAT)
    }
    instrument_request '/GetAccruedInterests', body
  end

  # Метод получения актива по его идентификатору.
  # https://tinkoff.github.io/investAPI/instruments/#getassetby
  #
  # @id: String, пример: '9f083982-cf4c-418a-a0bf-8b82f16db42d'
  def asset_by id:
    instrument_request '/GetAssetBy', { id: id }
  end

  # Метод получения списка активов.
  # https://tinkoff.github.io/investAPI/instruments/#getassets
  def assets
    instrument_request '/GetAssets'
  end

  # Метод получения графика выплат купонов по облигации.
  # https://tinkoff.github.io/investAPI/instruments/#getbondcoupons
  #
  # @figi: String, пример: 'BBG00X6ZGSY7'
  # @from: Time, пример: 1.year.ago
  # @to: Time, пример: 6.months.from_now
  def bond_coupons figi:, from:, to:
    body = {
      figi: figi,
      from: from.strftime(TIME_FORMAT),
      to: to.strftime(TIME_FORMAT)
    }
    instrument_request '/GetBondCoupons', body
  end

  # Метод для получения событий выплаты дивидендов по инструменту.
  # https://tinkoff.github.io/investAPI/instruments/#getdividends
  #
  # @figi: String, пример: 'BBG000B9XRY4'
  # @from: Time, пример: 1.year.ago
  # @to: Time, пример: 1.month.from_now
  def dividends figi:, from:, to:
    body = {
      figi: figi,
      from: from.strftime(TIME_FORMAT),
      to: to.strftime(TIME_FORMAT)
    }
    instrument_request '/GetDividends', body
  end

  # Метод получения избранных инструментов.
  # https://tinkoff.github.io/investAPI/instruments/#getfavorites
  def favorites
    instrument_request '/GetFavorites'
  end

  # Метод получения размера гарантийного обеспечения по фьючерсам.
  # https://tinkoff.github.io/investAPI/instruments/#getfuturesmargin
  #
  # @figi: String
  def futures_margin figi:
    instrument_request '/GetFuturesMargin', { figi: figi }
  end

  # Метод получения основной информации об инструменте.
  # https://tinkoff.github.io/investAPI/instruments/#getinstrumentby
  #
  # @id_type: InvestTinkoff::V2::InstrumentIdType
  # @id: String
  # @class_code: String (Обязателен при id_type = TICKER)
  #
  # client.instrument_by id_type: InvestTinkoff::V2::InstrumentIdType::FIGI, id: 'BBG000B9XRY4'
  def instrument_by id_type:, id:, class_code: nil
    body = { idType: id_type, classCode: class_code, id: id }
    instrument_request '/GetInstrumentBy', body
  end

  # Метод получения акции по её идентификатору.
  # https://tinkoff.github.io/investAPI/instruments/#shareby
  #
  # @id_type: InvestTinkoff::V2::InstrumentIdType
  # @id: String
  # @class_code: String (Обязателен при id_type = TICKER)
  #
  # client.share_by id_type: InvestTinkoff::V2::InstrumentIdType::FIGI, id: 'BBG000B9XRY4'
  def share_by id_type:, id:, class_code: nil
    body = { idType: id_type, classCode: class_code, id: id }
    instrument_request '/ShareBy', body
  end

  # Метод получения списка акций.
  # https://tinkoff.github.io/investAPI/instruments/#shares
  #
  # @instrument_status: InvestTinkoff::V2::InstrumentStatus
  def shares instrument_status: InvestTinkoff::V2::InstrumentStatus::BASE
    instrument_request '/Shares', { instrumentStatus: instrument_status }
  end

  # Метод получения расписания торгов торговых площадок.
  # https://tinkoff.github.io/investAPI/instruments/#tradingschedulesrequest
  #
  # @exchange: String, пример: 'MOEX'
  # @from: Time, пример: 1.day.from_now
  # @to: Time, пример: 5.days.from_now
  def trading_schedules exchange:, from:, to:
    body = {
      exchange: exchange,
      from: from.strftime(TIME_FORMAT),
      to: to.strftime(TIME_FORMAT)
    }
    instrument_request '/TradingSchedules', body
  end

  # ==========================================
  # MarketDataService
  # ==========================================

  # Метод запроса исторических свечей по инструменту.
  # https://tinkoff.github.io/investAPI/marketdata/#getcandles
  #
  # @figi: String, пример: 'BBG000B9XRY4'
  # @from: Time, пример: 1.hour.ago
  # @to: Time, пример: Time.zone.now
  # @interval: InvestTinkoff::V2::CandleInterval
  def candles figi:, from:, to:, interval: InvestTinkoff::V2::CandleInterval::HOUR
    body = {
      figi: figi,
      from: from.strftime(TIME_FORMAT),
      to: to.strftime(TIME_FORMAT),
      interval: interval
    }
    market_request '/GetCandles', body
  end

  # Метод запроса последних цен по инструментам.
  # https://tinkoff.github.io/investAPI/marketdata/#getlastprices
  #
  # @figis: String, пример: ['BBG000B9XRY4', 'BBG000BWXBC2']
  def last_prices figis:
    market_request '/GetLastPrices', { figi: figis }
  end

  # Метод запроса последних обезличенных сделок по инструменту.
  # https://tinkoff.github.io/investAPI/marketdata/#getlasttrades
  #
  # @figi: String, пример: 'BBG000B9XRY4'
  # @from: Time, пример: 1.hour.ago
  # @to: Time, пример: Time.zone.now
  def last_trades figi:, from:, to:
    body = {
      figi: figi,
      from: from.strftime(TIME_FORMAT),
      to: to.strftime(TIME_FORMAT)
    }
    market_request '/GetLastTrades', body
  end

  # Метод получения стакана по инструменту.
  # https://tinkoff.github.io/investAPI/marketdata/#getorderbook
  #
  # @figi: String, пример: 'BBG000B9XRY4'
  # @depth: Integer
  def order_book figi:, depth: 10
    market_request '/GetOrderBook', { figi: figi, depth: depth }
  end

  # Метод запроса статуса торгов по инструментам.
  # https://tinkoff.github.io/investAPI/marketdata/#gettradingstatus
  #
  # @figi: String, пример: 'BBG000B9XRY4'
  def trading_status figi:
    market_request '/GetTradingStatus', { figi: figi }
  end

  # ==========================================
  # OperationsService
  # ==========================================

  # Метод получения брокерского отчёта.
  # https://tinkoff.github.io/investAPI/operations/#getbrokerreport
  def broker_report
    # operation_request '/GetBrokerReport', body
    raise NotImplementedError
  end

  # Метод получения отчёта "Справка о доходах за пределами РФ".
  # https://tinkoff.github.io/investAPI/operations/#getdividendsforeignissuer
  def dividends_foreign_issuer
    # operation_request '/GetDividendsForeignIssuer', body
    raise NotImplementedError
  end

  # Метод получения списка операций по счёту.
  # https://tinkoff.github.io/investAPI/operations/#getoperations
  #
  # @account_id: String
  # @figi: String, пример: 'BBG000B9XRY4'
  # @from: Time
  # @to: Time
  # @state (опиционально): InvestTinkoff::V2::OperationState
  def operations account_id:, figi:, from:, to:, state: InvestTinkoff::V2::OperationState::UNSPECIFIED
    body = {
      accountId: account_id,
      figi: figi,
      from: from.strftime(TIME_FORMAT),
      to: to.strftime(TIME_FORMAT),
      state: state || InvestTinkoff::V2::OperationState::UNSPECIFIED
    }
    operation_request '/GetOperations', body
  end

  # Метод получения портфеля по счёту.
  # https://tinkoff.github.io/investAPI/operations/#getportfolio
  #
  # @account_id: String
  def portfolio account_id:
    operation_request '/GetPortfolio', { accountId: account_id }
  end

  # Метод получения списка позиций по счёту.
  # https://tinkoff.github.io/investAPI/operations/#getpositions
  #
  # @account_id: String
  def positions account_id:
    operation_request '/GetPositions', { accountId: account_id }
  end

  # Метод получения доступного остатка для вывода средств.
  # https://tinkoff.github.io/investAPI/operations/#getwithdrawlimits
  def withdraw_limits account_id:
    operation_request '/GetWithdrawLimits', { accountId: account_id }
  end

  # ==========================================
  # OrdersService
  # ==========================================

  # Метод получения списка активных заявок по счёту.
  #
  # @account_id: String
  def orders account_id:
    order_request '/GetOrders', { accountId: account_id }
  end

  # Метод выставления заявки.
  # https://tinkoff.github.io/investAPI/orders/#postorder
  #
  # @account_id: String
  # @figi: String
  # @quantity: Integer
  # @price: Float
  # @direction: InvestTinkoff::V2::OrderDirection
  # @order_type: InvestTinkoff::V2::OrderType
  # @order_id: String (max length 36)
  def create_order( # rubocop: disable Metrics/ParameterLists
    account_id:,
    figi:,
    quantity:,
    price:,
    direction:,
    order_type:,
    order_id:
  )
    body = {
      accountId: account_id,
      figi: figi,
      quantity: quantity,
      price: InvestTinkoff::V2::Quotation.create(price),
      direction: direction,
      orderType: order_type,
      orderId: order_id
    }
    order_request '/PostOrder', body
  end

  # Метод получения статуса торгового поручения.
  # https://tinkoff.github.io/investAPI/orders/#getorderstate
  #
  # @account_id: String
  # @order_id: String
  def order_state account_id:, order_id:
    body = { accountId: account_id, orderId: order_id }
    order_request '/GetOrderState', body
  end

  # Метод отмены биржевой заявки.
  # https://tinkoff.github.io/investAPI/orders/#cancelorder
  #
  # @account_id: String
  # @order_id: String
  def cancel_order account_id:, order_id:
    body = { accountId: account_id, orderId: order_id }
    order_request '/CancelOrder', body
  end

  # ==========================================
  # StopOrdersService
  # ==========================================

  # Метод получения списка активных стоп заявок по счёту.
  # https://tinkoff.github.io/investAPI/stoporders/#getstoporders
  def stop_orders account_id:
    body = { accountId: account_id }
    stop_order_request '/GetStopOrders', body
  end

  # Метод выставления стоп-заявки.
  # https://tinkoff.github.io/investAPI/stoporders/#poststoporder
  #
  # @account_id: String
  # @figi: String, пример: 'BBG000B9XRY4'
  # @quantity: Integer
  # @price: Float
  # @stop_price: Float
  # @expiration_type: InvestTinkoff::V2::StopOrderExpirationType
  # @stop_order_type: InvestTinkoff::V2::StopOrderType
  def create_stop_order(
    account_id:,
    figi:,
    quantity:,
    price:,
    stop_price:,
    expire_date:,
    expiration_type: InvestTinkoff::V2::StopOrderExpirationType::UNSPECIFIED,
    stop_order_type: InvestTinkoff::V2::StopOrderType::UNSPECIFIED
  )
    body = {
      accountId: account_id,
      figi: figi,
      quantity: quantity,
      price: InvestTinkoff::V2::Quotation.create(price),
      stopPrice: InvestTinkoff::V2::Quotation.create(stop_price),
      expirationType: (expiration_type || StopOrderExpirationType::UNSPECIFIED),
      stop_order_type: (stop_order_type || InvestTinkoff::V2::StopOrderType::UNSPECIFIED),
      expire_date: expire_date.strftime(TIME_FORMAT)
    }
    stop_order_request '/PostStopOrder', body
  end

  # Метод отмены стоп-заявки.
  # https://tinkoff.github.io/investAPI/stoporders/#cancelstoporder
  def cancel_stop_order account_id:, order_id:
    body = { accountId: account_id, stopOrderId: order_id }
    stop_order_request '/CancelStopOrder', body
  end

  # ==========================================
  # UsersService
  # ==========================================

  # Метод получения счетов пользователя.
  # https://tinkoff.github.io/investAPI/users/#getaccounts
  def accounts
    user_service_request '/GetAccounts'
  end

  # Метод получения информации о пользователе.
  # https://tinkoff.github.io/investAPI/users/#getinfo
  def info
    user_service_request '/GetInfo'
  end

  # Расчёт маржинальных показателей по счёту.
  # https://tinkoff.github.io/investAPI/users/#getmarginattributes
  def margin_attributes account_id:
    body = { accountId: account_id }
    user_service_request '/GetMarginAttributes', body
  end

  # Текущий тариф пользователя (лимиты запросов к API).
  # https://tinkoff.github.io/investAPI/users/#getusertariff
  def user_tariff
    user_service_request '/GetUserTariff'
  end

  private

  def parse_response response
    InvestTinkoff::V2::Response.create response
  end

  def instrument_request path, body = {}
    post_api_request(
      "/tinkoff.public.invest.api.contract.v1.InstrumentsService#{path}",
      body: body
    )
  end

  def market_request path, body = {}
    post_api_request(
      "/tinkoff.public.invest.api.contract.v1.MarketDataService#{path}",
      body: body
    )
  end

  def operation_request path, body = {}
    post_api_request(
      "/tinkoff.public.invest.api.contract.v1.OperationsService#{path}",
      body: body
    )
  end

  def order_request path, body = {}
    post_api_request(
      "/tinkoff.public.invest.api.contract.v1.OrdersService#{path}",
      body: body
    )
  end

  def stop_order_request path, body = {}
    post_api_request(
      "/tinkoff.public.invest.api.contract.v1.StopOrdersService#{path}",
      body: body
    )
  end

  def user_service_request path, body = {}
    post_api_request(
      "/tinkoff.public.invest.api.contract.v1.UsersService#{path}",
      body: body
    )
  end
end
