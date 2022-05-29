# invest_tinkoff

> Ruby Rest API client

## Install

```
gem install invest_tinkoff
```

## Requirements
- Ruby 2.3.0 or higher

## Docs

### RubyDoc.info
https://www.rubydoc.info/gems/invest_tinkoff/0.9.4/index

## V1

```ruby
client = InvestTinkoff::V1::SandboxClient.new token: 'ВАШ_ТОКЕН'
```

### Операции с заявками

Получение списка активных заявок
```ruby
client.orders
```

Создание лимитной заявки
```ruby
client.orders_limit_order figi:, operation:, lots:, price:
```

Создание рыночной заявки
```ruby
client.orders_market_order figi:, operation:, lots:
```

Отмена заявки
```ruby
client.orders_cancel id
```

### Операции с портфелем пользователя

Получение портфеля клиента
```ruby
client.portfolio
```

Получение валютных активов клиента
```ruby
client.portfolio_currencies
```
