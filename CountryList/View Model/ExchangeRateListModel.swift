
import Foundation

final class ExchangeRateListModel: ManagerInjected {
  
  let apiService = APIService()
  var exchangeRateList : ExchangeRateList?
  
  var destinationId: Int {
    return exchangeRateList?.destinantionId ?? 0
  }

}

