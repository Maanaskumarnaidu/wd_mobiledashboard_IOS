//
//  newgraphPageVC.swift
//  wisedrivedashboard
//
//  Created by Maanas Kumar on 03/10/23.
//

import UIKit
import Highcharts

class newgraphPageVC: UIViewController {
    
    @IBOutlet weak var leadsummarybasicgraphView: HIChartView!
    @IBOutlet weak var cartitleBackView: UIView!
    @IBOutlet weak var cartitleLabel: UILabel!
    @IBOutlet weak var leadtitleBackView: UIView!
    @IBOutlet weak var leadtitleLabel: UILabel!
    
    var insprejectedlistarr = [InspRejectedModelClass]()
    
    var warrantypurchasedlistarr = [WarranrtPurchasedModelClass]()
    
    var inspapprovedlistarr = [InspApprovedModelClass]()
    
    var inspschedulelistarr = [InspScheduledModelClass]()
    
    var inspcancelledlistarr = [InspCancelledModelCLass]()
    
    var freeinspdatalistarr = [FreeInspDataModelClass]()
    
    var paidinspdatalistarr = [PaidInspDataModelClass]()
    
    var allinspdatalistarr = [AllInspDataModelClass]()
    
    var inspcompletedlistarr = [InspCompletedModelClass]()
    
    var allleadslistarr = [AllLeadModelClass]()
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.rotateToLandsScapeDevice()
        
        self.cartitleBackView.backgroundColor = .clear
        self.cartitleLabel.textColor = UIColor.init(hexString: "252a40")
        self.leadtitleBackView.backgroundColor = UIColor.init(hexString: "252a40")
        self.leadtitleLabel.textColor = .white
        
        byleadsleadssummarygraphlistServiceCall()
    }
    
//    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
//        return .landscapeLeft
//    }
//
//    override var shouldAutorotate: Bool {
//        return true
//    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.rotateToPotraitScapeDevice()
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    func rotateToLandsScapeDevice(){
           let appDelegate = UIApplication.shared.delegate as! AppDelegate
           appDelegate.myOrientation = .landscapeRight
           UIDevice.current.setValue(UIInterfaceOrientation.landscapeLeft.rawValue, forKey: "orientation")
           UIView.setAnimationsEnabled(true)
       }

       func rotateToPotraitScapeDevice(){
           let appDelegate = UIApplication.shared.delegate as! AppDelegate
           appDelegate.myOrientation = .portrait
           UIDevice.current.setValue(UIInterfaceOrientation.portrait.rawValue, forKey: "orientation")
           UIView.setAnimationsEnabled(true)
       }
    
    @IBAction func backActionBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func bycarsActionBtn(_ sender: Any) {
        self.cartitleBackView.backgroundColor = UIColor.init(hexString: "252a40")
        self.cartitleLabel.textColor = .white
        self.leadtitleBackView.backgroundColor = .clear
        self.leadtitleLabel.textColor = UIColor.init(hexString: "252a40")
        self.bycarsleadssummarygraphlistServiceCall()
    }
    
    @IBAction func byleadsActionBtn(_ sender: Any) {
        self.cartitleBackView.backgroundColor = .clear
        self.cartitleLabel.textColor = UIColor.init(hexString: "252a40")
        self.leadtitleBackView.backgroundColor = UIColor.init(hexString: "252a40")
        self.leadtitleLabel.textColor = .white
        self.byleadsleadssummarygraphlistServiceCall()
    }
    

    
    
    
    func bycarsleadssummarygraphlistServiceCall() {
        if !InternetReachable.ValidateInternet {
            Message.NoInternetAlert(self)
            return
        }
        
        let imei = UIDevice.current.clientID
        
        self.view.StartLoading()
        
        Webservice().call(cRequest: CRequest.getRequest(url: CUrls.BaseUrl, suffix: CUrls.newmobiledashboardmodule.get_leadapi_getLeadSummaryForGraph, method: .get, contentType: .urlencode, params: ["textId": "", "month": "", "year": "", "empId": "", "fromDate": "", "toDate": "", "inspTypeId": "", "inspStatus": "", "utmSource": "", "utmMedium": "", "utmCampaign": "", "typeId": self.graphtype_id], headers: ["Authorization": "Bearer ", "X-Device-Imei": imei, "Content-Type": "application/json"])) { (response, auth) in
            
            self.view.StopLoading()
            
            if auth {
                sectionExpiredClass.ClearData(controller: self)
            } else {
            //    self.insprejectedData.removeAll()
                
                switch response.result {
                    
                case .success(let jsonResponse):
                    
                    if jsonResponse.responseType.isSuccess {
                        
                        print("get_leadapi_getLeadSummaryForGraph:" + "\(jsonResponse.response)")
                        
                        let main = jsonResponse.response.dictionaryValue
                        
                        let InspRejected = main["InspRejected"]?.arrayValue
                        
                        var insprejectedData: [[String: Any]] = []
                        
                        InspRejected?.forEach { obj in
                            let data: [String: Any] = [
                                "name": obj["graph_month"].stringValue,
                                "y": obj["count"].intValue
                            ]
                            insprejectedData.append(data)
                        }
                        
                        let WarranrtPurchased = main["WarranrtPurchased"]?.arrayValue
                        
                        var warranrtpurchasedData: [[String: Any]] = []
                        
                        WarranrtPurchased?.forEach { obj in
                            let wpdata: [String: Any] = [
                                "name": obj["graph_month"].stringValue,
                                "y": obj["count"].intValue
                            ]
                            warranrtpurchasedData.append(wpdata)
                        }
                        
                        let InspApproved = main["InspApproved"]?.arrayValue
                        
                        var inspapprovedData: [[String: Any]] = []
                        
                        InspApproved?.forEach { obj in
                            let aidata: [String: Any] = [
                                "name": obj["graph_month"].stringValue,
                                "y": obj["count"].intValue
                            ]
                            inspapprovedData.append(aidata)
                        }
                        
                        let InspScheduled = main["InspScheduled"]?.arrayValue
                        
                        var inspscheduledData: [[String: Any]] = []
                        
                        InspScheduled?.forEach { obj in
                            let isdata: [String: Any] = [
                                "name": obj["graph_month"].stringValue,
                                "y": obj["count"].intValue
                            ]
                            inspscheduledData.append(isdata)
                        }
                        
                        let InspCancelled = main["InspCancelled"]?.arrayValue
                        
                        var inspcancelledData: [[String: Any]] = []
                        
                        InspCancelled?.forEach { obj in
                            let icdata: [String: Any] = [
                                "name": obj["graph_month"].stringValue,
                                "y": obj["count"].intValue
                            ]
                            inspcancelledData.append(icdata)
                        }
                        
                        let FreeInspData = main["FreeInspData"]?.arrayValue
                        
                        var freeinspData: [[String: Any]] = []
                        
                        FreeInspData?.forEach { obj in
                            let fidata: [String: Any] = [
                                "name": obj["graph_month"].stringValue,
                                "y": obj["count"].intValue
                            ]
                            freeinspData.append(fidata)
                        }
                        
                        let PaidInspData = main["PaidInspData"]?.arrayValue
                        
                        var paidinspData: [[String: Any]] = []
                        
                        PaidInspData?.forEach { obj in
                            let pidata: [String: Any] = [
                                "name": obj["graph_month"].stringValue,
                                "y": obj["count"].intValue
                            ]
                            paidinspData.append(pidata)
                        }
                        
                        let AllInspData = main["AllInspData"]?.arrayValue
                        
                        var allinspData: [[String: Any]] = []
                        
                        AllInspData?.forEach { obj in
                            let allinspdata: [String: Any] = [
                                "name": obj["graph_month"].stringValue,
                                "y": obj["count"].intValue
                            ]
                            allinspData.append(allinspdata)
                        }
                        
                        let InspCompleted = main["InspCompleted"]?.arrayValue
                        
                        var inspcompletedData: [[String: Any]] = []
                        
                        InspCompleted?.forEach { obj in
                            let inspcompletedata: [String: Any] = [
                                "name": obj["graph_month"].stringValue,
                                "y": obj["count"].intValue
                            ]
                            inspcompletedData.append(inspcompletedata)
                        }
                        
                        let AllLead = main["AllLead"]?.arrayValue
                        
                        var allleadData: [[String: Any]] = []
                        
                            AllLead?.forEach { obj in
                            let allleadsData: [String: Any] = [
                                "name": obj["graph_month"].stringValue,
                                "y": obj["count"].intValue
                            ]
                            allleadData.append(allleadsData)
                        }
                        
                        
                        let chartView = HIChartView(frame: self.leadsummarybasicgraphView.bounds)
                        chartView.plugins = ["series-label"]

                        let options = HIOptions()

                        options.title = nil
                        options.subtitle = nil
                        
                        options.exporting = HIExporting()
                        options.exporting.enabled = false

                        let title = HITitle()
                        title.text = "By Cars Graph"
                        options.title = title

                        let yAxis = HIYAxis()
                        yAxis.title = HITitle()
                        yAxis.title.text = "Count"
                        options.yAxis = [yAxis]

//                        let currentDate = Date()
//                        let calendar = Calendar.current
//
//                        // Calculate the last three months from the current date
//                        var lastThreeMonths: [String] = []
//                        for i in 0..<3 {
//                            if let date = calendar.date(byAdding: .month, value: -i, to: currentDate) {
//                                let monthFormatter = DateFormatter()
//                                monthFormatter.dateFormat = "MMMM" // This will give you the full month name
//                                let monthName = monthFormatter.string(from: date)
//                                lastThreeMonths.insert(monthName, at: 0) // Insert at the beginning to maintain order
//                            }
//                        }

                        let currentDate = Date()
                        let calendar = Calendar.current

                        // Calculate the last three months from the current date
                        var lastThreeMonths: [String] = []
                        for i in 1...6 { // Start from 1 to exclude the current month
                            if let date = calendar.date(byAdding: .month, value: -i, to: currentDate) {
                                let monthFormatter = DateFormatter()
                                monthFormatter.dateFormat = "MMM" // This will give you the full month name
                                let monthName = monthFormatter.string(from: date)
                                lastThreeMonths.insert(monthName, at: 0) // Insert at the beginning to maintain order
                            }
                        }

                        let xAxis = HIXAxis()
                        xAxis.categories = lastThreeMonths
                        options.xAxis = [xAxis]

                        let legend = HILegend()
                        legend.layout = "vertical"
                        legend.align = "right"
                        legend.verticalAlign = "middle"
                        options.legend = legend

                        let installation = HISeries()
                        installation.name = "InspRejected"
                        installation.data = insprejectedData

                        let warrantypurchased = HISeries()
                        warrantypurchased.name = "WarranrtPurchased"
                        warrantypurchased.data = warranrtpurchasedData

                        let inspapproved = HISeries()
                        inspapproved.name = "InspApproved"
                        inspapproved.data = inspapprovedData

                        let inspsechuled = HISeries()
                        inspsechuled.name = "InspScheduled"
                        inspsechuled.data = inspscheduledData

                        let inspcancelled = HISeries()
                        inspcancelled.name = "InspCancelled"
                        inspcancelled.data = inspcancelledData

                        let freeinsp = HISeries()
                        freeinsp.name = "FreeInspData"
                        freeinsp.data = freeinspData

                        let paidinsp = HISeries()
                        paidinsp.name = "PaidInspData"
                        paidinsp.data = paidinspData

                        let allinsp = HISeries()
                        allinsp.name = "AllInspData"
                        allinsp.data = allinspData

                        let inspcompleted = HISeries()
                        inspcompleted.name = "InspCompleted"
                        inspcompleted.data = inspcompletedData

                        let allleads = HISeries()
                        allleads.name = "AllLead"
                        allleads.data = allleadData

                        options.series = [installation, warrantypurchased, inspapproved, inspsechuled, inspcancelled, freeinsp, paidinsp, allinsp, inspcompleted, allleads]

                        let responsive = HIResponsive()
                        let rules = HIRules()
                        rules.condition = HICondition()
                        rules.condition.maxWidth = 500
                        rules.chartOptions = [
                            "legend": [
                                "layout": "horizontal",
                                "align": "center",
                                "verticalAlign": "bottom"
                            ]
                        ]
                        responsive.rules = [rules]
                        options.responsive = responsive
                        
                        options.credits = HICredits()
                        options.credits.enabled = false

                        chartView.options = options

                        self.leadsummarybasicgraphView.addSubview(chartView)
                        
                        
//                        let chartView = HIChartView(frame: self.leadsummarybasicgraphView.bounds)
//
//                            let options = HIOptions()
//
//                        options.exporting = HIExporting()
//                        options.exporting.enabled = false
//
//                            let chart = HIChart()
//                            chart.type = "column"
//                            options.chart = chart
//
//                            let title = HITitle()
//                            title.text = "By Leads Graph"
//                            options.title = title
//
//                        let currentDate = Date()
//                        let calendar = Calendar.current
//
//                        // Calculate the last three months from the current date
//                        var lastThreeMonths: [String] = []
//                        for i in 1...3 { // Start from 1 to exclude the current month
//                            if let date = calendar.date(byAdding: .month, value: -i, to: currentDate) {
//                                let monthFormatter = DateFormatter()
//                                monthFormatter.dateFormat = "MMMM" // This will give you the full month name
//                                let monthName = monthFormatter.string(from: date)
//                                lastThreeMonths.insert(monthName, at: 0) // Insert at the beginning to maintain order
//                            }
//                        }
//
//                        let xAxis = HIXAxis()
//                        xAxis.categories = lastThreeMonths
//                        options.xAxis = [xAxis]
//
//                        let yAxis = HIYAxis()
//                        yAxis.min = 0
//                        yAxis.title = HITitle()
//                        yAxis.title.text = "Count"
//                        options.yAxis = [yAxis]
//
////                            let tooltip = HITooltip()
////                            tooltip.headerFormat = "<span style=\"font-size:10px\">{point.key}</span><table>"
////                            tooltip.pointFormat = "<tr><td style=\"color:{series.color};padding:0\">{series.name}: </td>" + "<td style=\"padding:0\"><b>{point.y:.1f} mm</b></td></tr>"
////                            tooltip.footerFormat = "</table>"
////                            tooltip.shared = true
////                            tooltip.useHTML = true
////                            options.tooltip = tooltip
//
//                            let plotOptions = HIPlotOptions()
//                            plotOptions.column = HIColumn()
//                            plotOptions.column.pointPadding = 0.2
//                            plotOptions.column.borderWidth = 0
//                            options.plotOptions = plotOptions
//
//                        let installation = HISeries()
//                        installation.name = "InspRejected"
//                        installation.data = insprejectedData
//
//                        let warrantypurchased = HISeries()
//                        warrantypurchased.name = "WarranrtPurchased"
//                        warrantypurchased.data = warranrtpurchasedData
//
//                        let inspapproved = HISeries()
//                        inspapproved.name = "InspApproved"
//                        inspapproved.data = inspapprovedData
//
//                        let inspsechuled = HISeries()
//                        inspsechuled.name = "InspScheduled"
//                        inspsechuled.data = inspscheduledData
//
//                        let inspcancelled = HISeries()
//                        inspcancelled.name = "InspCancelled"
//                        inspcancelled.data = inspcancelledData
//
//                        let freeinsp = HISeries()
//                        freeinsp.name = "FreeInspData"
//                        freeinsp.data = freeinspData
//
//                        let paidinsp = HISeries()
//                        paidinsp.name = "PaidInspData"
//                        paidinsp.data = paidinspData
//
//                        let allinsp = HISeries()
//                        allinsp.name = "AllInspData"
//                        allinsp.data = allinspData
//
//                        let inspcompleted = HISeries()
//                        inspcompleted.name = "InspCompleted"
//                        inspcompleted.data = inspcompletedData
//
//                        let allleads = HISeries()
//                        allleads.name = "AllLead"
//                        allleads.data = allleadData
//
//                        options.series = [installation, warrantypurchased, inspapproved, inspsechuled, inspcancelled, freeinsp, paidinsp, allinsp, inspcompleted, allleads]
//
//                            chartView.options = options
//
//                        options.credits = HICredits()
//                        options.credits.enabled = false
//
//                            self.leadsummarybasicgraphView.addSubview(chartView)
                        
                    } else {
                        
                        if let code = response.response?.statusCode {
                            if code == 401 || code == 403 {
                                sectionExpiredClass.ClearData(controller: self)
                            }
                        }
                        
                        print("post_dashBoardHome_homeTabService :" + "\(jsonResponse)")
                        self.view.ShowBlackTostWithText(message: jsonResponse.response["message"].stringValue, Interval: 3)
                        
                    }
                    
                    break
                case .failure(let error):
                    print(error.localizedDescription)
                    // Handle failure appropriately
                    
                    if let code = response.response?.statusCode {
                        if code == 401 {
                            // Handle unauthorized error
                        }
                    }
                    
                    break
                }
            }
        }
    }
    
    
    func byleadsleadssummarygraphlistServiceCall() {
        if !InternetReachable.ValidateInternet {
            Message.NoInternetAlert(self)
            return
        }
        
        let imei = UIDevice.current.clientID
        
        self.view.StartLoading()
        
        Webservice().call(cRequest: CRequest.getRequest(url: CUrls.BaseUrl, suffix: CUrls.newmobiledashboardmodule.get_graphDataByLead_getLeadSummaryForGraph, method: .get, contentType: .urlencode, params: ["textId": "", "month": "", "year": "", "empId": "", "fromDate": "", "toDate": "", "inspTypeId": "", "inspStatus": "", "utmSource": "", "utmMedium": "", "utmCampaign": "", "typeId": self.graphtype_id], headers: ["Authorization": "Bearer ", "X-Device-Imei": imei, "Content-Type": "application/json"])) { (response, auth) in
            
            self.view.StopLoading()
            
            if auth {
                sectionExpiredClass.ClearData(controller: self)
            } else {
            //    self.insprejectedData.removeAll()
                
                switch response.result {
                    
                case .success(let jsonResponse):
                    
                    if jsonResponse.responseType.isSuccess {
                        
                        print("get_graphDataByLead_getLeadSummaryForGraph:" + "\(jsonResponse.response)")
                        
                        let main = jsonResponse.response.dictionaryValue
                        
                        let InspRejected = main["InspRejected"]?.arrayValue
                        
                        var insprejectedData: [[String: Any]] = []
                        
                        InspRejected?.forEach { obj in
                            let data: [String: Any] = [
                                "name": obj["graph_month"].stringValue,
                                "y": obj["count"].intValue
                            ]
                            insprejectedData.append(data)
                        }
                        
                        let WarranrtPurchased = main["WarranrtPurchased"]?.arrayValue
                        
                        var warranrtpurchasedData: [[String: Any]] = []
                        
                        WarranrtPurchased?.forEach { obj in
                            let wpdata: [String: Any] = [
                                "name": obj["graph_month"].stringValue,
                                "y": obj["count"].intValue
                            ]
                            warranrtpurchasedData.append(wpdata)
                        }
                        
                        let InspApproved = main["InspApproved"]?.arrayValue
                        
                        var inspapprovedData: [[String: Any]] = []
                        
                        InspApproved?.forEach { obj in
                            let aidata: [String: Any] = [
                                "name": obj["graph_month"].stringValue,
                                "y": obj["count"].intValue
                            ]
                            inspapprovedData.append(aidata)
                        }
                        
                        let InspScheduled = main["InspScheduled"]?.arrayValue
                        
                        var inspscheduledData: [[String: Any]] = []
                        
                        InspScheduled?.forEach { obj in
                            let isdata: [String: Any] = [
                                "name": obj["graph_month"].stringValue,
                                "y": obj["count"].intValue
                            ]
                            inspscheduledData.append(isdata)
                        }
                        
                        let InspCancelled = main["InspCancelled"]?.arrayValue
                        
                        var inspcancelledData: [[String: Any]] = []
                        
                        InspCancelled?.forEach { obj in
                            let icdata: [String: Any] = [
                                "name": obj["graph_month"].stringValue,
                                "y": obj["count"].intValue
                            ]
                            inspcancelledData.append(icdata)
                        }
                        
                        let FreeInspData = main["FreeInspData"]?.arrayValue
                        
                        var freeinspData: [[String: Any]] = []
                        
                        FreeInspData?.forEach { obj in
                            let fidata: [String: Any] = [
                                "name": obj["graph_month"].stringValue,
                                "y": obj["count"].intValue
                            ]
                            freeinspData.append(fidata)
                        }
                        
                        let PaidInspData = main["PaidInspData"]?.arrayValue
                        
                        var paidinspData: [[String: Any]] = []
                        
                        PaidInspData?.forEach { obj in
                            let pidata: [String: Any] = [
                                "name": obj["graph_month"].stringValue,
                                "y": obj["count"].intValue
                            ]
                            paidinspData.append(pidata)
                        }
                        
                        let AllInspData = main["AllInspData"]?.arrayValue
                        
                        var allinspData: [[String: Any]] = []
                        
                        AllInspData?.forEach { obj in
                            let allinspdata: [String: Any] = [
                                "name": obj["graph_month"].stringValue,
                                "y": obj["count"].intValue
                            ]
                            allinspData.append(allinspdata)
                        }
                        
                        let InspCompleted = main["InspCompleted"]?.arrayValue
                        
                        var inspcompletedData: [[String: Any]] = []
                        
                        InspCompleted?.forEach { obj in
                            let inspcompletedata: [String: Any] = [
                                "name": obj["graph_month"].stringValue,
                                "y": obj["count"].intValue
                            ]
                            inspcompletedData.append(inspcompletedata)
                        }
                        
                        let AllLead = main["AllLead"]?.arrayValue
                        
                        var allleadData: [[String: Any]] = []
                        
                            AllLead?.forEach { obj in
                            let allleadsData: [String: Any] = [
                                "name": obj["graph_month"].stringValue,
                                "y": obj["count"].intValue
                            ]
                            allleadData.append(allleadsData)
                        }
                        
                        
                        let chartView = HIChartView(frame: self.leadsummarybasicgraphView.bounds)
                        chartView.plugins = ["series-label"]

                        let options = HIOptions()
                        options.title = nil
                        options.subtitle = nil
                        
                        options.exporting = HIExporting()
                        options.exporting.enabled = false
                        
                        let title = HITitle()
                        title.text = "By Leads Graph"
                        options.title = title

                        let yAxis = HIYAxis()
                        yAxis.title = HITitle()
                        yAxis.title.text = "Count"
                        options.yAxis = [yAxis]

//                        let currentDate = Date()
//                        let calendar = Calendar.current
//
//                        // Calculate the last three months from the current date
//                        var lastThreeMonths: [String] = []
//                        for i in 0..<3 {
//                            if let date = calendar.date(byAdding: .month, value: -i, to: currentDate) {
//                                let monthFormatter = DateFormatter()
//                                monthFormatter.dateFormat = "MMMM" // This will give you the full month name
//                                let monthName = monthFormatter.string(from: date)
//                                lastThreeMonths.insert(monthName, at: 0) // Insert at the beginning to maintain order
//                            }
//                        }

                        let currentDate = Date()
                        let calendar = Calendar.current

                        // Calculate the last three months from the current date
                        var lastThreeMonths: [String] = []
                        for i in 1...6 { // Start from 1 to exclude the current month
                            if let date = calendar.date(byAdding: .month, value: -i, to: currentDate) {
                                let monthFormatter = DateFormatter()
                                monthFormatter.dateFormat = "MMM" // This will give you the full month name
                                let monthName = monthFormatter.string(from: date)
                                lastThreeMonths.insert(monthName, at: 0) // Insert at the beginning to maintain order
                            }
                        }

                        let xAxis = HIXAxis()
                        xAxis.categories = lastThreeMonths
                        options.xAxis = [xAxis]

                        let legend = HILegend()
                        legend.layout = "vertical"
                        legend.align = "right"
                        legend.verticalAlign = "middle"
                        options.legend = legend

                        let installation = HISeries()
                        installation.name = "InspRejected"
                        installation.data = insprejectedData

                        let warrantypurchased = HISeries()
                        warrantypurchased.name = "WarranrtPurchased"
                        warrantypurchased.data = warranrtpurchasedData

                        let inspapproved = HISeries()
                        inspapproved.name = "InspApproved"
                        inspapproved.data = inspapprovedData

                        let inspsechuled = HISeries()
                        inspsechuled.name = "InspScheduled"
                        inspsechuled.data = inspscheduledData

                        let inspcancelled = HISeries()
                        inspcancelled.name = "InspCancelled"
                        inspcancelled.data = inspcancelledData

                        let freeinsp = HISeries()
                        freeinsp.name = "FreeInspData"
                        freeinsp.data = freeinspData

                        let paidinsp = HISeries()
                        paidinsp.name = "PaidInspData"
                        paidinsp.data = paidinspData

                        let allinsp = HISeries()
                        allinsp.name = "AllInspData"
                        allinsp.data = allinspData

                        let inspcompleted = HISeries()
                        inspcompleted.name = "InspCompleted"
                        inspcompleted.data = inspcompletedData

                        let allleads = HISeries()
                        allleads.name = "AllLead"
                        allleads.data = allleadData



                        options.series = [installation, warrantypurchased, inspapproved, inspsechuled, inspcancelled, freeinsp, paidinsp, allinsp, inspcompleted, allleads]


                        let responsive = HIResponsive()
                        let rules = HIRules()
                        rules.condition = HICondition()
                        rules.condition.maxWidth = 500
                        rules.chartOptions = [
                            "legend": [
                                "layout": "horizontal",
                                "align": "center",
                                "verticalAlign": "bottom"
                            ]
                        ]
                        responsive.rules = [rules]
                        options.responsive = responsive
                        
                        options.credits = HICredits()
                        options.credits.enabled = false

                        chartView.options = options

                        self.leadsummarybasicgraphView.addSubview(chartView)
                        
                    
//                        let chartView = HIChartView(frame: self.leadsummarybasicgraphView.bounds)
//
//                            let options = HIOptions()
//
//                        options.exporting = HIExporting()
//                        options.exporting.enabled = false
//
//                            let chart = HIChart()
//                            chart.type = "column"
//                            options.chart = chart
//
//                            let title = HITitle()
//                            title.text = "By Leads Graph"
//                            options.title = title
//
//                        let currentDate = Date()
//                        let calendar = Calendar.current
//
//                        // Calculate the last three months from the current date
//                        var lastThreeMonths: [String] = []
//                        for i in 1...3 { // Start from 1 to exclude the current month
//                            if let date = calendar.date(byAdding: .month, value: -i, to: currentDate) {
//                                let monthFormatter = DateFormatter()
//                                monthFormatter.dateFormat = "MMMM" // This will give you the full month name
//                                let monthName = monthFormatter.string(from: date)
//                                lastThreeMonths.insert(monthName, at: 0) // Insert at the beginning to maintain order
//                            }
//                        }
//
//                        let xAxis = HIXAxis()
//                        xAxis.categories = lastThreeMonths
//                        options.xAxis = [xAxis]
//
//                        let yAxis = HIYAxis()
//                        yAxis.min = 0
//                        yAxis.title = HITitle()
//                        yAxis.title.text = "Count"
//                        options.yAxis = [yAxis]
//
////                            let tooltip = HITooltip()
////                            tooltip.headerFormat = "<span style=\"font-size:10px\">{point.key}</span><table>"
////                            tooltip.pointFormat = "<tr><td style=\"color:{series.color};padding:0\">{series.name}: </td>" + "<td style=\"padding:0\"><b>{point.y:.1f} mm</b></td></tr>"
////                            tooltip.footerFormat = "</table>"
////                            tooltip.shared = true
////                            tooltip.useHTML = true
////                            options.tooltip = tooltip
//
//                            let plotOptions = HIPlotOptions()
//                            plotOptions.column = HIColumn()
//                            plotOptions.column.pointPadding = 0.2
//                            plotOptions.column.borderWidth = 0
//                            options.plotOptions = plotOptions
//
//                        let installation = HISeries()
//                        installation.name = "InspRejected"
//                        installation.data = insprejectedData
//
//                        let warrantypurchased = HISeries()
//                        warrantypurchased.name = "WarranrtPurchased"
//                        warrantypurchased.data = warranrtpurchasedData
//
//                        let inspapproved = HISeries()
//                        inspapproved.name = "InspApproved"
//                        inspapproved.data = inspapprovedData
//
//                        let inspsechuled = HISeries()
//                        inspsechuled.name = "InspScheduled"
//                        inspsechuled.data = inspscheduledData
//
//                        let inspcancelled = HISeries()
//                        inspcancelled.name = "InspCancelled"
//                        inspcancelled.data = inspcancelledData
//
//                        let freeinsp = HISeries()
//                        freeinsp.name = "FreeInspData"
//                        freeinsp.data = freeinspData
//
//                        let paidinsp = HISeries()
//                        paidinsp.name = "PaidInspData"
//                        paidinsp.data = paidinspData
//
//                        let allinsp = HISeries()
//                        allinsp.name = "AllInspData"
//                        allinsp.data = allinspData
//
//                        let inspcompleted = HISeries()
//                        inspcompleted.name = "InspCompleted"
//                        inspcompleted.data = inspcompletedData
//
//                        let allleads = HISeries()
//                        allleads.name = "AllLead"
//                        allleads.data = allleadData
//
//
//
//                        options.series = [installation, warrantypurchased, inspapproved, inspsechuled, inspcancelled, freeinsp, paidinsp, allinsp, inspcompleted, allleads]

//                        options.credits = HICredits()
//                        options.credits.enabled = false
//
//                            chartView.options = options
//
//                            self.leadsummarybasicgraphView.addSubview(chartView)
                        
                    } else {
                        
                        if let code = response.response?.statusCode {
                            if code == 401 || code == 403 {
                                sectionExpiredClass.ClearData(controller: self)
                            }
                        }
                        
                        print("post_dashBoardHome_homeTabService :" + "\(jsonResponse)")
                        self.view.ShowBlackTostWithText(message: jsonResponse.response["message"].stringValue, Interval: 3)
                        
                    }
                    
                    break
                case .failure(let error):
                    print(error.localizedDescription)
                    // Handle failure appropriately
                    
                    if let code = response.response?.statusCode {
                        if code == 401 {
                            // Handle unauthorized error
                        }
                    }
                    
                    break
                }
            }
        }
    }

   
}
