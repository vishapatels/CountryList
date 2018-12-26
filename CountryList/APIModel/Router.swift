//
//  Router.swift
//  MVVMProject
//
//  Created by Smitesh Patel on 2018-12-21.
//  Copyright © 2018 Smitesh Patel. All rights reserved.
//

import Foundation


enum HeaderField : String {
  
  case contentType = "Content-Type"
  case apiVersion = "api_version"
  case auth = "Authorization"
}

enum Router {
  
  
  case getallcountry()
  case getexchangerate(sourceCountryId: Int, destinationCountryId: Int)
  case getbeneficiaryList(destinationId: Int, paymentMethod: Int)
  
  func urlRequest(baseUrl: URL) -> URLRequest {
    var urlRequest = URLRequest(url: baseUrl.appendingPathComponent(path))
    urlRequest.httpMethod = httpMethod
    urlRequest.httpBody = postData
    urlRequest.allHTTPHeaderFields = httpHeaders
    return urlRequest
  }
  
  enum HTTPMethod: String {
    case post = "POST"
    case get = "GET"
    case put = "PUT"
  }
  
  var httpMethod: String {
    return HTTPMethod.post.rawValue
  }
  
  var postData: Data? {
    switch self {
    case .getallcountry:
      return nil
    case .getexchangerate(let sourceId, let destinationId):
      struct ExchangeRate : CoreServiceCodable {
        var sourcecountryid :Int
        var destinationcountryid :Int
        enum CodingKeys: String, CodingKey {
          case sourcecountryid = "source_country_id"
          case destinationcountryid = "destination_country_id"
        }
      }
      return ExchangeRate(sourcecountryid: sourceId, destinationcountryid: destinationId).data
      
    case .getbeneficiaryList(let destinationId, let paymentmethod):
      struct BeneficiaryList : CoreServiceCodable{
        var destinationId :Int
        var paymentmethod :Int
        enum CodingKeys: String, CodingKey {
          case destinationId = "destination_country_id"
          case paymentmethod = "payment_method"
        }
      }
      return BeneficiaryList(destinationId: destinationId, paymentmethod: paymentmethod).data
    
    }
  }
  
  var httpHeaders: [String: String] {
    var headers: [String: String] = [HeaderField.contentType.rawValue : "application/json"]
    headers.updateValue("v1", forKey: HeaderField.apiVersion.rawValue)
    headers.updateValue("bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VybmFtZSI6InNtaXQ5NjEyQGdtYWlsLmNvbSIsIm1vYmlsZSI6IjY0NzgzMjUxMTEiLCJjdXN0b21lcl9pZCI6ImYwN1lkbWx0SzBENGFcL3B6b3dFS3V3PT0iLCJndWlkIjoiMzFFcGFHWVgySEVoQkVGS3M1THFaZz09IiwidG9rZW5fZXhwaXJlIjoxNTUzMjE2NjI1fQ.x-VqHWYb7o2B4oAsqxIbdYA5szGF6kWGk6VjfKhxJGs", forKey: HeaderField.auth.rawValue)
    return headers
  }
  
  var path: String {
    switch self {
    case .getallcountry:
      return "/api/remitting_country"
    case .getexchangerate:
      return "/api/get_multi_exchange_rate"
    case .getbeneficiaryList:
      return "/api/get_recipients_by_country"
    }
  }
  
}

