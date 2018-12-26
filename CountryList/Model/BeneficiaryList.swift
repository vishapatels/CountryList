// To parse the JSON, add this file to your project and do:
//
//   let beneficiaryList = try? newJSONDecoder().decode(BeneficiaryList.self, from: jsonData)

import Foundation

struct BeneficiaryList: CoreServiceCodable {
  let statusCode: Int
  let results: [ResultBeneficiary]
  
  enum CodingKeys: String, CodingKey {
    case statusCode = "status_code"
    case results
  }
}

struct ResultBeneficiary: CoreServiceCodable {
  let rev, id: Int
  let email: String
  let guid: Int
  let firstname, lastname, middlename, maidenname: String
  let street, mobile, phone: String
  let cityID: Int
  let cityName, zipcode: String
  let gender: JSONNull?
  let occupation: String
  let active: Bool
  let stateID: Int
  let stateName: String
  let countryID: Int
  let dialingCode, countryName: String
  let mobileNumberLength: Int
  let flagURL: String
  let maidenNameMandatory, middleNameMandatory: Bool
  let isCustomerEdit: Int
  
  enum CodingKeys: String, CodingKey {
    case rev, id, email, guid, firstname, lastname, middlename, maidenname, street, mobile, phone
    case cityID = "city_id"
    case cityName = "city_name"
    case zipcode, gender, occupation, active
    case stateID = "state_id"
    case stateName = "state_name"
    case countryID = "country_id"
    case dialingCode = "dialing_code"
    case countryName = "country_name"
    case mobileNumberLength = "mobile_number_length"
    case flagURL = "flag_url"
    case maidenNameMandatory = "maiden_name_mandatory"
    case middleNameMandatory = "middle_name_mandatory"
    case isCustomerEdit = "is_customer_edit"
  }
}


