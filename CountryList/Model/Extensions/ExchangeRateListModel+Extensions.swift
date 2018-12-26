//
//  ExchangeRateListModel+Extensions.swift
//  CountryList
//
//  Created by Smitesh Patel on 2018-12-25.
//  Copyright © 2018 Smitesh Patel. All rights reserved.
//

import Foundation

extension ExchangeRateList {
  
  var exchangeRate: String {
    return results.exchangeRate.currencyRate.first?.rate ?? ""
  }
  
  var currencyRate: Double {
    return results.exchangeRate.currencyRate.first?.serviceCharge ?? 0.00
  }
  
  var destinantionId: Int {
    return results.exchangeRate.currencyRate.first?.destinationCurrency.countryID ?? 0
  }
  
}
//
//
//extension Array where Element == CurrencyRate {
//  func rateForCountryId(id: Int) -> CurrencyRate? {
//    return filter { $0.destinationCurrency.countryID == id }.first
//  }
//}
