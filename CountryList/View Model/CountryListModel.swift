
import Foundation

struct CountryListDataProvider {

    var countryInfos: [CountryInfoTuple]?
    var localidedDescription: String?
    
    var countryNames: [String] {
        return countryInfos?.compactMap { $0.countryName } ?? []
    }

}

struct CountryListModel: ManagerInjected {
  
    func getCountries(completionHandler complete: @escaping((CountryListDataProvider) -> Void) ) {
        apiManager.getCountries() { result in
            var countryListDataProvider = CountryListDataProvider()
            switch result {
            case .success(let countryInfos):
                countryListDataProvider.countryInfos = countryInfos
            case .failure(let error):
                countryListDataProvider.localidedDescription = error?.localizedDescription
            }
            return complete(countryListDataProvider)
            
        }
    }
}
