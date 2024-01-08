//
//  newipaddashboardgrapghsPageVC.swift
//  wisedrivedashboard
//
//  Created by Maanas Kumar on 02/11/23.
//

import UIKit
import Highcharts
import MapKit

class newipaddashboardgrapghsPageVC: UIViewController {
    
    @IBOutlet weak var chartone: HIChartView!
    @IBOutlet weak var charttwo: HIChartView!
    @IBOutlet weak var chartthree: HIChartView!
    @IBOutlet weak var chartfour: HIChartView!
    @IBOutlet weak var chartfiveView: HIChartView!
    
    var totalactivateddatalistarr = [WarrantyActivatedDataModelClass]()
    
    var allbrandlistarr = [WarrantyActivatedDataBrandWiseModelClass]()
    
    var allmodellistarr = [WarrantyActivatedDataModelWiseModelClass]()
    
    var currentDrilldownLevel: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let onechartView = HIChartView(frame: self.chartone.bounds)
        onechartView.plugins = ["series-label"]

        let oneoptions = HIOptions()
        oneoptions.exporting = HIExporting()
        oneoptions.exporting.enabled = false

        let title = HITitle()
        title.text = "Revenue"
        oneoptions.title = title

        let yAxis = HIYAxis()
        yAxis.title = HITitle()
        yAxis.title.text = "Amount"

        // Customize the y-axis labels using formatter
        yAxis.labels = HILabels()
        yAxis.labels.formatter = HIFunction(jsFunction: "function() { return Highcharts.numberFormat(this.value, 0, '.', ','); }")

        oneoptions.yAxis = [yAxis]

        let xAxis = HIXAxis()
        // Update categories to show the last six months
        xAxis.categories = ["Q1'22", "Q2'22", "Q3'22", "Q4'22", "Q1'23", "Q2'23"]
        oneoptions.xAxis = [xAxis]

        let legend = HILegend()
        legend.layout = "vertical"
        legend.align = "right"
        legend.verticalAlign = "middle"
        oneoptions.legend = legend

        let installation = HISeries()
        installation.name = "Revenue"
        // Update data for the last six months
        installation.data = [3346731, 4206338, 7347283, 8640837, 8810492, 9652148]

        oneoptions.series = [installation]
        
        let tooltip = HITooltip()
        // Customize the tooltip to display the value as an amount with comma separators
        tooltip.pointFormat = "<span style='color:{point.color}'>{series.name}</span>: <b>Rs. {point.y:,.0f}</b><br/>"
        oneoptions.tooltip = tooltip

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
        oneoptions.responsive = responsive
        
        oneoptions.credits = HICredits()
        oneoptions.credits.enabled = false

        onechartView.options = oneoptions

        self.chartone.addSubview(onechartView)
        

            let twochartView = HIChartView(frame: self.charttwo.bounds)
            twochartView.plugins = ["series-label"]

            let twooptions = HIOptions()
        
            twooptions.exporting = HIExporting()
            twooptions.exporting.enabled = false

            let twotitle = HITitle()
            twotitle.text = "Warranty Sold"
            twooptions.title = twotitle

            let twoyAxis = HIYAxis()
            twoyAxis.title = HITitle()
            twoyAxis.title.text = "Number of Sales"
            twoyAxis.labels = HILabels()
            twoyAxis.labels.formatter = HIFunction(jsFunction: "function() { return Highcharts.numberFormat(this.value, 0, '.', ','); }")
            twooptions.yAxis = [twoyAxis]

            let twoxAxis = HIXAxis()
            twoxAxis.categories = ["Q1'22", "Q2'22", "Q3'22", "Q4'22", "Q1'23", "Q2'23"]
            twooptions.xAxis = [twoxAxis]

            let twolegend = HILegend()
            twolegend.layout = "vertical"
            twolegend.align = "right"
            twolegend.verticalAlign = "middle"
            twooptions.legend = twolegend

//            let twoplotOptions = HIPlotOptions()
//            twoplotOptions.series = HISeries()
//            twoplotOptions.series.label = HILabel()
//            twoplotOptions.series.label.connectorAllowed = false
//            twoplotOptions.series.pointStart = 2010
//            twooptions.plotOptions = twoplotOptionsx

            let twoinstallation = HISeries()
            twoinstallation.name = "Sale"
            twoinstallation.data = [451, 605, 969, 1025, 1124, 1322]

            twooptions.series = [twoinstallation]

            let tworesponsive = HIResponsive()
            let tworules = HIRules()
            tworules.condition = HICondition()
            tworules.condition.maxWidth = 500
            tworules.chartOptions = [
              "legend": [
                 "layout": "horizontal",
                 "align": "center",
                 "verticalAlign": "bottom"
              ]
            ]
            tworesponsive.rules = [tworules]
            twooptions.responsive = tworesponsive
        
            twooptions.credits = HICredits()
            twooptions.credits.enabled = false

            twochartView.options = twooptions

            self.charttwo.addSubview(twochartView)
        
            inspgraphlistServiceCall()
            
            allactivatedcarsgraphlistServiceCall()
        
        newdrilldownallactivatedcarsgraphlistServiceCall()
        
//        let chartView = HIChartView(frame: self.chartfiveView.bounds)
//
//                let options = HIOptions()
//
//                let chart = HIChart()
//                chart.type = "column"
//                options.chart = chart
//
//        let fivetitle = HITitle()
//        fivetitle.text = "All Activated Cars"
//        options.title = fivetitle
//
//                let fivexAxis = HIXAxis()
//                fivexAxis.type = "category"
//                options.xAxis = [fivexAxis]
//
//                let series = HISeries()
//                series.data = [
//                    ["name": "Q1", "y": 56.33, "drilldown": "Q1"],
//                    ["name": "Q2", "y": 24.03, "drilldown": "Q2"],
//                    ["name": "Q3", "y": 65.03, "drilldown": "Q3"],
//                    ["name": "Q4", "y": 25.03, "drilldown": "Q4"],
//                    ["name": "Q5", "y": 15.03, "drilldown": "Q5"],
//                    ["name": "Q6", "y": 55.03, "drilldown": "Q6"]
//                ] as [Any]
//
//                options.series = [series]
//
//                let drilldown = HIDrilldown()
//
//                let ieDrilldown = HISeries()
//                ieDrilldown.name = "Q1"
//                ieDrilldown.id = "Q1"
//                ieDrilldown.data = [
//                    ["name": "Maruti", "y": 22, "drilldown": "Maruti"],
//                    ["name": "Honda", "y": 24, "drilldown": "Honda"]
//                ] as [Any]
//
//                let chromeDrilldown = HISeries()
//                chromeDrilldown.name = "Q2"
//                chromeDrilldown.id = "Q2"
//                chromeDrilldown.data = [
//                    ["name": "Honda", "y": 24, "drilldown": "Honda"]
//                ] as [Any]
//
//                let threeDrilldown = HISeries()
//                threeDrilldown.name = "Q3"
//                threeDrilldown.id = "Q3"
//                threeDrilldown.data = [
//                    ["name": "Tata", "y": 27, "drilldown": "Tata"]
//                ] as [Any]
//
//                let fourDrilldown = HISeries()
//                fourDrilldown.name = "Q4"
//                fourDrilldown.id = "Q4"
//                fourDrilldown.data = [
//                    ["name": "Ford", "y": 27, "drilldown": "Ford"]
//                ] as [Any]
//
//                let fiveDrilldown = HISeries()
//                fiveDrilldown.name = "Q5"
//                fiveDrilldown.id = "Q5"
//                fiveDrilldown.data = [
//                    ["name": "Renault", "y": 27, "drilldown": "Renault"]
//                ] as [Any]
//
//                let sixDrilldown = HISeries()
//                sixDrilldown.name = "Q6"
//                sixDrilldown.id = "Q6"
//                sixDrilldown.data = [
//                    ["name": "maruti", "y": 27, "drilldown": "maruti"]
//                ] as [Any]
//
//                let m1Drilldown = HISeries()
//                m1Drilldown.id = "Maruti"
//                m1Drilldown.data = [
//                    ["Swift", 17.2],
//                    ["Brezza", 25.2]
//                ] as [Any]
//
//                let q2Drilldown = HISeries()
//                q2Drilldown.id = "Honda"
//                q2Drilldown.data = [
//                    ["City", 17.2],
//                    ["BRV", 25.2]
//                ] as [Any]
//
//                let q3Drilldown = HISeries()
//                q3Drilldown.id = "Tata"
//                q3Drilldown.data = [
//                    ["Nexon", 17.2],
//                    ["Safari", 25.2]
//                ] as [Any]
//
//                let q4Drilldown = HISeries()
//                q4Drilldown.id = "Ford"
//                q4Drilldown.data = [
//                    ["Figo", 17.2],
//                    ["Ecosport", 25.2]
//                ] as [Any]
//
//                let q5Drilldown = HISeries()
//                q5Drilldown.id = "Renault"
//                q5Drilldown.data = [
//                    ["Kwid", 17.2],
//                    ["Duster", 25.2]
//                ] as [Any]
//
//                let q6Drilldown = HISeries()
//                q6Drilldown.id = "maruti"
//                q6Drilldown.data = [
//                    ["Kwid", 17.2],
//                    ["Duster", 25.2]
//                ] as [Any]
//
//                drilldown.series = [ieDrilldown, chromeDrilldown, threeDrilldown, fourDrilldown, fiveDrilldown, sixDrilldown, m1Drilldown, q2Drilldown, q3Drilldown, q4Drilldown, q5Drilldown, q6Drilldown]
//
//                options.drilldown = drilldown
//
//                chartView.options = options
//
//                self.chartfiveView.addSubview(chartView)
            
        
    }
//
//    func createDrilldownSeries(name: String, id: String, data: [[Any]]) -> HIColumn {
//        let drilldownSeries = HIColumn()
//        drilldownSeries.name = name
//        drilldownSeries.id = id  // Set the id directly here
//        drilldownSeries.data = data
//
//        return drilldownSeries
//    }


    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    @IBAction func backActionBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func warrantysoldbarchartActionBtn(_ sender: Any) {
        
        let onechartView = HIChartView(frame: self.chartone.bounds)

        let oneoptions = HIOptions()
        
       
        oneoptions.exporting = HIExporting()
        oneoptions.exporting.enabled = false

        let onechart = HIChart()
        onechart.type = "bar"
        oneoptions.chart = onechart

        let onetitle = HITitle()
        onetitle.text = "Revenue"
        oneoptions.title = onetitle

        let onexAxis = HIXAxis()
        onexAxis.categories = ["Q1'22", "Q2'22", "Q3'22", "Q4'22", "Q1'23", "Q2'23"]
        oneoptions.xAxis = [onexAxis]

        let oneyAxis = HIYAxis()
        oneyAxis.title = HITitle()
        oneyAxis.title.text = "Amount"
        oneyAxis.labels = HILabels()
        oneyAxis.labels.formatter = HIFunction(jsFunction: "function() { return Highcharts.numberFormat(this.value, 0, '.', ','); }")
        oneoptions.yAxis = [oneyAxis]

        let onecredits = HICredits()
        onecredits.enabled = false
        oneoptions.credits = onecredits

     //   options.chart?.contextMenu = ["viewFullscreen", "printChart", "downloadPNG", "downloadJPEG", "downloadPDF", "downloadSVG"]

        let amount = HIBar()
        amount.name = "Amount"
        amount.data = [3346731, 4206338, 7347283, 8640837, 8810492, 9652148]

        oneoptions.series = [amount]

        onechartView.options = oneoptions

        self.chartone.addSubview(onechartView)
        
        
        // second chart starts
        
        
        let chartView = HIChartView(frame: self.charttwo.bounds)

        let options = HIOptions()
        
       
        options.exporting = HIExporting()
        options.exporting.enabled = false

        let chart = HIChart()
        chart.type = "bar"
        options.chart = chart

        let title = HITitle()
        title.text = "Warranty Sold"
        options.title = title

        let xAxis = HIXAxis()
        xAxis.categories = ["Q1'22", "Q2'22", "Q3'22", "Q4'22", "Q1'23", "Q2'23"]
        options.xAxis = [xAxis]

        let yAxis = HIYAxis()
        yAxis.title = HITitle()
        yAxis.title.text = "Number of Sales"
        yAxis.labels = HILabels()
        yAxis.labels.formatter = HIFunction(jsFunction: "function() { return Highcharts.numberFormat(this.value, 0, '.', ','); }")
        options.yAxis = [yAxis]

        let credits = HICredits()
        credits.enabled = false
        options.credits = credits

     //   options.chart?.contextMenu = ["viewFullscreen", "printChart", "downloadPNG", "downloadJPEG", "downloadPDF", "downloadSVG"]

        let year1800 = HIBar()
        year1800.name = "Sale"
        year1800.data = [451, 605, 969, 1025, 1124, 1322]

        options.series = [year1800]
        
        options.credits = HICredits()
        options.credits.enabled = false

        chartView.options = options

        self.charttwo.addSubview(chartView)

    }
    
    @IBAction func warrantysoldlinechartActionBtn(_ sender: Any) {
        
        
        let chartView = HIChartView(frame: self.chartone.bounds)
        chartView.plugins = ["series-label"]

        let options = HIOptions()
        options.exporting = HIExporting()
        options.exporting.enabled = false

        let title = HITitle()
        title.text = "Revenue"
        options.title = title

        let yAxis = HIYAxis()
        yAxis.title = HITitle()
        yAxis.title.text = "Amount"

        // Customize the y-axis labels using formatter
        yAxis.labels = HILabels()
        yAxis.labels.formatter = HIFunction(jsFunction: "function() { return Highcharts.numberFormat(this.value, 0, '.', ','); }")

        options.yAxis = [yAxis]

        let xAxis = HIXAxis()
        // Update categories to show the last six months
        xAxis.categories = ["Q1'22", "Q2'22", "Q3'22", "Q4'22", "Q1'23", "Q2'23"]
        options.xAxis = [xAxis]

        let legend = HILegend()
        legend.layout = "vertical"
        legend.align = "right"
        legend.verticalAlign = "middle"
        options.legend = legend

        let installation = HISeries()
        installation.name = "Revenue"
        // Update data for the last six months
        installation.data = [3346731, 4206338, 7347283, 8640837, 8810492, 9652148]

        options.series = [installation]
        
        let tooltip = HITooltip()
        // Customize the tooltip to display the value as an amount with comma separators
        tooltip.pointFormat = "<span style='color:{point.color}'>{series.name}</span>: <b>Rs. {point.y:,.0f}</b><br/>"
        options.tooltip = tooltip

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

        self.chartone.addSubview(chartView)
        
        
        //second chart starts
        
        let twochartView = HIChartView(frame: self.charttwo.bounds)
        twochartView.plugins = ["series-label"]
        
        let twooptions = HIOptions()
        twooptions.exporting = HIExporting()
        twooptions.exporting.enabled = false

        let twotitle = HITitle()
        twotitle.text = "Warranty Sold"
        twooptions.title = twotitle

        let twoyAxis = HIYAxis()
        twoyAxis.title = HITitle()
        twoyAxis.title.text = "Number of Sales"
        twoyAxis.labels = HILabels()
        twoyAxis.labels.formatter = HIFunction(jsFunction: "function() { return Highcharts.numberFormat(this.value, 0, '.', ','); }")
        twooptions.yAxis = [twoyAxis]

        let twoxAxis = HIXAxis()
        twoxAxis.categories = ["Q1'22", "Q2'22", "Q3'22", "Q4'22", "Q1'23", "Q2'23"]
        twooptions.xAxis = [twoxAxis]

        let twolegend = HILegend()
        twolegend.layout = "vertical"
        twolegend.align = "right"
        twolegend.verticalAlign = "middle"
        twooptions.legend = twolegend

        let twoinstallation = HISeries()
        twoinstallation.name = "Sale"
        twoinstallation.data = [451, 605, 969, 1025, 1124, 1322]

        twooptions.series = [twoinstallation]

        let tworesponsive = HIResponsive()
        let tworules = HIRules()
        tworules.condition = HICondition()
        tworules.condition.maxWidth = 500
        tworules.chartOptions = [
          "legend": [
             "layout": "horizontal",
             "align": "center",
             "verticalAlign": "bottom"
          ]
        ]
        tworesponsive.rules = [tworules]
        twooptions.responsive = tworesponsive
        
        twooptions.credits = HICredits()
        twooptions.credits.enabled = false

        twochartView.options = twooptions

        self.charttwo.addSubview(twochartView)
    }
    
    
    
    func inspgraphlistServiceCall() {
        if !InternetReachable.ValidateInternet {
            Message.NoInternetAlert(self)
            return
        }
        
        let imei = UIDevice.current.clientID
        
        self.view.StartLoading()
        
        Webservice().call(cRequest: CRequest.getRequest(url: CUrls.BaseUrl, suffix: CUrls.newmobiledashboardmodule.get_InspGraph_getInspGraph, method: .get, contentType: .urlencode, params: [:], headers: ["Authorization": "Bearer ", "X-Device-Imei": imei, "Content-Type": "application/json"])) { (response, auth) in
            
            self.view.StopLoading()
            
            if auth {
                sectionExpiredClass.ClearData(controller: self)
            } else {
            //    self.insprejectedData.removeAll()
                
                switch response.result {
                    
                case .success(let jsonResponse):
                    
                    if jsonResponse.responseType.isSuccess {
                        
                        print("get_InspGraph_getInspGraph:" + "\(jsonResponse.response)")
                        
                        let main = jsonResponse.response.dictionaryValue
                        
                        
                        let InspApproved = main["InspGraphDataApproved"]?.arrayValue
                        
                        var inspapprovedData: [[String: Any]] = []
                        
                        InspApproved?.forEach { obj in
                            let aidata: [String: Any] = [
                                "name": obj["graph_month"].stringValue,
                                "y": obj["total_count"].intValue
                            ]
                            inspapprovedData.append(aidata)
                        }
                        
                        
                        let InspReinspect = main["InspGraphDataReinspect"]?.arrayValue
                        
                        var insreinspectData: [[String: Any]] = []
                        
                        InspReinspect?.forEach { obj in
                            let reidata: [String: Any] = [
                                "name": obj["graph_month"].stringValue,
                                "y": obj["total_count"].intValue
                            ]
                            insreinspectData.append(reidata)
                        }
                        
                        let InspRequested = main["InspGraphDataRequested"]?.arrayValue
                        
                        var insrequestData: [[String: Any]] = []
                        
                        InspRequested?.forEach { obj in
                            let rqstdata: [String: Any] = [
                                "name": obj["graph_month"].stringValue,
                                "y": obj["total_count"].intValue
                            ]
                            insrequestData.append(rqstdata)
                        }
                        
                        let Insptotal = main["InspGraphDataInsp"]?.arrayValue
                        
                        var instotalData: [[String: Any]] = []
                        
                        Insptotal?.forEach { obj in
                            let totaldata: [String: Any] = [
                                "name": obj["graph_month"].stringValue,
                                "y": obj["total_count"].intValue
                            ]
                            instotalData.append(totaldata)
                        }
                        
                       
                        
                        
                        let chartView = HIChartView(frame: self.chartfour.bounds)
                        chartView.plugins = ["series-label"]
                        
                        
                        let options = HIOptions()
                        
                        options.exporting = HIExporting()
                        options.exporting.enabled = false
                        
                        options.title = nil
                        options.subtitle = nil
                        
                        let title = HITitle()
                        title.text = "Total Inspections"
                        options.title = title
                        
                        let yAxis = HIYAxis()
                        yAxis.title = HITitle()
                        yAxis.title.text = "Number Of Inspections"
                        options.yAxis = [yAxis]

                        
                        let xAxis = HIXAxis()
                        xAxis.categories = ["Q1'22", "Q2'22", "Q3'22", "Q4'22", "Q1'23", "Q2'23"]
                        options.xAxis = [xAxis]
                        
                        let legend = HILegend()
                        legend.layout = "vertical"
                        legend.align = "right"
                        legend.verticalAlign = "middle"
                        options.legend = legend
                        
                        let inspapproved = HISeries()
                        inspapproved.name = "Approved"
                        inspapproved.data = inspapprovedData
                        
                        let inspreinspect = HISeries()
                        inspreinspect.name = "Rejected"
                        inspreinspect.data = insreinspectData
                        
                        let insprqst = HISeries()
                        insprqst.name = "Requested"
                        insprqst.data = insrequestData
                        
                        let insptotal = HISeries()
                        insptotal.name = "Total Inspection"
                        insptotal.data = instotalData
                        
                        options.series = [inspapproved, inspreinspect, insprqst, insptotal]
                        
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
                        
                        self.chartfour.addSubview(chartView)
                        
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
    
    
    func allactivatedcarsgraphlistServiceCall() {
        if !InternetReachable.ValidateInternet {
            Message.NoInternetAlert(self)
            return
        }
        
        let imei = UIDevice.current.clientID
        
        self.view.StartLoading()
        
        Webservice().call(cRequest: CRequest.getRequest(url: CUrls.BaseUrl, suffix: CUrls.newmobiledashboardmodule.get_WarantyActivated_getWarrantyActivatedData, method: .get, contentType: .urlencode, params: [:], headers: ["Authorization": "Bearer ", "X-Device-Imei": imei, "Content-Type": "application/json"])) { (response, auth) in
            
            self.view.StopLoading()
            
            if auth {
                sectionExpiredClass.ClearData(controller: self)
            } else {
           
                switch response.result {
                    
                case .success(let jsonResponse):
                    
                    if jsonResponse.responseType.isSuccess {
                        
                        print("get_WarantyActivated_getWarrantyActivatedData:" + "\(jsonResponse.response)")
                        
                        let main = jsonResponse.response.dictionaryValue
                        
                        let Sedan = main["WarrantyActivatedDataSedan"]?.arrayValue
                        
                        var sedanData: [[String: Any]] = []
                        
                        Sedan?.forEach { obj in
                            let sedandata: [String: Any] = [
                                "name": obj["graph_month"].stringValue,
                                "y": obj["total_count"].intValue
                            ]
                            sedanData.append(sedandata)
                        }
                        
                        let HatchBack = main["WarrantyActivatedDataHb"]?.arrayValue
                        
                        var HatchBackData: [[String: Any]] = []
                        
                        HatchBack?.forEach { obj in
                            let hbdata: [String: Any] = [
                                "name": obj["graph_month"].stringValue,
                                "y": obj["total_count"].intValue
                            ]
                            HatchBackData.append(hbdata)
                        }
                        
                        let SUV = main["WarrantyActivatedDataSuv"]?.arrayValue
                        
                        var SuvData: [[String: Any]] = []
                        
                        SUV?.forEach { obj in
                            let svdata: [String: Any] = [
                                "name": obj["graph_month"].stringValue,
                                "y": obj["total_count"].intValue
                            ]
                            SuvData.append(svdata)
                        }
                        
                        let TotalCars = main["WarrantyActivatedData"]?.arrayValue
                        
                        var allcarsData: [[String: Any]] = []
                        
                        TotalCars?.forEach { obj in
                            let AllCarsdata: [String: Any] = [
                                "name": obj["graph_month"].stringValue,
                                "y": obj["total_count"].intValue
                            ]
                            allcarsData.append(AllCarsdata)
                        }
                        
                        let chartView = HIChartView(frame: self.chartthree.bounds)
                        chartView.plugins = ["series-label"]
                        
                        let options = HIOptions()
                        
                        options.exporting = HIExporting()
                        options.exporting.enabled = false
                        
                        options.title = nil
                        options.subtitle = nil
                        
                        let title = HITitle()
                        title.text = "Total Cars Activated"
                        options.title = title
                        
                        let yAxis = HIYAxis()
                        yAxis.title = HITitle()
                        yAxis.title.text = "Number Of Cars"
                        options.yAxis = [yAxis]
                        
                        let xAxis = HIXAxis()
                        xAxis.categories = ["Q1'22", "Q2'22", "Q3'22", "Q4'22", "Q1'23", "Q2'23"]
                        options.xAxis = [xAxis]
                        
                        let legend = HILegend()
                        legend.layout = "vertical"
                        legend.align = "right"
                        legend.verticalAlign = "middle"
                        options.legend = legend
                        
                        let seadan = HISeries()
                        seadan.name = "Sedan"
                        seadan.data = sedanData
                        
                        let hatchb = HISeries()
                        hatchb.name = "HatchBack"
                        hatchb.data = HatchBackData
                        
                        let suv = HISeries()
                        suv.name = "SUV"
                        suv.data = SuvData
                        
                        let totalcars = HISeries()
                        totalcars.name = "All Cars"
                        totalcars.data = allcarsData
                        
                        options.series = [seadan, hatchb, suv, totalcars]
                        
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
                        
                        self.chartthree.addSubview(chartView)
                        
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
    
    @IBAction func carsactivatedlinegraphActionBtn(_ sender: Any) {
        self.allactivatedcarsgraphlistServiceCall()
        self.inspgraphlistServiceCall()
    }
    
    @IBAction func carsactivatedbargraphActionBtn(_ sender: Any) {
        newallactivatedcarsbargraphlistServiceCall()
        
        newinspbargraphlistServiceCall()
        
        
    }
    
    func newallactivatedcarsbargraphlistServiceCall() {
        if !InternetReachable.ValidateInternet {
            Message.NoInternetAlert(self)
            return
        }
        
        let imei = UIDevice.current.clientID
        
        self.view.StartLoading()
        
        Webservice().call(cRequest: CRequest.getRequest(url: CUrls.BaseUrl, suffix: CUrls.newmobiledashboardmodule.get_WarantyActivated_getWarrantyActivatedData, method: .get, contentType: .urlencode, params: [:], headers: ["Authorization": "Bearer ", "X-Device-Imei": imei, "Content-Type": "application/json"])) { (response, auth) in
            
            self.view.StopLoading()
            
            if auth {
                sectionExpiredClass.ClearData(controller: self)
            } else {
            //    self.insprejectedData.removeAll()
                
                switch response.result {
                    
                case .success(let jsonResponse):
                    
                    if jsonResponse.responseType.isSuccess {
                        
                        print("get_WarantyActivated_getWarrantyActivatedData:" + "\(jsonResponse.response)")
                        
                        let main = jsonResponse.response.dictionaryValue
                        
                        let Sedan = main["WarrantyActivatedDataSedan"]?.arrayValue
                        
                        var sedanData: [[String: Any]] = []
                        
                        Sedan?.forEach { obj in
                            let sedandata: [String: Any] = [
                                "name": obj["graph_month"].stringValue,
                                "y": obj["total_count"].intValue
                            ]
                            sedanData.append(sedandata)
                        }
                        
                        let HatchBack = main["WarrantyActivatedDataHb"]?.arrayValue
                        
                        var HatchBackData: [[String: Any]] = []
                        
                        HatchBack?.forEach { obj in
                            let hbdata: [String: Any] = [
                                "name": obj["graph_month"].stringValue,
                                "y": obj["total_count"].intValue
                            ]
                            HatchBackData.append(hbdata)
                        }
                        
                        let SUV = main["WarrantyActivatedDataSuv"]?.arrayValue
                        
                        var SuvData: [[String: Any]] = []
                        
                        SUV?.forEach { obj in
                            let svdata: [String: Any] = [
                                "name": obj["graph_month"].stringValue,
                                "y": obj["total_count"].intValue
                            ]
                            SuvData.append(svdata)
                        }
                        
                        let TotalCars = main["WarrantyActivatedData"]?.arrayValue
                        
                        var allcarsData: [[String: Any]] = []
                        
                        TotalCars?.forEach { obj in
                            let AllCarsdata: [String: Any] = [
                                "name": obj["graph_month"].stringValue,
                                "y": obj["total_count"].intValue
                            ]
                            allcarsData.append(AllCarsdata)
                        }
                        
                        let chartView = HIChartView(frame: self.chartthree.bounds)
                          
                          let options = HIOptions()

                        options.exporting = HIExporting()
                        options.exporting.enabled = false
                            
                          let chart = HIChart()
                          chart.type = "bar"
                          options.chart = chart

                          let title = HITitle()
                          title.text = "Total Cars Activated"
                          options.title = title

                          let xAxis = HIXAxis()
                          xAxis.categories = ["Q1'22", "Q2'22", "Q3'22", "Q4'22", "Q1'23", "Q2'23"]
                          options.xAxis = [xAxis]

                          let yAxis = HIYAxis()
                          yAxis.min = 0
                          yAxis.title = HITitle()
                          yAxis.title.text = "Number Of Cars"
                          options.yAxis = [yAxis]

                          let legend = HILegend()
                          legend.reversed = true
                          options.legend = legend

                          let plotOptions = HIPlotOptions()
                          plotOptions.series = HISeries()
                          plotOptions.series.stacking = "normal"
                          options.plotOptions = plotOptions

                          let credits = HICredits()
                          credits.enabled = false
                          options.credits = credits

//                        let legend = HILegend()
//                        legend.layout = "vertical"
//                        legend.align = "right"
//                        legend.verticalAlign = "middle"
//                        options.legend = legend
                        
                        let seadan = HISeries()
                        seadan.name = "Sedan"
                        seadan.data = sedanData
                        
                        let hatchb = HISeries()
                        hatchb.name = "HatchBack"
                        hatchb.data = HatchBackData
                        
                        let suv = HISeries()
                        suv.name = "SUV"
                        suv.data = SuvData
                        
                        let totalcars = HISeries()
                        totalcars.name = "All Cars"
                        totalcars.data = allcarsData
                        
                        options.series = [seadan, hatchb, suv, totalcars]
                        
                        options.credits = HICredits()
                        options.credits.enabled = false

                          chartView.options = options

                          self.chartthree.addSubview(chartView)
                        
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
    
    
    func newinspbargraphlistServiceCall() {
        if !InternetReachable.ValidateInternet {
            Message.NoInternetAlert(self)
            return
        }
        
        let imei = UIDevice.current.clientID
        
        self.view.StartLoading()
        
        Webservice().call(cRequest: CRequest.getRequest(url: CUrls.BaseUrl, suffix: CUrls.newmobiledashboardmodule.get_InspGraph_getInspGraph, method: .get, contentType: .urlencode, params: [:], headers: ["Authorization": "Bearer ", "X-Device-Imei": imei, "Content-Type": "application/json"])) { (response, auth) in
            
            self.view.StopLoading()
            
            if auth {
                sectionExpiredClass.ClearData(controller: self)
            } else {
            //    self.insprejectedData.removeAll()
                
                switch response.result {
                    
                case .success(let jsonResponse):
                    
                    if jsonResponse.responseType.isSuccess {
                        
                            print("get_InspGraph_getInspGraph:" + "\(jsonResponse.response)")
                        
                            let main = jsonResponse.response.dictionaryValue

                            let InspApproved = main["InspGraphDataApproved"]?.arrayValue
                            
                            var inspapprovedData: [[String: Any]] = []
                            
                            InspApproved?.forEach { obj in
                                let aidata: [String: Any] = [
                                    "name": obj["graph_month"].stringValue,
                                    "y": obj["total_count"].intValue
                                ]
                                inspapprovedData.append(aidata)
                            }
                        
                            let InspReinspect = main["InspGraphDataReinspect"]?.arrayValue
                            
                            var insreinspectData: [[String: Any]] = []
                            
                            InspReinspect?.forEach { obj in
                                let reidata: [String: Any] = [
                                    "name": obj["graph_month"].stringValue,
                                    "y": obj["total_count"].intValue
                                ]
                                insreinspectData.append(reidata)
                            }
                            
                            let InspRequested = main["InspGraphDataRequested"]?.arrayValue
                            
                            var insrequestData: [[String: Any]] = []
                            
                            InspRequested?.forEach { obj in
                                let rqstdata: [String: Any] = [
                                    "name": obj["graph_month"].stringValue,
                                    "y": obj["total_count"].intValue
                                ]
                                insrequestData.append(rqstdata)
                            }
                        
                            let Insptotal = main["InspGraphDataInsp"]?.arrayValue
                            
                            var instotalData: [[String: Any]] = []
                            
                            Insptotal?.forEach { obj in
                                let totaldata: [String: Any] = [
                                    "name": obj["graph_month"].stringValue,
                                    "y": obj["total_count"].intValue
                                ]
                                instotalData.append(totaldata)
                            }

                            let chartView = HIChartView(frame: self.chartfour.bounds)
                           
                            let options = HIOptions()
                        
                            options.exporting = HIExporting()
                            options.exporting.enabled = false

                           let chart = HIChart()
                           chart.type = "bar"
                           options.chart = chart

                           let title = HITitle()
                           title.text = "Total Inspections"
                           options.title = title

                           let xAxis = HIXAxis()
                           xAxis.categories = ["Q1'22", "Q2'22", "Q3'22", "Q4'22", "Q1'23", "Q2'23"]
                           options.xAxis = [xAxis]

                           let yAxis = HIYAxis()
                           yAxis.min = 0
                           yAxis.title = HITitle()
                           yAxis.title.text = "Number Of Inspections"
                           options.yAxis = [yAxis]

                           let legend = HILegend()
                           legend.reversed = true
                           options.legend = legend

                           let plotOptions = HIPlotOptions()
                           plotOptions.series = HISeries()
                           plotOptions.series.stacking = "normal"
                           options.plotOptions = plotOptions

                            let credits = HICredits()
                            credits.enabled = false
                            options.credits = credits

                            let inspapproved = HISeries()
                            inspapproved.name = "Approved"
                            inspapproved.data = inspapprovedData
                                
                            let inspreinspect = HISeries()
                            inspreinspect.name = "Rejected"
                            inspreinspect.data = insreinspectData
                                
                            let insprqst = HISeries()
                            insprqst.name = "Requested"
                            insprqst.data = insrequestData
                                
                            let insptotal = HISeries()
                            insptotal.name = "Total Inspection"
                            insptotal.data = instotalData
                                 
                            options.series = [inspapproved, inspreinspect, insprqst, insptotal]
                                
                            options.credits = HICredits()
                            options.credits.enabled = false

                           chartView.options = options

                           self.chartfour.addSubview(chartView)
                        
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

    
    func newdrilldownallactivatedcarsgraphlistServiceCall() {
        if !InternetReachable.ValidateInternet {
            Message.NoInternetAlert(self)
            return
        }

        let imei = UIDevice.current.clientID

        self.view.StartLoading()

        Webservice().call(cRequest: CRequest.getRequest(url: CUrls.BaseUrl, suffix: CUrls.newmobiledashboardmodule.get_WarantyActivated_getWarrantyActivatedData, method: .get, contentType: .urlencode, params: [:], headers: ["Authorization": "Bearer ", "X-Device-Imei": imei, "Content-Type": "application/json"])) { (response, auth) in

            self.view.StopLoading()

            if auth {
                sectionExpiredClass.ClearData(controller: self)
            } else {

                switch response.result {

                case .success(let jsonResponse):

                    if jsonResponse.responseType.isSuccess {

                        print("get_WarantyActivated_getWarrantyActivatedData:" + "\(jsonResponse.response)")

                        let main = jsonResponse.response.dictionaryValue

                        let WarrantyActivatedData = main["WarrantyActivatedData"]?.arrayValue

                        WarrantyActivatedData!.forEach({ (obj) in
                            self.totalactivateddatalistarr.append(WarrantyActivatedDataModelClass.init(data: obj))
                        })
                        
//                        let chartView = HIChartView(frame: self.chartfiveView.bounds)
//                        let options = HIOptions()
//
//                        let chart = HIChart()
//                        chart.type = "column"
//                        options.chart = chart
//
//                        let fivetitle = HITitle()
//                        fivetitle.text = "All Activated Cars"
//                        options.title = fivetitle
//
//                        let fivexAxis = HIXAxis()
//                        fivexAxis.type = "category"
//                        options.xAxis = [fivexAxis]
//
//                        // 2. Update series data with dynamic data for the first level
//                        let firstLevelSeries = HISeries()
//                        firstLevelSeries.data = self.totalactivateddatalistarr.map { ["name": $0.graph_month ?? "", "y": $0.total_count ?? 0, "drilldown": $0.graph_month ?? ""] as [String : Any] }
//                        options.series = [firstLevelSeries]
//
//                        // 3. Set up the drilldown
//                        let drilldown = HIDrilldown()
//
//                        // 4. Update drilldown series with dynamic data for the second level
//                        for firstLevelItem in self.totalactivateddatalistarr {
//                            let secondLevelSeries = HISeries()
//                            secondLevelSeries.name = firstLevelItem.graph_month
//                            secondLevelSeries.id = firstLevelItem.graph_month
//
//                            // Get the corresponding second level data for the selected first level item
//                            let correspondingSecondLevelData = self.allbrandlistarr.filter { $0.Quarter == firstLevelItem.graph_month }
//                            secondLevelSeries.data = correspondingSecondLevelData.map { ["name": $0.car_brand ?? "", "y": $0.total_count ?? 0, "drilldown": $0.car_brand ?? ""] as [String : Any] }
//
//                            drilldown.series.append(secondLevelSeries)
//                        }
//
//                        // 5. Set up the third level drilldown series
//                        for brandWiseItem in self.allbrandlistarr {
//                            let thirdLevelSeries = HISeries()
//                            thirdLevelSeries.id = brandWiseItem.car_brand
//
//                            // Get the corresponding third level data for the selected second level item
//                            let correspondingThirdLevelData = self.allmodellistarr.filter { $0.car_brand == brandWiseItem.car_brand }
//                            thirdLevelSeries.data = correspondingThirdLevelData.map { ["name": $0.car_model ?? "", "y": Double($0.total_count)] as [String : Any] }
//
//                            drilldown.series.append(thirdLevelSeries)
//                        }
//
//                        options.drilldown = drilldown
//
//                        // 6. Create and set up the chart view
//                    //    let chartView = HIChartView(frame: self.chartfiveView.bounds)
//                        chartView.options = options
//
//                        // 7. Add the chart view to your view hierarchy
//                        self.chartfiveView.addSubview(chartView)

                        
                        
//                        var seriesData: [[String: Any]] = []
//                                var drilldownData: [[String: Any]] = []
//
//
//
//                                for (index, data) in self.totalactivateddatalistarr.enumerated() {
//                                    let quarter = "Q\(index + 1)"
//                                    let total_count = data.total_count ?? 0
//                                    let seriesItem: [String: Any] = ["name": quarter, "y": total_count, "drilldown": quarter]
//                                    seriesData.append(seriesItem)
//
//                                    let drilldownItem: [String: Any] = ["id": quarter, "data": [
//                                        ["name": "Maruti", "y": 22, "drilldown": "Maruti"],
//                                        ["name": "Honda", "y": 24, "drilldown": "Honda"]
//                                        // Add other drilldown data as needed
//                                    ]]
//                                    drilldownData.append(drilldownItem)
//
//                                }
//
//                        let chartView = HIChartView(frame: self.chartfiveView.bounds)
//
//                                let options = HIOptions()
//
//                                let chart = HIChart()
//                                chart.type = "column"
//                                options.chart = chart
//
//                                let fivetitle = HITitle()
//                                fivetitle.text = "All Activated Cars"
//                                options.title = fivetitle
//
//                                let fivexAxis = HIXAxis()
//                                fivexAxis.type = "category"
//                                options.xAxis = [fivexAxis]
//
//                                let series = HISeries()
//                                series.data = seriesData
//                                options.series = [series]
//
//                                let drilldown = HIDrilldown()
//                                drilldown.series = drilldownData
//                                options.drilldown = drilldown
//
//                                chartView.options = options
//                                self.chartfiveView.addSubview(chartView)
//
                        let chartView = HIChartView(frame: self.chartfiveView.bounds)

                                let options = HIOptions()

                        options.exporting = HIExporting()
                        options.exporting.enabled = false

                                let chart = HIChart()
                                chart.type = "column"
                                options.chart = chart

                        let fivetitle = HITitle()
                        fivetitle.text = "All Activated Cars"
                        options.title = fivetitle

                                let fivexAxis = HIXAxis()
                                fivexAxis.type = "category"
                                options.xAxis = [fivexAxis]

                                let series = HISeries()
                                series.data = [
                                    ["name": "Q1'22", "y": 250, "drilldown": "Q1"],
                                    ["name": "Q2'22", "y": 464, "drilldown": "Q2"],
                                    ["name": "Q3'22", "y": 543, "drilldown": "Q3"],
                                    ["name": "Q4'22", "y": 622, "drilldown": "Q4"],
                                    ["name": "Q1'23", "y": 789, "drilldown": "Q5"],
                                    ["name": "Q2'23", "y": 883, "drilldown": "Q6"]
                                ] as [Any]
                                series.name = "Quarter"

                                options.series = [series]

                                let drilldown = HIDrilldown()

                                let ieDrilldown = HISeries()
                                ieDrilldown.name = "Brand"
                                ieDrilldown.id = "Q1"
                                ieDrilldown.data = [
                                    ["name": "CHEVROLET", "y": 14, "drilldown": "CHEVROLET"],
                                    ["name": "FIAT", "y": 3, "drilldown": "FIAT"],
                                    ["name": "FORD", "y": 19, "drilldown": "FORD"],
                                    ["name": "HONDA", "y": 31, "drilldown": "HONDA"],
                                    ["name": "HYUNDAI", "y": 62, "drilldown": "HYUNDAI"],
                                    ["name": "JEEP", "y": 1, "drilldown": "JEEP"],
                                    ["name": "MAHINDRA", "y": 9, "drilldown": "MAHINDRA"],
                                    ["name": "MARUTI", "y": 50, "drilldown": "MARUTI"],
                                    ["name": "NISSAN", "y": 2, "drilldown": "NISSAN"],
                                    ["name": "RENAULT", "y": 7, "drilldown": "RENAULT"],
                                    ["name": "SKODA", "y": 16, "drilldown": "SKODA"],
                                    ["name": "TATA", "y": 3, "drilldown": "TATA"],
                                    ["name": "TOYOTA", "y": 2, "drilldown": "TOYOTA"],
                                    ["name": "VOLKSWAGEN", "y": 31, "drilldown": "VOLKSWAGEN"],
                                ] as [Any]

                                let chromeDrilldown = HISeries()
                                chromeDrilldown.name = "Brand"
                                chromeDrilldown.id = "Q2"
                                chromeDrilldown.data = [
                                    ["name": "CHEVROLET", "y": 14, "drilldown": "Q2CHEVROLET"],
                                    ["name": "FIAT", "y": 6, "drilldown": "Q2FIAT"],
                                    ["name": "FORD", "y": 33, "drilldown": "Q2FORD"],
                                    ["name": "HONDA", "y": 33, "drilldown": "Q2HONDA"],
                                    ["name": "HYUNDAI", "y": 97, "drilldown": "Q2HYUNDAI"],
                                    ["name": "MAHINDRA", "y": 35, "drilldown": "Q2MAHINDRA"],
                                    ["name": "MARUTI", "y": 111, "drilldown": "Q2MARUTI"],
                                    ["name": "NISSAN", "y": 2, "drilldown": "Q2NISSAN"],
                                    ["name": "RENAULT", "y": 21, "drilldown": "Q2RENAULT"],
                                    ["name": "SKODA", "y": 32, "drilldown": "Q2SKODA"],
                                    ["name": "TATA", "y": 17, "drilldown": "Q2TATA"],
                                    ["name": "TOYOTA", "y": 24, "drilldown": "Q2TOYOTA"],
                                    ["name": "VOLKSWAGEN", "y": 34, "drilldown": "Q2VOLKSWAGEN"],
                                    ["name": "KIA", "y": 3, "drilldown": "Q2KIA"],
                                ] as [Any]

                                let threeDrilldown = HISeries()
                                threeDrilldown.name = "Brand"
                                threeDrilldown.id = "Q3"
                                threeDrilldown.data = [
                                    ["name": "CHEVROLET", "y": 10, "drilldown": "Q3CHEVROLET"],
                                    ["name": "DATSUN", "y": 2, "drilldown": "Q3DATSUN"],
                                    ["name": "FIAT", "y": 7, "drilldown": "Q3FIAT"],
                                    ["name": "FORD", "y": 46, "drilldown": "Q3FORD"],
                                    ["name": "HONDA", "y": 43, "drilldown": "Q3HONDA"],
                                    ["name": "HYUNDAI", "y": 126, "drilldown": "Q3HYUNDAI"],
                                    ["name": "MAHINDRA", "y": 39, "drilldown": "Q3MAHINDRA"],
                                    ["name": "MARUTI", "y": 117, "drilldown": "Q3MARUTI"],
                                    ["name": "NISSAN", "y": 7, "drilldown": "Q3NISSAN"],
                                    ["name": "RENAULT", "y": 22, "drilldown": "Q3RENAULT"],
                                    ["name": "SKODA", "y": 21, "drilldown": "Q3SKODA"],
                                    ["name": "TATA", "y": 29, "drilldown": "Q3TATA"],
                                    ["name": "TOYOTA", "y": 30, "drilldown": "Q3TOYOTA"],
                                    ["name": "VOLKSWAGEN", "y": 37, "drilldown": "Q3VOLKSWAGEN"],
                                    ["name": "KIA", "y": 4, "drilldown": "Q3KIA"],
                                    ["name": "REXTON", "y": 1, "drilldown": "Q3REXTON"],
                                ] as [Any]

                                let fourDrilldown = HISeries()
                                fourDrilldown.name = "Brand"
                                fourDrilldown.id = "Q4"
                                fourDrilldown.data = [
                                    ["name": "CHEVROLET", "y": 5, "drilldown": "Q4CHEVROLET"],
                                    ["name": "FIAT", "y": 6, "drilldown": "Q4FIAT"],
                                    ["name": "FORD", "y": 50, "drilldown": "Q4FORD"],
                                    ["name": "HONDA", "y": 55, "drilldown": "Q4HONDA"],
                                    ["name": "HYUNDAI", "y": 128, "drilldown": "Q4HYUNDAI"],
                                    ["name": "ISUZU", "y": 3, "drilldown": "Q4ISUZU"],
                                    ["name": "MAHINDRA", "y": 39, "drilldown": "Q4MAHINDRA"],
                                    ["name": "MARUTI", "y": 108, "drilldown": "Q4MARUTI"],
                                    ["name": "MITSUBISHI", "y": 1, "drilldown": "Q4MITSUBISHI"],
                                    ["name": "NISSAN", "y": 10, "drilldown": "Q4NISSAN"],
                                    ["name": "RENAULT", "y": 43, "drilldown": "Q4RENAULT"],
                                    ["name": "SKODA", "y": 39, "drilldown": "Q4SKODA"],
                                    ["name": "TATA", "y": 29, "drilldown": "Q4TATA"],
                                    ["name": "TOYOTA", "y": 30, "drilldown": "Q4TOYOTA"],
                                    ["name": "VOLKSWAGEN", "y": 60, "drilldown": "Q4VOLKSWAGEN"],
                                    ["name": "KIA", "y":11, "drilldown": "Q4KIA"],
                                    ["name": "MG", "y":5, "drilldown": "Q4MG"],
                                ] as [Any]

                                let fiveDrilldown = HISeries()
                                fiveDrilldown.name = "Brand"
                                fiveDrilldown.id = "Q5"
                                fiveDrilldown.data = [
                                    ["name": "CHEVROLET", "y": 17, "drilldown": "Q5CHEVROLET"],
                                    ["name": "DATSUN", "y": 2, "drilldown": "Q5DATSUN"],
                                    ["name": "FIAT", "y": 17, "drilldown": "Q5FIAT"],
                                    ["name": "FORD", "y": 67, "drilldown": "Q5FORD"],
                                    ["name": "HONDA", "y": 79, "drilldown": "Q5HONDA"],
                                    ["name": "HYUNDAI", "y": 201, "drilldown": "Q5HYUNDAI"],
                                    ["name": "MAHINDRA", "y": 60, "drilldown": "Q5MAHINDRA"],
                                    ["name": "MARUTI", "y": 134, "drilldown": "Q5MARUTI"],
                                    ["name": "NISSAN", "y": 15, "drilldown": "Q5NISSAN"],
                                    ["name": "RENAULT", "y": 30, "drilldown": "Q5RENAULT"],
                                    ["name": "SKODA", "y": 42, "drilldown": "Q5SKODA"],
                                    ["name": "TATA", "y": 17, "drilldown": "Q5TATA"],
                                    ["name": "TOYOTA", "y": 22, "drilldown": "Q5TOYOTA"],
                                    ["name": "VOLKSWAGEN", "y": 77, "drilldown": "Q5VOLKSWAGEN"],
                                    ["name": "KIA", "y": 7, "drilldown": "Q5KIA"],
                                ] as [Any]

                                let sixDrilldown = HISeries()
                                sixDrilldown.name = "Brand"
                                sixDrilldown.id = "Q6"
                                sixDrilldown.data = [
                                    ["name": "CHEVROLET", "y": 21, "drilldown": "Q6CHEVROLET"],
                                    ["name": "DATSUN", "y": 6, "drilldown": "Q6DATSUN"],
                                    ["name": "FIAT", "y": 3, "drilldown": "Q6FIAT"],
                                    ["name": "FORD", "y": 108, "drilldown": "Q6FORD"],
                                    ["name": "HONDA", "y": 93, "drilldown": "Q6HONDA"],
                                    ["name": "HYUNDAI", "y": 160, "drilldown": "Q6HYUNDAI"],
                                    ["name": "MAHINDRA", "y": 60, "drilldown": "Q6MAHINDRA"],
                                    ["name": "MARUTI", "y": 181, "drilldown": "Q6MARUTI"],
                                    ["name": "MERCEDES", "y": 3, "drilldown": "Q6MERCEDES"],
                                    ["name": "NISSAN", "y": 12, "drilldown": "Q6NISSAN"],
                                    ["name": "RENAULT", "y": 42, "drilldown": "Q6RENAULT"],
                                    ["name": "SKODA", "y": 42, "drilldown": "Q6SKODA"],
                                    ["name": "TATA", "y": 42, "drilldown": "Q6TATA"],
                                    ["name": "TOYOTA", "y": 21, "drilldown": "Q6TOYOTA"],
                                    ["name": "VOLKSWAGEN", "y": 78, "drilldown": "Q6VOLKSWAGEN"],
                                    ["name": "MG", "y": 9, "drilldown": "Q6MG"],
                                ] as [Any]

                                let m1Drilldown = HISeries()
                                m1Drilldown.id = "CHEVROLET"
                                m1Drilldown.name = "Model"
                                m1Drilldown.data = [
                                    ["Spark", 1],
                                    ["Beat", 5],
                                    ["Cruze", 5],
                                    ["Enjoy", 1],
                                    ["Aveo", 1],
                                    ["Captiva", 1],
                                ] as [Any]

                                let fiatDrilldown = HISeries()
                                fiatDrilldown.id = "FIAT"
                                fiatDrilldown.name = "Model"
                                fiatDrilldown.data = [
                                    ["Punto Evo", 1],
                                    ["Linea", 1],
                                    ["PUNTO", 1],
                                ] as [Any]

                                let fordDrilldown = HISeries()
                                fordDrilldown.id = "FORD"
                                fordDrilldown.name = "Model"
                                fordDrilldown.data = [
                                    ["Endeavour", 1],
                                    ["Ecosport", 2],
                                    ["Figo", 11],
                                    ["Fiesta", 1],
                                    ["Freestyle", 1],
                                    ["Fiesta 1.6", 1],
                                    ["FORD FIGO 1.5 TDCI TITA", 1],
                                ] as [Any]


                                let hondaDrilldown = HISeries()
                                hondaDrilldown.id = "HONDA"
                                hondaDrilldown.name = "Model"
                                hondaDrilldown.data = [
                                    ["Amaze", 3],
                                    ["Brio", 2],
                                    ["City", 15],
                                    ["Civic", 1],
                                    ["Fit/Jazz", 2],
                                    ["WR-V", 2],
                                    ["Mobilio", 2],
                                    ["City ZX", 1],
                                ] as [Any]


                                let hyundaiDrilldown = HISeries()
                                hyundaiDrilldown.id = "HYUNDAI"
                                hyundaiDrilldown.name = "Model"
                                hyundaiDrilldown.data = [
                                    ["Eon", 2],
                                    ["Xcent Facelift", 1],
                                    ["Elite i20", 1],
                                    ["i20 Active VTVT SX", 6],
                                    ["Creta", 2],
                                    ["Verna", 7],
                                    ["i10", 8],
                                    ["1.10 MAGNA", 1],
                                    ["CRETA BS4", 1],
                                    ["GRAND i 10", 2],
                                    ["GRAND I 10 MAGNA", 1],
                                    ["GRAND I 10 MAGNA 1.2", 1],
                                    ["I 10 SPORTZ 1.2 M", 1],
                                    ["I 20 MAGNA", 1],
                                    ["I 20 SPORTZ 1.4 DSL BS IV", 1],
                                    ["i10 ASTA", 2],
                                    ["I20 ASTA VTVT", 1],
                                    ["I20 SPORTZ +", 1],
                                    ["Xcent", 1],
                                    ["Verna 1.6", 1],
                                    ["I20 sportz VTVT", 1],
                                    ["verna fluidic", 1],
                                    ["Verna 1.6 sx", 1],
                                ] as [Any]

                                let jeepDrilldown = HISeries()
                                jeepDrilldown.id = "JEEP"
                                jeepDrilldown.name = "Model"
                                jeepDrilldown.data = [
                                    ["Compass", 1],
                                ] as [Any]

                                let mahindraDrilldown = HISeries()
                                mahindraDrilldown.id = "MAHINDRA"
                                mahindraDrilldown.data = [
                                    ["XUV500", 3],
                                    ["KUV100", 1],
                                    ["Bolero", 1],
                                    ["Xylo", 1],
                                    ["Scorpio", 1],
                                ] as [Any]

                                let marutiDrilldown = HISeries()
                                marutiDrilldown.id = "MARUTI"
                                marutiDrilldown.name = "Model"
                                marutiDrilldown.data = [
                                    ["Omni", 2],
                                    ["WagonR", 3],
                                    ["Swift", 8],
                                    ["Swift DZirE", 6],
                                    ["Eeco", 1],
                                    ["Ertiga", 5],
                                    ["Alto 800", 1],
                                    ["Celerio", 5],
                                    ["Ciaz", 2],
                                    ["Baleno", 2],
                                    ["Zen Zen Classic", 1],
                                    ["Alto", 2],
                                    ["A-star", 1],
                                    ["SX4", 2],
                                    ["Swift VDI", 1],
                                    ["Swift VXI", 2],
                                    ["celerio VXI AMT", 2],
                                    ["Sx4 VXI", 1],
                                ] as [Any]

                                let nissanDrilldown = HISeries()
                                nissanDrilldown.id = "NISSAN"
                                nissanDrilldown.name = "Model"
                                nissanDrilldown.data = [
                                    ["Micra", 1],
                                    ["Sunny", 1],
                                ] as [Any]

                                let renaultDrilldown = HISeries()
                                renaultDrilldown.id = "RENAULT"
                                renaultDrilldown.name = "Model"
                                renaultDrilldown.data = [
                                    ["Duster", 4],
                                    ["Kwid", 2],
                                    ["Scala", 2],
                                ] as [Any]

                                let skodaDrilldown = HISeries()
                                skodaDrilldown.id = "SKODA"
                                skodaDrilldown.name = "Model"
                                skodaDrilldown.data = [
                                    ["Rapid", 8],
                                    ["Octavia NEW", 1],
                                    ["Fabia", 3],
                                    ["Laura", 3],
                                ] as [Any]

                                let tataDrilldown = HISeries()
                                tataDrilldown.id = "TATA"
                                tataDrilldown.name = "Model"
                                tataDrilldown.data = [
                                    ["Nano", 2],
                                    ["Nexon", 1],
                                ] as [Any]

                                let toyotaDrilldown = HISeries()
                                toyotaDrilldown.id = "TOYOTA"
                                toyotaDrilldown.name = "Model"
                                toyotaDrilldown.data = [
                                    ["Etios", 1],
                                    ["Innova", 1],
                                ] as [Any]

                                let volswagenDrilldown = HISeries()
                                volswagenDrilldown.id = "VOLKSWAGEN"
                                volswagenDrilldown.name = "Model"
                                volswagenDrilldown.data = [
                                    ["Jetta", 1],
                                    ["Polo", 24],
                                    ["Vento", 5],
                                    ["Ameo", 1],
                                ] as [Any]

                                let q2Drilldown = HISeries()
                                q2Drilldown.id = "Q2CHEVROLET"
                                q2Drilldown.name = "Model"
                                q2Drilldown.data = [
                                    ["Spark", 2],
                                    ["Beat", 6],
                                    ["Cruze", 1],
                                    ["Enjoy", 1],
                                    ["Aveo LT", 1],
                                    ["Optra", 1],
                                ] as [Any]

                                let q2fiatDrilldown = HISeries()
                                q2fiatDrilldown.id = "Q2FIAT"
                                q2fiatDrilldown.name = "Model"
                                q2fiatDrilldown.data = [
                                    ["Punto Evo", 3],
                                    ["Palio", 1],
                                    ["PUNTO", 2],
                                ] as [Any]

                                let q2fordDrilldown = HISeries()
                                q2fordDrilldown.id = "Q2FORD"
                                q2fordDrilldown.name = "Model"
                                q2fordDrilldown.data = [
                                        ["Endeavour", 2],
                                        ["Ecosport", 14],
                                        ["Figo", 14],
                                        ["Classic", 1],
                                        ["FIESTA CLASSIC 1.4 CLXI", 1],
                                        ["FIGO 1.4", 1],
                                ] as [Any]

                                let q2hondaDrilldown = HISeries()
                                q2hondaDrilldown.id = "Q2HONDA"
                                q2hondaDrilldown.name = "Model"
                                q2hondaDrilldown.data = [
                                    ["Amaze", 1],
                                    ["Brio", 1],
                                    ["City", 21],
                                    ["CR-V", 1],
                                    ["Fit/Jazz", 2],
                                    ["Jazz RS", 1],
                                    ["WR-V", 1],
                                    ["CITY 1.5 S MT", 3],
                                    ["city ZXVTC", 1],
                                ] as [Any]

                                let q2hyundaiDrilldown = HISeries()
                                q2hyundaiDrilldown.id = "Q2HYUNDAI"
                                q2hyundaiDrilldown.name = "Model"
                                q2hyundaiDrilldown.data = [
                                    ["Eon", 4],
                                    ["i20 Active VTVT SX", 4],
                                    ["Creta", 4],
                                    ["Santro", 5],
                                    ["Santro Xing", 1],
                                    ["Accent CRDi", 1],
                                    ["Getz", 2],
                                    ["Accent GLE", 1],
                                    ["Verna", 18],
                                    ["Getz Prime", 1],
                                    ["i10", 13],
                                    ["Santa Fe Second", 1],
                                    ["i20", 10],
                                    ["Grand i10", 8],
                                    ["Venue", 2],
                                    ["CRETA BS4", 1],
                                    ["EON DLITE (0) BSIV", 1],
                                    ["GRAND i 10", 3],
                                    ["GRAND I 10 MAGNA", 1],
                                    ["I 20 SPORTZ", 1],
                                    ["I 20 SPORTZ 1.2", 1],
                                    ["i10 ASTA", 1],
                                    ["i20 ASTA", 2],
                                    ["i20 MAGNA", 1],
                                    ["I20 SPORTZ +", 2],
                                    ["Xcent", 1],
                                    ["Xcent CRDI BSIV", 1],
                                    ["Verna 1.6 sx", 1],
                                    ["Grand i10 sportz", 1],
                                ] as [Any]

                                let q2mahindraDrilldown = HISeries()
                                q2mahindraDrilldown.id = "Q2MAHINDRA"
                                q2mahindraDrilldown.name = "Model"
                                q2mahindraDrilldown.data = [
                                    ["Supro", 1],
                                    ["XUV500", 15],
                                    ["TUV300", 2],
                                    ["KUV100", 4],
                                    ["Bolero", 1],
                                    ["Scorpio S2", 3],
                                    ["Xylo", 1],
                                    ["Quanto", 1],
                                    ["Scorpio", 2],
                                    ["KUV 100", 1],
                                    ["TUV 300", 1],
                                    ["Scorpio LX", 2],
                                ] as [Any]

                                let q2marutiDrilldown = HISeries()
                                q2marutiDrilldown.id = "Q2MARUTI"
                                q2marutiDrilldown.name = "Model"
                                q2marutiDrilldown.data = [
                                    ["Omni", 1],
                                    ["WagonR", 13],
                                    ["Swift", 22],
                                    ["Swift DZirE", 5],
                                    ["Eeco", 4],
                                    ["SuzukiAltok10", 3],
                                    ["Ertiga", 5],
                                    ["Alto 800", 8],
                                    ["Celerio", 9],
                                    ["Ciaz", 1],
                                    ["Baleno", 4],
                                    ["Vitara Brezz", 2],
                                    ["Baleno RS", 1],
                                    ["Alto", 3],
                                    ["Zen Estilo", 2],
                                    ["A-star", 2],
                                    ["SX4", 4],
                                    ["Ritz", 6],
                                    ["BREZZA", 1],
                                    ["Swift VDI", 4],
                                    ["Swift VXI", 2],
                                    ["celerio VXI AMT", 2],
                                    ["Sx4 VDI", 1],
                                    ["SX4 VXI", 1],
                                    ["Swift Zxi", 2],
                                ] as [Any]

                                let q2nissanDrilldown = HISeries()
                                q2nissanDrilldown.id = "Q2NISSAN"
                                q2nissanDrilldown.name = "Model"
                                q2nissanDrilldown.data = [
                                    ["Terrano", 1],
                                    ["DATSUN", 1],
                                ] as [Any]

                                let q2renaultDrilldown = HISeries()
                                q2renaultDrilldown.id = "Q2RENAULT"
                                q2renaultDrilldown.name = "Model"
                                q2renaultDrilldown.data = [
                                    ["Duster", 6],
                                    ["Kwid", 8],
                                    ["Pulse", 2],
                                    ["Triber", 1],
                                    ["Duster rxl", 2],
                                    ["Kiger", 1],
                                ] as [Any]

                                let q2skodaDrilldown = HISeries()
                                q2skodaDrilldown.id = "Q2SKODA"
                                q2skodaDrilldown.name = "Model"
                                q2skodaDrilldown.data = [
                                    ["Superb", 5],
                                    ["Rapid", 15],
                                    ["Octavia", 1],
                                    ["Fabia", 6],
                                    ["Laura", 4],
                                ] as [Any]

                                let q2tataDrilldown = HISeries()
                                q2tataDrilldown.id = "Q2TATA"
                                q2tataDrilldown.name = "Model"
                                q2tataDrilldown.data = [
                                    ["Nano", 3],
                                    ["Nexon", 1],
                                    ["Tiago", 2],
                                    ["Tigor", 1],
                                    ["Hexa", 2],
                                    ["Indigo", 1],
                                    ["Indica", 1],
                                    ["Altroz", 1],
                                    ["HARRIER XM", 1],
                                    ["Indica Vista", 1],
                                ] as [Any]

                                let q2toyotaDrilldown = HISeries()
                                q2toyotaDrilldown.id = "Q2TOYOTA"
                                q2toyotaDrilldown.name = "Model"
                                q2toyotaDrilldown.data = [
                                    ["Corolla Altis", 2],
                                    ["Etios", 2],
                                    ["Fortuner", 5],
                                    ["Innova Crysta", 5],
                                    ["Innova", 9],
                                ] as [Any]

                                let q2volswagenDrilldown = HISeries()
                                q2volswagenDrilldown.id = "Q2VOLKSWAGEN"
                                q2volswagenDrilldown.name = "Model"
                                q2volswagenDrilldown.data = [
                                    ["Jetta", 1],
                                    ["Polo", 18],
                                    ["Vento", 15],
                                ] as [Any]

                                let q2kiaDrilldown = HISeries()
                                q2kiaDrilldown.id = "Q2KIA"
                                q2kiaDrilldown.name = "Model"
                                q2kiaDrilldown.data = [
                                    ["Seltos", 2],
                                    ["SONET", 1],
                                ] as [Any]

                                let q3Drilldown = HISeries()
                                q3Drilldown.id = "Q3CHEVROLET"
                                q3Drilldown.name = "Model"
                                q3Drilldown.data = [
                                    ["Beat", 7],
                                    ["Cruze", 1],
                                    ["Optra", 2],
                                    ["Captiva", 1],
                                ] as [Any]

                                let q3datsunDrilldown = HISeries()
                                q3datsunDrilldown.id = "Q3DATSUN"
                                q3datsunDrilldown.name = "Model"
                                q3datsunDrilldown.data = [
                                    ["Redi-GO", 1],
                                    ["GO", 1],
                                ] as [Any]

                                let q3fiatDrilldown = HISeries()
                                q3fiatDrilldown.id = "Q3FIAT"
                                q3fiatDrilldown.name = "Model"
                                q3fiatDrilldown.data = [
                                    ["Punto Evo", 1],
                                    ["Linea", 2],
                                    ["PUNTO", 4],
                                ] as [Any]

                                let q3fordDrilldown = HISeries()
                                q3fordDrilldown.id = "Q3FORD"
                                q3fordDrilldown.name = "Model"
                                q3fordDrilldown.data = [
                                        ["Endeavour", 1],
                                        ["Ecosport", 18],
                                        ["Figo", 17],
                                        ["Ikon", 1],
                                        ["Fusion", 1],
                                        ["Classic", 1],
                                        ["Fiesta", 4],
                                        ["FIESTA CLASSIC 1.4 CLXI", 1],
                                        ["FIGO 1.4 TIT BS4", 1],
                                        ["FIGO 1.4 TITANIUM", 2],
                                ] as [Any]

                                let q3hondaDrilldown = HISeries()
                                q3hondaDrilldown.id = "Q3HONDA"
                                q3hondaDrilldown.name = "Model"
                                q3hondaDrilldown.data = [
                                    ["Amaze", 6],
                                    ["Brio", 3],
                                    ["BR-V", 2],
                                    ["City", 17],
                                    ["Civic", 3],
                                    ["Fit/Jazz", 1],
                                    ["WR-V", 3],
                                    ["Mobilio", 2],
                                    ["Jazz", 2],
                                    ["City ZX", 2],
                                    ["city ZXVTC", 2],
                                ] as [Any]

                                let q3hyundaiDrilldown = HISeries()
                                q3hyundaiDrilldown.id = "Q3HYUNDAI"
                                q3hyundaiDrilldown.name = "Model"
                                q3hyundaiDrilldown.data = [
                                    ["Eon", 9],
                                    ["Grand i10 Facelift", 1],
                                    ["Elite i20", 1],
                                    ["i20 Active VTVT SX", 1],
                                    ["Elantra", 1],
                                    ["Creta", 15],
                                    ["Santro", 4],
                                    ["Santro Xing", 1],
                                    ["Sonata", 2],
                                    ["Getz", 2],
                                    ["Verna", 13],
                                    ["i10", 17],
                                    ["i20", 12],
                                    ["Grand i10", 7],
                                    ["4S Fluidic Verna", 1],
                                    ["Venue", 2],
                                    ["CRETA 1.6", 1],
                                    ["CRETA BS4", 2],
                                    ["GRAND i 10", 4],
                                    ["GRAND I 10 MAGNA 1.2", 1],
                                    ["GRAND I10 ASTA", 1],
                                    ["I 10", 1],
                                    ["I 10 MAGNA", 2],
                                    ["I 10 SPORTZ 1.2 M", 1],
                                    ["I 10 SPORTZ CAR", 2],
                                    ["I 20 MAGNA", 4],
                                    ["I 20 SPORTZ", 2],
                                    ["i20 ASTA", 7],
                                    ["I20 SPORTZ +", 1],
                                    ["Verna VTVT", 1],
                                    ["Xcent", 2],
                                    ["Verna 1.6", 2],
                                    ["Xcent CRDI BSIV", 1],
                                    ["I20 Era", 2],
                                    ["NEW VERNA SX", 1],
                                    ["Verna 1.6 sx", 2],
                                ] as [Any]

                                let q3mahindraDrilldown = HISeries()
                                q3mahindraDrilldown.id = "Q3MAHINDRA"
                                q3mahindraDrilldown.name = "Model"
                                q3mahindraDrilldown.data = [
                                    ["XUV500", 19],
                                    ["TUV300", 2],
                                    ["KUV100", 5],
                                    ["SsangYong Rexton", 1],
                                    ["Bolero", 2],
                                    ["Scorpio S2", 1],
                                    ["Xylo", 2],
                                    ["XUV300", 1],
                                    ["Scorpio", 4],
                                    ["KUV 100", 1],
                                    ["XUV 700", 1],
                                    ["Scorpio LX", 1],
                                ] as [Any]
                                let q3marutiDrilldown = HISeries()
                                q3marutiDrilldown.id = "Q3MARUTI"
                                q3marutiDrilldown.name = "Model"
                                q3marutiDrilldown.data = [
                                    ["Omni", 2],
                                    ["WagonR", 9],
                                    ["Swift", 21],
                                    ["Swift DZirE", 11],
                                    ["Ertiga", 12],
                                    ["SuzukiAltok10", 2],
                                    ["Celerio", 8],
                                    ["Ciaz", 4],
                                    ["Baleno", 9],
                                    ["S-Cross", 2],
                                    ["Vitara Brezz", 6],
                                    ["Ignis", 2],
                                    ["Baleno RS", 2],
                                    ["Alto", 7],
                                    ["Zen Estilo", 2],
                                    ["SX4", 3],
                                    ["Ritz", 2],
                                    ["XL6", 1],
                                    ["A STAR", 1],
                                    ["Alto K10", 1],
                                    ["BREZZA", 6],
                                    ["Swift Dzire VXI", 1],
                                    ["Swift VDI", 2],
                                    ["Swift VXI", 2],
                                    ["Swift Zxi", 1],
                                ] as [Any]

                                let q3nissanDrilldown = HISeries()
                                q3nissanDrilldown.id = "Q3NISSAN"
                                q3nissanDrilldown.name = "Model"
                                q3nissanDrilldown.data = [
                                    ["Terrano", 1],
                                    ["Micra", 2],
                                    ["Sunny", 3],
                                    ["KICKS", 1],
                                ] as [Any]

                                let q3renaultDrilldown = HISeries()
                                q3renaultDrilldown.id = "Q3RENAULT"
                                q3renaultDrilldown.name = "Model"
                                q3renaultDrilldown.data = [
                                    ["Duster", 7],
                                    ["Fluence", 1],
                                    ["Kwid", 12],
                                    ["Logan", 1],
                                    ["Triber", 1],
                                ] as [Any]

                                let q3skodaDrilldown = HISeries()
                                q3skodaDrilldown.id = "Q3SKODA"
                                q3skodaDrilldown.name = "Model"
                                q3skodaDrilldown.data = [
                                    ["Superb", 2],
                                    ["Rapid", 13],
                                    ["Octavia", 1],
                                    ["Fabia", 4],
                                    ["Laura", 2],
                                ] as [Any]

                                let q3tataDrilldown = HISeries()
                                q3tataDrilldown.id = "Q3TATA"
                                q3tataDrilldown.name = "Model"
                                q3tataDrilldown.data = [
                                    ["Safari", 3],
                                    ["Nano", 4],
                                    ["Nexon", 4],
                                    ["Zest", 3],
                                    ["Bolt", 1],
                                    ["Tiago", 4],
                                    ["Tigor", 2],
                                    ["Hexa", 1],
                                    ["Indigo", 1],
                                    ["Manza", 1],
                                    ["Indica", 1],
                                    ["Altroz", 1],
                                    ["Indica Manza", 1],
                                    ["Indigo Manza Qjet", 1],
                                ] as [Any]

                                let q3toyotaDrilldown = HISeries()
                                q3toyotaDrilldown.id = "Q3TOYOTA"
                                q3toyotaDrilldown.name = "Model"
                                q3toyotaDrilldown.data = [
                                    ["Corolla Altis", 3],
                                    ["Etios", 2],
                                    ["Etios Liva", 2],
                                    ["Fortuner", 6],
                                    ["Innova Crysta", 2],
                                    ["Innova", 14],
                                    ["Glanza", 2],
                                    ["Yaris", 1],
                                ] as [Any]

                                let q3volswagenDrilldown = HISeries()
                                q3volswagenDrilldown.id = "Q3VOLKSWAGEN"
                                q3volswagenDrilldown.name = "Model"
                                q3volswagenDrilldown.data = [
                                    ["Jetta", 2],
                                    ["Polo", 22],
                                    ["Polo GTI", 2],
                                    ["Vento", 10],
                                    ["Passat", 1],
                                ] as [Any]

                                let q3kiaDrilldown = HISeries()
                                q3kiaDrilldown.id = "Q3KIA"
                                q3kiaDrilldown.name = "Model"
                                q3kiaDrilldown.data = [
                                    ["Seltos", 2],
                                    ["SONET", 2],
                                ] as [Any]

                                let q3rextonDrilldown = HISeries()
                                q3rextonDrilldown.id = "Q3REXTON"
                                q3rextonDrilldown.name = "Model"
                                q3rextonDrilldown.data = [
                                    ["RX", 1],
                                ] as [Any]

                                let q4Drilldown = HISeries()
                                q4Drilldown.id = "Q4CHEVROLET"
                                q4Drilldown.name = "Model"
                                q4Drilldown.data = [
                                    ["Beat", 3],
                                    ["Optra", 1],
                                    ["Captiva", 1],
                                ] as [Any]


                                let q4fiatDrilldown = HISeries()
                                q4fiatDrilldown.id = "Q4FIAT"
                                q4fiatDrilldown.name = "Model"
                                q4fiatDrilldown.data = [
                                    ["Punto Evo", 1],
                                    ["Uno", 1],
                                    ["Linea", 1],
                                    ["PUNTO", 3],
                                ] as [Any]

                                let q4fordDrilldown = HISeries()
                                q4fordDrilldown.id = "Q4FORD"
                                q4fordDrilldown.name = "Model"
                                q4fordDrilldown.data = [
                                        ["Endeavour", 2],
                                        ["Ecosport", 19],
                                        ["Figo Aspire", 1],
                                        ["Figo", 21],
                                        ["Freestyle", 3],
                                        ["Fiesta 1.6", 2],
                                        ["Classic", 1],
                                ] as [Any]

                                let q4hondaDrilldown = HISeries()
                                q4hondaDrilldown.id = "Q4HONDA"
                                q4hondaDrilldown.name = "Model"
                                q4hondaDrilldown.data = [
                                    ["Amaze", 13],
                                    ["Brio", 3],
                                    ["BR-V", 2],
                                    ["City", 23],
                                    ["Jazz RS", 1],
                                    ["Fit/Jazz", 1],
                                    ["Mobilio", 2],
                                    ["BRIO 1.2 SMT", 1],
                                    ["CITY 1.5 S MT", 1],
                                    ["Jazz", 4],
                                    ["City ZX", 3],
                                ] as [Any]

                                let q4hyundaiDrilldown = HISeries()
                                q4hyundaiDrilldown.id = "Q4HYUNDAI"
                                q4hyundaiDrilldown.name = "Model"
                                q4hyundaiDrilldown.data = [
                                    ["Eon", 12],
                                    ["Xcent Facelift", 1],
                                    ["Elite i20", 6],
                                    ["i20 Active VTVT SX", 5],
                                    ["Elantra", 1],
                                    ["Creta", 7],
                                    ["3rd Gen-Verna", 1],
                                    ["Santro", 2],
                                    ["Getz", 1],
                                    ["Accent GLS", 1],
                                    ["Accent GLE", 1],
                                    ["Verna", 11],
                                    ["i10", 18],
                                    ["Tuscon", 1],
                                    ["i20", 15],
                                    ["Grand i10", 4],
                                    ["Venue", 2],
                                    ["1.10 MAGNA", 2],
                                    ["CRETA 1.6", 2],
                                    ["GRAND i 10", 6],
                                    ["I 10", 2],
                                    ["I 10 SPORTZ CAR", 5],
                                    ["I 20 MAGNA", 1],
                                    ["I 20 SPORTZ 1.2", 1],
                                    ["i20 ASTA", 6],
                                    ["Xcent", 2],
                                    ["Verna 1.6", 1],
                                    ["I20 Era", 1],
                                    ["Verna 1.6 sx", 5],
                                    ["Grand i10 sportz", 1],
                                ] as [Any]

                                let q4isuzuDrilldown = HISeries()
                                q4isuzuDrilldown.id = "Q4ISUZU"
                                q4isuzuDrilldown.name = "Model"
                                q4isuzuDrilldown.data = [
                                        ["MUX", 3],
                                ] as [Any]

                                let q4mahindraDrilldown = HISeries()
                                q4mahindraDrilldown.id = "Q4MAHINDRA"
                                q4mahindraDrilldown.name = "Model"
                                q4mahindraDrilldown.data = [
                                    ["XUV500", 20],
                                    ["TUV300", 3],
                                    ["KUV100", 2],
                                    ["Bolero", 3],
                                    ["Thar", 2],
                                    ["Xylo", 2],
                                    ["Quanto", 1],
                                    ["Scorpio", 3],
                                    ["XUV300", 1],
                                ] as [Any]

                                let q4marutiDrilldown = HISeries()
                                q4marutiDrilldown.id = "Q4MARUTI"
                                q4marutiDrilldown.name = "Model"
                                q4marutiDrilldown.data = [
                                    ["Omni", 1],
                                    ["WagonR", 10],
                                    ["Swift", 22],
                                    ["Swift DZirE", 10],
                                    ["Eeco", 1],
                                    ["SuzukiAltok10", 3],
                                    ["Ertiga", 12],
                                    ["Alto 800", 2],
                                    ["Celerio", 5],
                                    ["Ciaz", 3],
                                    ["Baleno", 10],
                                    ["S-Cross", 2],
                                    ["Vitara Brezza", 3],
                                    ["Alto", 2],
                                    ["Zen Estilo", 2],
                                    ["A-star", 1],
                                    ["SX4", 1],
                                    ["Ritz", 2],
                                    ["Baleno-sedan", 1],
                                    ["XL6", 2],
                                    ["BREZZA", 2],
                                    ["S-PRESSO", 1],
                                    ["WAGON R", 2],
                                    ["Swift VDI", 4],
                                    ["Swift VXI", 3],
                                ] as [Any]

                                let q4mitsubishiDrilldown = HISeries()
                                q4mitsubishiDrilldown.id = "Q4MITSUBISHI"
                                q4mitsubishiDrilldown.name = "Model"
                                q4mitsubishiDrilldown.data = [
                                        ["Pajero", 1],
                                ] as [Any]

                                let q4nissanDrilldown = HISeries()
                                q4nissanDrilldown.id = "Q4NISSAN"
                                q4nissanDrilldown.name = "Model"
                                q4nissanDrilldown.data = [
                                    ["Terrano", 1],
                                    ["Micra Active", 1],
                                    ["Micra", 6],
                                    ["Sunny", 1],
                                    ["GTR", 1],
                                ] as [Any]

                                let q4renaultDrilldown = HISeries()
                                q4renaultDrilldown.id = "Q4RENAULT"
                                q4renaultDrilldown.name = "Model"
                                q4renaultDrilldown.data = [
                                    ["Captur", 1],
                                    ["Duster", 19],
                                    ["Kwid", 15],
                                    ["Pulse", 2],
                                    ["Scala", 1],
                                    ["Lodgy", 1],
                                    ["Triber", 2],
                                    ["Kwid Rxt", 1],
                                ] as [Any]

                                let q4skodaDrilldown = HISeries()
                                q4skodaDrilldown.id = "Q4SKODA"
                                q4skodaDrilldown.name = "Model"
                                q4skodaDrilldown.data = [
                                    ["Superb", 4],
                                    ["Rapid", 17],
                                    ["Octavia NEW", 1],
                                    ["Octavia", 1],
                                    ["Fabia", 12],
                                    ["Laura", 2],
                                    ["Yeti", 1],
                                    ["KODIAQ", 1],
                                ] as [Any]

                                let q4tataDrilldown = HISeries()
                                q4tataDrilldown.id = "Q4TATA"
                                q4tataDrilldown.name = "Model"
                                q4tataDrilldown.data = [
                                    ["Safari", 2],
                                    ["Nano", 1],
                                    ["Nexon", 8],
                                    ["Zest", 3],
                                    ["Bolt", 1],
                                    ["Tiago", 8],
                                    ["Hexa", 1],
                                    ["Harrier", 1],
                                    ["Manza", 1],
                                    ["PUNCH", 1],
                                ] as [Any]

                                let q4toyotaDrilldown = HISeries()
                                q4toyotaDrilldown.id = "Q4TOYOTA"
                                q4toyotaDrilldown.name = "Model"
                                q4toyotaDrilldown.data = [
                                    ["Corolla Altis", 1],
                                    ["Etios", 1],
                                    ["Etios Liva", 2],
                                    ["Fortuner", 4],
                                    ["Innova Crysta", 3],
                                    ["Innova", 16],
                                    ["Urban Cruiser", 1],
                                    ["Yaris", 1],
                                ] as [Any]

                                let q4volswagenDrilldown = HISeries()
                                q4volswagenDrilldown.id = "Q4VOLKSWAGEN"
                                q4volswagenDrilldown.name = "Model"
                                q4volswagenDrilldown.data = [
                                    ["Polo", 43],
                                    ["Polo GTI", 1],
                                    ["Vento", 15],
                                    ["Ameo", 1],
                                ] as [Any]

                                let q4kiaDrilldown = HISeries()
                                q4kiaDrilldown.id = "Q4KIA"
                                q4kiaDrilldown.name = "Model"
                                q4kiaDrilldown.data = [
                                    ["Seltos", 7],
                                    ["SONET", 2],
                                    ["Carnival Premium 7 STR", 1],
                                    ["Carnival Prestige  7 STR", 1],
                                ] as [Any]

                                let q4mgDrilldown = HISeries()
                                q4mgDrilldown.id = "Q4MG"
                                q4mgDrilldown.name = "Model"
                                q4mgDrilldown.data = [
                                    ["Hector", 4],
                                    ["ZS EV", 1],
                                ] as [Any]

                                let q5Drilldown = HISeries()
                                q5Drilldown.id = "Q5CHEVROLET"
                                q5Drilldown.name = "Model"
                                q5Drilldown.data = [
                                    ["Beat", 12],
                                    ["Cruze", 2],
                                    ["Optra", 2],
                                ] as [Any]

                                let q5datsunDrilldown = HISeries()
                                q5datsunDrilldown.id = "Q5DATSUN"
                                q5datsunDrilldown.name = "Model"
                                q5datsunDrilldown.data = [
                                    ["Redi-GO", 2],
                                ] as [Any]

                                let q5fiatDrilldown = HISeries()
                                q5fiatDrilldown.id = "Q5FIAT"
                                q5fiatDrilldown.name = "Model"
                                q5fiatDrilldown.data = [
                                    ["Avventura", 2],
                                    ["Linea", 2],
                                    ["PUNTO", 12],
                                ] as [Any]

                                let q5fordDrilldown = HISeries()
                                q5fordDrilldown.id = "Q5FORD"
                                q5fordDrilldown.name = "Model"
                                q5fordDrilldown.data = [
                                        ["Endeavour", 2],
                                        ["Ecosport", 27],
                                        ["Figo Aspire", 2],
                                        ["Figo", 27],
                                        ["Fiesta", 2],
                                        ["Freestyle", 2],
                                        ["FIGO 1.4 TITANIUM", 2],
                                ] as [Any]

                                let q5hondaDrilldown = HISeries()
                                q5hondaDrilldown.id = "Q5HONDA"
                                q5hondaDrilldown.name = "Model"
                                q5hondaDrilldown.data = [
                                    ["Accord", 2],
                                    ["Amaze", 5],
                                    ["Brio", 5],
                                    ["City", 32],
                                    ["CR-V", 2],
                                    ["Fit/Jazz", 10],
                                    ["Jazz RS", 2],
                                    ["Pilot", 2],
                                    ["WR-V", 2],
                                    ["Mobilio", 2],
                                    ["Jazz", 7],
                                    ["City ZX", 2],
                                    ["city ZXVTC", 2],
                                ] as [Any]

                                let q5hyundaiDrilldown = HISeries()
                                q5hyundaiDrilldown.id = "Q5HYUNDAI"
                                q5hyundaiDrilldown.name = "Model"
                                q5hyundaiDrilldown.data = [
                                    ["Eon", 12],
                                    ["Grand i10 Facelift", 2],
                                    ["Elite i20", 5],
                                    ["i20 Active VTVT SX", 7],
                                    ["Creta", 5],
                                    ["Santro", 5],
                                    ["Verna", 15],
                                    ["i10", 30],
                                    ["i20", 42],
                                    ["Grand i10", 15],
                                    ["Venue", 7],
                                    ["1.10 MAGNA", 2],
                                    ["CRETA 1.6", 5],
                                    ["GRAND i 10", 5],
                                    ["I 10", 2],
                                    ["I 10 ERA", 2],
                                    ["I 10 SPORTZ 1.2 M", 2],
                                    ["I 10 SPORTZ CAR", 2],
                                    ["I 20 SPORTZ", 5],
                                    ["I 20 SPORTZ 1.4 DSL BS IV", 5],
                                    ["i20 ASTA", 2],
                                    ["Verna 1.6", 2],
                                    ["certa", 2],
                                    ["Verna 1.6 sx", 15],
                                ] as [Any]

                                let q5mahindraDrilldown = HISeries()
                                q5mahindraDrilldown.id = "Q5MAHINDRA"
                                q5mahindraDrilldown.name = "Model"
                                q5mahindraDrilldown.data = [
                                    ["XUV500", 33],
                                    ["TUV300", 5],
                                    ["KUV100", 5],
                                    ["Quanto", 3],
                                    ["eKUV100", 3],
                                    ["XUV300", 5],
                                    ["KUV 100", 3],
                                    ["TUV 300", 5],
                                ] as [Any]

                                let q5marutiDrilldown = HISeries()
                                q5marutiDrilldown.id = "Q5MARUTI"
                                q5marutiDrilldown.name = "Model"
                                q5marutiDrilldown.data = [
                                    ["Omni", 2],
                                    ["WagonR", 10],
                                    ["Swift", 22],
                                    ["Swift DZirE", 17],
                                    ["Eeco", 2],
                                    ["SuzukiAltok10", 2],
                                    ["Ertiga", 10],
                                    ["Alto 80", 5],
                                    ["Celerio", 5],
                                    ["Ciaz", 10],
                                    ["Baleno", 12],
                                    ["S-Cross", 2],
                                    ["Vitara Brezza", 2],
                                    ["Alto", 2],
                                    ["Zen Estilo", 5],
                                    ["SX4", 5],
                                    ["Ritz", 7],
                                    ["XL6", 1],
                                    ["WAGON R", 2],
                                    ["Swift VDI", 5],
                                    ["Swift VXI", 2],
                                ] as [Any]

                                let q5nissanDrilldown = HISeries()
                                q5nissanDrilldown.id = "Q5NISSAN"
                                q5nissanDrilldown.name = "Model"
                                q5nissanDrilldown.data = [
                                    ["Terrano", 3],
                                    ["Micra", 3],
                                    ["Sunny", 10],
                                ] as [Any]

                                let q5renaultDrilldown = HISeries()
                                q5renaultDrilldown.id = "Q5RENAULT"
                                q5renaultDrilldown.name = "Model"
                                q5renaultDrilldown.data = [
                                    ["Duster", 18],
                                    ["Pulse", 3],
                                    ["Lodgy", 8],
                                    ["Kwid Rxt", 3],
                                ] as [Any]

                                let q5skodaDrilldown = HISeries()
                                q5skodaDrilldown.id = "Q5SKODA"
                                q5skodaDrilldown.name = "Model"
                                q5skodaDrilldown.data = [
                                    ["Rapid", 22],
                                    ["Octavia", 5],
                                    ["Fabia", 12],
                                    ["Laura", 2],
                                ] as [Any]

                                let q5tataDrilldown = HISeries()
                                q5tataDrilldown.id = "Q5TATA"
                                q5tataDrilldown.name = "Model"
                                q5tataDrilldown.data = [
                                    ["Nexon", 7],
                                    ["Tiago", 5],
                                    ["Hexa", 2],
                                    ["Indica Vista", 2],
                                ] as [Any]

                                let q5toyotaDrilldown = HISeries()
                                q5toyotaDrilldown.id = "Q5TOYOTA"
                                q5toyotaDrilldown.name = "Model"
                                q5toyotaDrilldown.data = [
                                    ["Corolla Altis", 2],
                                    ["Etios", 2],
                                    ["Fortuner", 10],
                                    ["Innova", 7],
                                ] as [Any]

                                let q5volswagenDrilldown = HISeries()
                                q5volswagenDrilldown.id = "Q5VOLKSWAGEN"
                                q5volswagenDrilldown.name = "Model"
                                q5volswagenDrilldown.data = [
                                    ["Jetta", 5],
                                    ["Polo", 42],
                                    ["Polo GTI", 2],
                                    ["Vento", 25],
                                    ["Ameo", 2],
                                ] as [Any]

                                let q5kiaDrilldown = HISeries()
                                q5kiaDrilldown.id = "Q5KIA"
                                q5kiaDrilldown.name = "Model"
                                q5kiaDrilldown.data = [
                                    ["Seltos", 7],
                                ] as [Any]

                                let q6Drilldown = HISeries()
                                q6Drilldown.id = "Q6CHEVROLET"
                                q6Drilldown.name = "Model"
                                q6Drilldown.data = [
                                    ["Spark", 6],
                                    ["Cruze", 15],
                                ] as [Any]

                                let q6datsunDrilldown = HISeries()
                                q6datsunDrilldown.id = "Q6DATSUN"
                                q6datsunDrilldown.name = "Model"
                                q6datsunDrilldown.data = [
                                    ["Redi-GO", 3],
                                    ["GO", 3],
                                ] as [Any]

                                let q6fiatDrilldown = HISeries()
                                q6fiatDrilldown.id = "Q6FIAT"
                                q6fiatDrilldown.name = "Model"
                                q6fiatDrilldown.data = [
                                    ["PUNTO", 3],
                                ] as [Any]

                                let q6fordDrilldown = HISeries()
                                q6fordDrilldown.id = "Q6FORD"
                                q6fordDrilldown.name = "Model"
                                q6fordDrilldown.data = [
                                        ["Endeavour", 3],
                                        ["Ecosport", 39],
                                        ["Figo Aspire", 3],
                                        ["Figo", 21],
                                        ["ASPIRE", 36],
                                        ["FIGO 1.2 TI-VCT", 3],
                                ] as [Any]

                                let q6hondaDrilldown = HISeries()
                                q6hondaDrilldown.id = "Q6HONDA"
                                q6hondaDrilldown.name = "Model"
                                q6hondaDrilldown.data = [
                                    ["Accord", 6],
                                    ["Amaze", 12],
                                    ["Brio", 6],
                                    ["City", 57],
                                    ["Civic", 3],
                                    ["Jazz", 3],
                                ] as [Any]

                                let q6hyundaiDrilldown = HISeries()
                                q6hyundaiDrilldown.id = "Q6HYUNDAI"
                                q6hyundaiDrilldown.name = "Model"
                                q6hyundaiDrilldown.data = [
                                    ["Eon", 6],
                                    ["Grand i10 Facelift", 3],
                                    ["i20 Active VTVT SX", 36],
                                    ["Creta", 6],
                                    ["Santro", 9],
                                    ["Accent CRDi", 3],
                                    ["Accent GLS", 3],
                                    ["Verna", 24],
                                    ["i10", 12],
                                    ["i20", 27],
                                    ["Elantra", 6],
                                    ["GRAND I10 ASTA", 3],
                                    ["I 20 SPORTZ", 3],
                                    ["i20 ASTA", 3],
                                    ["Xcent", 3],
                                    ["I20 sportz VTVT", 3],
                                    ["Verna 1.6 sx", 3],
                                    ["I 20", 3],
                                    ["Creta 1.4", 3],
                                ] as [Any]
                                let q6mahindraDrilldown = HISeries()
                                q6mahindraDrilldown.id = "Q6MAHINDRA"
                                q6mahindraDrilldown.name = "Model"
                                q6mahindraDrilldown.data = [
                                    ["XUV500", 27],
                                    ["Bolero", 6],
                                    ["Xylo", 3],
                                    ["Scorpio", 6],
                                    ["Marazzo", 3],
                                    ["XUV300", 6],
                                    ["KUV 100", 3],
                                    ["TUV 300", 6],
                                ] as [Any]

                                let q6marutiDrilldown = HISeries()
                                q6marutiDrilldown.id = "Q6MARUTI"
                                q6marutiDrilldown.name = "Model"
                                q6marutiDrilldown.data = [
                                    ["Omni", 3],
                                    ["Gypsy", 9],
                                    ["WagonR", 21],
                                    ["Swift", 39],
                                    ["Swift DZirE", 15],
                                    ["Ertiga", 12],
                                    ["Alto 800", 6],
                                    ["Celerio", 9],
                                    ["Ciaz", 12],
                                    ["Baleno", 18],
                                    ["S-Cross", 3],
                                    ["Ignis", 3],
                                    ["Alto", 12],
                                    ["A-star", 3],
                                    ["Ritz", 6],
                                    ["Alto K10", 3],
                                    ["BREZZA", 6],
                                ] as [Any]


                                let q6mercedesDrilldown = HISeries()
                                q6mercedesDrilldown.id = "Q6MERCEDES"
                                q6mercedesDrilldown.name = "Model"
                                q6mercedesDrilldown.data = [
                                    ["BENZ", 3],
                                ] as [Any]

                                let q6nissanDrilldown = HISeries()
                                q6nissanDrilldown.id = "Q6NISSAN"
                                q6nissanDrilldown.name = "Model"
                                q6nissanDrilldown.data = [
                                    ["Micra", 3],
                                    ["Sunny", 3],
                                    ["GTR", 3],
                                    ["KICKS", 3],
                                ] as [Any]

                                let q6renaultDrilldown = HISeries()
                                q6renaultDrilldown.id = "Q6RENAULT"
                                q6renaultDrilldown.name = "Model"
                                q6renaultDrilldown.data = [
                                    ["Duster", 9],
                                    ["Fluence", 6],
                                    ["Kwid", 12],
                                    ["Pulse", 3],
                                    ["Scala", 3],
                                    ["Lodgy", 3],
                                    ["Triber", 3],
                                    ["Kwid Rxt", 3],
                                ] as [Any]

                                let q6skodaDrilldown = HISeries()
                                q6skodaDrilldown.id = "Q6SKODA"
                                q6skodaDrilldown.name = "Model"
                                q6skodaDrilldown.data = [
                                    ["Superb", 6],
                                    ["Rapid", 24],
                                    ["Octavia", 3],
                                    ["Laura", 9],
                                ] as [Any]

                                let q6tataDrilldown = HISeries()
                                q6tataDrilldown.id = "Q6TATA"
                                q6tataDrilldown.name = "Model"
                                q6tataDrilldown.data = [
                                    ["Safari", 6],
                                    ["Safari Storme", 3],
                                    ["Nexon", 12],
                                    ["Tiago", 9],
                                    ["Hexa", 6],
                                    ["Harrier", 3],
                                    ["Aria Pride 4X4", 3],
                                ] as [Any]

                                let q6toyotaDrilldown = HISeries()
                                q6toyotaDrilldown.id = "Q6TOYOTA"
                                q6toyotaDrilldown.name = "Model"
                                q6toyotaDrilldown.data = [
                                    ["Etios", 9],
                                    ["Fortuner", 6],
                                    ["Innova", 3],
                                    ["INNOVA 2.5", 3],
                                ] as [Any]

                                let q6volswagenDrilldown = HISeries()
                                q6volswagenDrilldown.id = "Q6VOLKSWAGEN"
                                q6volswagenDrilldown.name = "Model"
                                q6volswagenDrilldown.data = [
                                    ["Polo", 51],
                                    ["Vento", 24],
                                    ["Ameo", 3],
                                ] as [Any]

                                let q6mgDrilldown = HISeries()
                                q6mgDrilldown.id = "Q6MG"
                                q6mgDrilldown.name = "Model"
                                q6mgDrilldown.data = [
                                    ["Hector", 9],
                                ] as [Any]

                        drilldown.series = [ieDrilldown, chromeDrilldown, threeDrilldown, fourDrilldown, fiveDrilldown, sixDrilldown, m1Drilldown, fiatDrilldown, fordDrilldown, hondaDrilldown, hyundaiDrilldown, jeepDrilldown, mahindraDrilldown, marutiDrilldown, nissanDrilldown, renaultDrilldown, skodaDrilldown, tataDrilldown, toyotaDrilldown, volswagenDrilldown, q2Drilldown, q2fiatDrilldown, q2fordDrilldown, q2hondaDrilldown, q2hyundaiDrilldown, q2mahindraDrilldown, q2marutiDrilldown, q2nissanDrilldown, q2renaultDrilldown, q2skodaDrilldown, q2tataDrilldown, q2toyotaDrilldown, q2volswagenDrilldown, q2kiaDrilldown, q3Drilldown, q3datsunDrilldown, q3fiatDrilldown, q3fordDrilldown, q3hondaDrilldown, q3hyundaiDrilldown, q3mahindraDrilldown, q3marutiDrilldown, q3nissanDrilldown, q3renaultDrilldown, q3skodaDrilldown, q3tataDrilldown, q3toyotaDrilldown, q3volswagenDrilldown, q3kiaDrilldown, q3rextonDrilldown, q4Drilldown, q4fiatDrilldown, q4fordDrilldown, q4hondaDrilldown, q4hyundaiDrilldown, q4isuzuDrilldown, q4mahindraDrilldown, q4marutiDrilldown, q4mitsubishiDrilldown, q4nissanDrilldown, q4renaultDrilldown, q4skodaDrilldown, q4tataDrilldown, q4toyotaDrilldown, q4volswagenDrilldown, q4kiaDrilldown, q4mgDrilldown, q5Drilldown, q5datsunDrilldown, q5fiatDrilldown, q5fordDrilldown, q5hondaDrilldown, q5hyundaiDrilldown, q5mahindraDrilldown, q5marutiDrilldown, q5nissanDrilldown, q5renaultDrilldown, q5skodaDrilldown, q5tataDrilldown, q5toyotaDrilldown, q5volswagenDrilldown, q5kiaDrilldown, q6Drilldown, q6datsunDrilldown, q6fiatDrilldown, q6fordDrilldown, q6hondaDrilldown, q6hyundaiDrilldown, q6mahindraDrilldown, q6marutiDrilldown, q6mercedesDrilldown, q6nissanDrilldown, q6renaultDrilldown, q6skodaDrilldown, q6tataDrilldown, q6toyotaDrilldown, q6volswagenDrilldown, q6mgDrilldown]

                                options.drilldown = drilldown

                        options.credits = HICredits()
                        options.credits.enabled = false

                                chartView.options = options

                                self.chartfiveView.addSubview(chartView)
                        
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

    func newdrilldownallbrandgraphlistServiceCall() {
        if !InternetReachable.ValidateInternet {
            Message.NoInternetAlert(self)
            return
        }

        let imei = UIDevice.current.clientID

        self.view.StartLoading()

        Webservice().call(cRequest: CRequest.getRequest(url: CUrls.BaseUrl, suffix: CUrls.newmobiledashboardmodule.get_WarantyActivated_getWarrantyActivatedDataBrandWise, method: .get, contentType: .urlencode, params: [:], headers: ["Authorization": "Bearer ", "X-Device-Imei": imei, "Content-Type": "application/json"])) { (response, auth) in

            self.view.StopLoading()

            if auth {
                sectionExpiredClass.ClearData(controller: self)
            } else {

                switch response.result {

                case .success(let jsonResponse):

                    if jsonResponse.responseType.isSuccess {

                        print("get_WarantyActivated_getWarrantyActivatedDataBrandWise:" + "\(jsonResponse.response)")

                        let main = jsonResponse.response.dictionaryValue

                        let brandWiseData = main["WarrantyActivatedDataBrandWise"]?.arrayValue
                        brandWiseData?.forEach({ (obj) in
                            let brandWiseModel = WarrantyActivatedDataBrandWiseModelClass(data: obj)
                            self.allbrandlistarr.append(brandWiseModel)
                        })
                        self.bargraph()
                        
                        let drilldownModelData = self.createModelDrilldownData(dataList: self.allmodellistarr, id: "model")
                        self.updateChartWithDrilldown(drilldown: drilldownModelData)
                        

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


    func newdrilldownallmodelsgraphlistServiceCall() {
        if !InternetReachable.ValidateInternet {
            Message.NoInternetAlert(self)
            return
        }

        let imei = UIDevice.current.clientID

        self.view.StartLoading()

        Webservice().call(cRequest: CRequest.getRequest(url: CUrls.BaseUrl, suffix: CUrls.newmobiledashboardmodule.get_WarantyActivated_getWarrantyActivatedDataModelWise, method: .get, contentType: .urlencode, params: [:], headers: ["Authorization": "Bearer ", "X-Device-Imei": imei, "Content-Type": "application/json"])) { (response, auth) in

            self.view.StopLoading()

            if auth {
                sectionExpiredClass.ClearData(controller: self)
            } else {

                switch response.result {

                case .success(let jsonResponse):

                    if jsonResponse.responseType.isSuccess {

                        print("get_WarantyActivated_getWarrantyActivatedDataModelWise:" + "\(jsonResponse.response)")

                        let main = jsonResponse.response.dictionaryValue

                        let modelWiseData = main["WarrantyActivatedDataModelWise"]?.arrayValue
                        modelWiseData?.forEach({ (obj) in
                            let modelWiseModel = WarrantyActivatedDataModelWiseModelClass(data: obj)
                            self.allmodellistarr.append(modelWiseModel)
                        })
                        self.bargraph()

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
    
   
    func createSeriesData(dataList: [WarrantyActivatedDataModelClass]) -> [Any] {
            return dataList.map { data in
                return [
                    "name": data.graph_month,
                    "y": data.total_count,
                    "drilldown": data.graph_month
                ] as [String: Any]
            }
        }

        func createDrilldownData(dataList: [WarrantyActivatedDataBrandWiseModelClass], id: String) -> HISeries {
            let drilldownSeries = HISeries()
            drilldownSeries.id = id

            let drilldownData = dataList.map { data in
                return [
                    "name": data.car_brand,
                    "y": data.total_count
                ] as [String: Any]
            }

            drilldownSeries.data = drilldownData
            return drilldownSeries
        }

        func createModelDrilldownData(dataList: [WarrantyActivatedDataModelWiseModelClass], id: String) -> HISeries {
            let drilldownSeries = HISeries()
            drilldownSeries.id = id

            let drilldownData = dataList.map { data in
                return [
                    "name": data.car_model,
                    "y": data.total_count
                ] as [String: Any]
            }

            drilldownSeries.data = drilldownData
            return drilldownSeries
        }
    
    func updateChartWithDrilldown(drilldown: HISeries) {
            let chartView = HIChartView(frame: self.chartfiveView.bounds)

            let options = HIOptions()

            let chart = HIChart()
            chart.type = "column"
            options.chart = chart

            options.series = [drilldown]

            let newDrilldown = HIDrilldown()
            newDrilldown.series = [drilldown]

            options.drilldown = newDrilldown

            chartView.options = options

            self.chartfiveView.addSubview(chartView)
        }
   
    func bargraph() {
        let chartView = HIChartView(frame: self.chartfiveView.bounds)

                let options = HIOptions()

                let chart = HIChart()
                chart.type = "column"
                options.chart = chart

        let fivetitle = HITitle()
        fivetitle.text = "All Activated Cars"
        options.title = fivetitle

                let fivexAxis = HIXAxis()
                fivexAxis.type = "category"
                options.xAxis = [fivexAxis]

                let series = HISeries()
                series.data = [
                    ["name": self.totalactivateddatalistarr, "y": 56.33, "drilldown": "Q1"],
                    ["name": "Q2", "y": 24.03, "drilldown": "Q2"],
                    ["name": "Q3", "y": 65.03, "drilldown": "Q3"],
                    ["name": "Q4", "y": 25.03, "drilldown": "Q4"],
                    ["name": "Q5", "y": 15.03, "drilldown": "Q5"],
                    ["name": "Q6", "y": 55.03, "drilldown": "Q6"]
                ] as [Any]

                options.series = [series]

                let drilldown = HIDrilldown()

                let ieDrilldown = HISeries()
                ieDrilldown.name = "Q1"
                ieDrilldown.id = "Q1"
                ieDrilldown.data = [
                    ["name": "Maruti", "y": 22, "drilldown": "Maruti"],
                    ["name": "Honda", "y": 24, "drilldown": "Honda"]
                ] as [Any]

                let chromeDrilldown = HISeries()
                chromeDrilldown.name = "Q2"
                chromeDrilldown.id = "Q2"
                chromeDrilldown.data = [
                    ["name": "Honda", "y": 24, "drilldown": "Honda"]
                ] as [Any]

                let threeDrilldown = HISeries()
                threeDrilldown.name = "Q3"
                threeDrilldown.id = "Q3"
                threeDrilldown.data = [
                    ["name": "Tata", "y": 27, "drilldown": "Tata"]
                ] as [Any]

                let fourDrilldown = HISeries()
                fourDrilldown.name = "Q4"
                fourDrilldown.id = "Q4"
                fourDrilldown.data = [
                    ["name": "Ford", "y": 27, "drilldown": "Ford"]
                ] as [Any]

                let fiveDrilldown = HISeries()
                fiveDrilldown.name = "Q5"
                fiveDrilldown.id = "Q5"
                fiveDrilldown.data = [
                    ["name": "Renault", "y": 27, "drilldown": "Renault"]
                ] as [Any]

                let sixDrilldown = HISeries()
                sixDrilldown.name = "Q6"
                sixDrilldown.id = "Q6"
                sixDrilldown.data = [
                    ["name": "maruti", "y": 27, "drilldown": "maruti"]
                ] as [Any]

                let m1Drilldown = HISeries()
                m1Drilldown.id = "Maruti"
                m1Drilldown.data = [
                    ["Swift", 17.2],
                    ["Brezza", 25.2]
                ] as [Any]

                let q2Drilldown = HISeries()
                q2Drilldown.id = "Honda"
                q2Drilldown.data = [
                    ["City", 17.2],
                    ["BRV", 25.2]
                ] as [Any]

                let q3Drilldown = HISeries()
                q3Drilldown.id = "Tata"
                q3Drilldown.data = [
                    ["Nexon", 17.2],
                    ["Safari", 25.2]
                ] as [Any]

                let q4Drilldown = HISeries()
                q4Drilldown.id = "Ford"
                q4Drilldown.data = [
                    ["Figo", 17.2],
                    ["Ecosport", 25.2]
                ] as [Any]

                let q5Drilldown = HISeries()
                q5Drilldown.id = "Renault"
                q5Drilldown.data = [
                    ["Kwid", 17.2],
                    ["Duster", 25.2]
                ] as [Any]

                let q6Drilldown = HISeries()
                q6Drilldown.id = "maruti"
                q6Drilldown.data = [
                    ["Kwid", 17.2],
                    ["Duster", 25.2]
                ] as [Any]

                drilldown.series = [ieDrilldown, chromeDrilldown, threeDrilldown, fourDrilldown, fiveDrilldown, sixDrilldown, m1Drilldown, q2Drilldown, q3Drilldown, q4Drilldown, q5Drilldown, q6Drilldown]

                options.drilldown = drilldown

                chartView.options = options

                self.chartfiveView.addSubview(chartView)
    }

}
