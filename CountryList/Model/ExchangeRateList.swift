// To parse the JSON, add this file to your project and do:
//
//   let exchangeRateList = try? newJSONDecoder().decode(ExchangeRateList.self, from: jsonData)

import Foundation

struct ExchangeRateList: CoreServiceCodable {
  let statusCode: Int
  let results: Results
  
  enum CodingKeys: String, CodingKey {
    case statusCode = "status_code"
    case results
  }
}

struct Results: CoreServiceCodable {
  let services: [Service]
  let exchangeRate: ExchangeRate
  let onlineAmountRange: OnlineAmountRange
  
  enum CodingKeys: String, CodingKey {
    case services
    case exchangeRate = "exchange_rate"
    case onlineAmountRange = "online_amount_range"
  }
}

struct ExchangeRate: CoreServiceCodable {
  let empty: Int
  let initialAmount: String
  let sourceCountry: SourceCountry
  let currencyRate: [CurrencyRate]
  let usaExchangeRate: String
  
  enum CodingKeys: String, CodingKey {
    case empty
    case initialAmount = "initial_amount"
    case sourceCountry = "source_country"
    case currencyRate = "currency_rate"
    case usaExchangeRate = "usa_exchange_rate"
  }
}

struct CurrencyRate: CoreServiceCodable {
  let destinationCurrency: DestinationCurrency
  let transferFee, rate, totalAmount, receivingAmount: String
  let forexBatchID: JSONNull?
  let serviceCharge: Double
  
  enum CodingKeys: String, CodingKey {
    case destinationCurrency = "destination_currency"
    case transferFee = "transfer_fee"
    case rate
    case totalAmount = "total_amount"
    case receivingAmount = "receiving_amount"
    case forexBatchID = "forex_batch_id"
    case serviceCharge = "service_charge"
  }
}

struct DestinationCurrency: CoreServiceCodable {
  let countryID: Int
  let countryCode, currency: String
  let currencyID: Int
  let symbol: String
  
  enum CodingKeys: String, CodingKey {
    case countryID = "country_id"
    case countryCode = "country_code"
    case currency
    case currencyID = "currency_id"
    case symbol
  }
}

struct SourceCountry: CoreServiceCodable {
  let countryCode, currency: String
  let currencyID, countryID: Int
  let symbol: String
  
  enum CodingKeys: String, CodingKey {
    case countryID = "country_id"
    case countryCode = "country_code"
    case currency
    case currencyID = "currency_id"
    case symbol
  }
}

struct OnlineAmountRange: CoreServiceCodable {
  let minOnlineSendingAmt, maxOnlineSendingAmt: Int
}

struct Service: CoreServiceCodable {
  let serviceName, serviceID: String
  
  enum CodingKeys: String, CodingKey {
    case serviceName = "service_name"
    case serviceID = "service_id"
  }
}
