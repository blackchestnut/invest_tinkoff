# frozen_string_literal: true

class InvestTinkoff::V2::SandboxClient < InvestTinkoff::V2::Client
  def initialize token:, logger: nil
    super(
      token: token,
      logger: logger
    )
  end

  # ==========================================
  # SandboxService
  # ==========================================

  # Метод отмены торгового поручения в песочнице.
  # https://tinkoff.github.io/investAPI/sandbox/#cancelsandboxorder
  #
  # @account_id: String
  # @order_id: String
  def cancel_sandbox_order account_id:, order_id:
    body = { accountId: account_id, orderId: order_id }
    sandbox_request '/CancelSandboxOrder', body
  end

  # Метод закрытия счёта в песочнице.
  # https://tinkoff.github.io/investAPI/sandbox/#closesandboxaccount
  #
  # @account_id: String
  def close_sandbox_account account_id:
    sandbox_request '/CloseSandboxAccount', { accountId: account_id }
  end

  # Метод получения счетов в песочнице.
  # https://tinkoff.github.io/investAPI/sandbox/#getsandboxaccounts
  def sandbox_accounts
    sandbox_request '/GetSandboxAccounts'
  end

  # Метод получения операций в песочнице по номеру счёта.
  # https://tinkoff.github.io/investAPI/sandbox/#getsandboxoperations
  #
  # @account_id: String
  # @figi: String, пример: 'BBG000B9XRY4'
  # @from: Time
  # @to: Time
  # @state (опиционально): InvestTinkoff::V2::OperationState
  def sandbox_operations account_id:, figi:, from:, to:, state: InvestTinkoff::V2::OperationState::UNSPECIFIED
    body = {
      accountId: account_id,
      figi: figi,
      from: from.strftime(TIME_FORMAT),
      to: to.strftime(TIME_FORMAT),
      state: state || InvestTinkoff::V2::OperationState::UNSPECIFIED
    }
    sandbox_request '/GetSandboxOperations', body
  end

  # Метод получения статуса заявки в песочнице.
  # https://tinkoff.github.io/investAPI/sandbox/#getsandboxorderstate
  #
  # @account_id: String
  # @order_id: String
  def sandbox_order_state account_id:, order_id:
    body = { accountId: account_id, orderId: order_id }
    sandbox_request '/GetSandboxOrderState', body
  end

  # Метод получения списка активных заявок по счёту в песочнице.
  # https://tinkoff.github.io/investAPI/sandbox/#getsandboxorders
  #
  # @account_id: String
  def sandbox_orders account_id:
    sandbox_request '/GetSandboxOrders', { accountId: account_id }
  end

  # Метод получения портфолио в песочнице.
  # https://tinkoff.github.io/investAPI/sandbox/#getsandboxportfolio
  #
  # @account_id: String
  def sandbox_portfolio account_id:
    sandbox_request '/GetSandboxPortfolio', { accountId: account_id }
  end

  # Метод получения позиций по виртуальному счёту песочницы.
  # https://tinkoff.github.io/investAPI/sandbox/#getsandboxpositions
  #
  # @account_id: String
  def sandbox_positions account_id:
    sandbox_request '/GetSandboxPositions', { accountId: account_id }
  end

  # Метод регистрации счёта в песочнице.
  # https://tinkoff.github.io/investAPI/sandbox/#opensandboxaccount
  def open_sandbox_account
    sandbox_request '/OpenSandboxAccount'
  end

  # Метод выставления торгового поручения в песочнице.
  # https://tinkoff.github.io/investAPI/sandbox/#postsandboxorder
  #
  # @account_id: String
  # @figi: String
  # @quantity: Integer
  # @price: Float
  # @direction: InvestTinkoff::V2::OrderDirection
  # @order_type: InvestTinkoff::V2::OrderType
  # @order_id: String (max length 36)
  def create_sandbox_order( # rubocop: disable Metrics/ParameterLists
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
    sandbox_request '/PostSandboxOrder', body
  end

  # Метод пополнения счёта в песочнице.
  # https://tinkoff.github.io/investAPI/sandbox/#sandboxpayin
  #
  # @account_id: String
  # @amount: Float
  # @currency: String, пример 'RUB', 'USD', 'EUR' и т.д.
  def sandbox_pay_in account_id:, amount:, currency:
    body = {
      accountId: account_id,
      amount: InvestTinkoff::V2::Quotation.create(amount),
      currency: currency
    }
    sandbox_request '/SandboxPayIn', body
  end

  private

  def sandbox_request path, body = {}
    post_api_request(
      "/tinkoff.public.invest.api.contract.v1.SandboxService#{path}",
      body: body
    )
  end
end
