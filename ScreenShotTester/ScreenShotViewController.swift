//
//  ScreenShotViewController.swift
//  ScreenShotTester
//
//  Created by Eli Warner on 1/29/19.
//  Copyright © 2019 EGW. All rights reserved.
//

import UIKit

class ScreenShotViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {


    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        declareDelegates()

        // Do any additional setup after loading the view.
    }
    
    //MARK: Delegate Declarations
    
    func declareDelegates(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 200
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EGW.ScreenShot.Cell", for: indexPath) as! ScreenShotCell
        let cityState = data[indexPath.row].components(separatedBy: ", ")
        cell.cityName.text = cityState.first
        print("\(cityState)")
        cell.stateLabel.text = cityState.last
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    // MARK: Test Data
    
    let data = ["TOP BAR, TOP BAR", "New York, NY", "Los Angeles, CA", "Chicago, IL", "Houston, TX",
                "Philadelphia, PA", "Phoenix, AZ", "San Diego, CA", "San Antonio, TX",
                "Dallas, TX", "Detroit, MI", "San Jose, CA", "Indianapolis, IN",
                "Jacksonville, FL", "San Francisco, CA", "Columbus, OH", "Austin, TX",
                "Memphis, TN", "Baltimore, MD", "Charlotte, ND", "Fort Worth, TX", "Kat Youre So Cute, 10/10", "BOTTOM BAR, BOTTOM BAR"]



    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
