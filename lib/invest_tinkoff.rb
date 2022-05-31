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

require 'invest_tinkoff/v2/client'
require 'invest_tinkoff/v2/response'
require 'invest_tinkoff/v2/sandbox_client'
