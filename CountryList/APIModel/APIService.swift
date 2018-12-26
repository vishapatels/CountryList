//
//  APIService.swift
//  MVVMProject
//
//  Created by Smitesh Patel on 2018-12-21.
//  Copyright © 2018 Smitesh Patel. All rights reserved.
//

import Foundation
enum ServiceResult<T> {
  case success(T)
  case failure(Error?)
}

struct FGDError: CoreServiceCodable {
  var statusCode: Int?
  var error: String?
  
  enum CodingKeys: String, CodingKey {
    case statusCode = "status_code"
    case error
  }
}


class APIService: NSObject {
  
  private var logger: NetworkLogger = NetworkLogger()
  var baseURL = "https://happytransfer.firstglobalmoney.com"
  
  func performRequest(router: Router, completionHandler complete: @escaping (ServiceResult<Data?>) -> Void) {
    let urlRequest = router.urlRequest(baseUrl: URL(string: baseURL)!)
    logger.log(request: urlRequest)
    let urlSession = URLSession(configuration: URLSessionConfiguration.default, delegate: self, delegateQueue: nil)
    urlSession.dataTask(with: urlRequest) {  [weak self] (data,response,error) in
      if error == nil {
        
        if let urlResponse = response as? HTTPURLResponse  {
          self?.logger.log(response: urlResponse, data: data)
          if urlResponse.isSuccess {
            complete(.success(data))
          } else {
            if let data = data {
              let fgdError : FGDError? = FGDError.from(data: data)
              
            } else {
              complete(.failure(error))
            }
          }
        }
      }
      }.resume()
  }
}


extension HTTPURLResponse {
  
  var isSuccess: Bool {
    return 200 ... 299 ~= statusCode
  }
}

extension APIService: URLSessionDelegate {
  func urlSession(_ session: URLSession, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
    completionHandler(
      URLSession.AuthChallengeDisposition.useCredential,
      URLCredential(trust:
        challenge.protectionSpace.serverTrust!))
  }
}

