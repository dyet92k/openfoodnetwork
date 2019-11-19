angular.module('admin.orderCycles').factory('ExchangeProduct', ($resource) ->
  ExchangeProductResource = $resource('/api/exchanges/:exchange_id/products.json', {}, {
    'index': { method: 'GET' }
    'variant_count': { method: 'GET', params: { action_name: "variant_count" }}
  })
  {
    ExchangeProductResource: ExchangeProductResource
    loaded: false

    index: (params={}, callback=null) ->
      ExchangeProductResource.index params, (data) =>
        @loaded = true
        (callback || angular.noop)(data.products)

    countVariants: (params={}, callback=null) ->
      ExchangeProductResource.variant_count params, (data) =>
        (callback || angular.noop)(data.count)
  })
