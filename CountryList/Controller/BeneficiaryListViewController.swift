//
//  BeneficiaryListViewController.swift
//  CountryList
//
//  Created by Smitesh Patel on 2018-12-25.
//  Copyright © 2018 Smitesh Patel. All rights reserved.
//

import UIKit

class BeneficiaryListViewController: UIViewController {

  @IBOutlet weak var lblBeneficiaryName: UILabel!
  var beneficiaryModel: BeneficiaryListModel!
  
  var destinationId: Int! {
    didSet {
      beneficiaryModel = BeneficiaryListModel(destinationId: destinationId)
    }
  }
  override func viewDidLoad() {
      super.viewDidLoad()
//    beneficiaryModel.getBeneficiaryList(destinationId: destinationId, paymentMethod: 3, completionHandler: { [weak self] (result, isSuccess) in
//      if let result = result, isSuccess {
//       // self?.result =
//      } else {
//        self?.showError()
//      }
//    })
    }
  func showError() {
    print("error")
  }
  
}

