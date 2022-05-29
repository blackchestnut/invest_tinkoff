# frozen_string_literal: true

class InvestTinkoff::V1::SandboxClient < InvestTinkoff::V1::Client
  base_uri 'https://api-invest.tinkoff.ru/openapi/sandbox/'

  attr_accessor :broker_account_id

  # @param token [String] sandbox API token
  # @param broker_account_id [String] optional идентификатор счета
  # @param logger [Object] optional например: Rails.logger
  def initialize token:, broker_account_id: nil, logger: nil
    super(
      token: token,
      broker_account_id: broker_account_id,
      logger: logger
    )
    @is_sandbox_created = false
  end

  # ==========================================
  # Операции в sandbox
  # ==========================================

  # Создание счета и выставление баланса по валютным позициям
  def register
    return if @is_sandbox_created

    res = post_api_request '/sandbox/register'
    @is_sandbox_created = true
    res
  end

  # Выставление баланса по валютным позициям
  # @param currency [String] :RUB, :USD, :EUR и т.д.
  # @param balance [Float] баланс
  def currencies_balance currency:, balance:
    register
    body = { currency: currency, balance: balance }
    post_api_request '/sandbox/currencies/balance', body: body
  end

  # Выставление баланса по инструментным позициям
  # @param figi [String] Пример figi: 'BBG000B9XRY4'
  # @param balance [Float] баланс
  def position_balance figi:, balance:
    register
    body = { figi: figi, balance: balance }
    post_api_request '/sandbox/positions/balance', body: body
  end

  # Удаление всех позиций клиента
  def clear
    register
    post_api_request '/sandbox/clear'
  end

  # Удаление счета клиента
  def remove
    register
    post_api_request '/sandbox/remove'
  end
end
