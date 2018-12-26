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
  var myData: Result?
  var result: [Result]? {
    didSet {
      print("set tableView reoload")
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
    return result?.count ?? 0
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let myCell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "CountryList")
    myCell.textLabel?.text = result![indexPath.row].name
    return myCell
    
  }
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    myData = result![indexPath.row]
    performSegue(withIdentifier: "ExchangeRate", sender: self)
  }
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    let exchangeRateViewController: ExchangeRateViewController = segue.destination as! ExchangeRateViewController
    exchangeRateViewController.dataResult = myData!
  }
}

// private functions
extension CountryViewController {

  private func getCountries() {
    countryListModel.getCountries(completionHandler: { [weak self] (result, isSuccess) in
      if let result = result, isSuccess {
        self?.result = result
      } else {
        self?.showError()
      }
    })
  }
}

