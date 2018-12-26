//
//  ExchangeRateViewController.swift
//  CountryList
//
//  Created by Smitesh Patel on 2018-12-25.
//  Copyright © 2018 Smitesh Patel. All rights reserved.
//

import UIKit

class ExchangeRateViewController: UIViewController {

  @IBOutlet weak var exchangeRateValue: UILabel!
  @IBOutlet weak var lblCountryName: UILabel!
  var exchangeRateListModel = ExchangeRateListModel()
  var dataResult: Result?
  var rate: Double?
  var countryName = ""
  
  override func viewDidLoad() {
        super.viewDidLoad()
        lblCountryName.text = dataResult?.name
        getExchangeRate(id: dataResult!)
    
    }
  
  @IBAction func exchangeButtonClicked(_ sender: Any) {
    performSegue(withIdentifier: "beneficiaryList", sender: self)
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    var destinationVC: BeneficiaryListViewController = segue.destination as! BeneficiaryListViewController
    destinationVC.destinationId = exchangeRateListModel.destinationId
  }
}

extension ExchangeRateViewController
{
  func getExchangeRate(id: Result){
    
    exchangeRateListModel.getExchangeRate(sourceId: 41, destinationId: (dataResult?.id)!, completionHandler: { [weak self] isSuccess in
      if let exchangeRateList = self?.exchangeRateListModel.exchangeRateList, isSuccess {
          self?.exchangeRateValue.text =  "\(exchangeRateList.currencyRate)"
      } else {
        self?.showError()
      }
    })
}
  func showError() {
    print("error")
  }
}

