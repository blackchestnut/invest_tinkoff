# invest_tinkoff

> Ruby Rest API client

## Install

```
gem install invest_tinkoff
```

## Requirements
- Ruby 2.3.0 or higher

## Docs

[RubyDoc.info](https://www.rubydoc.info/gems/invest_tinkoff/0.9.6)

## API v2

```ruby
client = InvestTinkoff::V2::Client.new token: 'ВАШ_ТОКЕН'
```

### Справочная информации о ценных бумагах

Метод получения облигации по её идентификатору

> https://tinkoff.github.io/investAPI/instruments/#bondby

```ruby
# @id_type: InvestTinkoff::V2::InstrumentIdType
# @id: String
# @class_code: String (Обязателен при id_type = TICKER)

bond_by id_type:, id:, class_code: nil
```

Метод получения списка облигаций

> https://tinkoff.github.io/investAPI/instruments/#bonds

```ruby
# @instrument_status: InvestTinkoff::V2::InstrumentStatus

bonds instrument_status: InvestTinkoff::V2::InstrumentStatus::BASE
```

Метод получения списка валют

> https://tinkoff.github.io/investAPI/instruments/#currencies

```ruby
# @instrument_status: InvestTinkoff::V2::InstrumentStatus

currencies instrument_status: InvestTinkoff::V2::InstrumentStatus::BASE
```

Метод получения валюты по её идентификатору

> https://tinkoff.github.io/investAPI/instruments/#currencyby

```ruby
# @id_type: InvestTinkoff::V2::InstrumentIdType
# @id: String
# @class_code: String (Обязателен при id_type = TICKER)

currency_by id_type:, id:, class_code: nil
```

Метод редактирования избранных инструментов

> https://tinkoff.github.io/investAPI/instruments/#editfavorites

```ruby
# @figis: String, пример: ['BBG000B9XRY4', 'BBG000BWXBC2']
# @action_type: InvestTinkoff::V2::EditFavoritesActionType

edit_favorites figis:, action_type: InvestTinkoff::V2::EditFavoritesActionType::ADD
```

Метод получения инвестиционного фонда по его идентификатору

> https://tinkoff.github.io/investAPI/instruments/#etfby

```ruby
# @id_type: InvestTinkoff::V2::InstrumentIdType
# @id: String
# @class_code: String (Обязателен при id_type = TICKER)

etf_by id_type:, id:, class_code: nil
```

Метод получения списка инвестиционных фондов

> https://tinkoff.github.io/investAPI/instruments/#etfs

```ruby
# @instrument_status: InvestTinkoff::V2::InstrumentStatus

etfs instrument_status: InvestTinkoff::V2::InstrumentStatus::BASE
```

Метод получения фьючерса по его идентификатору

> https://tinkoff.github.io/investAPI/instruments/#futureby

```ruby
# @id_type: InvestTinkoff::V2::InstrumentIdType
# @id: String
# @class_code: String (Обязателен при id_type = TICKER)

future_by id_type:, id:, class_code: nil
```
```ruby
# Примеры:

client.future_by id_type: InvestTinkoff::V2::InstrumentIdType::FIGI, id: 'FUTSI0323000'
client.future_by id_type: InvestTinkoff::V2::InstrumentIdType::TICKER, id: 'SiH3', class_code: 'SPBFUT'
```

Метод получения списка фьючерсов

> https://tinkoff.github.io/investAPI/instruments/#futures

```ruby
# @instrument_status: InvestTinkoff::V2::InstrumentStatus

futures instrument_status: InvestTinkoff::V2::InstrumentStatus::BASE
```

Метод получения накопленного купонного дохода по облигации

> https://tinkoff.github.io/investAPI/instruments/#getaccruedinterests

```ruby
# @figi: String, пример: 'BBG00X6ZGSY7'
# @from: Time, пример: 1.year.ago
# @to: Time, пример: 2.months.from_now

accrued_interests figi:, from:, to:
```

Метод получения актива по его идентификатору

> https://tinkoff.github.io/investAPI/instruments/#getassetby

```ruby
# @id: String, пример: '9f083982-cf4c-418a-a0bf-8b82f16db42d'

asset_by id:
```

Метод получения списка активов

> https://tinkoff.github.io/investAPI/instruments/#getassets

```ruby
assets
```

Метод получения графика выплат купонов по облигации

> https://tinkoff.github.io/investAPI/instruments/#getbondcoupons

```ruby
# @figi: String, пример: 'BBG00X6ZGSY7'
# @from: Time, пример: 1.year.ago
# @to: Time, пример: 6.months.from_now

bond_coupons figi:, from:, to:
```

Метод для получения событий выплаты дивидендов по инструменту

> https://tinkoff.github.io/investAPI/instruments/#getdividends

```ruby
# @figi: String, пример: 'BBG000B9XRY4'
# @from: Time, пример: 1.year.ago
# @to: Time, пример: 1.month.from_now

dividends figi:, from:, to:
```

Метод получения избранных инструментов

> https://tinkoff.github.io/investAPI/instruments/#getfavorites

```ruby
favorites
```

Метод получения размера гарантийного обеспечения по фьючерсам

> https://tinkoff.github.io/investAPI/instruments/#getfuturesmargin

```ruby
# @figi: String

futures_margin figi:
```

Метод получения основной информации об инструменте

> https://tinkoff.github.io/investAPI/instruments/#getinstrumentby

```ruby
# @id_type: InvestTinkoff::V2::InstrumentIdType
# @id: String
# @class_code: String (Обязателен при id_type = TICKER)

instrument_by id_type:, id:, class_code: nil
```
```ruby
# Примеры:

client.instrument_by id_type: InvestTinkoff::V2::InstrumentIdType::FIGI, id: 'FUTSI0323000'
client.instrument_by id_type: InvestTinkoff::V2::InstrumentIdType::TICKER, id: 'SiH3', class_code: 'SPBFUT'
```

Метод получения акции по её идентификатору

> https://tinkoff.github.io/investAPI/instruments/#shareby

```ruby
# @id_type: InvestTinkoff::V2::InstrumentIdType
# @id: String
# @class_code: String (Обязателен при id_type = TICKER)

share_by id_type:, id:, class_code: nil
```
```ruby
# Примеры:

client.share_by id_type: InvestTinkoff::V2::InstrumentIdType::FIGI, id: 'BBG000B9XRY4'
client.share_by id_type: InvestTinkoff::V2::InstrumentIdType::TICKER, id: 'AAPL', class_code: 'SPBXM'
```

Метод получения списка акций

> https://tinkoff.github.io/investAPI/instruments/#shares

```ruby
# @instrument_status: InvestTinkoff::V2::InstrumentStatus

shares instrument_status: InvestTinkoff::V2::InstrumentStatus::BASE
```

Метод получения расписания торгов торговых площадок

> https://tinkoff.github.io/investAPI/instruments/#tradingschedulesrequest

```ruby
# @exchange: String, пример: 'MOEX'
# @from: Time, пример: 1.day.from_now
# @to: Time, пример: 5.days.from_now

trading_schedules exchange:, from:, to:
```

### Получения биржевой информации

Метод запроса исторических свечей по инструменту

> https://tinkoff.github.io/investAPI/marketdata/#getcandles

```ruby
# @figi: String, пример: 'BBG000B9XRY4'
# @from: Time, пример: 1.hour.ago
# @to: Time, пример: Time.zone.now
# @interval: InvestTinkoff::V2::CandleInterval

candles(
  figi:,
  from:,
  to:,
  interval: InvestTinkoff::V2::CandleInterval::HOUR
)
```

Метод запроса последних цен по инструментам

> https://tinkoff.github.io/investAPI/marketdata/#getlastprices

```ruby
# @figis: String, пример: ['BBG000B9XRY4', 'BBG000BWXBC2']

last_prices figis:
```

Метод запроса последних обезличенных сделок по инструменту

> https://tinkoff.github.io/investAPI/marketdata/#getlasttrades

```ruby
# @figi: String, пример: 'BBG000B9XRY4'
# @from: Time, пример: 1.hour.ago
# @to: Time, пример: Time.zone.now

last_trades figi:, from:, to:
```

Метод получения стакана по инструменту

> https://tinkoff.github.io/investAPI/marketdata/#getorderbook

```ruby
# @figi: String, пример: 'BBG000B9XRY4'
# @depth: Integer

order_book figi:, depth: 10
```

Метод запроса статуса торгов по инструментам

> https://tinkoff.github.io/investAPI/marketdata/#gettradingstatus

```ruby
# @figi: String, пример: 'BBG000B9XRY4'

trading_status figi:
```

### Операции по счёту

Метод получения списка операций по счёту

> https://tinkoff.github.io/investAPI/operations/#getoperations

```ruby
# @account_id: String
# @figi: String, пример: 'BBG000B9XRY4'
# @from: Time
# @to: Time
# @state (опиционально): InvestTinkoff::V2::OperationState

operations(
  account_id:,
  figi:,
  from:,
  to:,
  state: InvestTinkoff::V2::OperationState::UNSPECIFIED
)
```

Метод получения портфеля по счёту

> https://tinkoff.github.io/investAPI/operations/#getportfolio

```ruby
# @account_id: String

portfolio account_id:
```

Метод получения списка позиций по счёту

> https://tinkoff.github.io/investAPI/operations/#getpositions

```ruby
# @account_id: String

positions account_id:
```

Метод получения доступного остатка для вывода средств

> https://tinkoff.github.io/investAPI/operations/#getwithdrawlimits

```ruby
# @account_id: String

withdraw_limits account_id:
```

Метод получения брокерского отчёта `NotImplemented`

> https://tinkoff.github.io/investAPI/operations/#getbrokerreport

```ruby
broker_report
```

Метод получения отчёта "Справка о доходах за пределами РФ" `NotImplemented`

> https://tinkoff.github.io/investAPI/operations/#getdividendsforeignissuer

```ruby
dividends_foreign_issuer
```

### Торговые поручения

Метод получения списка активных заявок по счёту

> https://tinkoff.github.io/investAPI/orders/#getorders

```ruby
# @account_id: String

orders account_id:
```

Метод выставления заявки

> https://tinkoff.github.io/investAPI/orders/#postorder

```ruby
# @account_id: String
# @figi: String
# @quantity: Integer
# @price: Float
# @direction: InvestTinkoff::V2::OrderDirection
# @order_type: InvestTinkoff::V2::OrderType
# @order_id: String (max length 36)

create_order(
  account_id:,
  figi:,
  quantity:,
  price:,
  direction:,
  order_type:,
  order_id:
)
```
```ruby
# Пример:

client.create_order(
  account_id: 'ВАШ_ID_СЧЁТА',
  figi: 'BBG000BL9C59',
  quantity: 1,
  price: 11.35,
  direction: InvestTinkoff::V2::OrderDirection::BUY,
  order_type: InvestTinkoff::V2::OrderType::LIMIT,
  order_id: 'ВАШ_ВНУТРЕННИЙ_ID_ЗАЯВКИ'
)
```

Метод получения статуса торгового поручения

> https://tinkoff.github.io/investAPI/orders/#getorderstate

```ruby
# @account_id: String
# @order_id: String

order_state account_id:, order_id:
```

Метод отмены биржевой заявки

> https://tinkoff.github.io/investAPI/orders/#cancelorder

```ruby
# @account_id: String
# @order_id: String

cancel_order account_id:, order_id:
```

### Стоп-заявки

Метод получения списка активных стоп заявок по счёту

> https://tinkoff.github.io/investAPI/stoporders/#getstoporders

```ruby
# @account_id: String

stop_orders account_id:
```

Метод выставления стоп-заявки

> https://tinkoff.github.io/investAPI/stoporders/#poststoporder

```ruby
# @account_id: String
# @figi: String, пример: 'BBG000B9XRY4'
# @quantity: Integer
# @price: Float
# @stop_price: Float
# @expiration_type: InvestTinkoff::V2::StopOrderExpirationType
# @stop_order_type: InvestTinkoff::V2::StopOrderType

create_stop_order(
  account_id:,
  figi:,
  quantity:,
  price:,
  stop_price:,
  expire_date:,
  expiration_type: InvestTinkoff::V2::StopOrderExpirationType::UNSPECIFIED,
  stop_order_type: InvestTinkoff::V2::StopOrderType::UNSPECIFIED,
)
```

Метод отмены стоп-заявки

> https://tinkoff.github.io/investAPI/stoporders/#cancelstoporder

```ruby
# @account_id: String
# @order_id: String

cancel_stop_order account_id:, order_id:
```

### Получение справочной информации о пользователе Тинькофф Инвестиций

Метод получения счетов пользователя

> https://tinkoff.github.io/investAPI/users/#getaccounts

```ruby
accounts
```

Метод получения информации о пользователе

> https://tinkoff.github.io/investAPI/users/#getinfo

```ruby
info
```

Расчёт маржинальных показателей по счёту

> https://tinkoff.github.io/investAPI/users/#getmarginattributes

```ruby
# @account_id: String

margin_attributes account_id:
```

Текущий тариф пользователя (лимиты запросов к API)

> https://tinkoff.github.io/investAPI/users/#getusertariff

```ruby
user_tariff
```

## API v2 Sandbox

```ruby
client = InvestTinkoff::V2::SandboxClient.new token: 'ВАШ_ТОКЕН_ПЕСОЧНИЦЫ'
```

### Операции в sandbox

Метод отмены торгового поручения в песочнице

> https://tinkoff.github.io/investAPI/sandbox/#cancelsandboxorder

```ruby
# @account_id: String
# @order_id: String

cancel_sandbox_order account_id:, order_id:
```

Метод закрытия счёта в песочнице

> https://tinkoff.github.io/investAPI/sandbox/#closesandboxaccount

```ruby
# @account_id: String

close_sandbox_account account_id:
```

Метод получения счетов в песочнице

> https://tinkoff.github.io/investAPI/sandbox/#getsandboxaccounts

```ruby
sandbox_accounts
```

Метод получения операций в песочнице по номеру счёта

> https://tinkoff.github.io/investAPI/sandbox/#getsandboxoperations

```ruby
# @account_id: String
# @figi: String, пример: 'BBG000B9XRY4'
# @from: Time
# @to: Time
# @state (опиционально): InvestTinkoff::V2::OperationState

sandbox_operations(
  account_id:,
  figi:,
  from:,
  to:,
  state: InvestTinkoff::V2::OperationState::UNSPECIFIED
)
```

Метод получения статуса заявки в песочнице

> https://tinkoff.github.io/investAPI/sandbox/#getsandboxorderstate

```ruby
# @account_id: String
# @order_id: String

sandbox_order_state account_id:, order_id:
```

Метод получения списка активных заявок по счёту в песочнице

> https://tinkoff.github.io/investAPI/sandbox/#getsandboxorders

```ruby
# @account_id: String

sandbox_orders account_id:
```

Метод получения портфолио в песочнице

> https://tinkoff.github.io/investAPI/sandbox/#getsandboxportfolio

```ruby
# @account_id: String

sandbox_portfolio account_id:
```

Метод получения позиций по виртуальному счёту песочницы

> https://tinkoff.github.io/investAPI/sandbox/#getsandboxpositions

```ruby
# @account_id: String

sandbox_positions account_id:
```

Метод регистрации счёта в песочнице

> https://tinkoff.github.io/investAPI/sandbox/#opensandboxaccount

```ruby
open_sandbox_account
```

Метод выставления торгового поручения в песочнице

> https://tinkoff.github.io/investAPI/sandbox/#postsandboxorder

```ruby
# @account_id: String
# @figi: String
# @quantity: Integer
# @price: Float
# @direction: InvestTinkoff::V2::OrderDirection
# @order_type: InvestTinkoff::V2::OrderType
# @order_id: String (max length 36)

create_sandbox_order(
  account_id:,
  figi:,
  quantity:,
  price:,
  direction:,
  order_type:,
  order_id:
)
```

Метод пополнения счёта в песочнице

> https://tinkoff.github.io/investAPI/sandbox/#sandboxpayin

```ruby
# @account_id: String
# @amount: Float
# @currency: String, пример 'RUB', 'USD', 'EUR' и т.д.

sandbox_pay_in account_id:, amount:, currency:
```

## API v1
`Deprecated`
> Все новые рабочие токены доступны только для версии V2.
> Поддержка первой версии будет завершена в 2022 году.

```ruby
client = InvestTinkoff::V1::SandboxClient.new token: 'ВАШ_ТОКЕН'
```

### Операции с заявками

Получение списка активных заявок
```ruby
orders
```

Создание лимитной заявки
```ruby
orders_limit_order figi:, operation:, lots:, price:
```

Создание рыночной заявки
```ruby
orders_market_order figi:, operation:, lots:
```

Отмена заявки
```ruby
orders_cancel id
```

### Операции с портфелем пользователя

Получение портфеля клиента
```ruby
portfolio
```

Получение валютных активов клиента
```ruby
portfolio_currencies
```

### Получении информации по бумагам

Получение списка акций
```ruby
market_stocks
```

Получение списка облигаций
```ruby
market_bonds
```

Получение списка ETF
```ruby
market_etfs
```

Получение списка валютных пар
```ruby
market_currencies
```

Получение стакана по FIGI
```ruby
market_orderbook figi:, depth: 20
```

Получение исторических свечей по FIGI
```ruby
market_candles figi:, from:, to:, interval:
```

Получение инструмента по FIGI
```ruby
market_search_by_figi figi
```

Получение инструмента по тикеру
```ruby
market_search_by_ticker ticker
```

### Получении информации по операциям
Получение списка операций
```ruby
operations from:, to:, figi: nil
```

### Получении информации по брокерским счетам
Получение брокерских счетов клиента
```ruby
user_accounts
```

## API v1 Sandbox

> Все операции [рабочего клиента](#v1) плюс:

```ruby
client = InvestTinkoff::V1::SandboxClient.new token: 'ВАШ_ТОКЕН_ПЕСОЧНИЦЫ'
```

### Операции в sandbox
Создание счета и выставление баланса по валютным позициям
```ruby
register
```

Выставление баланса по валютным позициям
```ruby
currencies_balance currency:, balance:
```

Выставление баланса по инструментным позициям
```ruby
position_balance figi:, balance:
```

Удаление всех позиций клиента
```ruby
clear
```

Удаление счета клиента
```ruby
remove
```
