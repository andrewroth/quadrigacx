module QuadrigaCX
  module Private
    # List all account balances
    #
    def balance
      request(:post, '/balance')
    end

    # Places a limit order. Returns JSON describing the order
    #
    # amount - amount of major currency
    # price  - price to buy at
    # book   - optional, if not specified, will default to btc_cad
    def limit_buy params={}
      raise ConfigurationError.new('No price specified for limit buy') unless params[:price]
      request(:post, '/buy', params)
    end

    # Places a market order. Returns JSON describing the order
    #
    # amount - amount of minor currency to spend
    # book   - optional, if not specified, will default to btc_cad
    def market_buy params={}
      request(:post, '/buy', params)
    end

    def cancel params={}
      request(:post, '/cancel_order', params)
    end
  end
end
