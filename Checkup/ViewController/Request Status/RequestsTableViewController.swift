//
//  RequestsTableViewController.swift
//  Checkup
//
//  Created by yasmin mohsen on 5/12/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import UIKit
import Firebase
import SDWebImage
@IBDesignable
class RequestsTableViewController: UITableViewController , IFilterTest {
//let isResult = valueForKey("isResult")
//    @IBInspectable
//    var isResult: Bool {
//        get {
//            return self.isResult
//        }
//        set {
//            self.isResult = newValue
//
//        }
//    }
   
    var isResult : Bool?
    var testFilterOriginal : TestFilter?
    var testFilter : TestFilter?
    var take = 10
    var skip = 0
    var isFiltered = false
    var requests : [Request]?
    var isBottom = true
    var isOld = false
    @IBAction func filterDataBtn(_ sender: UIBarButtonItem) {
        let filterVC = storyboard?.instantiateViewController(withIdentifier: "filterSVC") as! FilterTestViewController
        filterVC.parentRef = self
        filterVC.testFilter = testFilter
        self.navigationController?.pushViewController(filterVC, animated: true)
    }
    var labNames = ["El-Mokhtabar" , "Alpha","Alpha" ]
    var labImages = ["mokhtabar" , "alpha","alpha" ]
    var labDate = ["Apr 5, 2020","jun 1, 2020","May 14, 2020"]
    var dateDescingly : [HistoryObject]!
    override func viewWillAppear(_ animated: Bool) {
        if(Auth.auth().currentUser?.uid == nil)
        {
            let loginVC = self.storyboard!.instantiateViewController(withIdentifier: "loginSVC") as! LoginTableViewController
            loginVC.modalPresentationStyle = .fullScreen
            self.present(loginVC, animated: true, completion: nil)
            
        }else if !isFiltered{
            isOld = false
            skip = 0
//            var getRequestsPresenter = GetRequestsPresenter(getRequestsViewRef: self)
//            getRequestsPresenter.getRequests(testFilter: testFilter!)
            sendRequest()
            
//            self.tableView.reloadData()
        }else {
            isFiltered = false
        }
        dateDescingly = formatDate(myArr: labDate)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.delegate = self
        requests = [Request]()
        if(Auth.auth().currentUser?.uid != nil)
        {
            
//            testFilterOriginal = TestFilter(dateTimeStampFrom: nil, dateTimeStampTo: nil, labIds: nil, userId: Auth.auth().currentUser?.uid, status: [TestType.PendingForLabConfirmation.rawValue,TestType.PendingForTakingTheSample.rawValue,TestType.PendingForResult.rawValue,TestType.Refused.rawValue], take: take, skip: skip)
            
//            testFilter = testFilterOriginal
//            sendRequest()
//            var getRequestsPresenter = GetRequestsPresenter(getRequestsViewRef: self)
//            getRequestsPresenter.getRequests(testFilter: testFilter!)
//            self.tableView.reloadData()
        }
        
        //        dateDescingly=labDate
        
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if(!isOld){
            isOld = true
         cell.alpha = 0
             UIView.animate(withDuration : 0.3, delay: 0.05 * Double(indexPath.row), animations: {
                 cell.alpha = 1
             })
        }
     }
     
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return requests!.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HistoryTableViewCell
        
        
        cell.layer.cornerRadius = 12
        cell.layer.borderWidth = 2
        cell.layer.borderColor = UIColor.white.cgColor
        cell.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        cell.labImageOutlet.sd_setImage(with: URL(string: requests![indexPath.row].labPhoto ?? "users"), placeholderImage: UIImage(named: "users"))
        cell.labImageOutlet.layer.cornerRadius = cell.labImageOutlet.frame.height/2
        
        cell.labNameOutlet.text = requests![indexPath.row].labName
        cell.labDateOutlet.text = requests![indexPath.row].dateRequest
        switch requests![indexPath.row].status! {
        case TestType.PendingForLabConfirmation.rawValue:
            cell.requestStatus.text = "🔵 Wait Response"
            break
        case TestType.PendingForTakingTheSample.rawValue:
            cell.requestStatus.text = "💉 Wait Sample"
            break
        case TestType.PendingForResult.rawValue:
            cell.requestStatus.text = "🔸 Wait Result"
            break
        default:
            break
        }
        if requests![indexPath.row].status! == "" {
            
        }
        cell.labDateOutlet.sizeToFit()
        cell.labNameOutlet.sizeToFit()
        
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
        
    }
    func formatDate(myArr : [String]) -> [HistoryObject] {
        var convertedArray : [String] = []
        var dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM dd, yyyy"// yyyy-MM-dd"
        
        
        let historyArray: [HistoryObject] = myArr.map {
            let value = Int(arc4random_uniform(1000))
            return HistoryObject(dateString: $0, value: value)
        }
        
        print("\n-----> Before sorting <-----")
        historyArray.forEach { print($0) }
        
        //Create an array of the `Dates` for each HistoryObject
        let historyDates: [Date] = historyArray.map { dateFormatter.date(from: $0.dateString)!
        }
        
        //Combine the array of `Dates` and the array of `HistoryObjects` into an array of tuples
        let historyTuples = zip(historyArray, historyDates)
        
        //Sort the array of tuples and then map back to an array of type [HistoryObject]
        let sortedHistoryObjects = historyTuples.sorted { $0.1 > $1.1}
            .map {$0.0}
        
        print("\n-----> After sorting <-----")
        sortedHistoryObjects.forEach { print($0) }
        
        return sortedHistoryObjects
        
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if #available(iOS 13.0, *) {
            let vc = storyboard?.instantiateViewController(identifier: "reqStatus") as! RequestStatusTableViewController
            vc.testID = requests![indexPath.row].id
            navigationController?.pushViewController(vc, animated: true)
        } else {
            
        }
        
    }
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
            let height = scrollView.frame.size.height
            let contentYoffset = scrollView.contentOffset.y
            let distanceFromBottom = scrollView.contentSize.height - contentYoffset
            if isBottom == false && distanceFromBottom < height {
                isBottom = true
                sendRequest()
            }
            else if distanceFromBottom > height{
                isBottom = false
            }

        }
    func sendRequest() {
        if(isResult == nil){
            
        }
        else{
        var getRequestsPresenter = GetRequestsPresenter(getRequestsViewRef: self)
        if !isFiltered {
            testFilter = TestFilter(isFilter: false,dateFrom: nil, dateTo: nil, labIds: nil, userId: Auth.auth().currentUser?.uid, status: [TestType.PendingForLabConfirmation.rawValue,TestType.PendingForTakingTheSample.rawValue,TestType.PendingForResult.rawValue,TestType.Refused.rawValue], take: take, skip: skip)
        }
        getRequestsPresenter.getRequests(testFilter: testFilter!)
        }
    }
    func getTestFilter(testFilter: TestFilter) {
        isFiltered = true
        self.testFilter = testFilter
        skip = 0
        sendRequest()
    }
    
}


extension RequestsTableViewController : UITabBarControllerDelegate {
//    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
//        if item == (self.tabBar.items as! [UITabBarItem])[1]{
//            let requsestSV = self.tabBarController
//           //Do something if index is 0
//        }
//        else if item == (self.tabBar.items as! [UITabBarItem])[3]{
//           //Do something if index is 1
//        }
//    }

   func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool
    {
        let index = tabBarController.selectedIndex
        if index == 1 {
            isResult = false
            // load data appropriate for coming from the 2nd tab
        } else if index == 3 {
            // load data appropriate for coming from the 3rd tab
            isResult = true
        }

        return true
    }
//    func selectItemWithIndex(value: Int) {
//        self.tabBarControllertabBarController.selectedIndex = value;
//        self.tabBar(self.tabBar, didSelectItem: (self.tabBar.items as! [UITabBarItem])[value]);
//    }
}
