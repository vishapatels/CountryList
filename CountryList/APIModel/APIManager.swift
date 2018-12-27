//
//  APIManager.swift
//  CountryList
//
//  Created by smitesh patel on 2018-12-26.
//  Copyright © 2018 Smitesh Patel. All rights reserved.
//

import Foundation

enum Brand {
    
    case fgm
    case fgd
}

protocol APIManagerProtocol {
    
    
    /// <#Description#>
    ///
    /// - Parameter complete: <#complete description#>
    func getCountries(completionHandler complete: @escaping(ServiceResult<[CountryInfoTuple]?>) -> Void)
    
    func getExchangeRate(sourceId: Int, destinationId: Int, completionHandler complete: @escaping(Bool) -> Void)
    
    func getBeneficiaryList(destinationId: Int, paymentMethod: Int, completionHandler complete: @escaping(BeneficiaryList?, Bool) -> Void)
    
}

final class APIManager: APIManagerProtocol {
    
    
    
    var brand: Brand = .fgd
    
    var token: String?

    let apiService = APIService()
        
    
    func getCountries(completionHandler complete: @escaping(ServiceResult<[CountryInfoTuple]?>) -> Void)
    {
        apiService.performRequest(router: .getallcountry(), completionHandler: { result in
            switch result {
            case .success(let data):
                if let data = data,  let countryList: CountryList = CountryList.from(data: data), let results: [Result] = countryList.results, results.count > 0 {
                    
                    DispatchQueue.main.async {
                        complete(.success(results.countryInfo))
                    }
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    complete(.failure(error))
                }
            }
        })
    }
    
    func getExchangeRate(sourceId: Int, destinationId: Int, completionHandler complete: @escaping(Bool) -> Void)
    {
        apiService.performRequest(router: .getexchangerate(sourceCountryId: sourceId, destinationCountryId: destinationId), completionHandler: { result in
            switch result {
            case .success(let data):
                if let data = data,  let exchangeRate: ExchangeRateList =   .from(data: data){
                    //self.exchangeRateList = exchangeRate
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
    
    func getBeneficiaryList(destinationId: Int, paymentMethod: Int, completionHandler complete: @escaping(BeneficiaryList?, Bool) -> Void)
    {
        apiService.performRequest(router: .getbeneficiaryList(destinationId: destinationId, paymentMethod: paymentMethod), completionHandler: { result in
            switch result {
            case .success(let data):
                if let data = data,  let beneficiaryList: BeneficiaryList =  BeneficiaryList.from(data: data){
                    DispatchQueue.main.async {
                        complete(beneficiaryList, true)
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
