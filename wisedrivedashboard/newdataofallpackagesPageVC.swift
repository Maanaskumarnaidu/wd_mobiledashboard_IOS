//
//  newdataofallpackagesPageVC.swift
//  wisedrivedashboard
//
//  Created by Maanas Kumar on 31/10/23.
//

import UIKit

class newdataofallpackagesPageVC: UIViewController {
    
    @IBOutlet weak var warrantydataTableView: UITableView!
    @IBOutlet weak var allservicesdataBalcView: UIView!
    @IBOutlet weak var servicesdataTableView: UITableView!
    @IBOutlet weak var mainheadingLabel: UILabel!
    
    var warrantypacklistarr = [WarrantyBreakUpDataModelClass]()
    
    var inspectionpacklistarr = [InspBreakUpDataModelClass]()
    
    var servicespacklistarr = [ServicesBreakUpDataModeClass]()
    
    var fromwhich = ""
    
    var graphtext_id = ""
    
    var graphfromdate = ""
    
    var graphtodate = ""
    
    var graphemp_id = ""
    
    var graphmonth = ""
    
    var graphyear = ""
    
    var graphinsptype_id = ""
    
    var graphsource = ""
    
    var graphmedium = ""
    
    var graphcampaign = ""
    
    var graphtype_id = ""
    
    var warrantylead_count = ""
    
    var insplead_count = ""
    
    var warrantypercentage = ""
    
    var inspectionpercentage = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        if self.fromwhich == "Services" {
            self.allservicesdataBalcView.isHidden = false
            servicesbreakupServiceCall()
        }else if self.fromwhich == "Warranty" {
            self.allservicesdataBalcView.isHidden = true
            self.mainheadingLabel.text! = "Warranty data"
            warrantybreakupServiceCall()
        }else{
            self.allservicesdataBalcView.isHidden = true
            self.mainheadingLabel.text! = "Inspection data"
            inspectionbreakupServiceCall()
        }
        
    }
    
    @IBAction func backACtionBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func warrantybreakupServiceCall() {
        if !InternetReachable.ValidateInternet {
            Message.NoInternetAlert(self)
            return
        }
        
        if self.graphsource == "All" {
            self.graphsource = ""
        }else{
            
        }
        
        if self.graphmedium == "All" {
            self.graphmedium = ""
        }else{
            
        }
        
        let imei = UIDevice.current.clientID
       
            self.view.StartLoading()

        Webservice().call(cRequest: CRequest.getRequest(url: CUrls.BaseUrl, suffix: CUrls.newmobiledashboardmodule.get_WarrantyBreakUpData_getWarrantyBreakUpData, method: .get, contentType: .urlencode, params: ["textId":self.graphtext_id,"typeId":self.graphtype_id,"month":self.graphmonth,"year":self.graphyear,"employeeId":graphemp_id,"fromDate":self.graphfromdate,"toDate":self.graphtodate,"categoryId":self.graphsource,"subcategoryId":self.graphmedium], headers: ["Authorization": "Bearer " ,"X-Device-Imei":imei,"Content-Type":"application/json"])) { (response, auth) in
            
                self.view.StopLoading()
        //    self.activityloader.isHidden = true

            if auth {
                sectionExpiredClass.ClearData(controller: self)
            }
            else {
                self.warrantypacklistarr.removeAll()
           
                switch response.result {
                
                case .success(let jsonResponse):
                    
                    if jsonResponse.responseType.isSuccess {
                        
                        print("get_WarrantyBreakUpData_getWarrantyBreakUpData:" + "\(jsonResponse.response)");
                        
                        let main = jsonResponse.response.dictionaryValue
                        
                        let WarrantyBreakUpData = main["WarrantyBreakUpData"]?.arrayValue
                        
                        WarrantyBreakUpData!.forEach({ (obj) in
                            self.warrantypacklistarr.append(WarrantyBreakUpDataModelClass.init(data: obj))
                        })
                        self.warrantydataTableView.reloadData()
                        

                    } else {
                        
                        if let code = response.response?.statusCode {
                            if code == 401 || code == 403{
                                sectionExpiredClass.ClearData(controller: self)
                                
                            }
                        }
                        
                        print("post_dashBoardHome_homeTabService :" + "\(jsonResponse)")
                        //                        self.view.ShowBlackTostWithText(message: jsonResponse.responseMessage, Interval: 2)
                        self.view.ShowBlackTostWithText(message: jsonResponse.response["message"].stringValue, Interval: 3)
                        
                    }
                    
                    break
                case .failure(let error):
                    print(error.localizedDescription)
                    //                    Message.SomethingWrongAlert(self)
                    
                    if let code = response.response?.statusCode {
                        if code == 401 {
                            
                        }
                    }
                    
                    break
                }
            }
        }
    }
    
    func inspectionbreakupServiceCall() {
        if !InternetReachable.ValidateInternet {
            Message.NoInternetAlert(self)
            return
        }
        
        if self.graphsource == "All" {
            self.graphsource = ""
        }else{
            
        }
        
        if self.graphmedium == "All" {
            self.graphmedium = ""
        }else{
            
        }
        
        let imei = UIDevice.current.clientID
       
            self.view.StartLoading()

        Webservice().call(cRequest: CRequest.getRequest(url: CUrls.BaseUrl, suffix: CUrls.newmobiledashboardmodule.get_InspBreakUp_getInspBreakUpData, method: .get, contentType: .urlencode, params: ["textId":self.graphtext_id,"typeId":self.graphtype_id,"month":self.graphmonth,"year":self.graphyear,"employeeId":graphemp_id,"fromDate":self.graphfromdate,"toDate":self.graphtodate,"categoryId":self.graphsource,"subcategoryId":self.graphmedium], headers: ["Authorization": "Bearer " ,"X-Device-Imei":imei,"Content-Type":"application/json"])) { (response, auth) in
            
                self.view.StopLoading()
        //    self.activityloader.isHidden = true

            if auth {
                sectionExpiredClass.ClearData(controller: self)
            }
            else {
                self.inspectionpacklistarr.removeAll()
           
                switch response.result {
                
                case .success(let jsonResponse):
                    
                    if jsonResponse.responseType.isSuccess {
                        
                        print("get_InspBreakUp_getInspBreakUpData:" + "\(jsonResponse.response)");
                        
                        let main = jsonResponse.response.dictionaryValue
                        
                        let InspBreakUpData = main["InspBreakUpData"]?.arrayValue
                        
                        InspBreakUpData!.forEach({ (obj) in
                            self.inspectionpacklistarr.append(InspBreakUpDataModelClass.init(data: obj))
                        })
                        self.warrantydataTableView.reloadData()
                        

                    } else {
                        
                        if let code = response.response?.statusCode {
                            if code == 401 || code == 403{
                                sectionExpiredClass.ClearData(controller: self)
                                
                            }
                        }
                        
                        print("post_dashBoardHome_homeTabService :" + "\(jsonResponse)")
                        //                        self.view.ShowBlackTostWithText(message: jsonResponse.responseMessage, Interval: 2)
                        self.view.ShowBlackTostWithText(message: jsonResponse.response["message"].stringValue, Interval: 3)
                        
                    }
                    
                    break
                case .failure(let error):
                    print(error.localizedDescription)
                    //                    Message.SomethingWrongAlert(self)
                    
                    if let code = response.response?.statusCode {
                        if code == 401 {
                            
                        }
                    }
                    
                    break
                }
            }
        }
    }
    
    func servicesbreakupServiceCall() {
        if !InternetReachable.ValidateInternet {
            Message.NoInternetAlert(self)
            return
        }
        
        if self.graphsource == "All" {
            self.graphsource = ""
        }else{
            
        }
        
        if self.graphmedium == "All" {
            self.graphmedium = ""
        }else{
            
        }
        
        let imei = UIDevice.current.clientID
       
            self.view.StartLoading()

        Webservice().call(cRequest: CRequest.getRequest(url: CUrls.BaseUrl, suffix: CUrls.newmobiledashboardmodule.get_ServiceBreakUp_getServiceBreakUp, method: .get, contentType: .urlencode, params: ["textId":self.graphtext_id,"typeId":self.graphtype_id,"month":self.graphmonth,"year":self.graphyear,"employeeId":graphemp_id,"fromDate":self.graphfromdate,"toDate":self.graphtodate,"categoryId":self.graphsource,"subcategoryId":self.graphmedium], headers: ["Authorization": "Bearer " ,"X-Device-Imei":imei,"Content-Type":"application/json"])) { (response, auth) in
            
                self.view.StopLoading()
        //    self.activityloader.isHidden = true

            if auth {
                sectionExpiredClass.ClearData(controller: self)
            }
            else {
                self.servicespacklistarr.removeAll()
           
                switch response.result {
                
                case .success(let jsonResponse):
                    
                    if jsonResponse.responseType.isSuccess {
                        
                        print("get_ServiceBreakUp_getServiceBreakUp:" + "\(jsonResponse.response)");
                        
                        let main = jsonResponse.response.dictionaryValue
                        
                        let InspBreakUpData = main["InspBreakUpData"]?.arrayValue
                        
                        InspBreakUpData!.forEach({ (obj) in
                            self.servicespacklistarr.append(ServicesBreakUpDataModeClass.init(data: obj))
                        })
                        self.servicesdataTableView.reloadData()
                        

                    } else {
                        
                        if let code = response.response?.statusCode {
                            if code == 401 || code == 403{
                                sectionExpiredClass.ClearData(controller: self)
                                
                            }
                        }
                        
                        print("post_dashBoardHome_homeTabService :" + "\(jsonResponse)")
                        //                        self.view.ShowBlackTostWithText(message: jsonResponse.responseMessage, Interval: 2)
                        self.view.ShowBlackTostWithText(message: jsonResponse.response["message"].stringValue, Interval: 3)
                        
                    }
                    
                    break
                case .failure(let error):
                    print(error.localizedDescription)
                    //                    Message.SomethingWrongAlert(self)
                    
                    if let code = response.response?.statusCode {
                        if code == 401 {
                            
                        }
                    }
                    
                    break
                }
            }
        }
    }
    
   
}

extension newdataofallpackagesPageVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView.tag == 11 {
            if self.fromwhich == "Warranty" {
                return warrantypacklistarr.count
            }else{
                return inspectionpacklistarr.count
            }
        }else{
            return servicespacklistarr.count
        }
        
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView.tag == 11 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "detailsofallwarrantypackagestablecell", for: indexPath) as! detailsofallwarrantypackagestablecell
            if self.fromwhich == "Warranty" {
                cell.nameofwarrabtypackLabel.text! = warrantypacklistarr[indexPath.row].category_name
                self.warrantylead_count = String(warrantypacklistarr[indexPath.row].leadCountNew["new_lead_count"] as? Int ?? 0)
                
               
                // Assuming you have the two integer values fetched from the API
                let totalCount = warrantypacklistarr[indexPath.row].total_count
                let leadCount = self.warrantylead_count

                // Calculate the percentage
                let percentage = ((Double(totalCount ?? 0)) / (Double(leadCount) ?? 0.0)) * 100.0

                // Format the percentage to display with 2 decimal places
                let formattedPercentage = String(format: "%.2f", percentage)

                // Update your label with the formatted percentage
                self.warrantypercentage = "\(formattedPercentage)%"



                if let total_count = warrantypacklistarr[indexPath.row].total_count {
                    let text = "\(total_count) (\(self.warrantylead_count))"
                    let attributedText = NSMutableAttributedString(string: text)

                    let regularFont = UIFont.systemFont(ofSize: 17.0)
                    let semiboldFont = UIFont(name: "Gilroy-Semibold", size: 17.0)

                    let regularRange = NSMakeRange(0, "\(total_count)".count)
                    if let range = text.range(of: self.warrantylead_count) {
                        let nsRange = NSRange(range, in: text)
                        attributedText.addAttributes([NSAttributedString.Key.font: regularFont], range: regularRange)
                        attributedText.addAttributes([NSAttributedString.Key.font: semiboldFont as Any], range: nsRange)
                    }

                    // Now, create the attributed string for the percentage
                    let percentageString = NSAttributedString(string: " (\(self.warrantypercentage))")

                    // Combine the main attributed text and the percentage attributed text
                    attributedText.append(percentageString)

                    cell.countofwarrantypackLabel.attributedText = attributedText
                }

                

                let dmamount: Double = self.warrantypacklistarr[indexPath.row].sales_sum
                let dmnumberFormatter = NumberFormatter()
                dmnumberFormatter.numberStyle = .decimal
                dmnumberFormatter.groupingSeparator = ","
                if let dmformattedAmount = dmnumberFormatter.string(from: NSNumber(value: dmamount)) {
                    let dmdisplayAmount = "Rs. " + dmformattedAmount
                    cell.amountofwarrantypackLabel.text = dmdisplayAmount
                }
            }else{
                cell.nameofwarrabtypackLabel.text! = inspectionpacklistarr[indexPath.row].category_name
                self.insplead_count = String(inspectionpacklistarr[indexPath.row].leadCountNew["new_lead_count"] as? Int ?? 0)
           
                let totalCount = inspectionpacklistarr[indexPath.row].total_sales
                let leadCount = self.insplead_count

                // Calculate the percentage
                let percentage = ((Double(totalCount ?? 0)) / (Double(leadCount) ?? 0.0)) * 100.0

                // Format the percentage to display with 2 decimal places
                let formattedPercentage = String(format: "%.2f", percentage)

                // Update your label with the formatted percentage
                self.inspectionpercentage = "\(formattedPercentage)%"
                
                if let total_count = inspectionpacklistarr[indexPath.row].total_sales {
                    let text = "\(total_count) (\(self.insplead_count))"
                    let attributedText = NSMutableAttributedString(string: text)

                    let regularFont = UIFont.systemFont(ofSize: 17.0)
                    let semiboldFont = UIFont(name: "Gilroy-Semibold", size: 17.0)

                    let regularRange = NSMakeRange(0, "\(total_count)".count)
                    if let range = text.range(of: self.insplead_count) {
                        let nsRange = NSRange(range, in: text)
                        attributedText.addAttributes([NSAttributedString.Key.font: regularFont], range: regularRange)
                        attributedText.addAttributes([NSAttributedString.Key.font: semiboldFont as Any], range: nsRange)
                    }

                    // Now, create the attributed string for the percentage
                    let percentageString = NSAttributedString(string: " (\(self.inspectionpercentage))")

                    // Combine the main attributed text and the percentage attributed text
                    attributedText.append(percentageString)

                    cell.countofwarrantypackLabel.attributedText = attributedText
                }
                
                let dmamount: Double = self.inspectionpacklistarr[indexPath.row].sales_sum
                let dmnumberFormatter = NumberFormatter()
                dmnumberFormatter.numberStyle = .decimal
                dmnumberFormatter.groupingSeparator = ","
                if let dmformattedAmount = dmnumberFormatter.string(from: NSNumber(value: dmamount)) {
                    let dmdisplayAmount = "Rs. " + dmformattedAmount
                    cell.amountofwarrantypackLabel.text = dmdisplayAmount
                }
            }
           
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "listofallservicesamounttablecell", for: indexPath) as! listofallservicesamounttablecell
            cell.typenameofservicesLabel.text! = servicespacklistarr[indexPath.row].category_name
            cell.countofservicesLabel.text! = String(servicespacklistarr[indexPath.row].total_sales)
            let dmamount: Double = self.servicespacklistarr[indexPath.row].sales_sum
            let dmnumberFormatter = NumberFormatter()
            dmnumberFormatter.numberStyle = .decimal
            dmnumberFormatter.groupingSeparator = ","
            if let dmformattedAmount = dmnumberFormatter.string(from: NSNumber(value: dmamount)) {
                let dmdisplayAmount = "Rs. " + dmformattedAmount
                cell.amountofservicesLabel.text = dmdisplayAmount
            }
            
            let avgamount: Double = self.servicespacklistarr[indexPath.row].avg_sum
            let avgnumberFormatter = NumberFormatter()
            avgnumberFormatter.numberStyle = .decimal
            avgnumberFormatter.groupingSeparator = ","
            avgnumberFormatter.maximumFractionDigits = 0 // Set maximumFractionDigits to 0 to remove decimal part

            if let avgformattedAmount = avgnumberFormatter.string(from: NSNumber(value: avgamount)) {
                let avgdisplayAmount = "Rs. " + avgformattedAmount
                cell.avgofservicesLabel.text = avgdisplayAmount
            }

            
            return cell
        }
        
        
    }
    
    
    
}

class detailsofallwarrantypackagestablecell : UITableViewCell {
    @IBOutlet weak var nameofwarrabtypackLabel: UILabel!
    @IBOutlet weak var countofwarrantypackLabel: UILabel!
    @IBOutlet weak var amountofwarrantypackLabel: UILabel!
    
}

class listofallservicesamounttablecell : UITableViewCell {
    @IBOutlet weak var typenameofservicesLabel: UILabel!
    @IBOutlet weak var countofservicesLabel: UILabel!
    @IBOutlet weak var amountofservicesLabel: UILabel!
    @IBOutlet weak var avgofservicesLabel: UILabel!
    
}
