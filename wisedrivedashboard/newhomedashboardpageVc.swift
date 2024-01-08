//
//  newhomedashboardpageVc.swift
//  wisedrivedashboard
//
//  Created by Maanas Kumar on 02/11/23.
//

import UIKit
import Highcharts
import Alamofire
import Charts
import MBCircularProgressBar
import FSCalendar
import RangeSeekSlider
import PINRemoteImage
import MapKit

class newhomedashboardpageVc: UIViewController, FSCalendarDataSource , FSCalendarDelegate  {
    
    @IBOutlet weak var utmsourcedataCollectionView: UICollectionView!
    @IBOutlet weak var utmmediumdataCollectionView: UICollectionView!
    @IBOutlet weak var utmcamphigndetailsCollectionView: UICollectionView!
    @IBOutlet weak var tletterBackView: UIView!
    @IBOutlet weak var tletterLabel: UILabel!
    @IBOutlet weak var mletterLabel: UILabel!
    @IBOutlet weak var mletterBackView: UIView!
    @IBOutlet weak var lmtitleBackView: UIView!
    @IBOutlet weak var lmtitleLabel: UILabel!
    @IBOutlet weak var servicestabBackView: UIView!
    @IBOutlet weak var servicestabtitleLabel: UILabel!
    @IBOutlet weak var watabtitleBackView: UIView!
    @IBOutlet weak var watabtitleLabel: UILabel!
    @IBOutlet weak var followupstatusdataTableView: UITableView!
    @IBOutlet weak var totalsalestitleLabel: UILabel!
    @IBOutlet weak var salestotalamountLabel: UILabel!
    @IBOutlet weak var dmtitleLabel: UILabel!
    @IBOutlet weak var dmamountLabel: UILabel!
    @IBOutlet weak var percentageoftotalsalesLabel: UILabel!
    @IBOutlet weak var dmpercentageLabel: UILabel!
    @IBOutlet weak var dealerstitleunderlineLabel: UILabel!
    @IBOutlet weak var dealerpurchaseddataBtn: UIButton!
    @IBOutlet weak var whatsapptitleLabel: UILabel!
    @IBOutlet weak var whatsappamountLabel: UILabel!
    @IBOutlet weak var bttocpercentageLabel: UILabel!
    @IBOutlet weak var whatsapppercentageLabel: UILabel!
    @IBOutlet weak var bttocwarrantysaletotalamountLabel: UILabel!
    @IBOutlet weak var btocwarrantypackagetotalcountLabel: UILabel!
    @IBOutlet weak var btocservicetotalamountLabel: UILabel!
    @IBOutlet weak var btocservicepackagetotalcountLabel: UILabel!
    @IBOutlet weak var btocinspectiontotalamountLabel: UILabel!
    @IBOutlet weak var btocinspectionpackagetotalcountLabel: UILabel!
    @IBOutlet weak var avgsaletimedaysLabel: UILabel!
    @IBOutlet weak var lastmonthtitleBackView: UIView!
    @IBOutlet weak var lastmonttitleLabel: UILabel!
    @IBOutlet weak var lastmonthamountoneBackView: UIView!
    @IBOutlet weak var lastmonthoneLabel: UILabel!
    @IBOutlet weak var lastbeforemonthtwoBackView: UIView!
    @IBOutlet weak var lastbeforemonthtwoLabel: UILabel!
    @IBOutlet weak var followupleadagetitlebgBackView: UIView!
    @IBOutlet weak var statusbarchartView: HIChartView!
    @IBOutlet weak var statuspiechartView: HIChartView!
    @IBOutlet weak var inspectionsdataCollectionView: UICollectionView!
    @IBOutlet weak var allinspectionsstatusdataTableView: UITableView!
    @IBOutlet weak var leadsummarydataCollectionView: UICollectionView!
    @IBOutlet weak var leadsummarytotalleadcountLabel: UILabel!
    @IBOutlet weak var lsdataTableView: UITableView!
    @IBOutlet weak var leadsummarylastmonthBackView: UIView!
    @IBOutlet weak var leadsummarylastmonthtitleLabel: UILabel!
    @IBOutlet weak var leadsummaryoneBackView: UIView!
    @IBOutlet weak var leadsummaryoneLabel: UILabel!
    @IBOutlet weak var leadsummarytwoBackView: UIView!
    @IBOutlet weak var leadsummarytwoLabel: UILabel!
    @IBOutlet weak var followupleadaggingdataBackView: UIView!
    @IBOutlet weak var followupleadaggingemplistBackView: UIView!
    @IBOutlet weak var htOffollowupleadaggingView: NSLayoutConstraint!
    @IBOutlet weak var followupleadaggingstatusdataBackView: UIView!
    @IBOutlet weak var htOffollowupleadaggingstatusView: NSLayoutConstraint!
    @IBOutlet weak var empdataoffollowupleadaggingCollectionView: UICollectionView!
    @IBOutlet weak var followupleadagingtitleLabel: UILabel!
    @IBOutlet weak var followupleadagingstatusdataCollectionView: UICollectionView!
    @IBOutlet weak var followupleadagedataTableView: UITableView!
    @IBOutlet weak var btobdealerpurchasedpackdataBackView: UIView!
    @IBOutlet weak var btobdealerspurchasedpackdetailsTableView: UITableView!
    @IBOutlet weak var vehicledataBackView: UIView!
    @IBOutlet weak var allcarsdetailsTableView: UITableView!
    @IBOutlet weak var totalpackagesoldcountLabel: UILabel!
    @IBOutlet weak var inspectionstatustitleLabel: UILabel!
    @IBOutlet weak var vehiclefilterBackView: UIView!
    @IBOutlet weak var filterBackView: UIView!
    @IBOutlet weak var datetitleLabel: UILabel!
    @IBOutlet weak var employeetitleLabel: UILabel!
    @IBOutlet weak var dataofallemployessBackView: UIView!
    @IBOutlet weak var allemployeesdataTableView: UITableView!
    @IBOutlet weak var daterangeBackView: UIView!
    @IBOutlet weak var alldateslistTableView: UITableView!
    @IBOutlet weak var customdatetitleLabel: UILabel!
    @IBOutlet weak var customdateBackView: UIView!
    @IBOutlet weak var calendar: FSCalendar!
    @IBOutlet weak var hideunhidetitleLabel: UILabel!
    @IBOutlet weak var firstcollectionBackView: UIView!
    @IBOutlet weak var htOffirstcollectionView: NSLayoutConstraint!
    @IBOutlet weak var secondcollectionBackView: UIView!
    @IBOutlet weak var htOfsecondcollectionView: NSLayoutConstraint!
    @IBOutlet weak var thirdcollectionviewBackView: UIView!
    @IBOutlet weak var htOfthirdcollectionView: NSLayoutConstraint!
    @IBOutlet weak var htOfmainView: NSLayoutConstraint!
    @IBOutlet weak var saleslinechartVuew: HIChartView!
    @IBOutlet weak var firstthreelistsBackView: UIView!
    
    var mainlistarr = [UtmSourceDataMlodelClass]()
    
    var secondlistarr = [UtmmediumDataModelClass]()
    
    var thirdlistarr = [UtmCampaignDataModelClass]()
    
    var daterangelistarr = [TextTypeListModelClass]()
    
    var totalsaleslistarr = [TotalSaleDataModelClass]()
    
  //  var Consolidatalistarr = [ConsolidateDataModelClass]()
    
    var Consolidatalistarr = [SalesDataForIpadModelClass]()
    
    var subfilterlistarr = [("Car Service"), ("General Service"), ("Lead For Car General Service"), ("so_wiseassist")]
    
    var leadbystatuslistarr = [UtmCampaignStatusDataModelClass]()
    
    var allleadsdatalistarr = [AllLeadsModelClass]()
    
    var upsellrenewallistarr = [UpsellrenewalModelClass]()
    
    var digitalmarketinglistarr = [DMStatusModelClass]()
    
    var dmallleadslistarr = [DMAllModelClass]()
    
    var whatsappNegativelistarr = [WhatsappNegativeModelClass]()
    
    var whatsappalllistarr = [WhatsappAllModelClass]()
    
    var allemployeelistarr = [InsideSalesTeamListModelClass]()
    
    var alltypeslistarr = [LeadTypeListModelClass]()
    
    var leadsbystatusbarlistarr = [UtmCampaignStatusDataModelClass]()
    
    var selectmonth = ""
    
    var selectyear = ""
    
    var quartertype = ""
    
    var datetype = ""
    
    var leadtypecountorper = ""
    
    var employeecount = Int()
    
    var count = Int()
    
    var leadcategorycount = ""
    
    var maincategory_id = ""
    
    var subcategoryid = ""
    
    var subcartehorycount = ""
    
    var sourcecampaigncount = ""
    
    var sourcecampignid = ""
    
    var leadbystatusid = ""
    
    var dateid = ""
    
    var fromdate = ""
    
    var todate = ""
    
    var selectedfromdate = ""
    
    var selecetedtodate = ""
    
    var isallempselected = "n"
    
    var totalsalesamount = Double()
    
    var btobsaleamount = Double()
    
    var btocsalesamount = Double()
    
   // var calendar:FSCalendar!
    
    var refreshControl = UIRefreshControl()
    
    private weak var calanderView: FSCalendar!
        
    private var datesRange: [Date]?
    
    private var firstDate: Date?
    
    private var lastDate: Date?
    
    let formatter = DateFormatter()
    
    var followupleadagelistarr = [LeadDataByFollowUpModelClass]()
    
    var followupleadagingemplistarr = [FollowUpEmpListModelClass]()
    
    var followupstatuslistarr = [FollowUpStatusListModelClass]()
    
    var followupleadagingemp_id = ""
    
    var followupleadagingstatus_id = ""
    
    var followupstatuscount = ""
    
    var salesdurationdatalistarr = [SaleDurationDataModelClass]()
    
    var fromwhereselectdate = ""
    
    var followupagingselecteddate = ""
    
    var followupfromdate = ""
    
    var followuptodate = ""
    
    var followupdisplayfromdate = ""
    
    var followupdisplaytodate = ""
    
    var inspheadingslistarr = [InspTypeListModelClass]()
    
    var inspectiontype_id = ""
    
    var allinspectionscountlistarr = [InspDataModelClass]()

    var insptypecount = ""
    
    var allcarlistarr = [reinsprepairDataModelClass]()
    
    var approvedvehlistarr = [InspApprovedDataModelClass]()
    
    var servicestab_selected = "n"
    
    var watab_selected = "n"
    
    var newfollowupleadstatusid = ""
    
    var fromwhich_tab = ""
    
    var insp_status = ""
    
    var leadtype_id = ""
    
    var yearminimum = ""
    
    var yearmaximum = ""
    
    var maxvalue = "2023"
    
    var minvalue = "1995"

    var brandiconlistarr = [BrandListModelClass]()
    
    var soldpackage_count = Int()
    
    var selectbrandid = ""
    
    var fule_type = ""
    
    var transmission_type = ""
    
    var selectedbrandste = ""
    
    var leadaginglistarr = [LeadagingInspDataModelClass]()
    
    var fromwhichaging = ""
    
    var selectlastmonth = "n"
    
    var newselect_lastmonth = "n"

    var selectlastbeforemonth = "n"
    
    var lastmonthorthismonth_id = ""
    
    var dealerpurchasedpacklistarr = [B2bSalesDetailsModelClass]()
    
    var leadsummarylistarr = [LeadSummaryModelClass]()
    
    var selectleadsummarylastmonth = "n"

    var leadsummarylastmonthortismonth_id = ""
    
    var selected_amountmonth = ""
    
    var selecetd_amountyear = ""
    
    var selectleadsummary_amountmonth = ""
    
    var selectleadsummary_amountyear = ""
    
    var leadsummarytypelistarr = [leadsummarydashboardModelClass]()
    
    var leadsummarytype_id = ""
    
    var leadsummarytypecount = ""
    
    var btocsalewarrantyamount = Double()
    
    var btocsalewarrantycount = Int()
    
    var totalavgsalewarranty = Double()
    
    var btocsaleserviceamount = Double()
    
    var btocsaleservicecount = Int()
    
    var totalavgsaleservice = Double()
    
    var btocsaleinspectionamount = Double()
    
    var btocsaleinspectioncount = Int()
    
    var totalavgsaleinspection = Double()
    
    var googleMapsURL = "comgooglemaps://"
    
    var allmapslistarr = [ShowRoomDataModelClass]()
    
    var hide_selected = "n"
    
    var newsales_id = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.followupleadagetitlebgBackView.backgroundColor = UIColor.init(hexString: "FFFCEFF1")
        
        self.servicestabBackView.backgroundColor = .clear
        self.servicestabtitleLabel.textColor = UIColor.init(hexString: "252a40")
        self.watabtitleBackView.backgroundColor = .clear
        self.watabtitleLabel.textColor = UIColor.init(hexString: "252a40")
        
        self.tletterBackView.backgroundColor = UIColor.init(hexString: "252a40")
        self.tletterLabel.textColor = .white
        self.mletterBackView.backgroundColor = UIColor.init(hexString: "f2f2f7")
        self.mletterLabel.textColor = UIColor.init(hexString: "252a40")
        self.lmtitleBackView.backgroundColor = UIColor.init(hexString: "f2f2f7")
        self.lmtitleLabel.textColor = UIColor.init(hexString: "252a40")
        
        self.lastmonthtitleBackView.backgroundColor = UIColor.init(hexString: "A8FFD3")
        self.lastmonttitleLabel.textColor = UIColor.init(hexString: "252a40")
        self.lastmonthamountoneBackView.backgroundColor = .white
        self.lastmonthoneLabel.textColor = UIColor.init(hexString: "252a40")
        self.lastbeforemonthtwoBackView.backgroundColor = .white
        self.lastbeforemonthtwoLabel.textColor = UIColor.init(hexString: "252a40")
        self.lastmonthorthismonth_id = "9"
        
        self.leadsummarylastmonthBackView.backgroundColor = UIColor.init(hexString: "252a40")
        self.leadsummarylastmonthtitleLabel.textColor = .white
        self.leadsummaryoneBackView.backgroundColor = .white
        self.leadsummaryoneLabel.textColor = UIColor.init(hexString: "252a40")
        self.leadsummarytwoBackView.backgroundColor = .white
        self.leadsummarytwoLabel.textColor = UIColor.init(hexString: "252a40")
        self.leadsummarylastmonthortismonth_id = "9"
        
        self.followupleadaggingdataBackView.isHidden = true
        self.btobdealerpurchasedpackdataBackView.isHidden = true
        self.vehicledataBackView.isHidden = true
        self.filterBackView.isHidden = true
        self.dataofallemployessBackView.isHidden = true
        self.daterangeBackView.isHidden = true
        self.customdateBackView.isHidden = true
        
        self.newsales_id = "1"
        
//        self.hideunhidetitleLabel.text! = "Unhide"
//        self.firstcollectionBackView.isHidden = true
//        self.htOffirstcollectionView.constant = 0
//        self.secondcollectionBackView.isHidden = true
//        self.htOfsecondcollectionView.constant = 0
//        self.thirdcollectionviewBackView.isHidden = true
//        self.htOfthirdcollectionView.constant = 0
        self.hideunhidetitleLabel.isHidden = true
        self.htOfmainView.constant = 1450
        
        self.firstthreelistsBackView.isHidden = true
        
        calendar.dataSource = self
        calendar.delegate = self
        calendar.scrollDirection = .horizontal
        calendar.allowsMultipleSelection = true
               // Set minimumDate and maximumDate to limit the selection to the desired range
               let formatter = DateFormatter()
               formatter.dateFormat = "dd-MM-yyyy"
        
        self.dateid = "1"
        leadbycategoryServiceCall()

        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    @IBAction func hideandunhideActionBtn(_ sender: Any) {
        if self.hide_selected == "n" {
            self.hideunhidetitleLabel.text! = "Hide"
            self.firstcollectionBackView.isHidden = false
            self.htOffirstcollectionView.constant = 50
            self.secondcollectionBackView.isHidden = false
            self.htOfsecondcollectionView.constant = 50
            self.thirdcollectionviewBackView.isHidden = false
            self.htOfthirdcollectionView.constant = 50
            self.htOfmainView.constant = 1600
            self.hide_selected = "y"
        }else{
            self.hideunhidetitleLabel.text! = "Unhide"
            self.firstcollectionBackView.isHidden = true
            self.htOffirstcollectionView.constant = 0
            self.secondcollectionBackView.isHidden = true
            self.htOfsecondcollectionView.constant = 0
            self.thirdcollectionviewBackView.isHidden = true
            self.htOfthirdcollectionView.constant = 0
            self.htOfmainView.constant = 1450
            self.hide_selected = "n"
        }
    }
    
    @IBAction func viewmapActionBtn(_ sender: Any) {
        let vc = self.controllerWithMainStoryBoard(withIdentifier: onlygooglempaPageVc.className) as! onlygooglempaPageVc
        self.navigationController?.pushViewController(vc, animated: true)
        
//        var googleMapsURL = "comgooglemaps://?q="
//
//        for showroom in allmapslistarr {
//            // Assuming 'Latitude' and 'Longitude' properties are of type Double
//            let latitude = showroom.Latitude ?? 0.0
//            let longitude = showroom.Longitude ?? 0.0
//            let locationString = String(format: "%.6f,%.6f", latitude, longitude)
//            googleMapsURL += locationString + "+"
//        }
//
//
//            // Remove the trailing '+' character
//            googleMapsURL = String(googleMapsURL.dropLast())
//
//            if let url = URL(string: googleMapsURL) {
//                if UIApplication.shared.canOpenURL(url) {
//                    UIApplication.shared.open(url)
//                } else {
//                    // Handle the case where Google Maps is not installed
//                    // You can display an alert or message to inform the user.
//                    print("Google Maps is not installed.")
//                }
//            }
    }
    
    func viewmapServiceCall() {
        if !InternetReachable.ValidateInternet {
            Message.NoInternetAlert(self)
            return
        }

        let imei = UIDevice.current.clientID

            self.view.StartLoading()

        Webservice().call(cRequest: CRequest.getRequest(url: CUrls.BaseUrl, suffix: CUrls.newmobiledashboardmodule.get_ShowRoomDataForMap_getShowRoomData, method: .get, contentType: .urlencode, params: [:], headers: ["Authorization": "Bearer " ,"X-Device-Imei":imei,"Content-Type":"application/json"])) { (response, auth) in

                self.view.StopLoading()
        //    self.activityloader.isHidden = true

            if auth {
                sectionExpiredClass.ClearData(controller: self)
            }
            else {

                switch response.result {

                case .success(let jsonResponse):

                    if jsonResponse.responseType.isSuccess {

                        print("get_ShowRoomDataForMap_getShowRoomData:" + "\(jsonResponse.response)");

                        let main = jsonResponse.response.dictionaryValue

                        if let ShowRoomData = main["ShowRoomData"]?.array {
                                                self.allmapslistarr = ShowRoomData.compactMap { ShowRoomDataModelClass(data: $0) }
                                            }

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
    
    
    @IBAction func tletterActionBtn(_ sender: Any) {
        self.tletterBackView.backgroundColor = UIColor.init(hexString: "252a40")
        self.tletterLabel.textColor = .white
        self.mletterBackView.backgroundColor = UIColor.init(hexString: "f2f2f7")
        self.mletterLabel.textColor = UIColor.init(hexString: "252a40")
        self.lmtitleBackView.backgroundColor = UIColor.init(hexString: "f2f2f7")
        self.lmtitleLabel.textColor = UIColor.init(hexString: "252a40")
        self.fromdate = ""
        self.todate = ""
        self.dateid = "1"
      //  self.datetitleLabel.text! = "Today"
        leadbycategoryServiceCall()
    }
    
    @IBAction func mletterActionBtn(_ sender: Any) {
        self.tletterBackView.backgroundColor = UIColor.init(hexString: "f2f2f7")
        self.tletterLabel.textColor = UIColor.init(hexString: "252a40")
        self.mletterBackView.backgroundColor = UIColor.init(hexString: "252a40")
        self.mletterLabel.textColor = .white
        self.lmtitleBackView.backgroundColor = UIColor.init(hexString: "f2f2f7")
        self.lmtitleLabel.textColor = UIColor.init(hexString: "252a40")
        self.fromdate = ""
        self.todate = ""
        self.dateid = "9"
      //  self.datetitleLabel.text! = "This Month"
        leadbycategoryServiceCall()
    }
    
    @IBAction func lmActionBtn(_ sender: Any) {
        self.tletterBackView.backgroundColor = UIColor.init(hexString: "f2f2f7")
        self.tletterLabel.textColor = UIColor.init(hexString: "252a40")
        self.mletterBackView.backgroundColor = UIColor.init(hexString: "f2f2f7")
        self.mletterLabel.textColor = UIColor.init(hexString: "252a40")
        self.lmtitleBackView.backgroundColor = UIColor.init(hexString: "252a40")
        self.lmtitleLabel.textColor = UIColor.init(hexString: "FFFFFF")
        self.fromdate = ""
        self.todate = ""
        self.dateid = "10"
      //  self.datetitleLabel.text! = "This Month"
        leadbycategoryServiceCall()
    }
    
    
    @IBAction func servicestabActionBtn(_ sender: Any) {
        if self.servicestab_selected == "n" {
            self.servicestabBackView.backgroundColor = UIColor.init(hexString: "252a40")
            self.servicestabtitleLabel.textColor = .white
            self.watabtitleBackView.backgroundColor = .clear
            self.watabtitleLabel.textColor = UIColor.init(hexString: "252a40")
            self.servicestab_selected = "y"
            self.watab_selected = "n"
            self.leadtype_id = "5"
            self.leadbycategoryServiceCall()
        }else{
            self.servicestabBackView.backgroundColor = .clear
            self.servicestabtitleLabel.textColor = UIColor.init(hexString: "252a40")
            self.watabtitleBackView.backgroundColor = .clear
            self.watabtitleLabel.textColor = UIColor.init(hexString: "252a40")
            self.servicestab_selected = "n"
            self.leadtype_id = ""
            self.leadbycategoryServiceCall()
        }
    }
    
    @IBAction func watabActionBtn(_ sender: Any) {
        if self.watab_selected == "n" {
            self.servicestabBackView.backgroundColor = .clear
            self.servicestabtitleLabel.textColor = UIColor.init(hexString: "252a40")
            self.watabtitleBackView.backgroundColor = UIColor.init(hexString: "252a40")
            self.watabtitleLabel.textColor = .white
            self.watab_selected = "y"
            self.servicestab_selected = "n"
            self.leadtype_id = "4"
            self.leadbycategoryServiceCall()
        }else{
            self.servicestabBackView.backgroundColor = .clear
            self.servicestabtitleLabel.textColor = UIColor.init(hexString: "252a40")
            self.watabtitleBackView.backgroundColor = .clear
            self.watabtitleLabel.textColor = UIColor.init(hexString: "252a40")
            self.watab_selected = "n"
            self.leadtype_id = ""
            self.leadbycategoryServiceCall()
        }
    }
    
    @IBAction func lastmonthActionBtn(_ sender: Any) {
        self.lastmonthtitleBackView.backgroundColor = UIColor.init(hexString: "A8FFD3")
        self.lastmonttitleLabel.textColor = UIColor.init(hexString: "252a40")
        self.lastmonthamountoneBackView.backgroundColor = .white
        self.lastmonthoneLabel.textColor = UIColor.init(hexString: "252a40")
        self.lastbeforemonthtwoBackView.backgroundColor = .white
        self.lastbeforemonthtwoLabel.textColor = UIColor.init(hexString: "252a40")
        self.selectlastmonth = "y"
        self.lastmonthorthismonth_id = "9"
        self.selected_amountmonth = ""
        self.selecetd_amountyear = ""
        self.newsales_id = "1"
        self.totalsaleslistServiceCall()
    }
    
    @IBAction func lastmonthoneActionBtn(_ sender: Any) {
        self.lastmonthtitleBackView.backgroundColor = .white
        self.lastmonttitleLabel.textColor = UIColor.init(hexString: "252a40")
        self.lastmonthamountoneBackView.backgroundColor = UIColor.init(hexString: "A8FFD3")
        self.lastmonthoneLabel.textColor = UIColor.init(hexString: "252a40")
        self.lastbeforemonthtwoBackView.backgroundColor = .white
        self.lastbeforemonthtwoLabel.textColor = UIColor.init(hexString: "252a40")
        self.lastmonthorthismonth_id = "10"
        self.selected_amountmonth = ""
        self.selecetd_amountyear = ""
        self.newsales_id = "2"
        self.totalsaleslistServiceCall()
    }
    
    @IBAction func lastbeforemonthtwoActionBtn(_ sender: Any) {
        self.lastmonthtitleBackView.backgroundColor = .white
        self.lastmonttitleLabel.textColor = UIColor.init(hexString: "252a40")
        self.lastmonthamountoneBackView.backgroundColor = .white
        self.lastmonthoneLabel.textColor = UIColor.init(hexString: "252a40")
        self.lastbeforemonthtwoBackView.backgroundColor = UIColor.init(hexString: "A8FFD3")
        self.lastbeforemonthtwoLabel.textColor = UIColor.init(hexString: "252a40")
    //    self.selectlastbeforemonth = "y"
        self.lastmonthorthismonth_id = ""
        let currentDate = Date()
              
              // Create a Calendar instance
              let calendar = Calendar.current
              
              // Get the last month's date
              if let lastMonthDate = calendar.date(byAdding: .month, value: -2, to: currentDate) {
                  // Extract the month and year components from the last month's date
                  let lastMonth = calendar.component(.month, from: lastMonthDate)
                  let currentYear = calendar.component(.year, from: currentDate)
                  
                  // Display the results (e.g., print them)
                  print("Last month: \(lastMonth)")
                  print("Current year: \(currentYear)")
                  self.selected_amountmonth = String(lastMonth)
                  self.selecetd_amountyear = String(currentYear)
              }
        self.newsales_id = "3"
        self.totalsaleslistServiceCall()
    }
    
    
    @IBAction func leadsummarylastmonthActionBtn(_ sender: Any) {
        self.leadsummarylastmonthBackView.backgroundColor = UIColor.init(hexString: "252a40")
        self.leadsummarylastmonthtitleLabel.textColor = .white
        self.leadsummaryoneBackView.backgroundColor = .white
        self.leadsummaryoneLabel.textColor = UIColor.init(hexString: "252a40")
        self.leadsummarytwoBackView.backgroundColor = .white
        self.leadsummarytwoLabel.textColor = UIColor.init(hexString: "252a40")
        self.leadsummarylastmonthortismonth_id = "9"
        self.selectleadsummary_amountmonth = ""
        self.selectleadsummary_amountyear = ""
        self.leadsummarytypelistServiceCall()
    }
    
    @IBAction func leadsummaryoneActionBtn(_ sender: Any) {
        self.leadsummarylastmonthBackView.backgroundColor = .white
        self.leadsummarylastmonthtitleLabel.textColor = UIColor.init(hexString: "252a40")
        self.leadsummaryoneBackView.backgroundColor = UIColor.init(hexString: "252a40")
        self.leadsummaryoneLabel.textColor = .white
        self.leadsummarytwoBackView.backgroundColor = .white
        self.leadsummarytwoLabel.textColor = UIColor.init(hexString: "252a40")
        self.leadsummarylastmonthortismonth_id = "10"
        self.selectleadsummary_amountmonth = ""
        self.selectleadsummary_amountyear = ""
        self.leadsummarytypelistServiceCall()
    }
    
    @IBAction func leadsummarytwoActionBtn(_ sender: Any) {
        self.leadsummarylastmonthBackView.backgroundColor = .white
        self.leadsummarylastmonthtitleLabel.textColor = UIColor.init(hexString: "252a40")
        self.leadsummaryoneBackView.backgroundColor = .white
        self.leadsummaryoneLabel.textColor = UIColor.init(hexString: "252a40")
        self.leadsummarytwoBackView.backgroundColor = UIColor.init(hexString: "252a40")
        self.leadsummarytwoLabel.textColor = .white
        self.leadsummarylastmonthortismonth_id = ""
        let currentDate = Date()
              
              // Create a Calendar instance
              let calendar = Calendar.current
              
              // Get the last month's date
              if let lastMonthDate = calendar.date(byAdding: .month, value: -2, to: currentDate) {
                  // Extract the month and year components from the last month's date
                  let lastMonth = calendar.component(.month, from: lastMonthDate)
                  let currentYear = calendar.component(.year, from: currentDate)
                  
                  // Display the results (e.g., print them)
                  print("Last month: \(lastMonth)")
                  print("Current year: \(currentYear)")
                  self.selectleadsummary_amountmonth = String(lastMonth)
                  self.selectleadsummary_amountyear = String(currentYear)
              }
        self.leadsummarytypelistServiceCall()
    }
    
    @IBAction func leadsummarygraphActionBtn(_ sender: Any) {
        let vc = self.controllerWithMainStoryBoard(withIdentifier: newgraphPageVC.className) as! newgraphPageVC
        vc.graphtext_id = self.leadsummarylastmonthortismonth_id
        vc.graphfromdate = self.fromdate
        vc.graphtodate = self.todate
        vc.graphmonth = self.selectleadsummary_amountmonth
        vc.graphyear = self.selectleadsummary_amountyear
        vc.graphinsptype_id = self.leadsummarytype_id
        vc.graphsource = self.maincategory_id
        vc.graphmedium = self.subcategoryid
        vc.graphcampaign = self.sourcecampignid
        vc.graphtype_id = self.leadtype_id
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func followupleadaggingActionBtn(_ sender: Any) {
        self.followupleadaggingdataBackView.isHidden = false
        self.followupleadaggingemplistBackView.isHidden = false
        self.htOffollowupleadaggingView.constant = 50
        self.followupleadaggingstatusdataBackView.isHidden = false
        self.htOffollowupleadaggingstatusView.constant = 100
        self.followupleadagingtitleLabel.text! = "Followup Lead Aging"
        self.fromwhichaging = "Followup Lead Aging"
        self.followupleadagingemplistServiceCall()
    }
    
    @IBAction func hidefollowupleadageviewActionBtn(_ sender: Any) {
        self.followupleadaggingdataBackView.isHidden = true
    }
    
    @IBAction func hidebtobdealerpacksACtionBtn(_ sender: Any) {
        self.btobdealerpurchasedpackdataBackView.isHidden = true
    }
    
    @IBAction func showbtobdealerpacksActionBtn(_ sender: Any) {
        self.btobdealerpurchasedpackdataBackView.isHidden = false
        self.dealerpurchasedpackagesServiceCall()
    }
    
    @IBAction func hidevehiclesActionBtn(_ sender: Any) {
        self.vehicledataBackView.isHidden = true
    }
    
    @IBAction func hidefilterBackView(_ sender: Any) {
        self.filterBackView.isHidden = true
    }
    
    @IBAction func showfiltersActionBtn(_ sender: Any) {
        self.filterBackView.isHidden = false
    }
    
    @IBAction func selectemployeeActionBtn(_ sender: Any) {
        if self.allemployeelistarr.count == 0 {
            self.dataofallemployessBackView.isHidden = false
            allemployeelistServiceCall()
        }else{
            self.dataofallemployessBackView.isHidden = false
        }
    }
    
    @IBAction func hideemployeelistActionBtn(_ sender: Any) {
        self.dataofallemployessBackView.isHidden = true
    }
    
    @IBAction func selectemployeessubmitActionBtn(_ sender: Any) {
        leadbycategoryServiceCall()
        self.dataofallemployessBackView.isHidden = true
        self.filterBackView.isHidden = true
    }
    
    @IBAction func hidedaterangeActionBtn(_ sender: Any) {
        self.daterangeBackView.isHidden = true
    }
    
    @IBAction func selectdateActionBtn(_ sender: Any) {
        self.daterangeBackView.isHidden = false
        alldateslistServiceCall()
    }
    
    @IBAction func hidecustomdaterangeACtionBtn(_ sender: Any) {
        self.customdateBackView.isHidden = true
    }
    
    @IBAction func customdateActionBtn(_ sender: Any) {
        self.customdateBackView.isHidden = false
    }
    
    @IBAction func selectsourceActionBtn(_ sender: Any) {
        self.firstthreelistsBackView.isHidden = false
        self.filterBackView.isHidden = true
        self.leadbycategoryServiceCall()
    }
    
    @IBAction func hidefirstthreelistActionBtn(_ sender: Any) {
        self.firstthreelistsBackView.isHidden = true
    }
    
    
    @IBAction func customdatesubmitActionBtn(_ sender: Any) {
            if self.fromdate != "" && self.todate == "" {
                self.view.ShowBlackTostWithText(message: "Please date range", Interval: 2)
            }else{
                    self.dateid = ""
                    leadbycategoryServiceCall()
                    if self.fromdate == "" || self.fromdate == nil {
                        self.customdatetitleLabel.text = "Custom"
                        self.datetitleLabel.text! = "All"
                    }else{
                        let dateFormatter = DateFormatter()
                        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
                        dateFormatter.dateFormat = "yyyy-MM-dd"
                        let date = dateFormatter.date(from: self.fromdate)
                        dateFormatter.dateFormat = "dd MMM yyyy"
                        let dateStr = dateFormatter.string(from:date!)
                        self.selectedfromdate = dateStr
                   }
                    if self.todate == "" || self.todate == nil {
                        self.customdatetitleLabel.text = "Custom"
                        self.datetitleLabel.text! = "All"
                    }else{
                        let dateFormatter = DateFormatter()
                        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
                        dateFormatter.dateFormat = "yyyy-MM-dd"
                        let date = dateFormatter.date(from: self.todate)
                        dateFormatter.dateFormat = "dd MMM yyyy"
                        let dateStr = dateFormatter.string(from:date!)
                        self.selecetedtodate = dateStr
                   }
                    self.customdatetitleLabel.text = self.selectedfromdate + " - " + self.selecetedtodate
                    self.datetitleLabel.text! = self.selectedfromdate + " - " + self.selecetedtodate
                    self.daterangeBackView.isHidden = true
                    self.customdateBackView.isHidden = true
                    
                    self.leadbycategoryServiceCall()
                    self.daterangeBackView.isHidden = true
                
                self.tletterBackView.backgroundColor = UIColor.init(hexString: "f2f2f7")
                self.tletterLabel.textColor = UIColor.init(hexString: "252a40")
                self.mletterBackView.backgroundColor = UIColor.init(hexString: "f2f2f7")
                self.tletterLabel.textColor = UIColor.init(hexString: "252a40")
                self.lmtitleBackView.backgroundColor = UIColor.init(hexString: "f2f2f7")
                self.lmtitleLabel.textColor = UIColor.init(hexString: "252a40")
               
            }
        
    }
    
    func reloadCalendar() {
            calendar.reloadData()
        }
    
    
    
    
    func datesRange(from: Date, to: Date) -> [Date] {
            if from > to { return [Date]() }
            
            var tempDate = from
            var array = [tempDate]
            
            while tempDate < to {
                tempDate = Calendar.current.date(byAdding: .day, value: 1, to: tempDate)!
                array.append(tempDate)
            }
            
            return array
        }
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        
        let currentDate = Date()
            
            // If the selected date is greater than the current date, do not process it.
            if date > currentDate {
                let alert = UIAlertController(title: "Invalid Selection", message: "Selecting dates beyond the current date is not allowed.", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                        self.present(alert, animated: true, completion: nil)
                        
                        // Deselect the selected date to prevent it from being selected
                        calendar.deselect(date)
                return
            }
        // nothing selected:
        if firstDate == nil {
            firstDate = date
            datesRange = [firstDate!]
            
            print("datesRange contains: \(datesRange!)")
            
            let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy-MM-dd"
            if self.fromwhereselectdate == "Followup" {
                self.followupfromdate = dateFormatter.string(from: firstDate!)
                print("fromDate: \(fromdate)")
            }else{
                self.fromdate = dateFormatter.string(from: firstDate!)
                print("fromDate: \(fromdate)")
            }
            
            
            return
        }
        
        // only first date is selected:
        if firstDate != nil && lastDate == nil {
            // handle the case of if the last date is less than the first date:
            if date <= firstDate! {
                calendar.deselect(firstDate!)
                firstDate = date
                datesRange = [firstDate!]
                
                print("datesRange contains: \(datesRange!)")
                
                let todateFormatter = DateFormatter()
                todateFormatter.dateFormat = "yyyy-MM-dd"
                if self.fromwhereselectdate == "Followup" {
                    self.followuptodate = todateFormatter.string(from: lastDate!)
                    print("toDate: \(todate)")
                }else{
                    self.todate = todateFormatter.string(from: lastDate!)
                    print("toDate: \(todate)")
                }
                
                return
            }
            
            let range = datesRange(from: firstDate!, to: date)
            
            lastDate = range.last
            
            for d in range {
                calendar.select(d)
            }
            
            datesRange = range
            
            print("datesRange contains: \(datesRange!)")
            
            let todateFormatter = DateFormatter()
            todateFormatter.dateFormat = "yyyy-MM-dd"
            if self.fromwhereselectdate == "Followup" {
                self.followuptodate = todateFormatter.string(from: lastDate!)
                print("toDate: \(todate)")
            }else{
                self.todate = todateFormatter.string(from: lastDate!)
                print("toDate: \(todate)")
            }
            
            return
        }
        
        // both are selected:
        
        if firstDate != nil && lastDate != nil {
            for d in calendar.selectedDates {
                calendar.deselect(d)
            }
            
            lastDate = nil
            firstDate = nil
            if self.fromwhereselectdate == "Followup" {
                if firstDate == nil {
                    self.followupfromdate = ""
                }else if lastDate == nil {
                    self.followuptodate = ""
                }
            }else{
                if firstDate == nil {
                    self.fromdate = ""
                }else if lastDate == nil {
                    self.todate = ""
                }
            }
            
            datesRange = []
            print("toDate: \(todate)")
           
//            print("datesRange contains: \(datesRange!)")
//            let todateFormatter = DateFormatter()
//            todateFormatter.dateFormat = "yyyy-MM-dd"
//            self.todate = todateFormatter.string(from: lastDate!)
//                print("toDate: \(todate)")
//
//            let dateFormatter = DateFormatter()
//                dateFormatter.dateFormat = "yyyy-MM-dd"
//            self.fromdate = dateFormatter.string(from: firstDate!)
//            print("fromDate: \(fromdate)")
            
//            self.fromdate = ""
//            self.todate = ""
            
        }
        

    }
    
    func calendar(_ calendar: FSCalendar, didDeselect date: Date, at monthPosition: FSCalendarMonthPosition) {
        // both are selected:
        
        if firstDate != nil && lastDate != nil {
            for d in calendar.selectedDates {
                calendar.deselect(d)
            }
            
            lastDate = nil
            firstDate = nil
            if self.fromwhereselectdate == "Followup" {
                self.followupfromdate = ""
                self.followuptodate = ""
                datesRange = []
            }else{
                self.fromdate = ""
                self.todate = ""
                datesRange = []
            }
            print("datesRange contains: \(datesRange!)")
        }

    }
    
    func removeSelectedDates() {
        let selectedDates = calendar.selectedDates
        for date in selectedDates {
            calendar.deselect(date)
        }
    }
    
    
    
    @IBAction func warrantiesActionBtn(_ sender: Any) {
        let vc = self.controllerWithMainStoryBoard(withIdentifier: newdataofallpackagesPageVC.className) as! newdataofallpackagesPageVC
        vc.fromwhich = "Warranty"
        vc.graphtext_id = self.lastmonthorthismonth_id
        vc.graphtype_id = self.leadtype_id
        vc.graphmonth = self.selected_amountmonth
        vc.graphyear = self.selecetd_amountyear
        self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func servicesActionBtn(_ sender: Any) {
        let vc = self.controllerWithMainStoryBoard(withIdentifier: newdataofallpackagesPageVC.className) as! newdataofallpackagesPageVC
        vc.fromwhich = "Services"
        vc.graphtext_id = self.lastmonthorthismonth_id
        vc.graphtype_id = self.leadtype_id
        vc.graphmonth = self.selected_amountmonth
        vc.graphyear = self.selecetd_amountyear
        self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func inspectionsActionBtn(_ sender: Any) {
        let vc = self.controllerWithMainStoryBoard(withIdentifier: newdataofallpackagesPageVC.className) as! newdataofallpackagesPageVC
        vc.fromwhich = "Inspections"
        vc.graphtext_id = self.lastmonthorthismonth_id
        vc.graphtype_id = self.leadtype_id
        vc.graphmonth = self.selected_amountmonth
        vc.graphyear = self.selecetd_amountyear
        self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func kibActionBtn(_ sender: Any) {
        let vc = self.controllerWithMainStoryBoard(withIdentifier: newipaddashboardgrapghsPageVC.className) as! newipaddashboardgrapghsPageVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    
    func leadbycategoryServiceCall() {
        if !InternetReachable.ValidateInternet {
            Message.NoInternetAlert(self)
            return
        }
        
        var selectedepmloyees = [String]()

        for k in allemployeelistarr.enumerated() {
            if self.allemployeelistarr[k.offset].is_seleceted {
                selectedepmloyees.append(String(self.allemployeelistarr[k.offset].employee_id))
                
            }

        }

        let stypeselectedemployeesstr = selectedepmloyees
        let selectedserviceemployessste = selectedepmloyees.joined(separator: ",")
        
        let imei = UIDevice.current.clientID
       
            self.view.StartLoading()

        Webservice().call(cRequest: CRequest.getRequest(url: CUrls.BaseUrl, suffix: CUrls.newmobiledashboardmodule.get_leadapi_getUtmSourceData, method: .get, contentType: .urlencode, params: ["textId":self.dateid,"typeId":self.leadtype_id,"month":"","year":"","empId":selectedserviceemployessste,"fromDate":self.fromdate,"toDate":self.todate], headers: ["Authorization": "Bearer " ,"X-Device-Imei":imei,"Content-Type":"application/json"])) { (response, auth) in
            
                self.view.StopLoading()
        //    self.activityloader.isHidden = true

            if auth {
                sectionExpiredClass.ClearData(controller: self)
            }
            else {
                self.mainlistarr.removeAll()
           
                switch response.result {
                
                case .success(let jsonResponse):
                    
                    if jsonResponse.responseType.isSuccess {
                        
                        print("get_leadapi_getUtmSourceData:" + "\(jsonResponse.response)");
                        
                        let main = jsonResponse.response.dictionaryValue
                        
                        let UtmSourceData = main["UtmSourceData"]?.arrayValue
                        
                        UtmSourceData!.forEach({ (obj) in
                            self.mainlistarr.append(UtmSourceDataMlodelClass.init(data: obj))
                        })
                        self.utmsourcedataCollectionView.reloadData()
                        
                        self.mainlistarr[0].is_seleceted = true
                        self.maincategory_id = String(self.mainlistarr[0].utm_source)
                        
                        self.leadbysubcategoryServiceCall()
                        

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
    
    
    func leadbysubcategoryServiceCall() {
        if !InternetReachable.ValidateInternet {
            Message.NoInternetAlert(self)
            return
        }
        
        var selectedepmloyees = [String]()
        
        if self.maincategory_id == "All" {
            self.maincategory_id = ""
        }else{
            
        }

        for k in allemployeelistarr.enumerated() {
            if self.allemployeelistarr[k.offset].is_seleceted {
                selectedepmloyees.append(String(self.allemployeelistarr[k.offset].employee_id))
                
            }

        }

        let stypeselectedemployeesstr = selectedepmloyees
        let selectedserviceemployessste = selectedepmloyees.joined(separator: ",")
        
        let imei = UIDevice.current.clientID
       
            self.view.StartLoading()

        Webservice().call(cRequest: CRequest.getRequest(url: CUrls.BaseUrl, suffix: CUrls.newmobiledashboardmodule.get_leadapi_getUtmMediumData, method: .get, contentType: .urlencode, params: ["textId":self.dateid,"typeId":self.leadtype_id,"month":"","year":"","empId":selectedserviceemployessste,"fromDate":self.fromdate,"toDate":self.todate,"utmSource":self.maincategory_id], headers: ["Authorization": "Bearer " ,"X-Device-Imei":imei,"Content-Type":"application/json"])) { (response, auth) in
            
                self.view.StopLoading()
        //    self.activityloader.isHidden = true

            if auth {
                sectionExpiredClass.ClearData(controller: self)
            }
            else {
                self.secondlistarr.removeAll()
           
                switch response.result {
                
                case .success(let jsonResponse):
                    
                    if jsonResponse.responseType.isSuccess {
                        
                        print("get_leadapi_getUtmMediumData:" + "\(jsonResponse.response)");
                        
                        let main = jsonResponse.response.dictionaryValue
                        
                        let UtmmediumData = main["UtmmediumData"]?.arrayValue
                        
                        UtmmediumData!.forEach({ (obj) in
                            self.secondlistarr.append(UtmmediumDataModelClass.init(data: obj))
                        })
                        self.utmmediumdataCollectionView.reloadData()
                        self.secondlistarr[0].seleceted = true
                        self.subcategoryid = self.secondlistarr[0].utm_medium
                        
                        self.leadbysourcecampaignServiceCall()
                        self.leadbystatuslistServiceCall()
                        self.totalsaleslistServiceCall()
                        self.leadsbystatusbarchartServiceCall()
                        self.inspectiontypelistServiceCall()
                        self.leadsummarytypelistServiceCall()
                        self.saleslinegraphlistServiceCall()
//                        if self.maincategory_id == "99" {
//                            self.allfavdataleadslistServiceCall()
//                        }else if self.maincategory_id == "1" {
//                            self.dmdataleadslistServiceCall()
//                        }else if self.maincategory_id == "2" {
//                            self.whatsappdataleadslistServiceCall()
//                        }
                        

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
    
    func leadbysourcecampaignServiceCall() {
        if !InternetReachable.ValidateInternet {
            Message.NoInternetAlert(self)
            return
        }
        
        if self.maincategory_id == "All" {
            self.maincategory_id = ""
        }else{
            
        }
        
        if self.subcategoryid == "All" {
            self.subcategoryid = ""
        }else{
            
        }
        
        var selectedepmloyees = [String]()

        for k in allemployeelistarr.enumerated() {
            if self.allemployeelistarr[k.offset].is_seleceted {
                selectedepmloyees.append(String(self.allemployeelistarr[k.offset].employee_id))
                
            }

        }

        let stypeselectedemployeesstr = selectedepmloyees
        let selectedserviceemployessste = selectedepmloyees.joined(separator: ",")
        
        let imei = UIDevice.current.clientID
       
            self.view.StartLoading()

        Webservice().call(cRequest: CRequest.getRequest(url: CUrls.BaseUrl, suffix: CUrls.newmobiledashboardmodule.get_leadapi_getUtmCampaignData, method: .get, contentType: .urlencode, params: ["textId":self.dateid,"typeId":self.leadtype_id,"month":"","year":"","empId":selectedserviceemployessste,"fromDate":self.fromdate,"toDate":self.todate,"utmSource":self.maincategory_id,"utmMedium":self.subcategoryid], headers: ["Authorization": "Bearer " ,"X-Device-Imei":imei,"Content-Type":"application/json"])) { (response, auth) in
            
                self.view.StopLoading()
        //    self.activityloader.isHidden = true

            if auth {
                sectionExpiredClass.ClearData(controller: self)
            }
            else {
                self.thirdlistarr.removeAll()
           
                switch response.result {
                
                case .success(let jsonResponse):
                    
                    if jsonResponse.responseType.isSuccess {
                        
                        print("get_leadapi_getUtmCampaignData:" + "\(jsonResponse.response)");
                        
                        let main = jsonResponse.response.dictionaryValue
                        
                        let UtmCampaignData = main["UtmCampaignData"]?.arrayValue
                        
                        UtmCampaignData!.forEach({ (obj) in
                            self.thirdlistarr.append(UtmCampaignDataModelClass.init(data: obj))
                        })
                        self.utmcamphigndetailsCollectionView.reloadData()
                        
                        self.thirdlistarr[0].was_select = true
                        self.sourcecampignid = String(self.thirdlistarr[0].utm_campaign)
                        

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
    
    func leadbystatuslistServiceCall() {
        if !InternetReachable.ValidateInternet {
            Message.NoInternetAlert(self)
            return
        }
        
        if self.maincategory_id == "All" {
            self.maincategory_id = ""
        }else{
            
        }
        
        if self.subcategoryid == "All" {
            self.subcategoryid = ""
        }else{
            
        }
        
        if self.sourcecampignid == "All" {
            self.sourcecampignid = ""
        }else{
            
        }
        
        var selectedepmloyees = [String]()

        for k in allemployeelistarr.enumerated() {
            if self.allemployeelistarr[k.offset].is_seleceted {
                selectedepmloyees.append(String(self.allemployeelistarr[k.offset].employee_id))
                
            }

        }
        
        let stypeselectedemployeesstr = selectedepmloyees
        let selectedserviceemployessste = selectedepmloyees.joined(separator: ",")
        
        let imei = UIDevice.current.clientID
       
            self.view.StartLoading()

        Webservice().call(cRequest: CRequest.getRequest(url: CUrls.BaseUrl, suffix: CUrls.newmobiledashboardmodule.get_leadapi_getUtmDataStatusBased, method: .get, contentType: .urlencode, params: ["textId":self.dateid,"typeId":self.leadtype_id,"month":"","year":"","empId":selectedserviceemployessste,"fromDate":self.fromdate,"toDate":self.todate,"utmSource":self.maincategory_id,"utmMedium":self.subcategoryid,"utmCampaign":self.sourcecampignid], headers: ["Authorization": "Bearer " ,"X-Device-Imei":imei,"Content-Type":"application/json"])) { (response, auth) in
            
                self.view.StopLoading()
        //    self.activityloader.isHidden = true

            if auth {
                sectionExpiredClass.ClearData(controller: self)
            }
            else {
                self.leadbystatuslistarr.removeAll()
           
                switch response.result {
                
                case .success(let jsonResponse):
                    
                    if jsonResponse.responseType.isSuccess {
                        
                        print("get_leadapi_getUtmDataStatusBased:" + "\(jsonResponse.response)");
                        
                        let main = jsonResponse.response.dictionaryValue
                        
                        let UtmCampaignStatusData = main["UtmCampaignStatusData"]?.arrayValue
                        
                        UtmCampaignStatusData!.forEach({ (obj) in
                            self.leadbystatuslistarr.append(UtmCampaignStatusDataModelClass.init(data: obj))
                        })
                        self.followupstatusdataTableView.reloadData()
                        if self.leadbystatuslistarr.count == 0 {
                            
                        }else{
                            self.leadbystatuslistarr[0].is_select = true
                            self.leadbystatusid = self.leadbystatuslistarr[0].status_name
                    }
                        
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
    
    func totalsaleslistServiceCall() {
        if !InternetReachable.ValidateInternet {
            Message.NoInternetAlert(self)
            return
        }
        
        var selectedepmloyees = [String]()

        for k in allemployeelistarr.enumerated() {
            if self.allemployeelistarr[k.offset].is_seleceted {
                selectedepmloyees.append(String(self.allemployeelistarr[k.offset].employee_id))
                
            }

        }

        let stypeselectedemployeesstr = selectedepmloyees
        let selectedserviceemployessste = selectedepmloyees.joined(separator: ",")
    
        let imei = UIDevice.current.clientID
       
            self.view.StartLoading()

        Webservice().call(cRequest: CRequest.getRequest(url: CUrls.BaseUrl, suffix: CUrls.newmobiledashboardmodule.get_salesDataForIpadNew_getSalesDataForIpad, method: .get, contentType: .urlencode, params: ["id":self.newsales_id], headers: ["Authorization": "Bearer " ,"X-Device-Imei":imei,"Content-Type":"application/json"])) { (response, auth) in
            
                self.view.StopLoading()
        //    self.activityloader.isHidden = true

            if auth {
                sectionExpiredClass.ClearData(controller: self)
            }
            else {
                self.totalsaleslistarr.removeAll()
                self.Consolidatalistarr.removeAll()
                self.salesdurationdatalistarr.removeAll()
           
                switch response.result {
                
                case .success(let jsonResponse):
                    
                    if jsonResponse.responseType.isSuccess {
                        
                        print("get_leadapi_getTotalSaleData:" + "\(jsonResponse.response)");
                        
                        let main = jsonResponse.response.dictionaryValue
                        
                        let SalesDataForIpad = main["SalesDataForIpad"]?.arrayValue
                        SalesDataForIpad!.forEach({ (obj) in
                            self.Consolidatalistarr.append(SalesDataForIpadModelClass.init(data: obj))
                        })
                        if self.Consolidatalistarr.count == 0 {
                            
                        }else{
                        
                            self.btocwarrantypackagetotalcountLabel.text! = "--"
                            self.btocinspectionpackagetotalcountLabel.text! = "--"
                            self.avgsaletimedaysLabel.text! = "--"
                            
                            
                            let totalSales = self.Consolidatalistarr[0].category_name

                                    // Capitalize the first letter and add it to the UILabel
                            let capitalizedTotalSales = (totalSales?.prefix(1).capitalized ?? "") + (totalSales?.dropFirst() ?? "")

                            self.totalsalestitleLabel.text = capitalizedTotalSales
                            
                                    self.totalsalesamount = self.Consolidatalistarr[0].sales_sum
                                    self.btobsaleamount = self.Consolidatalistarr[1].sales_sum
                                    self.btocsalesamount = self.Consolidatalistarr[2].sales_sum
                            
                                    let amount: Double = self.totalsalesamount
                                    let numberFormatter = NumberFormatter()
                                    numberFormatter.numberStyle = .decimal
                                    numberFormatter.groupingSeparator = ","
                                    
                                    if let formattedAmount = numberFormatter.string(from: NSNumber(value: amount)) {
                                        let displayAmount = "Rs. " + formattedAmount
                                        self.salestotalamountLabel.text = displayAmount
                                    }
                            
                                    self.percentageoftotalsalesLabel.text! = String(self.Consolidatalistarr[1].percent) + "%"
                            
                                    self.bttocpercentageLabel.text! = String(self.Consolidatalistarr[2].percent) + "%"
                            
                                    self.dmtitleLabel.text! = self.Consolidatalistarr[1].category_name
                            
                                    let dmamount: Double = self.Consolidatalistarr[1].sales_sum
                                    let dmnumberFormatter = NumberFormatter()
                                    dmnumberFormatter.numberStyle = .decimal
                                    dmnumberFormatter.groupingSeparator = ","
                                    
                                    if let dmformattedAmount = dmnumberFormatter.string(from: NSNumber(value: dmamount)) {
                                        let dmdisplayAmount = "Rs. " + dmformattedAmount
                                        self.dmamountLabel.text = dmdisplayAmount
                                    }
                            if self.dmamountLabel.text! == "" || self.dmamountLabel.text == "Rs. 0" {
                                self.dealerstitleunderlineLabel.isHidden = true
                                self.dealerpurchaseddataBtn.isHidden = true
                            }else{
                                self.dealerstitleunderlineLabel.isHidden = true
                                self.dealerpurchaseddataBtn.isHidden = true
                            }

                            self.dmpercentageLabel.text! = String(self.Consolidatalistarr[1].total_count)
                            
                            self.whatsapptitleLabel.text! = self.Consolidatalistarr[2].category_name

                            let btocapiAmount = self.Consolidatalistarr[2].sales_sum

                                    // Create a NumberFormatter instance
                            let btocnumberFormatter = NumberFormatter()
                            btocnumberFormatter.numberStyle = .decimal
                            btocnumberFormatter.groupingSeparator = ","
                            btocnumberFormatter.groupingSize = 3

                            // Format the amount using the number formatter
                            if let btocformattedAmount = btocnumberFormatter.string(from: NSNumber(value: btocapiAmount ?? 0.0)) {
                                self.whatsappamountLabel.text! = "Rs. " + btocformattedAmount
                            } else {
                                self.whatsappamountLabel.text! = "Invalid amount"
                            }
                            
                            self.whatsapppercentageLabel.text! = String(self.Consolidatalistarr[2].total_count)
                            
                            
                            let btocwarrantyAmount = self.Consolidatalistarr[3].sales_sum

                                    // Create a NumberFormatter instance
                            let btocwarrntynumberFormatter = NumberFormatter()
                            btocwarrntynumberFormatter.numberStyle = .decimal
                            btocwarrntynumberFormatter.groupingSeparator = ","
                            btocwarrntynumberFormatter.groupingSize = 3

                            // Format the amount using the number formatter
                            if let btocwformattedAmount = btocwarrntynumberFormatter.string(from: NSNumber(value: btocwarrantyAmount ?? 0.0)) {
                                self.bttocwarrantysaletotalamountLabel.text! = "Rs." + btocwformattedAmount
                            } else {
                                self.bttocwarrantysaletotalamountLabel.text! = "Invalid amount"
                            }
                            
                            self.btocsalewarrantyamount = self.Consolidatalistarr[3].sales_sum
                            self.btocsalewarrantycount = self.Consolidatalistarr[3].total_count

                            if self.btocsalewarrantycount != 0 {
                                self.totalavgsalewarranty = Double(self.btocsalewarrantyamount) / Double(self.btocsalewarrantycount)
                                let roundedAverage = String(format: "%.f", self.totalavgsalewarranty)
                                    print("The average is: \(roundedAverage)")
                             //   self.btocwarrantypackagetotalcountLabel.text! = String(self.Consolidatalistarr[3].total_count) + "(" + String(roundedAverage) + ")"
                                
                                let totalCount = self.Consolidatalistarr[3].total_count
                                let labelText = "\(totalCount ?? 0) (\(roundedAverage))"

                                let attributedText = NSMutableAttributedString(string: labelText)

                                // Set the custom font "Gilroy-Regular" with size 17 for self.Consolidatalistarr[3].total_count
                                let totalCountRange = (labelText as NSString).range(of: "\(totalCount ?? 0)")
                                let totalCountFont = UIFont(name: "Gilroy-Medium", size: 17) ?? UIFont.systemFont(ofSize: 17)
                                attributedText.addAttribute(.font, value: totalCountFont, range: totalCountRange)

                                // Set the custom font "Gilroy-Regular" with size 13 for roundedAverage
                                let roundedAverageRange = (labelText as NSString).range(of: "\(roundedAverage)")
                                let roundedAverageFont = UIFont(name: "Gilroy-Medium", size: 13) ?? UIFont.systemFont(ofSize: 13)
                                attributedText.addAttribute(.font, value: roundedAverageFont, range: roundedAverageRange)

                                // Set the attributed text to the label
                                self.btocwarrantypackagetotalcountLabel.attributedText = attributedText
                                
                            } else {
                                print("Cannot divide by zero. Count should not be zero.")
                            }
                            
                            
                            let btocinspAmount = self.Consolidatalistarr[4].sales_sum

                                    // Create a NumberFormatter instance
                            let btocinspectionnumberFormatter = NumberFormatter()
                            btocinspectionnumberFormatter.numberStyle = .decimal
                            btocinspectionnumberFormatter.groupingSeparator = ","
                            btocinspectionnumberFormatter.groupingSize = 3

                            // Format the amount using the number formatter
                            if let btocinspectionformattedAmount = btocinspectionnumberFormatter.string(from: NSNumber(value: btocinspAmount ?? 0.0)) {
                                self.btocinspectiontotalamountLabel.text! = "Rs." + btocinspectionformattedAmount
                            } else {
                                self.btocinspectiontotalamountLabel.text! = "Invalid amount"
                            }
                            
                            self.btocsaleinspectionamount = self.Consolidatalistarr[4].sales_sum
                            self.btocsaleinspectioncount = self.Consolidatalistarr[4].total_count

                            if self.btocsaleinspectioncount != 0 {
                                self.totalavgsaleinspection = Double(self.btocsaleinspectionamount) / Double(self.btocsaleinspectioncount)
                                let insproundedAverage = String(format: "%.f", self.totalavgsaleinspection)
                                    print("The average is: \(insproundedAverage)")
                            //    self.btocinspectionpackagetotalcountLabel.text! = String(self.Consolidatalistarr[4].total_count) + "(" + String(insproundedAverage) + ")"
                                
                                let insptotalCount = self.Consolidatalistarr[4].total_count
                                let insplabelText = "\(insptotalCount ?? 0) (\(insproundedAverage))"

                                let attributedText = NSMutableAttributedString(string: insplabelText)

                                // Set the custom font "Gilroy-Regular" with size 17 for self.Consolidatalistarr[3].total_count
                                let totalCountRange = (insplabelText as NSString).range(of: "\(insptotalCount ?? 0)")
                                let totalCountFont = UIFont(name: "Gilroy-Medium", size: 17) ?? UIFont.systemFont(ofSize: 17)
                                attributedText.addAttribute(.font, value: totalCountFont, range: totalCountRange)

                                // Set the custom font "Gilroy-Regular" with size 13 for roundedAverage
                                let roundedAverageRange = (insplabelText as NSString).range(of: "\(insproundedAverage)")
                                let roundedAverageFont = UIFont(name: "Gilroy-Medium", size: 13) ?? UIFont.systemFont(ofSize: 13)
                                attributedText.addAttribute(.font, value: roundedAverageFont, range: roundedAverageRange)

                                // Set the attributed text to the label
                                self.btocinspectionpackagetotalcountLabel.attributedText = attributedText
                                
                            } else {
                                print("Cannot divide by zero. Count should not be zero.")
                            }
                            
                            
                            let btocservicepAmount = self.Consolidatalistarr[5].sales_sum

                                    // Create a NumberFormatter instance
                            let btocservnumberFormatter = NumberFormatter()
                            btocservnumberFormatter.numberStyle = .decimal
                            btocservnumberFormatter.groupingSeparator = ","
                            btocservnumberFormatter.groupingSize = 3

                            // Format the amount using the number formatter
                            if let btocseformattedAmount = btocservnumberFormatter.string(from: NSNumber(value: btocservicepAmount ?? 0.0)) {
                                self.btocservicetotalamountLabel.text! = "Rs." + btocseformattedAmount
                            } else {
                                self.btocservicetotalamountLabel.text! = "Invalid amount"
                            }
                            
                            self.btocsaleserviceamount = self.Consolidatalistarr[5].sales_sum
                            self.btocsaleservicecount = self.Consolidatalistarr[5].total_count
                            
                            self.btocservicepackagetotalcountLabel.text! = "--"

                            if self.btocsaleservicecount != 0 {
                                self.totalavgsaleservice = Double(self.btocsaleserviceamount) / Double(self.btocsaleservicecount)
                                let serviceroundedAverage = String(format: "%.f", self.totalavgsaleservice)
                                    print("The average is: \(serviceroundedAverage)")
                         //       self.btocservicepackagetotalcountLabel.text! = String(self.Consolidatalistarr[5].total_count) + "(" + String(serviceroundedAverage) + ")"
                                
                                let servicetotalCount = self.Consolidatalistarr[5].total_count
                                let servicelabelText = "\(servicetotalCount ?? 0) (\(serviceroundedAverage))"

                                let attributedText = NSMutableAttributedString(string: servicelabelText)

                                // Set the custom font "Gilroy-Regular" with size 17 for self.Consolidatalistarr[3].total_count
                                let totalCountRange = (servicelabelText as NSString).range(of: "\(servicetotalCount ?? 0)")
                                let totalCountFont = UIFont(name: "Gilroy-Medium", size: 17) ?? UIFont.systemFont(ofSize: 17)
                                attributedText.addAttribute(.font, value: totalCountFont, range: totalCountRange)

                                // Set the custom font "Gilroy-Regular" with size 13 for roundedAverage
                                let roundedAverageRange = (servicelabelText as NSString).range(of: "\(serviceroundedAverage)")
                                let roundedAverageFont = UIFont(name: "Gilroy-Medium", size: 13) ?? UIFont.systemFont(ofSize: 13)
                                attributedText.addAttribute(.font, value: roundedAverageFont, range: roundedAverageRange)

                                // Set the attributed text to the label
                                self.btocservicepackagetotalcountLabel.attributedText = attributedText
                                
                                
                            } else {
                                print("Cannot divide by zero. Count should not be zero.")
                            }
                            
                            
                        }
                        
//                        let TotalSaleData = main["TotalSaleData"]?.arrayValue
//
//                        TotalSaleData!.forEach({ (obj) in
//                            self.totalsaleslistarr.append(TotalSaleDataModelClass.init(data: obj))
//                        })
                   //     self.salesdatabasedonsourceCollectionView.reloadData()

                        let SaleDurationData = main["SaleDurationData"]?.arrayValue

                        SaleDurationData!.forEach({ (obj) in
                            self.salesdurationdatalistarr.append(SaleDurationDataModelClass.init(data: obj))
                        })

                        self.avgsaletimedaysLabel.text! = self.salesdurationdatalistarr[0].tat
                       
                        
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
    
    
    func leadsbystatusbarchartServiceCall() {
        if !InternetReachable.ValidateInternet {
            Message.NoInternetAlert(self)
            return
        }
        
        if self.maincategory_id == "All" {
            self.maincategory_id = ""
        }else{
            
        }
        
        if self.subcategoryid == "All" {
            self.subcategoryid = ""
        }else{
            
        }
        
        if self.sourcecampignid == "All" {
            self.sourcecampignid = ""
        }else{
            
        }
        
        var selectedepmloyees = [String]()

        for k in allemployeelistarr.enumerated() {
            if self.allemployeelistarr[k.offset].is_seleceted {
                selectedepmloyees.append(String(self.allemployeelistarr[k.offset].employee_id))
                
            }

        }

        let stypeselectedemployeesstr = selectedepmloyees
        let selectedserviceemployessste = selectedepmloyees.joined(separator: ",")
    
        let imei = UIDevice.current.clientID
       
            self.view.StartLoading()
        
        //self.employemobilenumberLabel.text = data[""]
        
        Webservice().call(cRequest: CRequest.getRequest(url: CUrls.BaseUrl, suffix: CUrls.newmobiledashboardmodule.get_leadapi_getUtmDataStatusBased, method: .get, contentType: .urlencode, params: ["textId":self.dateid,"typeId":self.leadtype_id,"month":"","year":"","empId":selectedserviceemployessste,"fromDate":self.fromdate,"toDate":self.todate,"utmSource":self.maincategory_id,"utmMedium":self.subcategoryid,"utmCampaign":self.sourcecampignid], headers: ["Authorization": "Bearer " ,"X-Device-Imei":imei,"Content-Type":"application/json"])) { (response, auth) in
            
                self.view.StopLoading()
        //    self.activityloader.isHidden = true

            if auth {
                sectionExpiredClass.ClearData(controller: self)
            }
            else {
                self.leadsbystatusbarlistarr.removeAll()
           
                switch response.result {
                
                case .success(let jsonResponse):
                    
                    if jsonResponse.responseType.isSuccess {
                        
                        print("get_leadapi_getUtmDataStatusBased:" + "\(jsonResponse.response)");
                        
                        let main = jsonResponse.response.dictionaryValue
                        
                        let UtmCampaignStatusData = main["UtmCampaignStatusData"]?.arrayValue
                      
                        UtmCampaignStatusData!.forEach({ (obj) in
                            self.leadsbystatusbarlistarr.append(UtmCampaignStatusDataModelClass.init(data: obj))
                           
                        })
                        
                        if self.leadsbystatusbarlistarr.count == 0 || self.leadsbystatusbarlistarr.count == nil {
                            
                            self.leadsbystatusbarlistarr.removeAll()
                            
                        }else{
                            
                            let chartView = HIChartView(frame: self.statusbarchartView.bounds)

                               let options = HIOptions()

                               let chart = HIChart()
                               chart.type = "bar"
                               options.chart = chart
                              chart.backgroundColor = HIColor.init(hexValue: "ffffff")


                               let title = HITitle()
                               title.text = ""
                               options.title = title



                               let subtitle = HISubtitle()
                               subtitle.text = ""
                               options.subtitle = subtitle


                               let accessibility = HIAccessibility()

                               options.accessibility = accessibility
                            let exporting = HIExporting()
                                   exporting.enabled = false
                                   options.exporting = exporting



                            let credits = HICredits()
                            credits.enabled = false
                            options.credits = credits


                            let xAxis = HIXAxis()
                            xAxis.type = "category"
                            xAxis.title = HITitle()
                            xAxis.title.text = " "
                            options.xAxis = [xAxis]




                               let yAxis = HIYAxis()
                               yAxis.title = HITitle()
                               yAxis.title.text = ""
                               options.yAxis = [yAxis]
                            yAxis.labels = HILabels()
                            yAxis.labels.style = HIStyle()
                            yAxis.labels.style.color = "#000000"
                           yAxis.title.style = HIStyle()
                            yAxis.title.style.color = "#000000"
                            yAxis.gridLineColor = .init(uiColor: UIColor.clear)

                               let legend = HILegend()
                               legend.enabled = false
                               options.legend = legend


                            let plotOptions = HIPlotOptions()
                                     plotOptions.column = HIColumn()
                                     plotOptions.column.borderWidth = 0
                                     let dataLabels = HIDataLabels()
                                     dataLabels.enabled = true
                                     dataLabels.format = "{point.y:.1f}%"
                                     // plotOptions.column.dataLabels = [dataLabels]
                                   plotOptions.series = HISeries()
                                   plotOptions.series.dataLabels = HIDataLabels()
                                   plotOptions.series.dataLabels.enabled = true
                                plotOptions.series.dataLabels.color = HIColor.init(hexValue: "0000000")
                                plotOptions.series.dataLabels.borderColor = HIColor.init(hexValue: "000000")
                                plotOptions.series.label = HILabel()

                                     options.plotOptions = plotOptions


                            if self.leadtypecountorper == "N" {

                            }else{
                                let tooltip = HITooltip()
                                tooltip.headerFormat = "<span style=\"font-size:11px\">{series.name}</span><br>"
                                tooltip.pointFormat = "<span style=\"color:{point.color}\">{point.name}</span>: <b>{point.y:.2f}%</b> of total<br/>"
                                tooltip.enabled = false
                                options.tooltip = tooltip

                            }

                               let browsers = HIColumn()
                               browsers.name = "Status"
                               browsers.colorByPoint = true

                            var countData: [HIData] = []
                            var percentageData: [HIData] = []

                            for index in 0..<min(10, self.leadsbystatusbarlistarr.count) {
                                let countItem = HIData()
                                countItem.name = self.leadsbystatusbarlistarr[index].status_name
                                countItem.y = self.leadsbystatusbarlistarr[index].count as NSNumber?
                                countData.append(countItem)
                                
//                                let percentageItem = HIData()
//                                percentageItem.name = self.leadsbystatusbarlistarr[index].status_name
//                                percentageItem.y = self.leadsbystatusbarlistarr[index].percent as NSNumber?
//                                percentageData.append(percentageItem)
                            }

                            // Create two series for count and percentage
                            let countSeries = HIColumn()
                            countSeries.name = "Count"
                            countSeries.data = countData

                            let percentageSeries = HIColumn()
                            percentageSeries.name = "Percentage"
                            percentageSeries.data = percentageData

                            // Add both series to the options
                            options.series = [countSeries, percentageSeries]

                            // Set the number of x-axis categories
                            xAxis.categories = self.leadsbystatusbarlistarr.map { $0.status_name }
                            
                            options.credits = HICredits()
                            options.credits.enabled = false

                            // Assign the modified options to the chartView
                            chartView.options = options

                            // Add the chartView to the statusbarchartView
                            self.statusbarchartView.addSubview(chartView)

                        }
                        
                        
                        if self.leadsbystatusbarlistarr.count == 0 || self.leadsbystatusbarlistarr.count == nil {
                            
                            self.leadsbystatusbarlistarr.removeAll()
                         
                        }else{
                    
                            let criclechartView = HIChartView(frame: self.statuspiechartView.bounds)
                            let cricleoptions = HIOptions()
                            let criclechart = HIChart()
                            criclechart.type = "pie"
                            cricleoptions.chart = criclechart
                            criclechart.backgroundColor = HIColor.init(hexValue: "ffffff")
                            
                            let exporting = HIExporting()
                            exporting.enabled = false
                            cricleoptions.exporting = exporting
                            

                            // ...
                            let tooltip = HITooltip()
                         //   tooltip.headerFormat = "{series.name}: <b>{point.y:.2f}%</b>"
                            tooltip.pointFormat = "{series.name}: <b>{point.y:.2f}%</b>"
//                            tooltip.pointFormat = "<span style=\"color:{point.color}\">{point.name}</span>: <b>{point.y:.2f}%</b> of total<br/>"
                            tooltip.enabled = false
                            cricleoptions.tooltip = tooltip

                            let brands = HIPie()
                            brands.name = "Value"

                            var dataArr: [HIData] = []
                            let colors: [UIColor] = [.green, .blue, .orange]

                            for index in 0..<min(10, self.leadsbystatusbarlistarr.count) {
                                let data = HIData()
                             //   data.name = self.leadsbystatusbarlistarr[index].status_name
                                
                              //  data.y = self.leadsbystatusbarlistarr[index].count_1 as NSNumber?
                                let totalCount = Double(self.leadsbystatusbarlistarr.reduce(0) { $0 + ($1.percent ?? 0) })
                                let count = Double(self.leadsbystatusbarlistarr[index].percent ?? 0)
                                let percentage = count / totalCount * 100.0
                              //  data.y = NSNumber(value: percentage)
                                let formattedPercentage = String(format: "%.2f", percentage)
                                data.name = "\(self.leadsbystatusbarlistarr[index].status_name ?? ""): \(formattedPercentage)%"
                                data.y = NSNumber(value: percentage)
                                data.color = HIColor.init(uiColor: colors[index % colors.count])
                            //    data.color = HIColor.init(hexValue: package.color)  // Coming from API
                                
                                dataArr.append(data)
                                
                            }

                            brands.data = dataArr

                            // ...

                            cricleoptions.series = [brands]
                            criclechartView.options = cricleoptions
                            cricleoptions.title = HITitle()
                            cricleoptions.title.text = ""
                            cricleoptions.credits = HICredits()
                            cricleoptions.credits.enabled = false
                            criclechartView.options = cricleoptions
                            self.statuspiechartView.addSubview(criclechartView)
                        
                            
                        }
                        
                       
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
    
    
    func inspectiontypelistServiceCall() {
        if !InternetReachable.ValidateInternet {
            Message.NoInternetAlert(self)
            return
        }
        
        if self.maincategory_id == "All" {
            self.maincategory_id = ""
        }else{
            
        }
        
        if self.subcategoryid == "All" {
            self.subcategoryid = ""
        }else{
            
        }
        
        if self.sourcecampignid == "All" {
            self.sourcecampignid = ""
        }else{
            
        }
        
        var selectedepmloyees = [String]()

        for k in allemployeelistarr.enumerated() {
            if self.allemployeelistarr[k.offset].is_seleceted {
                selectedepmloyees.append(String(self.allemployeelistarr[k.offset].employee_id))
                
            }

        }

        let stypeselectedemployeesstr = selectedepmloyees
        let selectedserviceemployessste = selectedepmloyees.joined(separator: ",")
     
       
        let imei = UIDevice.current.clientID
       
            self.view.StartLoading()

        Webservice().call(cRequest: CRequest.getRequest(url: CUrls.BaseUrl, suffix: CUrls.newmobiledashboardmodule.get_leadapi_getInspTypeListNewChanges, method: .get, contentType: .urlencode, params: ["textId":self.dateid,"month":"","year":"","empId":selectedserviceemployessste,"fromDate":self.fromdate,"toDate":self.todate,"utmSource":self.maincategory_id,"utmMedium":self.subcategoryid,"utmCampaign":self.sourcecampignid,"typeId":self.leadtype_id], headers: ["Authorization": "Bearer " ,"X-Device-Imei":imei,"Content-Type":"application/json"])) { (response, auth) in
            
                self.view.StopLoading()
        

            if auth {
                sectionExpiredClass.ClearData(controller: self)
            }
            else {
                self.inspheadingslistarr.removeAll()
           
                switch response.result {
                
                case .success(let jsonResponse):
                    
                    if jsonResponse.responseType.isSuccess {
                        
                        print("get_leadapi_getInspTypeListNewChanges:" + "\(jsonResponse.response)");
                        
                        let main = jsonResponse.response.dictionaryValue
                        
                        let InspTypeListNew = main["InspTypeListNew"]?.arrayValue

                        InspTypeListNew!.forEach({ (obj) in
                            self.inspheadingslistarr.append(InspTypeListModelClass.init(data: obj))
                        })
                        if self.inspheadingslistarr.count == 0 {
                            
                        }else{
                            self.inspheadingslistarr[0].selected = true
                            self.inspectiontype_id = self.inspheadingslistarr[0].id
                            self.allinspectionscountlistServiceCall()
                        }
                       
                        self.inspectionsdataCollectionView.reloadData()
                        
                        
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
    
    func allinspectionscountlistServiceCall() {
        if !InternetReachable.ValidateInternet {
            Message.NoInternetAlert(self)
            return
        }
        
        if self.maincategory_id == "All" {
            self.maincategory_id = ""
        }else{
            
        }
        
        if self.subcategoryid == "All" {
            self.subcategoryid = ""
        }else{
            
        }
        
        if self.sourcecampignid == "All" {
            self.sourcecampignid = ""
        }else{
            
        }
        
        var selectedepmloyees = [String]()

        for k in allemployeelistarr.enumerated() {
            if self.allemployeelistarr[k.offset].is_seleceted {
                selectedepmloyees.append(String(self.allemployeelistarr[k.offset].employee_id))
                
            }
            
        }

        let stypeselectedemployeesstr = selectedepmloyees
        let selectedserviceemployessste = selectedepmloyees.joined(separator: ",")
        
        let imei = UIDevice.current.clientID
       
            self.view.StartLoading()

        Webservice().call(cRequest: CRequest.getRequest(url: CUrls.BaseUrl, suffix: CUrls.newmobiledashboardmodule.get_leadapi_getInspDataNew, method: .get, contentType: .urlencode, params: ["textId":self.dateid,"month":"","year":"","empId":selectedserviceemployessste,"fromDate":self.fromdate,"toDate":self.todate,"inspTypeId":self.inspectiontype_id,"utmSource":self.maincategory_id,"utmMedium":self.subcategoryid,"utmCampaign":self.sourcecampignid,"typeId":self.leadtype_id], headers: ["Authorization": "Bearer " ,"X-Device-Imei":imei,"Content-Type":"application/json"])) { (response, auth) in
            
                self.view.StopLoading()
        //    self.activityloader.isHidden = true

            if auth {
                sectionExpiredClass.ClearData(controller: self)
            }
            else {
                self.allinspectionscountlistarr.removeAll()
           
                switch response.result {
                
                case .success(let jsonResponse):
                    
                    if jsonResponse.responseType.isSuccess {
                        
                        print("get_leadapi_getInspDataNew:" + "\(jsonResponse.response)");
                        
                        let main = jsonResponse.response.dictionaryValue
                        
                        let InspData = main["InspData"]?.arrayValue
                        
                        InspData!.forEach({ (obj) in
                            self.allinspectionscountlistarr.append(InspDataModelClass.init(data: obj))
                        })
                       
                        self.allinspectionsstatusdataTableView.reloadData()
                        
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
    
    
    func leadsummarytypelistServiceCall() {
        if !InternetReachable.ValidateInternet {
            Message.NoInternetAlert(self)
            return
        }
        
        if self.maincategory_id == "All" {
            self.maincategory_id = ""
        }else{
            
        }
        
        if self.subcategoryid == "All" {
            self.subcategoryid = ""
        }else{
            
        }
        
        if self.sourcecampignid == "All" {
            self.sourcecampignid = ""
        }else{
            
        }
        
        var selectedepmloyees = [String]()

        for k in allemployeelistarr.enumerated() {
            if self.allemployeelistarr[k.offset].is_seleceted {
                selectedepmloyees.append(String(self.allemployeelistarr[k.offset].employee_id))
                
            }

        }

        let stypeselectedemployeesstr = selectedepmloyees
        let selectedserviceemployessste = selectedepmloyees.joined(separator: ",")
     
        let imei = UIDevice.current.clientID
       
            self.view.StartLoading()

        Webservice().call(cRequest: CRequest.getRequest(url: CUrls.BaseUrl, suffix: CUrls.newmobiledashboardmodule.get_leadapi_getLeadSummaryDashboard, method: .get, contentType: .urlencode, params: ["textId":self.leadsummarylastmonthortismonth_id,"month":self.selectleadsummary_amountmonth,"year":self.selectleadsummary_amountyear,"empId":selectedserviceemployessste,"fromDate":"","toDate":"","utmSource":self.maincategory_id,"utmMedium":self.subcategoryid,"utmCampaign":self.sourcecampignid,"typeId":self.leadtype_id,"inspTypeId":""], headers: ["Authorization": "Bearer " ,"X-Device-Imei":imei,"Content-Type":"application/json"])) { (response, auth) in
            
                self.view.StopLoading()
        

            if auth {
                sectionExpiredClass.ClearData(controller: self)
            }
            else {
                self.leadsummarytypelistarr.removeAll()
           
                switch response.result {
                
                case .success(let jsonResponse):
                    
                    if jsonResponse.responseType.isSuccess {
                        
                        print("get_leadapi_getInspTypeListNewChanges:" + "\(jsonResponse.response)");
                        
                        let main = jsonResponse.response.dictionaryValue
                        if let leadsummarydashboard = main["leadsummarydashboard"]?.arrayValue {
                            if leadsummarydashboard.count > 1 {
                                // Store the first element that we removed
                                let firstElement = leadsummarydashboard[0]
                                
                                // Add the remaining elements to self.leadsummarytypelistarr
                                leadsummarydashboard.dropFirst().forEach { obj in
                                    self.leadsummarytypelistarr.append(leadsummarydashboardModelClass(data: obj))
                                }
                                
                                // Display the count of the first element in self.leadsummarytotalleadscountLabel.text
                                if let count = firstElement["count"].int {
                                    self.leadsummarytotalleadcountLabel.text = "\(count)"
                                } else {
                                    // Handle the case when the count of the first element is not available or not an integer
                                }
                                
                                if self.leadsummarytypelistarr.isEmpty {
                                    // Handle the case when leadsummarytypelistarr is empty
                                } else {
                                    self.leadsummarytypelistarr[0].is_selected = true
                                    self.leadsummarytype_id = self.leadsummarytypelistarr[0].insp_type_id
                                    self.leadssummarylistServiceCall()
                                }
                                self.leadsummarydataCollectionView.reloadData()
                            } else {
                                // Handle the case when leadsummarydashboard has less than 2 elements
                            }
                        } else {
                            // Handle the case when leadsummarydashboard is nil or not an array
                        }



                        
                        
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
    
    func leadssummarylistServiceCall() {
        if !InternetReachable.ValidateInternet {
            Message.NoInternetAlert(self)
            return
        }
        
        if self.maincategory_id == "All" {
            self.maincategory_id = ""
        }else{
            
        }
        
        if self.subcategoryid == "All" {
            self.subcategoryid = ""
        }else{
            
        }
        
        if self.sourcecampignid == "All" {
            self.sourcecampignid = ""
        }else{
            
        }
        
        var selectedepmloyees = [String]()

        for k in allemployeelistarr.enumerated() {
            if self.allemployeelistarr[k.offset].is_seleceted {
                selectedepmloyees.append(String(self.allemployeelistarr[k.offset].employee_id))
                
            }

        }

        let stypeselectedemployeesstr = selectedepmloyees
        let selectedserviceemployessste = selectedepmloyees.joined(separator: ",")
        
       
        let imei = UIDevice.current.clientID
       
            self.view.StartLoading()

        Webservice().call(cRequest: CRequest.getRequest(url: CUrls.BaseUrl, suffix: CUrls.newmobiledashboardmodule.get_leadapi_getLeadSummaryNew, method: .get, contentType: .urlencode, params: ["textId":self.leadsummarylastmonthortismonth_id,"month":self.selectleadsummary_amountmonth,"year":self.selectleadsummary_amountyear,"empId":selectedserviceemployessste,"fromDate":self.fromdate,"toDate":self.todate,"inspTypeId":self.leadsummarytype_id,"inspStatus":self.insp_status,"utmSource":self.maincategory_id,"utmMedium":self.subcategoryid,"utmCampaign":self.sourcecampignid,"typeId":self.leadtype_id], headers: ["Authorization": "Bearer " ,"X-Device-Imei":imei,"Content-Type":"application/json"])) { (response, auth) in
            
                self.view.StopLoading()

            if auth {
                sectionExpiredClass.ClearData(controller: self)
            }
            else {
                self.leadsummarylistarr.removeAll()
           
                switch response.result {
                
                case .success(let jsonResponse):
                    
                    if jsonResponse.responseType.isSuccess {
                        
                        print("get_leadapi_getLeadSummaryNew:" + "\(jsonResponse.response)");
                        
                        let main = jsonResponse.response.dictionaryValue
                        
                        let leadSummary = main["leadSummary"]?.arrayValue
                        
                        leadSummary!.forEach({ (obj) in
                            self.leadsummarylistarr.append(LeadSummaryModelClass.init(data: obj))
                        })
                        
                        self.lsdataTableView.reloadData()
                      
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
    
    
    func followupleadagingemplistServiceCall() {
        if !InternetReachable.ValidateInternet {
            Message.NoInternetAlert(self)
            return
        }
        
        let imei = UIDevice.current.clientID
       
            self.view.StartLoading()

        Webservice().call(cRequest: CRequest.getRequest(url: CUrls.BaseUrl, suffix: CUrls.newmobiledashboardmodule.get_leadapi_GetFollowUpEmpList, method: .get, contentType: .urlencode, params: [:], headers: ["Authorization": "Bearer " ,"X-Device-Imei":imei,"Content-Type":"application/json"])) { (response, auth) in
            
                self.view.StopLoading()
        //    self.activityloader.isHidden = true

            if auth {
                sectionExpiredClass.ClearData(controller: self)
            }
            else {
                self.followupleadagingemplistarr.removeAll()
                switch response.result {
                
                case .success(let jsonResponse):
                    
                    if jsonResponse.responseType.isSuccess {
                        
                        print("get_leadapi_GetFollowUpEmpList:" + "\(jsonResponse.response)");
                        
                        let main = jsonResponse.response.dictionaryValue
                        
                        let FollowUpEmpList = main["FollowUpEmpList"]?.arrayValue

                        FollowUpEmpList!.forEach({ (obj) in
                            self.followupleadagingemplistarr.append(FollowUpEmpListModelClass.init(data: obj))
                        })
                    
                        self.followupleadagingemplistarr[0].is_selected = true
                        self.followupleadagingemp_id = self.followupleadagingemplistarr[0].employee_id
                        self.empdataoffollowupleadaggingCollectionView.reloadData()
                        self.followupleadagingstatuslistServiceCall()

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
    
    func followupleadagingstatuslistServiceCall() {
        if !InternetReachable.ValidateInternet {
            Message.NoInternetAlert(self)
            return
        }
        if self.maincategory_id == "All" {
            self.maincategory_id = ""
        }else{
            
        }
        
        if self.subcategoryid == "All" {
            self.subcategoryid = ""
        }else{
            
        }
        
        if self.sourcecampignid == "All" {
            self.sourcecampignid = ""
        }else{
            
        }
     
       
        let imei = UIDevice.current.clientID
       
            self.view.StartLoading()

        Webservice().call(cRequest: CRequest.getRequest(url: CUrls.BaseUrl, suffix: CUrls.newmobiledashboardmodule.get_leadapi_getFollowUpStatusList, method: .get, contentType: .urlencode, params: ["fromDate":"","toDate":"","textId":"","typeId":self.leadtype_id,"empId":self.followupleadagingemp_id,"month":"","year":"","utmSource":"","utmMedium":"","utmCampaign":""], headers: ["Authorization": "Bearer " ,"X-Device-Imei":imei,"Content-Type":"application/json"])) { (response, auth) in
            
                self.view.StopLoading()
        

            if auth {
                sectionExpiredClass.ClearData(controller: self)
            }
            else {
                self.followupstatuslistarr.removeAll()
           
                switch response.result {
                
                case .success(let jsonResponse):
                    
                    if jsonResponse.responseType.isSuccess {
                        
                        print("get_leadapi_getFollowUpStatusList:" + "\(jsonResponse.response)");
                        
                        let main = jsonResponse.response.dictionaryValue
                        
                        let FollowUpStatusList = main["FollowUpStatusList"]?.arrayValue

                        FollowUpStatusList!.forEach({ (obj) in
                            self.followupstatuslistarr.append(FollowUpStatusListModelClass.init(data: obj))
                        })
                        if self.followupstatuslistarr.count > 2 {
                            self.htOffollowupleadaggingstatusView.constant = 100
                        }else{
                            self.htOffollowupleadaggingstatusView.constant = 50
                        }
                        self.followupleadagingstatusdataCollectionView.reloadData()
                        self.followupleaddatalistServiceCall()
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
    
    
    func followupleaddatalistServiceCall() {
        if !InternetReachable.ValidateInternet {
            Message.NoInternetAlert(self)
            return
        }
        
        if self.maincategory_id == "All" {
            self.maincategory_id = ""
        }else{
            
        }
        
        if self.subcategoryid == "All" {
            self.subcategoryid = ""
        }else{
            
        }
        
        if self.sourcecampignid == "All" {
            self.sourcecampignid = ""
        }else{
            
        }
        
        var selectedepmloyees = [String]()

        for k in allemployeelistarr.enumerated() {
            if self.allemployeelistarr[k.offset].is_seleceted {
                selectedepmloyees.append(String(self.allemployeelistarr[k.offset].employee_id))
                
            }

        }

        let stypeselectedemployeesstr = selectedepmloyees
        let selectedserviceemployessste = selectedepmloyees.joined(separator: ",")
        
        var followupstatusselected = [String]()

        for k in followupstatuslistarr.enumerated() {
            if self.followupstatuslistarr[k.offset].was_selected {
                followupstatusselected.append(self.followupstatuslistarr[k.offset].status_id)
                
            }

        }

        let followupleadagingselectedstatusstr = followupstatusselected
        let followupleadagingselectedstatusste = followupstatusselected.joined(separator: ",")
        
        let imei = UIDevice.current.clientID
       
            self.view.StartLoading()

        Webservice().call(cRequest: CRequest.getRequest(url: CUrls.BaseUrl, suffix: CUrls.newmobiledashboardmodule.get_leadapi_getLeadDataByFollowUp, method: .get, contentType: .urlencode, params: ["textId":self.followupagingselecteddate,"typeId":self.leadtype_id,"month":"","year":"","empId":self.followupleadagingemp_id,"fromDate":self.followupfromdate,"toDate":self.followuptodate,"utmSource":self.maincategory_id,"utmMedium":self.subcategoryid,"utmCampaign":self.sourcecampignid,"statusId":followupleadagingselectedstatusste], headers: ["Authorization": "Bearer " ,"X-Device-Imei":imei,"Content-Type":"application/json"])) { (response, auth) in
            
                self.view.StopLoading()

            if auth {
                sectionExpiredClass.ClearData(controller: self)
            }
            else {
                self.followupleadagelistarr.removeAll()
           
                switch response.result {
                
                case .success(let jsonResponse):
                    
                    if jsonResponse.responseType.isSuccess {
                        
                        print("get_leadapi_getLeadDataByFollowUp:" + "\(jsonResponse.response)");
                        
                        let main = jsonResponse.response.dictionaryValue
                        
                        let LeadDataByFollowUp = main["LeadDataByFollowUp"]?.arrayValue
                        
                        LeadDataByFollowUp!.forEach({ (obj) in
                            self.followupleadagelistarr.append(LeadDataByFollowUpModelClass.init(data: obj))
                        })
                        
                        self.followupleadagedataTableView.reloadData()
                      
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
    
    
    func leadstatusdatalistServiceCall() {
        if !InternetReachable.ValidateInternet {
            Message.NoInternetAlert(self)
            return
        }
        
        if self.maincategory_id == "All" {
            self.maincategory_id = ""
        }else{
            
        }
        
        if self.subcategoryid == "All" {
            self.subcategoryid = ""
        }else{
            
        }
        
        if self.sourcecampignid == "All" {
            self.sourcecampignid = ""
        }else{
            
        }
        
       
        let imei = UIDevice.current.clientID
       
            self.view.StartLoading()

        Webservice().call(cRequest: CRequest.getRequest(url: CUrls.BaseUrl, suffix: CUrls.newmobiledashboardmodule.get_leadapi_getLeadDataByFollowUp, method: .get, contentType: .urlencode, params: ["textId":self.dateid,"typeId":self.leadtype_id,"month":"","year":"","empId":self.followupleadagingemp_id,"fromDate":self.followupfromdate,"toDate":self.followuptodate,"utmSource":self.maincategory_id,"utmMedium":self.subcategoryid,"utmCampaign":self.sourcecampignid,"statusId":self.newfollowupleadstatusid], headers: ["Authorization": "Bearer " ,"X-Device-Imei":imei,"Content-Type":"application/json"])) { (response, auth) in
            
                self.view.StopLoading()

            if auth {
                sectionExpiredClass.ClearData(controller: self)
            }
            else {
                self.followupleadagelistarr.removeAll()
           
                switch response.result {
                
                case .success(let jsonResponse):
                    
                    if jsonResponse.responseType.isSuccess {
                        
                        print("get_leadapi_getLeadDataByFollowUp:" + "\(jsonResponse.response)");
                        
                        let main = jsonResponse.response.dictionaryValue
                        
                        let LeadDataByFollowUp = main["LeadDataByFollowUp"]?.arrayValue
                        
                        LeadDataByFollowUp!.forEach({ (obj) in
                            self.followupleadagelistarr.append(LeadDataByFollowUpModelClass.init(data: obj))
                        })
                        
                        self.followupleadagedataTableView.reloadData()
                      
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
    
    func dealerpurchasedpackagesServiceCall() {
        if !InternetReachable.ValidateInternet {
            Message.NoInternetAlert(self)
            return
        }
        
        var selectedepmloyees = [String]()

        for k in allemployeelistarr.enumerated() {
            if self.allemployeelistarr[k.offset].is_seleceted {
                selectedepmloyees.append(String(self.allemployeelistarr[k.offset].employee_id))
                
            }

        }

        let stypeselectedemployeesstr = selectedepmloyees
        let selectedserviceemployessste = selectedepmloyees.joined(separator: ",")
        
       
        let imei = UIDevice.current.clientID
       
            self.view.StartLoading()

        Webservice().call(cRequest: CRequest.getRequest(url: CUrls.BaseUrl, suffix: CUrls.newmobiledashboardmodule.get_leadapi_getB2bSalesDetails, method: .get, contentType: .urlencode, params: ["textId":self.lastmonthorthismonth_id,"month":self.selected_amountmonth,"year":self.selecetd_amountyear,"empId":selectedserviceemployessste,"fromDate":self.fromdate,"toDate":self.todate], headers: ["Authorization": "Bearer " ,"X-Device-Imei":imei,"Content-Type":"application/json"])) { (response, auth) in
            
                self.view.StopLoading()

            if auth {
                sectionExpiredClass.ClearData(controller: self)
            }
            else {
                self.dealerpurchasedpacklistarr.removeAll()
           
                switch response.result {
                
                case .success(let jsonResponse):
                    
                    if jsonResponse.responseType.isSuccess {
                        
                        print("get_leadapi_getB2bSalesDetails:" + "\(jsonResponse.response)");
                        
                        let main = jsonResponse.response.dictionaryValue
                        
                        let B2bSalesDetails = main["B2bSalesDetails"]?.arrayValue
                        
                        B2bSalesDetails!.forEach({ (obj) in
                            self.dealerpurchasedpacklistarr.append(B2bSalesDetailsModelClass.init(data: obj))
                        })
                        
                        self.btobdealerspurchasedpackdetailsTableView.reloadData()
                      
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
    
    func repairrqatandrejectcarslistServiceCall() {
        if !InternetReachable.ValidateInternet {
            Message.NoInternetAlert(self)
            return
        }
        
        if self.maincategory_id == "All" {
            self.maincategory_id = ""
        }else{
            
        }
        
        if self.subcategoryid == "All" {
            self.subcategoryid = ""
        }else{
            
        }
        
        if self.sourcecampignid == "All" {
            self.sourcecampignid = ""
        }else{
            
        }
        
        var selectedepmloyees = [String]()

        for k in allemployeelistarr.enumerated() {
            if self.allemployeelistarr[k.offset].is_seleceted {
                selectedepmloyees.append(String(self.allemployeelistarr[k.offset].employee_id))
                
            }

        }

        let stypeselectedemployeesstr = selectedepmloyees
        let selectedserviceemployessste = selectedepmloyees.joined(separator: ",")
        
        
        var selectedbrand = [String]()
        for i in brandiconlistarr.enumerated() {
            if self.brandiconlistarr[i.offset].was_selected {
                selectedbrand.append(String(self.brandiconlistarr[i.offset].id))
                
            }
        }
        let selectedbrandstr = selectedbrand
        self.selectedbrandste = selectedbrand.joined(separator: ",")
        
        let imei = UIDevice.current.clientID
       
            self.view.StartLoading()

        Webservice().call(cRequest: CRequest.getRequest(url: CUrls.BaseUrl, suffix: CUrls.newmobiledashboardmodule.get_leadapi_getReinspRepairDataNew, method: .get, contentType: .urlencode, params: ["textId":self.dateid,"month":"","year":"","empId":selectedserviceemployessste,"fromDate":self.fromdate,"toDate":self.todate,"inspTypeId":self.inspectiontype_id,"inspStatus":self.insp_status,"brandId":self.selectedbrandste,"yearFrom":self.yearminimum,"yearTo":self.yearmaximum,"fuelType":self.fule_type,"transmissionType":self.transmission_type,"utmSource":self.maincategory_id,"utmMedium":self.subcategoryid,"utmCampaign":self.sourcecampignid,"typeId":self.leadtype_id], headers: ["Authorization": "Bearer " ,"X-Device-Imei":imei,"Content-Type":"application/json"])) { (response, auth) in
            
                self.view.StopLoading()
        //    self.activityloader.isHidden = true

            if auth {
                sectionExpiredClass.ClearData(controller: self)
            }
            else {
                self.allcarlistarr.removeAll()
           
                switch response.result {
                
                case .success(let jsonResponse):
                    
                    if jsonResponse.responseType.isSuccess {
                        
                        print("get_leadapi_getReinspRepairDataNew:" + "\(jsonResponse.response)");
                        
                        let main = jsonResponse.response.dictionaryValue
                        
                        let InspApprovedDataNew = main["InspApprovedDataNew"]?.arrayValue
                        
                        InspApprovedDataNew!.forEach({ (obj) in
                            self.allcarlistarr.append(reinsprepairDataModelClass.init(data: obj))
                        })
                       
                        self.allcarsdetailsTableView.reloadData()
                        
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
    
    func approvedcarslistServiceCall() {
        if !InternetReachable.ValidateInternet {
            Message.NoInternetAlert(self)
            return
        }
        
        if self.maincategory_id == "All" {
            self.maincategory_id = ""
        }else{
            
        }
        
        if self.subcategoryid == "All" {
            self.subcategoryid = ""
        }else{
            
        }
        
        if self.sourcecampignid == "All" {
            self.sourcecampignid = ""
        }else{
            
        }
        
        var selectedepmloyees = [String]()

        for k in allemployeelistarr.enumerated() {
            if self.allemployeelistarr[k.offset].is_seleceted {
                selectedepmloyees.append(String(self.allemployeelistarr[k.offset].employee_id))
                
            }

        }

        let stypeselectedemployeesstr = selectedepmloyees
        let selectedserviceemployessste = selectedepmloyees.joined(separator: ",")
        
        var selectedbrand = [String]()
        for i in brandiconlistarr.enumerated() {
            if self.brandiconlistarr[i.offset].was_selected {
                selectedbrand.append(String(self.brandiconlistarr[i.offset].id))
                
            }
        }
        let selectedbrandstr = selectedbrand
        self.selectedbrandste = selectedbrand.joined(separator: ",")
        
        
        let imei = UIDevice.current.clientID
       
            self.view.StartLoading()

        Webservice().call(cRequest: CRequest.getRequest(url: CUrls.BaseUrl, suffix: CUrls.newmobiledashboardmodule.get_leadapi_getApprovedVehicleDataNew, method: .get, contentType: .urlencode, params: ["textId":self.dateid,"month":"","year":"","empId":selectedserviceemployessste,"fromDate":self.fromdate,"toDate":self.todate,"inspTypeId":self.inspectiontype_id,"inspStatus":self.insp_status,"brandId":self.selectedbrandste,"yearFrom":self.yearminimum,"yearTo":self.yearmaximum,"fuelType":self.fule_type,"transmissionType":self.transmission_type,"utmSource":self.maincategory_id,"utmMedium":self.subcategoryid,"utmCampaign":self.sourcecampignid,"typeId":self.leadtype_id], headers: ["Authorization": "Bearer " ,"X-Device-Imei":imei,"Content-Type":"application/json"])) { (response, auth) in
            
                self.view.StopLoading()
        //    self.activityloader.isHidden = true

            if auth {
                sectionExpiredClass.ClearData(controller: self)
            }
            else {
                self.approvedvehlistarr.removeAll()
           
                switch response.result {
                
                case .success(let jsonResponse):
                    
                    if jsonResponse.responseType.isSuccess {
                        
                        print("get_leadapi_getApprovedVehicleDataNew:" + "\(jsonResponse.response)");
                        
                        let main = jsonResponse.response.dictionaryValue
                        
                        let InspApprovedDataNew = main["InspApprovedDataNew"]?.arrayValue
                        
                        InspApprovedDataNew!.forEach({ (obj) in
                            self.approvedvehlistarr.append(InspApprovedDataModelClass.init(data: obj))
                        })
                        
                        self.soldpackage_count = 0
                           
                                for i in 0..<self.approvedvehlistarr.count {
                                    if self.approvedvehlistarr[i].is_with_package == "Y" {
                                        self.soldpackage_count += 1
                                        self.totalpackagesoldcountLabel.text! = "Sale: " + String(self.soldpackage_count)
                                    }
                                }
                            
                       
                        self.allcarsdetailsTableView.reloadData()
                        
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
    
    func leadsaginglistServiceCall() {
        if !InternetReachable.ValidateInternet {
            Message.NoInternetAlert(self)
            return
        }
        
        var selectedepmloyees = [String]()

        for k in allemployeelistarr.enumerated() {
            if self.allemployeelistarr[k.offset].is_seleceted {
                selectedepmloyees.append(String(self.allemployeelistarr[k.offset].employee_id))
                
            }

        }

        let stypeselectedemployeesstr = selectedepmloyees
        let selectedserviceemployessste = selectedepmloyees.joined(separator: ",")
        
       
        let imei = UIDevice.current.clientID
       
            self.view.StartLoading()

        Webservice().call(cRequest: CRequest.getRequest(url: CUrls.BaseUrl, suffix: CUrls.newmobiledashboardmodule.get_leadapi_getLeadAgingDataNew, method: .get, contentType: .urlencode, params: ["textId":self.dateid,"month":"","year":"","empId":selectedserviceemployessste,"fromDate":self.fromdate,"toDate":self.todate,"inspTypeId":self.inspectiontype_id,"inspStatus":self.insp_status,"utmSource":self.maincategory_id,"utmMedium":self.subcategoryid,"utmCampaign":self.sourcecampignid,"typeId":self.leadtype_id], headers: ["Authorization": "Bearer " ,"X-Device-Imei":imei,"Content-Type":"application/json"])) { (response, auth) in
            
                self.view.StopLoading()

            if auth {
                sectionExpiredClass.ClearData(controller: self)
            }
            else {
                self.leadaginglistarr.removeAll()
           
                switch response.result {
                
                case .success(let jsonResponse):
                    
                    if jsonResponse.responseType.isSuccess {
                        
                        print("get_leadapi_getLeadAgingDataNew:" + "\(jsonResponse.response)");
                        
                        let main = jsonResponse.response.dictionaryValue
                        
                        let leadInspData = main["InspData"]?.arrayValue
                        
                        leadInspData!.forEach({ (obj) in
                            self.leadaginglistarr.append(LeadagingInspDataModelClass.init(data: obj))
                        })
                        
                        self.followupleadagedataTableView.reloadData()
                      
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
    
    
    func allemployeelistServiceCall() {
        if !InternetReachable.ValidateInternet {
            Message.NoInternetAlert(self)
            return
        }
        
     
       
        let imei = UIDevice.current.clientID
       
            self.view.StartLoading()

        Webservice().call(cRequest: CRequest.getRequest(url: CUrls.BaseUrl, suffix: CUrls.newmobiledashboardmodule.get_leadapi_GetEmployeeList, method: .get, contentType: .urlencode, params: ["search":"","pageNo":"1"], headers: ["Authorization": "Bearer " ,"X-Device-Imei":imei,"Content-Type":"application/json"])) { (response, auth) in
            
                self.view.StopLoading()
        //    self.activityloader.isHidden = true

            if auth {
                sectionExpiredClass.ClearData(controller: self)
            }
            else {
                self.allemployeelistarr.removeAll()
           
                switch response.result {
                
                case .success(let jsonResponse):
                    
                    if jsonResponse.responseType.isSuccess {
                        
                        print("get_leadapi_GetEmployeeList:" + "\(jsonResponse.response)");
                        
                        let main = jsonResponse.response.dictionaryValue
                        
                        let InsideSalesTeamList = main["InsideSalesTeamList"]?.arrayValue
                       // self.statusid = brandList!["id"] as! String

                        InsideSalesTeamList!.forEach({ (obj) in
                            self.allemployeelistarr.append(InsideSalesTeamListModelClass.init(data: obj))
                        })
                        self.allemployeesdataTableView.reloadData()
                        
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
    
    
    func alldateslistServiceCall() {
        if !InternetReachable.ValidateInternet {
            Message.NoInternetAlert(self)
            return
        }
        
        let imei = UIDevice.current.clientID
       
            self.view.StartLoading()

        Webservice().call(cRequest: CRequest.getRequest(url: CUrls.BaseUrl, suffix: CUrls.newmobiledashboardmodule.get_leadapi_GetTextTypeList, method: .get, contentType: .urlencode, params: [:], headers: ["Authorization": "Bearer " ,"X-Device-Imei":imei,"Content-Type":"application/json"])) { (response, auth) in
            
                self.view.StopLoading()

            if auth {
                sectionExpiredClass.ClearData(controller: self)
            }
            else {
                self.daterangelistarr.removeAll()
           
                switch response.result {
                
                case .success(let jsonResponse):
                    
                    if jsonResponse.responseType.isSuccess {
                        
                        print("get_leadapi_GetTextTypeList:" + "\(jsonResponse.response)");
                        
                        let main = jsonResponse.response.dictionaryValue
                        
                        let TextTypeList = main["TextTypeList"]?.arrayValue
                        
                        TextTypeList!.forEach({ (obj) in
                            self.daterangelistarr.append(TextTypeListModelClass.init(data: obj))
                        })
                        self.alldateslistTableView.reloadData()

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
    
    
    func saleslinegraphlistServiceCall() {
        if !InternetReachable.ValidateInternet {
            Message.NoInternetAlert(self)
            return
        }
        
        let imei = UIDevice.current.clientID
        
        self.view.StartLoading()
        
        Webservice().call(cRequest: CRequest.getRequest(url: CUrls.BaseUrl, suffix: CUrls.newmobiledashboardmodule.get_SalesGraphForIpad_getSalesGraph, method: .get, contentType: .urlencode, params: ["fromDate":"","toDate":"","textId":"","typeId":"","employeeId":"","month":"","year":"","categoryId":"","subcategoryId":""], headers: ["Authorization": "Bearer ", "X-Device-Imei": imei, "Content-Type": "application/json"])) { (response, auth) in
            
            self.view.StopLoading()
            
            if auth {
                sectionExpiredClass.ClearData(controller: self)
            } else {
           
                switch response.result {
                    
                case .success(let jsonResponse):
                    
                    if jsonResponse.responseType.isSuccess {
                        
                        print("get_SalesGraphForIpad_getSalesGraph:" + "\(jsonResponse.response)")
                        
                        let main = jsonResponse.response.dictionaryValue
                        
                        let Sedan = main["InspSales"]?.arrayValue
                        
                        var sedanData: [[String: Any]] = []
                        
                        Sedan?.forEach { obj in
                            let sedandata: [String: Any] = [
                                "name": obj["payment_month"].stringValue,
                                "y": obj["total_sales"].intValue
                            ]
                            sedanData.append(sedandata)
                        }
                        
                        let HatchBack = main["ServiceSales"]?.arrayValue
                        
                        var HatchBackData: [[String: Any]] = []
                        
                        HatchBack?.forEach { obj in
                            let hbdata: [String: Any] = [
                                "name": obj["payment_month"].stringValue,
                                "y": obj["total_sales"].intValue
                            ]
                            HatchBackData.append(hbdata)
                        }
                        
                        let SUV = main["TotalSales"]?.arrayValue
                        
                        var SuvData: [[String: Any]] = []
                        
                        SUV?.forEach { obj in
                            let svdata: [String: Any] = [
                                "name": obj["payment_month"].stringValue,
                                "y": obj["total_sales"].intValue
                            ]
                            SuvData.append(svdata)
                        }
                        
                        let TotalCars = main["WarrantySales"]?.arrayValue
                        
                        var allcarsData: [[String: Any]] = []
                        
                        TotalCars?.forEach { obj in
                            let AllCarsdata: [String: Any] = [
                                "name": obj["payment_month"].stringValue,
                                "y": obj["total_sales"].intValue
                            ]
                            allcarsData.append(AllCarsdata)
                        }
                        
                        let chartView = HIChartView(frame: self.saleslinechartVuew.bounds)
                        chartView.plugins = ["series-label"]
                        
                        let options = HIOptions()
                        
                        options.exporting = HIExporting()
                        options.exporting.enabled = false
                        options.chart = HIChart()
                        options.chart.backgroundColor = HIColor(rgba: 0, green: 0, blue: 0, alpha: 0)
                        
                        options.title = nil
                        options.subtitle = nil
                        
                        // ... (your existing code)

                        let plotOptions = HIPlotOptions()
                        plotOptions.series = HISeries()

                        // Remove data labels
                        plotOptions.series.dataLabels = nil

                        // Remove separator lines between data points

                        options.plotOptions = plotOptions

                        // ... (continue with your existing code)


                        
                        let title = HITitle()
                        title.text = "Sales"
                        title.style = HIStyle()
                        title.style.color = "#ffffff"
                        options.title = title


//                        let yAxis = HIYAxis()
//                        yAxis.title = HITitle()
//                        yAxis.title.text = nil
//                        yAxis.gridLineWidth = 0
//
//                        // Customize the y-axis labels using formatter
//                        yAxis.labels = HILabels()
//                        yAxis.labels.formatter = HIFunction(jsFunction: "function() { return Highcharts.numberFormat(this.value, 0, '.', ','); }")
//                        options.yAxis = [yAxis]
                        
                        let yAxis = HIYAxis()
                        yAxis.visible = false  // Hide the Y-axis
                        options.yAxis = [yAxis]
                        
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
                        xAxis.labels = HILabels()
                        xAxis.labels.style = HIStyle()
                        xAxis.labels.style.color = "#F2F2F2"
                        options.xAxis = [xAxis]

                        
                        let legend = HILegend()
                        legend.layout = "vertical"
                        legend.align = "right"
                        legend.verticalAlign = "middle"
                       // legend.backgroundColor = HIColor(rgba: 255, green: 255, blue: 255, alpha: 1.0)
                        legend.itemStyle = HIItemStyle()
                        legend.itemStyle.color = "#FFFFFF"
                        options.legend = legend
                        
                        let seadan = HISeries()
                        seadan.name = "Insp Sale"
                        seadan.data = sedanData
                        seadan.dataLabels = HIDataLabels()
                        seadan.dataLabels.color = HIColor(rgba: 255, green: 255, blue: 255, alpha: 1.0) // White color

                        let hatchb = HISeries()
                        hatchb.name = "Service Sale"
                        hatchb.data = HatchBackData
                        hatchb.dataLabels = HIDataLabels()
                        hatchb.dataLabels.color = HIColor(rgba: 255, green: 255, blue: 255, alpha: 1.0) // White color

                        let suv = HISeries()
                        suv.name = "Total Sales"
                        suv.data = SuvData
                        suv.dataLabels = HIDataLabels()
                        suv.dataLabels.color = HIColor(rgba: 255, green: 255, blue: 255, alpha: 1.0) // White color

                        let totalcars = HISeries()
                        totalcars.name = "Warranty Sale"
                        totalcars.data = allcarsData
                        totalcars.dataLabels = HIDataLabels()
                        totalcars.dataLabels.color = HIColor(rgba: 255, green: 255, blue: 255, alpha: 1.0) // White color

                        
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
                        
                        self.saleslinechartVuew.addSubview(chartView)
                        
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


extension newhomedashboardpageVc: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView.tag == 111 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "sourcesofutmlistcollectioncell", for: indexPath) as! sourcesofutmlistcollectioncell
            self.leadcategorycount = String(mainlistarr[indexPath.row].count)
            cell.utmsourcenameLabel.text = mainlistarr[indexPath.row].utm_source + " " + "(" + self.leadcategorycount + ")"
            if self.mainlistarr[indexPath.row].is_seleceted == true {
                cell.utmsourcebgView.backgroundColor = UIColor.init(hexString: "E9F0FA")
                cell.utmsourcenameLabel.textColor = UIColor.init(hexString: "252a40")
            }else{
                cell.utmsourcebgView.backgroundColor = UIColor.init(hexString: "f2f2f7")
                cell.utmsourcenameLabel.textColor = .lightGray
            }
            cell.htOfutmsourceView.constant = 45
            cell.selectutmsourceBtn.tag = indexPath.row
            cell.selectutmsourceBtn.addTarget(self, action: #selector(selectutmsourceBtnAction(sender:)), for: UIControl.Event.touchUpInside)
            return cell
        }else if collectionView.tag == 222 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "mediumofallutmlistcollectioncell", for: indexPath) as! mediumofallutmlistcollectioncell
            self.subcartehorycount = String(secondlistarr[indexPath.row].count)
            cell.nameofutmmediumLabel.text = secondlistarr[indexPath.row].utm_medium + " " + "(" + self.subcartehorycount + ")"
            if secondlistarr[indexPath.row].seleceted == true {
                cell.utmmediumbgBackView.backgroundColor = UIColor.init(hexString: "FFFCEFF1")
                cell.nameofutmmediumLabel.textColor = UIColor.init(hexString: "252a40")
            }else{
                cell.utmmediumbgBackView.backgroundColor = UIColor.init(hexString: "f2f2f7")
                cell.nameofutmmediumLabel.textColor = .lightGray
            }
            cell.htOfutmmediumCell.constant = 45
            cell.selectutmmediumBtn.tag = indexPath.row
            cell.selectutmmediumBtn.addTarget(self, action: #selector(selectutmmediumBtnAction(sender:)), for: UIControl.Event.touchUpInside)
            return cell
        }else if collectionView.tag == 333 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "campignlistofutmcollectioncell", for: indexPath) as! campignlistofutmcollectioncell
            self.sourcecampaigncount = String(thirdlistarr[indexPath.row].count)
            cell.campaignnameLabel.text = thirdlistarr[indexPath.row].utm_campaign + " " + "(" + self.sourcecampaigncount + ")"
            if thirdlistarr[indexPath.row].was_select == true {
                cell.utmcampaginbgView.backgroundColor = UIColor.init(hexString: "E2FFEE")
                cell.campaignnameLabel.textColor = UIColor.init(hexString: "252a40")
            }else{
                cell.utmcampaginbgView.backgroundColor = UIColor.init(hexString: "f2f2f7")
                cell.campaignnameLabel.textColor = .lightGray
            }
            cell.htOfcampaginCell.constant = 45
            cell.selectcampgnBtn.tag = indexPath.row
            cell.selectcampgnBtn.addTarget(self, action: #selector(selectcampgnBtnAction(sender:)), for: UIControl.Event.touchUpInside)
            return cell
        }else if collectionView.tag == 444 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "detailsofinspectionsColletionCell", for: indexPath) as! detailsofinspectionsColletionCell
            self.insptypecount = String(inspheadingslistarr[indexPath.row].count)
            cell.nameofinspectiontitleLabel.text! = inspheadingslistarr[indexPath.row].insp_name + " " + "(" + self.insptypecount + ")"
            if self.inspheadingslistarr[indexPath.row].selected == true {
                cell.inspectiontitlebgBackView.backgroundColor = UIColor.init(hexString: "E9F0FA")
                cell.nameofinspectiontitleLabel.textColor = UIColor.init(hexString: "252a40")
            }else{
                cell.inspectiontitlebgBackView.backgroundColor = UIColor.init(hexString: "f2f2f7")
                cell.nameofinspectiontitleLabel.textColor = .lightGray
            }
            cell.htOfinsptitleCell.constant = 45
            cell.selectinspectiontitleBtn.tag = indexPath.row
            cell.selectinspectiontitleBtn.addTarget(self, action: #selector(selectinspectiontitleBtnAction(sender:)), for: UIControl.Event.touchUpInside)
            return cell
        }else if collectionView.tag == 555 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "allleadsummarydetailsCollectionCell", for: indexPath) as! allleadsummarydetailsCollectionCell
                self.leadsummarytypecount = String(self.leadsummarytypelistarr[indexPath.row].count)
                cell.headingofleadsummaryLabel.text! = leadsummarytypelistarr[indexPath.row].type_name + "(" + self.leadsummarytypecount + ")"
                    if self.leadsummarytypelistarr[indexPath.row].is_selected == true {
                        cell.leadsummaryheadingbgView.backgroundColor = UIColor.init(hexString: "E9F0FA")
                        cell.headingofleadsummaryLabel.textColor = UIColor.init(hexString: "252a40")
                    }else{
                        cell.leadsummaryheadingbgView.backgroundColor = UIColor.init(hexString: "f2f2f7")
                        cell.headingofleadsummaryLabel.textColor = .lightGray
                    
                }
            cell.htOfleadsummaryheadingCell.constant = 45
            cell.selectleadsummaryheadingBtn.tag = indexPath.row
            cell.selectleadsummaryheadingBtn.addTarget(self, action: #selector(selectstatusofleadfollowupagingBtnAction(sender:)), for: UIControl.Event.touchUpInside)
            return cell
        }else if collectionView.tag == 666 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "followuplaempllistCollectionCell", for: indexPath) as! followuplaempllistCollectionCell
                cell.followupleadagempnameLabel.text! = followupleadagingemplistarr[indexPath.row].employee_name
                if self.followupleadagingemplistarr[indexPath.row].is_selected == true {
                    cell.followupleadaggingbgView.backgroundColor = UIColor.init(hexString: "E9F0FA")
                    cell.followupleadagempnameLabel.textColor = UIColor.init(hexString: "252a40")
                }else{
                    cell.followupleadaggingbgView.backgroundColor = UIColor.init(hexString: "f2f2f7")
                    cell.followupleadagempnameLabel.textColor = .lightGray
                }
            
            cell.htOffollowupleadaggingCell.constant = 45
            cell.selectfollowupempBtn.tag = indexPath.row
            cell.selectfollowupempBtn.addTarget(self, action: #selector(selectfollowupempBtnAction(sender:)), for: UIControl.Event.touchUpInside)
       
        return cell
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "followuplastatusCollectionCell", for: indexPath) as! followuplastatusCollectionCell
                self.followupstatuscount = String(followupstatuslistarr[indexPath.row].count)
                cell.followupleadagingstatusnameLabel.text = followupstatuslistarr[indexPath.row].status_name + " " + "(" + self.followupstatuscount + ")"
                if self.followupstatuslistarr[indexPath.row].was_selected == true {
                    cell.followuplastatusbgView.backgroundColor = UIColor.init(hexString: "E9F0FA")
                    cell.followupleadagingstatusnameLabel.textColor = UIColor.init(hexString: "252a40")
                }else{
                    cell.followuplastatusbgView.backgroundColor = UIColor.init(hexString: "f2f2f7")
                    cell.followupleadagingstatusnameLabel.textColor = .lightGray
                }
                
                cell.htOffollowuplastatusCell.constant = 45
            
            cell.selectfollowupleadagingstatusBtn.tag = indexPath.row
            cell.selectfollowupleadagingstatusBtn.addTarget(self, action: #selector(selectfollowupleadagingstatusBtnAction(sender:)), for: UIControl.Event.touchUpInside)
            return cell
        }

           
        
    }
    
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView.tag == 111 {
            return mainlistarr.count
        }else if collectionView.tag == 222 {
            return secondlistarr.count
        }else if collectionView.tag == 333 {
            return thirdlistarr.count
        }else if collectionView.tag == 444 {
            return inspheadingslistarr.count
        }else if collectionView.tag == 555 {
            return leadsummarytypelistarr.count
        }else if collectionView.tag == 666 {
            return followupleadagingemplistarr.count
        }else{
            return followupstatuslistarr.count
        }

        }
    
    @objc func selectutmsourceBtnAction(sender:UIButton!) {
        for n in 0..<mainlistarr.count {

            if sender.tag == n {
                mainlistarr[n].is_seleceted = true
                self.maincategory_id = mainlistarr[n].utm_source
            }else{
                mainlistarr[n].is_seleceted = false

            }
        }
       self.utmsourcedataCollectionView.reloadData()
        self.leadbysubcategoryServiceCall()
        self.leadbystatuslistServiceCall()

    }

    @objc func selectutmmediumBtnAction(sender:UIButton!) {
        for n in 0..<secondlistarr.count {

            if sender.tag == n {
                secondlistarr[n].seleceted = true
                self.subcategoryid = secondlistarr[n].utm_medium
            }else{
                secondlistarr[n].seleceted = false

            }
        }
       self.utmmediumdataCollectionView.reloadData()

        self.leadbysourcecampaignServiceCall()

    }

    @objc func selectcampgnBtnAction(sender:UIButton!) {
        for n in 0..<thirdlistarr.count {

            if sender.tag == n {
                thirdlistarr[n].was_select = true
                self.sourcecampignid = thirdlistarr[n].utm_campaign
            }else{
                thirdlistarr[n].was_select = false

            }
        }
       self.utmcamphigndetailsCollectionView.reloadData()

        self.leadbystatuslistServiceCall()

    }
    
    @objc func selectinspectiontitleBtnAction(sender:UIButton!) {
        for n in 0..<inspheadingslistarr.count {
            
            if sender.tag == n {
                inspheadingslistarr[n].selected = true
                self.inspectiontype_id = self.inspheadingslistarr[n].id
            }else{
                inspheadingslistarr[n].selected = false
                
            }
        }
       self.inspectionsdataCollectionView.reloadData()
        
        self.allinspectionscountlistServiceCall()
        
    }
    
    @objc func selectfollowupempBtnAction(sender:UIButton!) {
       
            for n in 0..<followupleadagingemplistarr.count {
                
                if sender.tag == n {
                    followupleadagingemplistarr[n].is_selected = true
                    self.followupleadagingemp_id = String(self.followupleadagingemplistarr[n].employee_id)
                }else{
                    followupleadagingemplistarr[n].is_selected = false
                    
                }
            }
            self.empdataoffollowupleadaggingCollectionView.reloadData()
            self.followupleaddatalistServiceCall()
            self.followupleadagingstatuslistServiceCall()
    
       
    }
    
    @objc func selectstatusofleadfollowupagingBtnAction(sender:UIButton!) {
       
            for n in 0..<leadsummarytypelistarr.count {
                
                if sender.tag == n {
                    leadsummarytypelistarr[n].is_selected = true
                    self.leadsummarytype_id = String(self.leadsummarytypelistarr[n].insp_type_id)
                }else{
                    leadsummarytypelistarr[n].is_selected = false
                    
                }
            }
            self.leadsummarydataCollectionView.reloadData()
            if self.leadsummarytype_id == "" {
                
            }else{
                self.leadssummarylistServiceCall()
            }
            
       
    }
    
    @objc func selectfollowupleadagingstatusBtnAction(sender:UIButton!) {
            self.followupstatuslistarr[sender.tag].was_selected = !self.followupstatuslistarr[sender.tag].was_selected
            self.followupleadagingstatusdataCollectionView.reloadData()
            self.followupleaddatalistServiceCall()
        
    }

    
   
    
   }

class sourcesofutmlistcollectioncell : UICollectionViewCell {
    @IBOutlet weak var utmsourcenameLabel: UILabel!
    @IBOutlet weak var htOfutmsourceView: NSLayoutConstraint!
    @IBOutlet weak var selectutmsourceBtn: UIButton!
    @IBOutlet weak var utmsourcebgView: UIView!
    
}

class mediumofallutmlistcollectioncell : UICollectionViewCell {
    @IBOutlet weak var nameofutmmediumLabel: UILabel!
    @IBOutlet weak var utmmediumbgBackView: UIView!
    @IBOutlet weak var selectutmmediumBtn: UIButton!
    @IBOutlet weak var htOfutmmediumCell: NSLayoutConstraint!
    
}

class campignlistofutmcollectioncell : UICollectionViewCell {
    @IBOutlet weak var campaignnameLabel: UILabel!
    @IBOutlet weak var selectcampgnBtn: UIButton!
    @IBOutlet weak var utmcampaginbgView: UIView!
    @IBOutlet weak var htOfcampaginCell: NSLayoutConstraint!
    
}

class detailsofinspectionsColletionCell : UICollectionViewCell {
    @IBOutlet weak var nameofinspectiontitleLabel: UILabel!
    @IBOutlet weak var selectinspectiontitleBtn: UIButton!
    @IBOutlet weak var inspectiontitlebgBackView: UIView!
    @IBOutlet weak var htOfinsptitleCell: NSLayoutConstraint!
    
}

class allleadsummarydetailsCollectionCell : UICollectionViewCell {
    @IBOutlet weak var headingofleadsummaryLabel: UILabel!
    @IBOutlet weak var selectleadsummaryheadingBtn: UIButton!
    @IBOutlet weak var leadsummaryheadingbgView: UIView!
    @IBOutlet weak var htOfleadsummaryheadingCell: NSLayoutConstraint!
    
}

class followuplaempllistCollectionCell : UICollectionViewCell {
    @IBOutlet weak var followupleadagempnameLabel: UILabel!
    @IBOutlet weak var selectfollowupempBtn: UIButton!
    @IBOutlet weak var followupleadaggingbgView: UIView!
    @IBOutlet weak var htOffollowupleadaggingCell: NSLayoutConstraint!
    
}

class followuplastatusCollectionCell : UICollectionViewCell {
    @IBOutlet weak var followupleadagingstatusnameLabel: UILabel!
    @IBOutlet weak var selectfollowupleadagingstatusBtn: UIButton!
    @IBOutlet weak var followuplastatusbgView: UIView!
    @IBOutlet weak var htOffollowuplastatusCell: NSLayoutConstraint!
    
}



extension newhomedashboardpageVc: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView.tag == 1 {
            return leadbystatuslistarr.count
        }else if tableView.tag == 2 {
            return allinspectionscountlistarr.count
        }else if tableView.tag == 3 {
            return leadsummarylistarr.count
        }else if tableView.tag == 4 {
            if self.fromwhichaging == "Lead aging" {
                return leadaginglistarr.count
            }else{
                return followupleadagelistarr.count
            }
        }else if tableView.tag == 5 {
            return dealerpurchasedpacklistarr.count
        }else if tableView.tag == 6 {
            if self.insp_status == "Approved" {
                return approvedvehlistarr.count
            }else{
                return allcarlistarr.count
            }
        }else if tableView.tag == 7 {
            return allemployeelistarr.count
        }else{
            return daterangelistarr.count
        }
            
        
        
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView.tag == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "listofalldfollowupsstatustablecell", for: indexPath) as! listofalldfollowupsstatustablecell
            cell.followupstatusnameLabel.text = leadbystatuslistarr[indexPath.row].status_name
            cell.followupstatuscountLabel.text = String(leadbystatuslistarr[indexPath.row].count)
            let percentageValue = leadbystatuslistarr[indexPath.row].percent
            let formattedPercentage = String(format: "%.1f%%", percentageValue!)
            cell.followupstatuspercentageLabel.text = formattedPercentage
            cell.htOffollowupstatusCell.constant = 55
            cell.selectfollowupstatusBtn.tag = indexPath.row
            cell.selectfollowupstatusBtn.addTarget(self, action: #selector(selectfollowupstatusBtnAction(sender:)), for: UIControl.Event.touchUpInside)
            return cell
        }else if tableView.tag == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "statusofallinspectionstabelcell", for: indexPath) as! statusofallinspectionstabelcell
            cell.insptatusnameLabel.text! = allinspectionscountlistarr[indexPath.row].inspection_status
            cell.inspstatuscountLabel.text! = String(allinspectionscountlistarr[indexPath.row].count)
            let percentageValue = allinspectionscountlistarr[indexPath.row].percentage
            let formattedPercentage = String(format: "%.1f%%", percentageValue!)
            cell.inspstatuspercentageLabel.text! = formattedPercentage
            if self.allinspectionscountlistarr[indexPath.row].percentage > 70 {
                cell.inspectionstatuspercentBackView.backgroundColor = UIColor.init(hexString: "4BAE4F")
                cell.inspstatuspercentageLabel.textColor = .white
            }else if self.allinspectionscountlistarr[indexPath.row].percentage > 50 && self.allinspectionscountlistarr[indexPath.row].percentage < 70 {
                cell.inspectionstatuspercentBackView.backgroundColor = UIColor.init(hexString: "F68B33")
                cell.inspstatuspercentageLabel.textColor = .white
            }else{
                cell.inspectionstatuspercentBackView.backgroundColor = UIColor.init(hexString: "F7F7F7")
                cell.inspstatuspercentageLabel.textColor = UIColor.init(hexString: "252a40")
            }
            cell.inspstatusleadscountLabel.text! = String(allinspectionscountlistarr[indexPath.row].lead_count)
            cell.htOfinspstatusCell.constant = 55
            if self.allinspectionscountlistarr[indexPath.row].inspection_status == "Repair Requested" || self.allinspectionscountlistarr[indexPath.row].inspection_status == "Rejected" || self.allinspectionscountlistarr[indexPath.row].inspection_status == "Approved" {
                if self.allinspectionscountlistarr[indexPath.row].count == 0 {
                    cell.inspstatusvehdataBtn.isHidden = true
                    cell.inspstatuscountunderlineLabel.isHidden = true
                }else{
                    cell.inspstatusvehdataBtn.isHidden = false
                    cell.inspstatuscountunderlineLabel.isHidden = false
                }
            }else{
                cell.inspstatusvehdataBtn.isHidden = true
                cell.inspstatuscountunderlineLabel.isHidden = true
            }
            
            if self.inspectiontype_id == "4" || self.inspectiontype_id == "5" {
                cell.inspstatusleadunderlineLabel.isHidden = true
                cell.inspstatusbyleadsBtn.isHidden = true
            }else{
                cell.inspstatusleadunderlineLabel.isHidden = false
                cell.inspstatusbyleadsBtn.isHidden = false
            }
            
            cell.inspstatusvehdataBtn.tag = indexPath.row
            cell.inspstatusvehdataBtn.addTarget(self, action: #selector(inspstatusvehdataBtnAction(sender:)), for: UIControl.Event.touchUpInside)
            cell.inspstatusbyleadsBtn.tag = indexPath.row
            cell.inspstatusbyleadsBtn.addTarget(self, action: #selector(inspstatusbyleadsBtnction(sender:)), for: UIControl.Event.touchUpInside)
            return cell
        }else if tableView.tag == 3 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "listofalllsdatatablecell", for: indexPath) as! listofalllsdatatablecell
                cell.lsnameLabel.text = leadsummarylistarr[indexPath.row].status_name
                cell.lscountLabel.text = String(leadsummarylistarr[indexPath.row].count)
                let percentageValue = leadsummarylistarr[indexPath.row].percentage
                let formattedPercentage = String(format: "%.1f%%", percentageValue!)
                cell.lspercentageLabel.text = formattedPercentage
                cell.htOflsCell.constant = 55
            return cell
        }else if tableView.tag == 4 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ageoffollowupleadlisttablecell", for: indexPath) as! ageoffollowupleadlisttablecell
            if self.fromwhichaging == "Lead aging" {
                cell.nameoffollowupleadageLabel.text = leadaginglistarr[indexPath.row].age_name
                cell.countforfollowupleadagLabel.text = String(leadaginglistarr[indexPath.row].count)
                let percentageValue = leadaginglistarr[indexPath.row].percentage
                let formattedPercentage = String(format: "%.1f%%", percentageValue!)
                cell.percentageoffollowupleadageLabel.text = formattedPercentage
                cell.htOfageoffollwuoleadCell.constant = 55
            }else{
                cell.nameoffollowupleadageLabel.text = followupleadagelistarr[indexPath.row].follow_up_name
                cell.countforfollowupleadagLabel.text = String(followupleadagelistarr[indexPath.row].count)
                let percentageValue = followupleadagelistarr[indexPath.row].percentage
                let formattedPercentage = String(format: "%.1f%%", percentageValue!)
                cell.percentageoffollowupleadageLabel.text = formattedPercentage
                cell.htOfageoffollwuoleadCell.constant = 55
            }
            return cell
        }else if tableView.tag == 5 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "dealerspplisttablecell", for: indexPath) as! dealerspplisttablecell
            cell.dealernameLabel.text! = dealerpurchasedpacklistarr[indexPath.row].dealer_name
            cell.dealerpackagenameLabel.text! = String(self.dealerpurchasedpacklistarr[indexPath.row].quantity) + " " + dealerpurchasedpacklistarr[indexPath.row].display_name
            let dmamount: Double = self.dealerpurchasedpacklistarr[indexPath.row].final_price
            let dmnumberFormatter = NumberFormatter()
            dmnumberFormatter.numberStyle = .decimal
            dmnumberFormatter.groupingSeparator = ","
            if let dmformattedAmount = dmnumberFormatter.string(from: NSNumber(value: dmamount)) {
                let dmdisplayAmount = "Rs. " + dmformattedAmount
                cell.dealeramountLabel.text = dmdisplayAmount
            }
            if self.dealerpurchasedpacklistarr[indexPath.row].payment_mode == "cheque" || self.dealerpurchasedpacklistarr[indexPath.row].payment_mode == "Cheque" {
                cell.dealersbgView.backgroundColor = UIColor.init(hexString: "E9F0FA")
            }else{
                cell.dealersbgView.backgroundColor = .white
            }
            if self.dealerpurchasedpacklistarr[indexPath.row].dealer6monthdata.count == 0 {
                cell.dealerpackdatesBackView.isHidden = true
                cell.htOfdealerpackdatesView.constant = 0
            }else{
                cell.dealerpackdatesBackView.isHidden = false
                cell.htOfdealerpackdatesView.constant = 50
            }
            cell.innerarrofdata = self.dealerpurchasedpacklistarr[indexPath.row].dealer6monthdata
           
            cell.comboreloaddataofcell(index: indexPath.row)
            return cell
        }else if tableView.tag == 6 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "carsinspstatusTableCell", for: indexPath) as! carsinspstatusTableCell
            if self.insp_status == "Approved" {
                cell.carmakeLabel.text! = approvedvehlistarr[indexPath.row].vehicle_make
                cell.carmodelLabel.text! = approvedvehlistarr[indexPath.row].vehicle_model
                cell.carfueltypeLabel.text! = approvedvehlistarr[indexPath.row].fuel_type
                cell.cartransmissionLabel.text! = approvedvehlistarr[indexPath.row].transmission_type
                cell.carmfgyearLabel.text! = approvedvehlistarr[indexPath.row].manufacturing_year
                cell.carcountLabel.text! = String(approvedvehlistarr[indexPath.row].count)
                if self.approvedvehlistarr[indexPath.row].is_with_package == "Y" || self.approvedvehlistarr[indexPath.row].is_with_package == "y" {
                    cell.vehiclebgView.backgroundColor = UIColor.init(hexString: "E2FFEE")
                }else{
                    cell.vehiclebgView.backgroundColor = .white
                }
                cell.htOfcarinspCell.constant = 75
            }else{
                cell.carmakeLabel.text! = allcarlistarr[indexPath.row].vehicle_make
                cell.carmodelLabel.text! = allcarlistarr[indexPath.row].vehicle_model
                cell.carfueltypeLabel.text! = allcarlistarr[indexPath.row].fuel_type
                cell.cartransmissionLabel.text! = allcarlistarr[indexPath.row].transmission_type
                cell.carmfgyearLabel.text! = allcarlistarr[indexPath.row].manufacturing_year
                cell.carcountLabel.text! = String(allcarlistarr[indexPath.row].count)
                cell.htOfcarinspCell.constant = 75
                cell.vehiclebgView.backgroundColor = .white
            }
           
            return cell
        }else if tableView.tag == 7 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "normalemployeelistTableCell", for: indexPath) as! normalemployeelistTableCell
            cell.empnameLabel.text = allemployeelistarr[indexPath.row].employee_name
            if self.allemployeelistarr[indexPath.row].is_seleceted == true {
                cell.selectempImageView.isHidden = false
            }else{
                cell.selectempImageView.isHidden = true
            }
            cell.selectempBtn.tag = indexPath.row
            cell.selectempBtn.addTarget(self, action: #selector(selectempBtnAction(sender:)), for: UIControl.Event.touchUpInside)
            cell.htOfempCell.constant = 55
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "datesdataTableCell", for: indexPath) as! datesdataTableCell
            cell.nameofdateLabel.text = daterangelistarr[indexPath.row].text_type
            if self.daterangelistarr[indexPath.row].is_selected == true {
            cell.nameofdateLabel.textColor = UIColor.init(hexString: "0619c3")
            cell.selectdatetickImageView.isHidden = false
        }else{
            cell.nameofdateLabel.textColor = UIColor.init(hexString: "252a40")
            cell.selectdatetickImageView.isHidden = true
        }
            cell.selectdateBtn.tag = indexPath.row
            cell.selectdateBtn.addTarget(self, action: #selector(selectdaterangeBtnAction(sender:)), for: UIControl.Event.touchUpInside)
        cell.htOfdatesCell.constant = 60
            return cell
        }
            
      
           
       }
    
    @objc func selectfollowupstatusBtnAction(sender:UIButton!) {
        let index = sender.tag
        self.followupleadaggingdataBackView.isHidden = false
        self.fromwhichaging = "Inspection followup aging"
        self.followupleadaggingemplistBackView.isHidden = true
        self.htOffollowupleadaggingView.constant = 0
        self.followupleadaggingstatusdataBackView.isHidden = true
        self.htOffollowupleadaggingstatusView.constant = 0
        self.newfollowupleadstatusid = self.leadbystatuslistarr[index].status_id
        self.followupleadagingtitleLabel.text! = self.leadbystatuslistarr[index].status_name
        self.leadstatusdatalistServiceCall()
    
    }
    
    @objc func inspstatusvehdataBtnAction(sender:UIButton!) {
        let index = sender.tag
        self.vehicledataBackView.isHidden = false
        let bottomInset = vehiclefilterBackView.frame.height
        allcarsdetailsTableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: bottomInset, right: 0)
        self.insp_status = self.allinspectionscountlistarr[index].inspection_status
        self.inspectionstatustitleLabel.text! = self.allinspectionscountlistarr[index].inspection_status + " " + "Vehicles"
        if self.insp_status == "Approved" {
            self.approvedcarslistServiceCall()
            self.totalpackagesoldcountLabel.isHidden = false
        }else{
            self.totalpackagesoldcountLabel.isHidden = true
            self.repairrqatandrejectcarslistServiceCall()
        }
    }
    
    @objc func inspstatusbyleadsBtnction(sender:UIButton!) {
        let index = sender.tag
        self.followupleadaggingdataBackView.isHidden = false
        self.followupleadaggingemplistBackView.isHidden = true
        self.htOffollowupleadaggingView.constant = 0
        self.followupleadaggingstatusdataBackView.isHidden = true
        self.htOffollowupleadaggingstatusView.constant = 0
        self.insp_status = self.allinspectionscountlistarr[index].inspection_status
        self.followupleadagingtitleLabel.text! = "Lead Aging"
        self.fromwhichaging = "Lead aging"
        self.leadsaginglistServiceCall()
    }
    
    @objc func selectempBtnAction(sender:UIButton!) {
        
        self.allemployeelistarr[sender.tag].is_seleceted = !self.allemployeelistarr[sender.tag].is_seleceted
        
        if self.allemployeelistarr[sender.tag].is_seleceted == true {
            self.employeecount = employeecount + 1
            self.employeetitleLabel.text = "Employee" + "(" + String(self.employeecount) + ")"
            self.allemployeesdataTableView.reloadData()
        }else{
            self.employeecount = employeecount - 1
            self.employeetitleLabel.text = "Employee" + "(" + String(self.employeecount) + ")"
            self.allemployeesdataTableView.reloadData()
            if self.employeetitleLabel.text == "0" {
                self.employeetitleLabel.text = "Employee" + ""
            }else{
                self.employeetitleLabel.text = "Employee" + "(" + String(self.employeecount) + ")"
            }
            
        }
    
    }
    
    @objc func selectdaterangeBtnAction(sender:UIButton!) {
        
        for n in 0..<daterangelistarr.count {
            
            if sender.tag == n {
                daterangelistarr[n].is_selected = true
                
//                if self.fromwhereselectdate == "Followup" {
//                    self.customdatetitleLabel.text = "Custom date"
//                    self.followupfromdate = ""
//                    self.followuptodate = ""
//                    self.reloadCalendar()
//                    self.followupdatetitleLabel.text! = daterangelistarr[n].text_type
//                    self.followupagingselecteddate = String(daterangelistarr[n].id)
//                    self.followupleaddatalistServiceCall()
//                }else{
                    self.customdatetitleLabel.text = "Custom date"
                    self.fromdate = ""
                    self.todate = ""
                    self.reloadCalendar()
                    self.datetitleLabel.text! = daterangelistarr[n].text_type
                    self.dateid = String(daterangelistarr[n].id)
                    if self.daterangelistarr[n].id == 1 {
                        self.tletterBackView.backgroundColor = UIColor.init(hexString: "252a40")
                        self.tletterLabel.textColor = .white
                        self.mletterBackView.backgroundColor = UIColor.init(hexString: "f2f2f7")
                        self.mletterLabel.textColor = UIColor.init(hexString: "252a40")
                        self.lmtitleBackView.backgroundColor = UIColor.init(hexString: "f2f2f7")
                        self.lmtitleLabel.textColor = UIColor.init(hexString: "252a40")
                    }else if self.daterangelistarr[n].id == 9 {
                        self.tletterBackView.backgroundColor = UIColor.init(hexString: "f2f2f7")
                        self.tletterLabel.textColor = UIColor.init(hexString: "252a40")
                        self.mletterBackView.backgroundColor = UIColor.init(hexString: "252a40")
                        self.mletterLabel.textColor = .white
                        self.lmtitleBackView.backgroundColor = UIColor.init(hexString: "f2f2f7")
                        self.lmtitleLabel.textColor = UIColor.init(hexString: "252a40")
                    }else if self.daterangelistarr[n].id == 10 {
                        self.tletterBackView.backgroundColor = UIColor.init(hexString: "f2f2f7")
                        self.tletterLabel.textColor = UIColor.init(hexString: "252a40")
                        self.mletterBackView.backgroundColor = UIColor.init(hexString: "f2f2f7")
                        self.mletterLabel.textColor = UIColor.init(hexString: "252a40")
                        self.lmtitleBackView.backgroundColor = UIColor.init(hexString: "252a40")
                        self.lmtitleLabel.textColor = .white
                    }else{
                        self.tletterBackView.backgroundColor = UIColor.init(hexString: "f2f2f7")
                        self.tletterLabel.textColor = UIColor.init(hexString: "252a40")
                        self.mletterBackView.backgroundColor = UIColor.init(hexString: "f2f2f7")
                        self.mletterLabel.textColor = UIColor.init(hexString: "252a40")
                        self.lmtitleBackView.backgroundColor = UIColor.init(hexString: "f2f2f7")
                        self.lmtitleLabel.textColor = UIColor.init(hexString: "252a40")
                    }
                    self.leadbycategoryServiceCall()
             //   }
                self.daterangeBackView.isHidden = true
                
               
                
            }else{
                daterangelistarr[n].is_selected = false
                
            }
        }
       self.alldateslistTableView.reloadData()
    
    }
    
    
    }



class listofalldfollowupsstatustablecell : UITableViewCell {
    @IBOutlet weak var followupstatusnameLabel: UILabel!
    @IBOutlet weak var followupstatuscountLabel: UILabel!
    @IBOutlet weak var followupstatuscountubderlineLabel: UILabel!
    @IBOutlet weak var followupstatuspercentageLabel: UILabel!
    @IBOutlet weak var selectfollowupstatusBtn: UIButton!
    @IBOutlet weak var htOffollowupstatusCell: NSLayoutConstraint!
    
}


class statusofallinspectionstabelcell : UITableViewCell {
    @IBOutlet weak var insptatusnameLabel: UILabel!
    @IBOutlet weak var inspstatuscountLabel: UILabel!
    @IBOutlet weak var inspstatuspercentageLabel: UILabel!
    @IBOutlet weak var inspstatusleadscountLabel: UILabel!
    @IBOutlet weak var inspstatusleadunderlineLabel: UILabel!
    @IBOutlet weak var inspstatuscountunderlineLabel: UILabel!
    @IBOutlet weak var inspstatusvehdataBtn: UIButton!
    @IBOutlet weak var inspstatusbyleadsBtn: UIButton!
    @IBOutlet weak var htOfinspstatusCell: NSLayoutConstraint!
    @IBOutlet weak var inspectionstatuspercentBackView: UIView!
    
}

class listofalllsdatatablecell : UITableViewCell {
    @IBOutlet weak var lsnameLabel: UILabel!
    @IBOutlet weak var lscountLabel: UILabel!
    @IBOutlet weak var lspercentageLabel: UILabel!
    @IBOutlet weak var htOflsCell: NSLayoutConstraint!
    
}

class ageoffollowupleadlisttablecell : UITableViewCell {
    @IBOutlet weak var nameoffollowupleadageLabel: UILabel!
    @IBOutlet weak var countforfollowupleadagLabel: UILabel!
    @IBOutlet weak var percentageoffollowupleadageLabel: UILabel!
    @IBOutlet weak var htOfageoffollwuoleadCell: NSLayoutConstraint!
    
}

class dealerspplisttablecell : UITableViewCell {
    @IBOutlet weak var dealernameLabel: UILabel!
    @IBOutlet weak var dealerpackagenameLabel: UILabel!
    @IBOutlet weak var dealeramountLabel: UILabel!
    @IBOutlet weak var packagesdatesCollectionView: UICollectionView!
    @IBOutlet weak var dealersbgView: UIView!
    @IBOutlet weak var dealerpackdatesBackView: UIView!
    @IBOutlet weak var htOfdealerpackdatesView: NSLayoutConstraint!
    
    var controller : newhomedashboardpageVc!
    var innerarrofdata = [dealer6monthdataModelClass]()
    var MWImagesArr = [Any]()
    var indee = -1
    var finalamount = ""
    var selectedyear_id = ""
    
    override class func awakeFromNib() {
        awakeFromNib()
    }

    func comboreloaddataofcell(index : Int) {
          // DispatchQueue.main.async {
               self.packagesdatesCollectionView.delegate = self
               self.packagesdatesCollectionView.dataSource = self
               self.packagesdatesCollectionView.reloadData()
               self.indee = index
       }
    
}

class carsinspstatusTableCell : UITableViewCell {
    @IBOutlet weak var carmakeLabel: UILabel!
    @IBOutlet weak var carmodelLabel: UILabel!
    @IBOutlet weak var carfueltypeLabel: UILabel!
    @IBOutlet weak var cartransmissionLabel: UILabel!
    @IBOutlet weak var carmfgyearLabel: UILabel!
    @IBOutlet weak var carcountLabel: UILabel!
    @IBOutlet weak var htOfcarinspCell: NSLayoutConstraint!
    @IBOutlet weak var vehiclebgView: UIView!
    
}

class normalemployeelistTableCell : UITableViewCell {
    @IBOutlet weak var empnameLabel: UILabel!
    @IBOutlet weak var selectempImageView: UIImageView!
    @IBOutlet weak var selectempBtn: UIButton!
    @IBOutlet weak var htOfempCell: NSLayoutConstraint!
    
}

class datesdataTableCell : UITableViewCell {
    @IBOutlet weak var nameofdateLabel: UILabel!
    @IBOutlet weak var selectdatetickImageView: UIImageView!
    @IBOutlet weak var selectdateBtn: UIButton!
    @IBOutlet weak var htOfdatesCell: NSLayoutConstraint!
    
}

extension dealerspplisttablecell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "alldatesofdealerpurchasedlistcollectioncell", for: indexPath) as! alldatesofdealerpurchasedlistcollectioncell
            cell.datenameLabel.text! = innerarrofdata[indexPath.row].payment_month
            cell.htOfdateCell.constant = 45
            return cell
        
        
    }
    
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       
            return innerarrofdata.count
        
    
        }
    
   
   }


class alldatesofdealerpurchasedlistcollectioncell : UICollectionViewCell {
    @IBOutlet weak var datenameLabel: UILabel!
    @IBOutlet weak var htOfdateCell: NSLayoutConstraint!
    
}
