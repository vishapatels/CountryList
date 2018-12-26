
import Foundation

struct CountryListModel {
  
  let apiService = APIService()
  //create new urlsession
  //urlsession.datatask
  func getCountries(completionHandler complete: @escaping([Result]?, Bool) -> Void)
  {
    apiService.performRequest(router: .getallcountry(), completionHandler: { result in
      switch result {
      case .success(let data):
        if let data = data,  let countryList: CountryList = CountryList.from(data: data), let results: [Result] = countryList.results, results.count > 0 {
          DispatchQueue.main.async {
            complete(results, true)
          }
        }
      case .failure(let error):
        DispatchQueue.main.async {
          complete(nil, false)
        }
      }
    })
  }
}
