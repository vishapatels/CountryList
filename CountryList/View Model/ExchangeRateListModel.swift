
import Foundation

final class ExchangeRateListModel {
  
  let apiService = APIService()
  var exchangeRateList : ExchangeRateList?
  
  var destinationId: Int {
    return exchangeRateList?.destinantionId ?? 0
  }
  
  func getExchangeRate(sourceId: Int, destinationId: Int, completionHandler complete: @escaping(Bool) -> Void)
  {
    apiService.performRequest(router: .getexchangerate(sourceCountryId: sourceId, destinationCountryId: destinationId), completionHandler: { result in
      switch result {
      case .success(let data):
        if let data = data,  let exchangeRate: ExchangeRateList =   .from(data: data){
          self.exchangeRateList = exchangeRate
          DispatchQueue.main.async {
            complete(true)
          }
        }
      case .failure(let error):
        DispatchQueue.main.async {
          complete(false)
        }
      }
    })
  }
}

