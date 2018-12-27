//
//  ViewController.swift
//  CountryList
//
//  Created by Smitesh Patel on 2018-12-25.
//  Copyright © 2018 Smitesh Patel. All rights reserved.
//

import UIKit

class CountryViewController: UIViewController {


  @IBOutlet weak var tableView: UITableView!
  var countryListModel = CountryListModel()
  var countryListDataProvider: CountryListDataProvider? {
    didSet {
      tableView.reloadData()
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    getCountries()
  }
  
  func showError() {
    print("error")
  }
}

extension CountryViewController: UITableViewDataSource, UITableViewDelegate
{
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return countryListDataProvider?.countryNames.count ?? 0
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let myCell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "CountryList")
    myCell.textLabel?.text = countryListDataProvider?.countryNames[indexPath.row] ?? ""
    return myCell
    
  }
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    //myData = result![indexPath.row]
    performSegue(withIdentifier: "ExchangeRate", sender: self)
  }
    
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    let exchangeRateViewController: ExchangeRateViewController = segue.destination as! ExchangeRateViewController
    //exchangeRateViewController.dataResult = myData!
  }
}

// private functions
extension CountryViewController {

  private func getCountries() {
    countryListModel.getCountries() { [weak self] countryListDataProvider in
        guard let `self` = self else  { return }
        self.countryListDataProvider = countryListDataProvider
    }
  }
}

