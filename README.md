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

## V2
> TODO

### Операций по счёту

Метод получения списка операций по счёту

> https://tinkoff.github.io/investAPI/operations/#getoperations

```ruby
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
portfolio account_id:
```

Метод получения списка позиций по счёту

> https://tinkoff.github.io/investAPI/operations/#getpositions

```ruby
positions account_id:
```

Метод получения доступного остатка для вывода средств

> https://tinkoff.github.io/investAPI/operations/#getwithdrawlimits

```ruby
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
orders account_id:
```

Метод выставления заявки

> https://tinkoff.github.io/investAPI/orders/#postorder

```ruby
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

Метод получения статуса торгового поручения

> https://tinkoff.github.io/investAPI/orders/#getorderstate

```ruby
order_state account_id:, order_id:
```

Метод отмены биржевой заявки

> https://tinkoff.github.io/investAPI/orders/#cancelorder

```ruby
cancel_order account_id:, order_id:
```

### Стоп-заявки

Метод получения списка активных стоп заявок по счёту

> https://tinkoff.github.io/investAPI/stoporders/#getstoporders

```ruby
stop_orders account_id:
```

Метод выставления стоп-заявки

> https://tinkoff.github.io/investAPI/stoporders/#poststoporder

```ruby
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
margin_attributes account_id:
```

Текущий тариф пользователя (лимиты запросов к API)

> https://tinkoff.github.io/investAPI/users/#getusertariff

```ruby
user_tariff
```

## V1
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

## V1 Sandbox

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
