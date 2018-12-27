
import Foundation

struct BeneficiaryListModel {
  
  var destinationId: Int
  init(destinationId: Int) {
       self.destinationId = destinationId
  }
  
  let apiService = APIService()
}


