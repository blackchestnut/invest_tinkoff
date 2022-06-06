# frozen_string_literal: true

module InvestTinkoff
  module V1
  end

  module V2
  end
end

require 'bigdecimal'
require 'bigdecimal/util'
require 'invest_tinkoff/client_base'

require 'invest_tinkoff/v1/client'
require 'invest_tinkoff/v1/response'
require 'invest_tinkoff/v1/sandbox_client'

require 'invest_tinkoff/v2/response'
require 'invest_tinkoff/v2/candle_interval'
require 'invest_tinkoff/v2/edit_favorites_action_type'
require 'invest_tinkoff/v2/instrument_id_type'
require 'invest_tinkoff/v2/instrument_status'
require 'invest_tinkoff/v2/operation_state'
require 'invest_tinkoff/v2/order_direction'
require 'invest_tinkoff/v2/order_type'
require 'invest_tinkoff/v2/quotation'
require 'invest_tinkoff/v2/stop_order_expiration_type'
require 'invest_tinkoff/v2/stop_order_type'
require 'invest_tinkoff/v2/client'
require 'invest_tinkoff/v2/sandbox_client'
