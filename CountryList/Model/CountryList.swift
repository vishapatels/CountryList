// To parse the JSON, add this file to your project and do:
//
//   let countryList = try? newJSONDecoder().decode(CountryList.self, from: jsonData)

import Foundation

struct CountryList: CoreServiceCodable {
  let statusCode: Int
  let results: [Result]?
  
  enum CodingKeys: String, CodingKey {
    case statusCode = "status_code"
    case results
  }
}

struct Result: CoreServiceCodable {
  let id: Int
  let name, iso2, iso3, dialingCode: String
  let flagURL: String
  let zipCodeMandatory, maidenNameMandatory, middleNameMandatory: Bool
  let mobileNumberLength: String
  
  enum CodingKeys: String, CodingKey {
    case id, name, iso2, iso3, dialingCode
    case flagURL = "flag_url"
    case zipCodeMandatory = "zip_code_mandatory"
    case maidenNameMandatory = "maiden_name_mandatory"
    case middleNameMandatory = "middle_name_mandatory"
    case mobileNumberLength = "mobile_number_length"
  }
}


typealias CountryInfoTuple = (countryId: Int, countryName: String)

extension Array where Element == Result {
    
    var countryInfo: [CountryInfoTuple] {
        return compactMap { (countryId: $0.id, countryName: $0.name) }
    }
}
