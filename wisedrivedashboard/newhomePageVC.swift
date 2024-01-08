//
//  newhomePageVC.swift
//  wisedrivedashboard
//
//  Created by Maanas Kumar on 15/07/23.
//

import UIKit
import Highcharts
import Alamofire
import Charts
import MBCircularProgressBar
import FSCalendar
import RangeSeekSlider
import PINRemoteImage
import CoreLocation

class newhomePageVC: UIViewController, FSCalendarDataSource , FSCalendarDelegate {
    
    

    @IBOutlet weak var mainalldataCollectionView: UICollectionView!
    @IBOutlet weak var secondlistCollectionView: UICollectionView!
    @IBOutlet weak var thirddetailsCollectionView: UICollectionView!
    @IBOutlet weak var statusbarchartView: HIChartView!
    @IBOutlet weak var statuspiechartView: HIChartView!
    @IBOutlet weak var daterangeBackView: UIView!
    @IBOutlet weak var alldatesTableVIew: UITableView!
    @IBOutlet weak var filterBackView: UIView!
    @IBOutlet weak var selectedfilterBackView: UIView!
    @IBOutlet weak var allselectedfiltersTableView: UITableView!
    @IBOutlet weak var transactionsTableView: UITableView!
    @IBOutlet weak var leadsdataCollectionView: UICollectionView!
    @IBOutlet weak var chartsBackView: UIView!
    @IBOutlet weak var dataofallemployeesBackView: UIView!
    @IBOutlet weak var allemployeesdetailsTableVIew: UITableView!
    @IBOutlet weak var selectallemployeestickImageView: UIImageView!
    @IBOutlet weak var employeetitileLabel: UILabel!
    @IBOutlet weak var typeTitleLabel: UILabel!
    @IBOutlet weak var alltypesBackView: UIView!
    @IBOutlet weak var differenttypesTableView: UITableView!
    @IBOutlet weak var statustitleLabel: UILabel!
    @IBOutlet weak var datetitleLabel: UILabel!
    @IBOutlet weak var customdateBackView: UIView!
    @IBOutlet weak var calenderView: UIView!
    @IBOutlet weak var customdatetitleLabel: UILabel!
    @IBOutlet weak var customcalendar: FSCalendar!
    @IBOutlet weak var salesdatabasedonsourceCollectionView: UICollectionView!
    @IBOutlet weak var totalsalestitleLabel: UILabel!
    @IBOutlet weak var salestotalamountLabel: UILabel!
    @IBOutlet weak var percentageoftotalsalesLabel: UILabel!
    @IBOutlet weak var dmtitleLabel: UILabel!
    @IBOutlet weak var dmamountLabel: UILabel!
    @IBOutlet weak var dmpercenatgeLabel: UILabel!
    @IBOutlet weak var whatsapptitleLabel: UILabel!
    @IBOutlet weak var whatsappamountLabel: UILabel!
    @IBOutlet weak var whatsapppercentageLabel: UILabel!
    @IBOutlet weak var calendar: FSCalendar!
    @IBOutlet weak var htOfstatustableView: NSLayoutConstraint!
    @IBOutlet weak var htOffirstcollectionView: NSLayoutConstraint!
    @IBOutlet weak var htOfmainView: NSLayoutConstraint!
    @IBOutlet weak var newpagecontrol: UIPageControl!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var maincontentView: UIView!
    @IBOutlet weak var highlightsscrollView: UIScrollView!
    @IBOutlet weak var hightlightscontentView: UIView!
    @IBOutlet weak var firstboxtitleLabel: UILabel!
    @IBOutlet weak var firstboxdateLabel: UILabel!
    @IBOutlet weak var firstboxtotalcountLabel: UILabel!
    @IBOutlet weak var firstboxsubtitleoneLabel: UILabel!
    @IBOutlet weak var firstboxsubpercentoneLabel: UILabel!
    @IBOutlet weak var firstboxsubcountoneLabel: UILabel!
    @IBOutlet weak var firstboxsubtitletwoLabel: UILabel!
    @IBOutlet weak var firstboxsubpercenttwoLabel: UILabel!
    @IBOutlet weak var firstboxsubcounttwoLabel: UILabel!
    @IBOutlet weak var firstboxsubtitlethreeLabel: UILabel!
    @IBOutlet weak var firstboxsubpercentthreeLabel: UILabel!
    @IBOutlet weak var firstboxsubcountthreeLabel: UILabel!
    @IBOutlet weak var secondboxtitleLabel: UILabel!
    @IBOutlet weak var secondboxdateLabel: UILabel!
    @IBOutlet weak var secondboxtotalcountLabel: UILabel!
    @IBOutlet weak var secondboxsubtitleoneLabel: UILabel!
    @IBOutlet weak var secondboxsubpercentoneLabel: UILabel!
    @IBOutlet weak var secondboxsubcountoneLabel: UILabel!
    @IBOutlet weak var secondboxsubtitletwoLabel: UILabel!
    @IBOutlet weak var secondboxsubpercebttwoLabel: UILabel!
    @IBOutlet weak var secondboxcounttwoLabel: UILabel!
    @IBOutlet weak var firstboxalldetailsBackView: UIView!
    @IBOutlet weak var secondboxalldetailsBackView: UIView!
    @IBOutlet weak var thirdboxdmdetailsBackView: UIView!
    @IBOutlet weak var thirdboxalltitleLabel: UILabel!
    @IBOutlet weak var thirdboxdateLabel: UILabel!
    @IBOutlet weak var thirdboxallcountLabel: UILabel!
    @IBOutlet weak var thirdboxsubtitleoneLabel: UILabel!
    @IBOutlet weak var thirdboxsubpercentoneLabel: UILabel!
    @IBOutlet weak var thirdboxsubcountoneLabel: UILabel!
    @IBOutlet weak var thirdboxsubtitletwoLabel: UILabel!
    @IBOutlet weak var thirdboxsubpercentLabel: UILabel!
    @IBOutlet weak var thirdboxsubcounttwoLabel: UILabel!
    @IBOutlet weak var btocpercentageLabel: UILabel!
    @IBOutlet weak var followupleadagedataTableView: UITableView!
    @IBOutlet weak var ageofallfollowupleaddataBackView: UIView!
    @IBOutlet weak var followupleadagetitlebgBackView: UIView!
    @IBOutlet weak var allfollowupleadempdataCollectionView: UICollectionView!
    @IBOutlet weak var leadfollowupagingstatusdataCollectionView: UICollectionView!
    @IBOutlet weak var htOffollowupstatusdataView: NSLayoutConstraint!
    @IBOutlet weak var btocwarrantysaletotalamountLabel: UILabel!
    @IBOutlet weak var btocwarrantypackagetotalcountLabel: UILabel!
    @IBOutlet weak var btocservicetotalamountLabel: UILabel!
    @IBOutlet weak var btocservicepackagetotalcountLabel: UILabel!
    @IBOutlet weak var btocinspectiontotalamountLabel: UILabel!
    @IBOutlet weak var btocinspectionpackagetotalcountLabel: UILabel!
    @IBOutlet weak var avgsaletimedaysLabel: UILabel!
    @IBOutlet weak var followupdatetitleLabel: UILabel!
    @IBOutlet weak var totaldataofallinspectionsCollectionView: UICollectionView!
    @IBOutlet weak var allinspectiondataTableView: UITableView!
    @IBOutlet weak var vehiclelistBackView: UIView!
    @IBOutlet weak var allvehlistbasedoninspstatusTableView: UITableView!
    @IBOutlet weak var agingfollowupemployeedataBackView: UIView!
    @IBOutlet weak var htOfaggingfollowupempView: NSLayoutConstraint!
    @IBOutlet weak var agingfollowupstatusBackView: UIView!
    @IBOutlet weak var servicestitleBackView: UIView!
    @IBOutlet weak var servicestitletabLabel: UILabel!
    @IBOutlet weak var watitleBackView: UIView!
    @IBOutlet weak var watitletabLabel: UILabel!
    @IBOutlet weak var followupleadagingtitleLabel: UILabel!
    @IBOutlet weak var inspectionstatustitleLabel: UILabel!
    @IBOutlet weak var totalpackagesoldcountLabel: UILabel!
    @IBOutlet weak var vehiclefilterBackView: UIView!
    @IBOutlet weak var carfiltersdataBackView: UIView!
    @IBOutlet weak var yearrangeslider: RangeSeekSlider!
    @IBOutlet weak var allbrandsdataCollectionView: UICollectionView!
    @IBOutlet weak var dieseltickImageView: UIImageView!
    @IBOutlet weak var pertoltickImageView: UIImageView!
    @IBOutlet weak var manualtickImageView: UIImageView!
    @IBOutlet weak var automatictickImageView: UIImageView!
    @IBOutlet weak var newtBackView: UIView!
    @IBOutlet weak var newtletterLabel: UILabel!
    @IBOutlet weak var newmBackView: UIView!
    @IBOutlet weak var newmletterLabel: UILabel!
    @IBOutlet weak var DurationtitleLabel: UILabel!
    @IBOutlet weak var b2bdealersalesdataTableView: UITableView!
    @IBOutlet weak var dealerpurchasedpackagedataBackView: UIView!
    @IBOutlet weak var lastmonthtitleBackView: UIView!
    @IBOutlet weak var lastmonttitleLabel: UILabel!
    @IBOutlet weak var dealerstitleunderlineLabel: UILabel!
    @IBOutlet weak var dealerpurchaseddataBtn: UIButton!
    @IBOutlet weak var leadsummarylastmonthBackView: UIView!
    @IBOutlet weak var leadsummarylastmonthtitleLabel: UILabel!
    @IBOutlet weak var lastmonthamountoneBakcView: UIView!
    @IBOutlet weak var lastmonthoneLabel: UILabel!
    @IBOutlet weak var lastbeforemonthttwoBackView: UIView!
    @IBOutlet weak var lastbeforemonthtwoLabel: UILabel!
    @IBOutlet weak var leadsummaryoneBackView: UIView!
    @IBOutlet weak var leadsummaryoneLabel: UILabel!
    @IBOutlet weak var leadsummarytwoBackView: UIView!
    @IBOutlet weak var leadsummarytwoLabel: UILabel!
    @IBOutlet weak var leadsummarygraphBackView: UIView!
    @IBOutlet weak var leadsummarytotalleaddscountBackView: UIView!
    @IBOutlet weak var leadsummarytotalleadscountLabel: UILabel!
    @IBOutlet weak var htOfleadsummarytotalleadView: NSLayoutConstraint!
    
    
    
    
    var mainlistarr = [UtmSourceDataMlodelClass]()
    
    var secondlistarr = [UtmmediumDataModelClass]()
    
    var thirdlistarr = [UtmCampaignDataModelClass]()
    
    var daterangelistarr = [TextTypeListModelClass]()
    
    var totalsaleslistarr = [TotalSaleDataModelClass]()
    
    var Consolidatalistarr = [ConsolidateDataModelClass]()
    
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
    
    var allmapslistarr = [ShowRoomDataModelClass]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        let refreshControl = UIRefreshControl()
//        refreshControl.addTarget(self, action: #selector(doSomething), for: .valueChanged)
//        maincontentView.refreshControl = refreshControl
        
        
        
        let refreshControl = UIRefreshControl()
               refreshControl.addTarget(self, action: #selector(doSomething), for: .valueChanged)
               scrollView.refreshControl = refreshControl
        
        self.daterangeBackView.isHidden = true
        self.filterBackView.isHidden = true
        self.selectedfilterBackView.isHidden = true
        self.chartsBackView.isHidden = true
        self.dataofallemployeesBackView.isHidden = true
        self.alltypesBackView.isHidden = true
        
        self.selectallemployeestickImageView.isHidden = true
        self.customdateBackView.isHidden = true
  
        self.ageofallfollowupleaddataBackView.isHidden = true
        
        self.vehiclelistBackView.isHidden = true
        
        self.carfiltersdataBackView.isHidden = true
        
        self.dieseltickImageView.isHidden = true
        self.pertoltickImageView.isHidden = true
        self.manualtickImageView.isHidden = true
        self.automatictickImageView.isHidden = true
        
        self.dealerpurchasedpackagedataBackView.isHidden = true
        
        self.followupleadagetitlebgBackView.backgroundColor = UIColor.init(hexString: "FFFCEFF1")
        
        self.servicestitleBackView.backgroundColor = .clear
        self.servicestitletabLabel.textColor = UIColor.init(hexString: "252a40")
        self.watitleBackView.backgroundColor = .clear
        self.watitletabLabel.textColor = UIColor.init(hexString: "252a40")
        
        self.newtBackView.backgroundColor = UIColor.init(hexString: "252a40")
        self.newtletterLabel.textColor = .white
        self.newmBackView.backgroundColor = UIColor.init(hexString: "f2f2f7")
        self.newmletterLabel.textColor = UIColor.init(hexString: "252a40")
        
        self.yearrangeslider.delegate = self
        yearrangeslider.minValue = CGFloat((self.minvalue as NSString).floatValue)
        yearrangeslider.maxValue = CGFloat((self.maxvalue as NSString).floatValue)
        
        yearrangeslider.selectedMinValue = CGFloat((self.minvalue as NSString).floatValue)
        yearrangeslider.selectedMaxValue = CGFloat((self.maxvalue as NSString).floatValue)
        
        yearrangeslider.numberFormatter.numberStyle = .none
        
        yearrangeslider.minLabelFont = UIFont.systemFont(ofSize: 16) // Adjust the font size as needed
        yearrangeslider.maxLabelFont = UIFont.systemFont(ofSize: 16)
        
        self.lastmonthtitleBackView.backgroundColor = UIColor.init(hexString: "A8FFD3")
        self.lastmonttitleLabel.textColor = UIColor.init(hexString: "252a40")
        self.lastmonthamountoneBakcView.backgroundColor = .white
        self.lastmonthoneLabel.textColor = UIColor.init(hexString: "252a40")
        self.lastbeforemonthttwoBackView.backgroundColor = .white
        self.lastbeforemonthtwoLabel.textColor = UIColor.init(hexString: "252a40")
        self.lastmonthorthismonth_id = "9"
        
        self.leadsummarylastmonthBackView.backgroundColor = UIColor.init(hexString: "252a40")
        self.leadsummarylastmonthtitleLabel.textColor = .white
        self.leadsummaryoneBackView.backgroundColor = .white
        self.leadsummaryoneLabel.textColor = UIColor.init(hexString: "252a40")
        self.leadsummarytwoBackView.backgroundColor = .white
        self.leadsummarytwoLabel.textColor = UIColor.init(hexString: "252a40")
        self.leadsummarylastmonthortismonth_id = "9"
        
        
        
        calendar.dataSource = self
        calendar.delegate = self
        calendar.scrollDirection = .horizontal
        calendar.allowsMultipleSelection = true
               // Set minimumDate and maximumDate to limit the selection to the desired range
               let formatter = DateFormatter()
               formatter.dateFormat = "dd-MM-yyyy"
               
        
        
        self.dateid = "1"
        
        highlightsscrollView.delegate = self
        highlightsscrollView.isPagingEnabled = true
        
        highlightsscrollView.isScrollEnabled = true
        scrollView.contentSize = CGSize(width: hightlightscontentView.frame.width, height: scrollView.frame.height)

               // Disable vertical scrolling
        highlightsscrollView.showsVerticalScrollIndicator = false
        
        leadbycategoryServiceCall()
        
        viewmapServiceCall()
        
    }
    

    @objc func doSomething() {
           // Perform the refresh action here
        self.leadbycategoryServiceCall()
           // After the refresh is complete, end the refresh control
           scrollView.refreshControl?.endRefreshing()
       }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }

    
    @IBAction func hideagefollowupleadACtionBtn(_ sender: Any) {
        self.ageofallfollowupleaddataBackView.isHidden = true
    }
    
    @IBAction func showageoffollowupleadActionBtn(_ sender: Any) {
        self.ageofallfollowupleaddataBackView.isHidden = false
        self.agingfollowupemployeedataBackView.isHidden = false
        self.htOfaggingfollowupempView.constant = 50
        self.agingfollowupstatusBackView.isHidden = false
        self.leadsummarytotalleaddscountBackView.isHidden = true
        self.htOfleadsummarytotalleadView.constant = 0
        self.followupleadagingtitleLabel.text! = "Followup Lead Aging"
        self.DurationtitleLabel.text! = "Duration"
        self.fromwhichaging = "Followup Lead Aging"
        self.leadsummarylastmonthBackView.isHidden = true
        self.leadsummaryoneBackView.isHidden = true
        self.leadsummarytwoBackView.isHidden = true
        self.leadsummarygraphBackView.isHidden = true
        self.followupleadagingemplistServiceCall()
    }
    
    
    @IBAction func pagecontrollerValueChange(_ sender: UIPageControl) {
        let page = sender.currentPage
            let xOffset = CGFloat(page) * scrollView.frame.width
            highlightsscrollView.setContentOffset(CGPoint(x: xOffset, y: 0), animated: true)
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
   
    @IBAction func followupagingdatefilterActionBtn(_ sender: Any) {
        if self.fromwhereselectdate == "normal" {
            alldateslistServiceCall()
            self.fromwhereselectdate = "Followup"
            self.daterangeBackView.isHidden = false
            self.customdatetitleLabel.text! = "Custom Date"
            removeSelectedDates()
        }else{
            self.fromwhereselectdate = "Followup"
            if self.daterangelistarr.count == 0 {
                self.daterangeBackView.isHidden = false
                alldateslistServiceCall()
            }else{
                self.daterangeBackView.isHidden = false
            }
        }
        
    }
    
    func removeSelectedDates() {
        let selectedDates = calendar.selectedDates
        for date in selectedDates {
            calendar.deselect(date)
        }
    }
  
    @IBAction func todayActionBtn(_ sender: Any) {
        
        if self.fromwhereselectdate == "Followup" {
            alldateslistServiceCall()
            self.fromwhereselectdate = "normal"
            self.daterangeBackView.isHidden = false
            self.filterBackView.isHidden = true
            self.customdatetitleLabel.text! = "Custom Date"
            removeSelectedDates()
        }else{
            self.fromwhereselectdate = "normal"
            if self.daterangelistarr.count == 0 {
                self.daterangeBackView.isHidden = false
                self.filterBackView.isHidden = true
                alldateslistServiceCall()
            }else{
                self.filterBackView.isHidden = true
                self.daterangeBackView.isHidden = false
            }
        }
       
    }
    
    @IBAction func hidedaterangeActionBtn(_ sender: Any) {
        self.daterangeBackView.isHidden = true
    }
    
    @IBAction func filterActionBtn(_ sender: Any) {
        self.filterBackView.isHidden = false
    }
    
    @IBAction func hidefilterActionBtn(_ sender: Any) {
        self.filterBackView.isHidden = true
    }
    
    @IBAction func hidesubfilterActionBtn(_ sender: Any) {
        self.selectedfilterBackView.isHidden = true
    }
    
    @IBAction func campaignActionBtn(_ sender: Any) {
        self.selectedfilterBackView.isHidden = false
    }
    
    @IBAction func hidechartsActionBtn(_ sender: Any) {
        self.chartsBackView.isHidden = true
    }
    
    @IBAction func hidecustomdateActionBtn(_ sender: Any) {
        self.customdateBackView.isHidden = true
    }
    
    @IBAction func hidevehiclelistActionBtn(_ sender: Any) {
        self.vehiclelistBackView.isHidden = true
        
        self.dieseltickImageView.isHidden = true
        self.pertoltickImageView.isHidden = true
        self.manualtickImageView.isHidden = true
        self.automatictickImageView.isHidden = true
        
        
        self.fule_type = ""
        self.transmission_type = ""
        self.brandiconlistarr.removeAll()
        self.selectedbrandste = ""
    
        
//        yearrangeslider.delegate = self
//        yearrangeslider.minValue = 1995
//        yearrangeslider.maxValue = 2023
//
//        yearrangeslider.selectedMinValue = 1995
//        yearrangeslider.selectedMaxValue = 2023
//
//        yearrangeslider.numberFormatter.numberStyle = .none
//
//        yearrangeslider.minLabelFont = UIFont.systemFont(ofSize: 16) // Adjust the font size as needed
//        yearrangeslider.maxLabelFont = UIFont.systemFont(ofSize: 16)
        
        resetRangeSeekSlider()
        self.yearmaximum = ""
        self.yearminimum = ""
        
    }
    
    func resetRangeSeekSlider() {
        // Set the minimum and maximum values for the RangeSeekSlider
        yearrangeslider.selectedMinValue = 1995
        yearrangeslider.selectedMaxValue = 2023
        yearrangeslider.minValue = 1995
        yearrangeslider.maxValue = 2023
        
        // You can also reset any other customizations you made to the slider here
        // For example, resetting fonts or colors if needed.
        
        // Update the labels or any UI elements that display the slider values
        self.yearminimum = "1995"
        self.yearmaximum = "2023"
    }
    
    
    @IBAction func piegraphActionBtn(_ sender: Any) {
        self.chartsBackView.isHidden = false
        self.statuspiechartView.isHidden = false
        self.statusbarchartView.isHidden = true
        leadsbystatusbarchartServiceCall()
       
    }
    
    @IBAction func allcarsfilterActionBtn(_ sender: Any) {
        if self.brandiconlistarr.count == 0 {
            self.brandslistServiceCall()
            self.carfiltersdataBackView.isHidden = false
        }else{
            self.carfiltersdataBackView.isHidden = false
        }
        
    }
    
    @IBAction func hidecarfilterACtionBtn(_ sender: Any) {
        self.carfiltersdataBackView.isHidden = true
    }
    
    @IBAction func dieselActionBtn(_ sender: Any) {
        self.dieseltickImageView.isHidden = false
        self.pertoltickImageView.isHidden = true
        self.fule_type = "Diesel"
    }
    
    @IBAction func pertolActionBtn(_ sender: Any) {
        self.dieseltickImageView.isHidden = true
        self.pertoltickImageView.isHidden = false
        self.fule_type = "Petrol"
    }
    
    @IBAction func manualActionBtn(_ sender: Any) {
        self.manualtickImageView.isHidden = false
        self.automatictickImageView.isHidden = true
        self.transmission_type = "Manual"
    }
    
    @IBAction func automaticActionBtn(_ sender: Any) {
        self.manualtickImageView.isHidden = true
        self.automatictickImageView.isHidden = false
        self.transmission_type = "Automtic"
    }
    
    @IBAction func applyefilterActionBtn(_ sender: Any) {
        self.carfiltersdataBackView.isHidden = true
        if self.insp_status == "Approved" {
            self.approvedcarslistServiceCall()
        }else{
            self.repairrqatandrejectcarslistServiceCall()
        }
    }
    
    
    
    @IBAction func employeelistActionBtn(_ sender: Any) {
        if self.allemployeelistarr.count == 0 {
            self.dataofallemployeesBackView.isHidden = false
            allemployeelistServiceCall()
        }else{
            self.dataofallemployeesBackView.isHidden = false
        }
    }
    
    @IBAction func bargraphActionBtn(_ sender: Any) {
        self.chartsBackView.isHidden = false
        self.statuspiechartView.isHidden = true
        self.statusbarchartView.isHidden = false
        leadsbystatusbarchartServiceCall()
       
    }
    
    @IBAction func hideallemployeesActionBtn(_ sender: Any) {
        self.dataofallemployeesBackView.isHidden = true
    }
    
    @IBAction func customdaterangeACtionBtn(_ sender: Any) {
        self.customdateBackView.isHidden = false
    }
    
    @IBAction func servicestabActionBtn(_ sender: Any) {
//        if self.servicestab_selected == "n" {
//            self.servicestitleBackView.backgroundColor = UIColor.init(hexString: "252a40")
//            self.servicestitletabLabel.textColor = .white
//            self.watitleBackView.backgroundColor = .clear
//            self.watitletabLabel.textColor = UIColor.init(hexString: "252a40")
//            self.servicestab_selected = "y"
//            self.watab_selected = "n"
//            self.leadtype_id = "5"
//            self.leadbycategoryServiceCall()
//        }else{
//            self.servicestitleBackView.backgroundColor = .clear
//            self.servicestitletabLabel.textColor = UIColor.init(hexString: "252a40")
//            self.watitleBackView.backgroundColor = .clear
//            self.watitletabLabel.textColor = UIColor.init(hexString: "252a40")
//            self.servicestab_selected = "n"
//            self.leadtype_id = ""
//            self.leadbycategoryServiceCall()
//        }
        
     //   var googleMapsURL = "https://www.google.com/maps/search/?api=1&query="


        // Construct a query for all the locations
//        let locationsQuery = allmapslistarr
//            .compactMap { data in
//                if let lat = data.Latitude, let long = data.Longitude {
//                    return "\(lat),\(long)"
//                }
//                return nil
//            }
//            .joined(separator: "+")
//
//        // Create a Google Maps URL with the query
//        let googleMapsURL = "https://www.google.com/maps/search/?api=1&query=\(locationsQuery)"
//
//        if let url = URL(string: googleMapsURL) {
//            if UIApplication.shared.canOpenURL(url) {
//                UIApplication.shared.open(url, options: [:], completionHandler: nil)
//            } else {
//                // Handle the case where the Google Maps app is not installed
//                print("Google Maps app is not installed.")
//            }
//        } else {
//            // Handle the case where the URL is invalid
//            print("Invalid URL for Google Maps")
//        }
        
//        let nearbyFuelLocation = "12.90388366,77.50926588" // Replace with the actual coordinates of nearby fuel
//                let nearbyEVChargingLocation = "12.9073608,77.59858652" // Replace with the actual coordinates of nearby EV charging
//
//                let googleMapsURLString = "comgooglemaps://?saddr=&daddr=\(nearbyFuelLocation)+to:\(nearbyEVChargingLocation)&directionsmode=driving"
//
//                if let url = URL(string: googleMapsURLString), UIApplication.shared.canOpenURL(url) {
//                    UIApplication.shared.open(url, options: [:], completionHandler: nil)
//                } else {
//                    // Handle the case where Google Maps is not installed
//                    print("Google Maps app is not installed.")
//                    // You can provide a fallback or ask the user to install Google Maps from the App Store.
//                }

        var markerString = ""
               
               for location in allmapslistarr {
                   if let latitude = location.Latitude, let longitude = location.Longitude {
                       // Construct the marker for each location
                       markerString += "\(latitude),\(longitude)+"
                   }
               }
               
               if !markerString.isEmpty {
                   markerString.removeLast() // Remove the trailing '+'

                   let googleMapsURLString = "https://www.google.com/maps/search/?api=1&query=\(markerString)"

                   if let url = URL(string: googleMapsURLString) {
                       UIApplication.shared.open(url, options: [:], completionHandler: nil)
                   } else {
                       print("Invalid URL")
                   }
               } else {
                   print("No valid coordinates available.")
               }

        
        
            
        






        

       



        
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
    
    
    @IBAction func watabActionBtn(_ sender: Any) {
        if self.watab_selected == "n" {
            self.servicestitleBackView.backgroundColor = .clear
            self.servicestitletabLabel.textColor = UIColor.init(hexString: "252a40")
            self.watitleBackView.backgroundColor = UIColor.init(hexString: "252a40")
            self.watitletabLabel.textColor = .white
            self.watab_selected = "y"
            self.servicestab_selected = "n"
            self.leadtype_id = "4"
            self.leadbycategoryServiceCall()
        }else{
            self.servicestitleBackView.backgroundColor = .clear
            self.servicestitletabLabel.textColor = UIColor.init(hexString: "252a40")
            self.watitleBackView.backgroundColor = .clear
            self.watitletabLabel.textColor = UIColor.init(hexString: "252a40")
            self.watab_selected = "n"
            self.leadtype_id = ""
            self.leadbycategoryServiceCall()
        }
    }
    
    
    @IBAction func customdatesubmitActionBtn(_ sender: Any) {
        
        if self.fromwhereselectdate == "Followup" {
            
            if self.followupfromdate != "" && self.followuptodate == "" {
                self.view.ShowBlackTostWithText(message: "Please date range", Interval: 2)
            }else{
                    self.followupagingselecteddate = ""
                    followupleaddatalistServiceCall()
                    if self.followupfromdate == "" || self.followupfromdate == nil {
                        self.customdatetitleLabel.text = "Custom Date"
                        self.followupdatetitleLabel.text! = "All"
                    }else{
                        let dateFormatter = DateFormatter()
                        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
                        dateFormatter.dateFormat = "yyyy-MM-dd"
                        let date = dateFormatter.date(from: self.followupfromdate)
                        dateFormatter.dateFormat = "dd MMM yyyy"
                        let dateStr = dateFormatter.string(from:date!)
                        self.followupdisplayfromdate = dateStr
                   }
                    if self.followuptodate == "" || self.followuptodate == nil {
                        self.customdatetitleLabel.text = "Custom"
                        self.followupdatetitleLabel.text! = "All"
                    }else{
                        let dateFormatter = DateFormatter()
                        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
                        dateFormatter.dateFormat = "yyyy-MM-dd"
                        let date = dateFormatter.date(from: self.followuptodate)
                        dateFormatter.dateFormat = "dd MMM yyyy"
                        let dateStr = dateFormatter.string(from:date!)
                        self.followupdisplaytodate = dateStr
                   }
                    self.customdatetitleLabel.text = self.followupdisplayfromdate + " - " + self.followupdisplaytodate
                    self.followupdatetitleLabel.text! = self.followupdisplayfromdate + " - " + self.followupdisplaytodate
                    self.daterangeBackView.isHidden = true
                    self.customdateBackView.isHidden = true
                    
                    self.followupleaddatalistServiceCall()
                    self.daterangeBackView.isHidden = true
               
            }
            
        }else{
            
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
                
                self.newtBackView.backgroundColor = UIColor.init(hexString: "f2f2f7")
                self.newtletterLabel.textColor = UIColor.init(hexString: "252a40")
                self.newmBackView.backgroundColor = UIColor.init(hexString: "f2f2f7")
                self.newmletterLabel.textColor = UIColor.init(hexString: "252a40")
               
            }
            
        }
        
    }
    
    @IBAction func typelistActionBtn(_ sender: Any) {
        if self.alltypeslistarr.count == 0 {
            allleadtypeslistServiceCall()
            self.alltypesBackView.isHidden = false
        }else{
            self.alltypesBackView.isHidden = false
        }
       
    }
    
    @IBAction func hidetypelistActionBtn(_ sender: Any) {
        self.alltypesBackView.isHidden = true
    }
    @IBAction func selectallemployeesActionBtn(_ sender: Any) {
        if self.isallempselected == "n" {
            self.selectallemployeestickImageView.isHidden = false
            self.employeecount = employeecount + 1
            self.employeetitileLabel.text = "Employee" + "(" + String(self.employeecount) + ")"
            let allSelected = allemployeelistarr.allSatisfy { $0.is_seleceted }
            allemployeelistarr = allemployeelistarr.map { employee in
                        var mutableEmployee = employee
                        mutableEmployee.is_seleceted = !allSelected
                        return mutableEmployee
                    }
            self.allemployeesdetailsTableVIew.reloadData()
            self.isallempselected = "y"
        }else{
            self.selectallemployeestickImageView.isHidden = true
            self.employeecount = employeecount - 1
            self.employeetitileLabel.text = "Employee" + "(" + String(self.employeecount) + ")"
            let allSelected = allemployeelistarr.allSatisfy { $0.is_seleceted }
            allemployeelistarr = allemployeelistarr.map { employee in
                        var mutableEmployee = employee
                        mutableEmployee.is_seleceted = !allSelected
                        return mutableEmployee
                    }
            self.allemployeesdetailsTableVIew.reloadData()
            self.isallempselected = "y"
        }
        
            
    }
    
    @IBAction func newtActionBtn(_ sender: Any) {
        self.newtBackView.backgroundColor = UIColor.init(hexString: "252a40")
        self.newtletterLabel.textColor = .white
        self.newmBackView.backgroundColor = UIColor.init(hexString: "f2f2f7")
        self.newmletterLabel.textColor = UIColor.init(hexString: "252a40")
        self.fromdate = ""
        self.todate = ""
        self.dateid = "1"
        self.datetitleLabel.text! = "Today"
        leadbycategoryServiceCall()
    }
    
    @IBAction func newmletterActionBtn(_ sender: Any) {
        self.newtBackView.backgroundColor = UIColor.init(hexString: "f2f2f7")
        self.newtletterLabel.textColor = UIColor.init(hexString: "252a40")
        self.newmBackView.backgroundColor = UIColor.init(hexString: "252a40")
        self.newmletterLabel.textColor = .white
        self.fromdate = ""
        self.todate = ""
        self.dateid = "9"
        self.datetitleLabel.text! = "This Month"
        leadbycategoryServiceCall()
    }
    
    @IBAction func leadsummaryActionBtn(_ sender: Any) {
        self.ageofallfollowupleaddataBackView.isHidden = false
        self.agingfollowupemployeedataBackView.isHidden = true
        self.htOfaggingfollowupempView.constant = 50
        self.leadsummarytotalleaddscountBackView.isHidden = false
        self.htOfleadsummarytotalleadView.constant = 47.33
        self.agingfollowupstatusBackView.isHidden = false
        self.htOffollowupstatusdataView.constant = 50
        self.followupleadagingtitleLabel.text! = "Leads Summary"
        self.DurationtitleLabel.text! = "Name"
        self.fromwhichaging = "Leads summary"
        self.leadsummarylastmonthBackView.isHidden = false
        self.leadsummaryoneBackView.isHidden = false
        self.leadsummarytwoBackView.isHidden = false
        self.leadsummarygraphBackView.isHidden = false
        self.leadsummarytypelistServiceCall()
        

        
    }
    
    
    @IBAction func btobsalesdetailsActionBtn(_ sender: Any) {
        self.dealerpurchasedpackagedataBackView.isHidden = false
        self.dealerpurchasedpackagesServiceCall()
    }
    
    @IBAction func hidebtobsalesofdealerActionBtn(_ sender: Any) {
        self.dealerpurchasedpackagedataBackView.isHidden = true
    }
    
    @IBAction func lastmonthActionBtn(_ sender: Any) {
     //   if self.selectlastmonth == "n" {
            self.lastmonthtitleBackView.backgroundColor = UIColor.init(hexString: "A8FFD3")
            self.lastmonttitleLabel.textColor = UIColor.init(hexString: "252a40")
            self.lastmonthamountoneBakcView.backgroundColor = .white
            self.lastmonthoneLabel.textColor = UIColor.init(hexString: "252a40")
            self.lastbeforemonthttwoBackView.backgroundColor = .white
            self.lastbeforemonthtwoLabel.textColor = UIColor.init(hexString: "252a40")
            self.selectlastmonth = "y"
            self.lastmonthorthismonth_id = "9"
            self.selected_amountmonth = ""
            self.selecetd_amountyear = ""
            self.totalsaleslistServiceCall()
//        }else{
//            self.lastmonthtitleBackView.backgroundColor = .white
//            self.lastmonttitleLabel.textColor = UIColor.init(hexString: "252a40")
//            self.lastmonthamountoneBakcView.backgroundColor = .white
//            self.lastmonthoneLabel.textColor = UIColor.init(hexString: "252a40")
//            self.lastbeforemonthttwoBackView.backgroundColor = .white
//            self.lastbeforemonthtwoLabel.textColor = UIColor.init(hexString: "252a40")
//            self.selectlastmonth = "n"
//            self.lastmonthorthismonth_id = ""
//
//            self.totalsaleslistServiceCall()
//        }
       
    }
    
    @IBAction func leadsummarylastmonthActionBtn(_ sender: Any) {
     //   if self.selectleadsummarylastmonth == "n" {
            self.leadsummarylastmonthBackView.backgroundColor = UIColor.init(hexString: "252a40")
            self.leadsummarylastmonthtitleLabel.textColor = .white
            self.leadsummaryoneBackView.backgroundColor = .white
            self.leadsummaryoneLabel.textColor = UIColor.init(hexString: "252a40")
            self.leadsummarytwoBackView.backgroundColor = .white
            self.leadsummarytwoLabel.textColor = UIColor.init(hexString: "252a40")
            self.leadsummarylastmonthortismonth_id = "9"
            self.selectleadsummary_amountmonth = ""
            self.selectleadsummary_amountyear = ""
      //      self.selectleadsummarylastmonth = "y"
            self.leadsummarytypelistServiceCall()
//        }else{
//            self.leadsummarylastmonthBackView.backgroundColor = .white
//            self.leadsummarylastmonthtitleLabel.textColor = UIColor.init(hexString: "252a40")
//            self.leadsummarylastmonthortismonth_id = "9"
//            self.selectleadsummarylastmonth = "n"
//            self.leadssummarylistServiceCall()
//        }
    }
    
    
    @IBAction func selectlastmonthforamountdataActionBtn(_ sender: Any) {
            self.lastmonthtitleBackView.backgroundColor = .white
            self.lastmonttitleLabel.textColor = UIColor.init(hexString: "252a40")
            self.lastmonthamountoneBakcView.backgroundColor = UIColor.init(hexString: "A8FFD3")
            self.lastmonthoneLabel.textColor = UIColor.init(hexString: "252a40")
            self.lastbeforemonthttwoBackView.backgroundColor = .white
            self.lastbeforemonthtwoLabel.textColor = UIColor.init(hexString: "252a40")
            self.lastmonthorthismonth_id = "10"
            self.selected_amountmonth = ""
            self.selecetd_amountyear = ""
            self.totalsaleslistServiceCall()

    }
    
    @IBAction func selectbeforemonthamountdataACtionBtn(_ sender: Any) {
     //   if self.selectlastbeforemonth == "n" {
            self.lastmonthtitleBackView.backgroundColor = .white
            self.lastmonttitleLabel.textColor = UIColor.init(hexString: "252a40")
            self.lastmonthamountoneBakcView.backgroundColor = .white
            self.lastmonthoneLabel.textColor = UIColor.init(hexString: "252a40")
            self.lastbeforemonthttwoBackView.backgroundColor = UIColor.init(hexString: "A8FFD3")
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
            self.totalsaleslistServiceCall()

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
    
    
    @IBAction func warrantyamountdetailsActionBtn(_ sender: Any) {
        let vc = self.controllerWithMainStoryBoard(withIdentifier: newdataofallpackagesPageVC.className) as! newdataofallpackagesPageVC
        vc.fromwhich = "Warranty"
        vc.graphtext_id = self.lastmonthorthismonth_id
        vc.graphtype_id = self.leadtype_id
        vc.graphmonth = self.selected_amountmonth
        vc.graphyear = self.selecetd_amountyear
        self.present(vc, animated: true, completion: nil)
    }
    
    
    @IBAction func servicesamountdetailsActionBtn(_ sender: Any) {
        let vc = self.controllerWithMainStoryBoard(withIdentifier: newdataofallpackagesPageVC.className) as! newdataofallpackagesPageVC
        vc.fromwhich = "Services"
        vc.graphtext_id = self.lastmonthorthismonth_id
        vc.graphtype_id = self.leadtype_id
        vc.graphmonth = self.selected_amountmonth
        vc.graphyear = self.selecetd_amountyear
        self.present(vc, animated: true, completion: nil)
    }
    
    
    @IBAction func inspectionamountdetailsActionBtn(_ sender: Any) {
        let vc = self.controllerWithMainStoryBoard(withIdentifier: newdataofallpackagesPageVC.className) as! newdataofallpackagesPageVC
        vc.fromwhich = "Inspections"
        vc.graphtext_id = self.lastmonthorthismonth_id
        vc.graphtype_id = self.leadtype_id
        vc.graphmonth = self.selected_amountmonth
        vc.graphyear = self.selecetd_amountyear
        self.present(vc, animated: true, completion: nil)
    }
    
    
    func dateString(from date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd" // Choose the desired date format
        return dateFormatter.string(from: date)
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
                        self.mainalldataCollectionView.reloadData()
                        
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
                        self.secondlistCollectionView.reloadData()
                        self.secondlistarr[0].seleceted = true
                        self.subcategoryid = self.secondlistarr[0].utm_medium
                        
                        self.leadbysourcecampaignServiceCall()
                        self.leadbystatuslistServiceCall()
                        self.totalsaleslistServiceCall()
                        self.inspectiontypelistServiceCall()
                        if self.maincategory_id == "99" {
                            self.allfavdataleadslistServiceCall()
                        }else if self.maincategory_id == "1" {
                            self.dmdataleadslistServiceCall()
                        }else if self.maincategory_id == "2" {
                            self.whatsappdataleadslistServiceCall()
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
                        self.thirddetailsCollectionView.reloadData()
                        
                        self.thirdlistarr[0].was_select = true
                        self.sourcecampignid = String(self.thirdlistarr[0].utm_campaign)
                        
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
    
    
    func allfavdataleadslistServiceCall() {
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

        Webservice().call(cRequest: CRequest.getRequest(url: CUrls.BaseUrl, suffix: CUrls.newmobiledashboardmodule.get_leadapi_getFavDetailsAll, method: .get, contentType: .urlencode, params: ["textId":self.dateid,"typeId":self.leadtype_id,"month":"","year":"","employeeId":selectedserviceemployessste,"fromDate":self.fromdate,"toDate":self.todate,"categoryId":self.maincategory_id,"subcategoryId":self.subcategoryid], headers: ["Authorization": "Bearer " ,"X-Device-Imei":imei,"Content-Type":"application/json"])) { (response, auth) in
            
                self.view.StopLoading()
        //    self.activityloader.isHidden = true

            if auth {
                sectionExpiredClass.ClearData(controller: self)
            }
            else {
                self.allleadsdatalistarr.removeAll()
                self.upsellrenewallistarr.removeAll()
                
                switch response.result {
                
                case .success(let jsonResponse):
                    
                    if jsonResponse.responseType.isSuccess {
                        
                        print("get_leadapi_getFavDetailsAll:" + "\(jsonResponse.response)");
                        
                        let main = jsonResponse.response.dictionaryValue
                        
                        let AllLeads = main["AllLeads"]?.arrayValue
                        
                        AllLeads!.forEach({ (obj) in
                            self.allleadsdatalistarr.append(AllLeadsModelClass.init(data: obj))
                        })
                        
                        self.firstboxalldetailsBackView.isHidden = false
                        self.secondboxalldetailsBackView.isHidden = false
                        self.thirdboxdmdetailsBackView.isHidden = true
                        
                        self.firstboxtitleLabel.text! = self.allleadsdatalistarr[0].all_category_name
                        self.firstboxtotalcountLabel.text! = "Total:" + String(self.allleadsdatalistarr[0].all_count)
                        
                        self.firstboxdateLabel.text! = self.datetitleLabel.text!
                        self.secondboxdateLabel.text! = self.datetitleLabel.text!
                        
                        let percentageValue = self.allleadsdatalistarr[0].dm_percent
                        let formattedPercentage = String(format: "%.f%%", percentageValue!)
                        self.firstboxsubpercentoneLabel.text! = formattedPercentage
                        
                        self.firstboxsubcountoneLabel.text! = String(self.allleadsdatalistarr[0].dm_count)
                        self.firstboxsubtitleoneLabel.text! = self.allleadsdatalistarr[0].dm_category_name
                        
                        let wapercentageValue = self.allleadsdatalistarr[0].wa_percent
                        let waformattedPercentage = String(format: "%.f%%", wapercentageValue!)
                        self.firstboxsubpercenttwoLabel.text! = waformattedPercentage
                        
                        self.firstboxsubcounttwoLabel.text! = String(self.allleadsdatalistarr[0].wa_count)
                        self.firstboxsubtitletwoLabel.text! = self.allleadsdatalistarr[0].wa_category_name
                        
                        let otherspercentageValue = self.allleadsdatalistarr[0].others_percent
                        let othersformattedPercentage = String(format: "%.f%%", otherspercentageValue!)
                        self.firstboxsubpercentthreeLabel.text! = othersformattedPercentage
                        
                        self.firstboxsubcountthreeLabel.text! = String(self.allleadsdatalistarr[0].others_count)
                        self.firstboxsubtitlethreeLabel.text! = self.allleadsdatalistarr[0].others_category_name
                        
                        
                        let Upsellrenewal = main["Upsellrenewal"]?.arrayValue
                        
                        Upsellrenewal!.forEach({ (obj) in
                            self.upsellrenewallistarr.append(UpsellrenewalModelClass.init(data: obj))
                        })
                        
                        self.secondboxtitleLabel.text! = "Total"
                        self.secondboxtotalcountLabel.text! = String(self.upsellrenewallistarr[0].all_count)
                        
                        let renewalpercentageValue = self.upsellrenewallistarr[0].renewal_percent
                        let renewalformattedPercentage = String(format: "%.f%%", renewalpercentageValue!)
                        self.secondboxsubpercentoneLabel.text! = renewalformattedPercentage
                        
                        self.secondboxsubcountoneLabel.text! = String(self.upsellrenewallistarr[0].renewal_count)
                        self.secondboxsubtitleoneLabel.text! = self.upsellrenewallistarr[0].renewal_category_name
                        
                        let upsellingpercentageValue = self.upsellrenewallistarr[0].upselling_pecent
                        let upsellingformattedPercentage = String(format: "%.f%%", upsellingpercentageValue!)
                        self.secondboxsubpercebttwoLabel.text! = upsellingformattedPercentage
                        
                        self.secondboxcounttwoLabel.text! = String(self.upsellrenewallistarr[0].upselling_count)
                        self.secondboxsubtitletwoLabel.text! = self.upsellrenewallistarr[0].upselling_category_name
                        
                        
                      //  self.leadsdataCollectionView.reloadData()
                        self.newpagecontrol.numberOfPages = self.allleadsdatalistarr.count + self.upsellrenewallistarr.count
                        

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
    
    
    
    func dmdataleadslistServiceCall() {
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

        Webservice().call(cRequest: CRequest.getRequest(url: CUrls.BaseUrl, suffix: CUrls.newmobiledashboardmodule.get_leadapi_getFavDetailsDM, method: .get, contentType: .urlencode, params: ["textId":self.dateid,"typeId":self.leadtype_id,"month":"","year":"","employeeId":selectedserviceemployessste,"fromDate":self.fromdate,"toDate":self.todate,"categoryId":self.maincategory_id,"subcategoryId":self.subcategoryid], headers: ["Authorization": "Bearer " ,"X-Device-Imei":imei,"Content-Type":"application/json"])) { (response, auth) in
            
                self.view.StopLoading()
        //    self.activityloader.isHidden = true

            if auth {
                sectionExpiredClass.ClearData(controller: self)
            }
            else {
                self.digitalmarketinglistarr.removeAll()
                self.dmallleadslistarr.removeAll()
           
                switch response.result {
                
                case .success(let jsonResponse):
                    
                    if jsonResponse.responseType.isSuccess {
                        
                        print("get_leadapi_getFavDetailsDM:" + "\(jsonResponse.response)");
                        
                        let main = jsonResponse.response.dictionaryValue
                        
                        let DMStatus = main["DMStatus"]?.arrayValue
                        
                        DMStatus!.forEach({ (obj) in
                            self.digitalmarketinglistarr.append(DMStatusModelClass.init(data: obj))
                        })
                        
                        self.firstboxalldetailsBackView.isHidden = true
                        self.secondboxalldetailsBackView.isHidden = false
                        self.thirdboxdmdetailsBackView.isHidden = false
                        
                        self.thirdboxdateLabel.text! = self.datetitleLabel.text!
                        self.secondboxdateLabel.text! = self.datetitleLabel.text!
                        
                        self.thirdboxalltitleLabel.text! = self.digitalmarketinglistarr[0].all_category_name
                        self.thirdboxallcountLabel.text! = "Total:" + String(self.digitalmarketinglistarr[0].all_count)
                        
                        let percentageValue = self.digitalmarketinglistarr[0].rnr_percent
                        let formattedPercentage = String(format: "%.f%%", percentageValue!)
                        self.thirdboxsubpercentoneLabel.text! = formattedPercentage
                        
                        self.thirdboxsubcountoneLabel.text! = String(self.digitalmarketinglistarr[0].rnr_count)
                        self.thirdboxsubtitleoneLabel.text! = self.digitalmarketinglistarr[0].rnr_category_name
                        
                        let wapercentageValue = self.digitalmarketinglistarr[0].insp_scheduled_percent
                        let waformattedPercentage = String(format: "%.f%%", wapercentageValue!)
                        self.thirdboxsubpercentLabel.text! = waformattedPercentage
                        
                        self.thirdboxsubcounttwoLabel.text! = String(self.digitalmarketinglistarr[0].insp_scheduled_count)
                        self.thirdboxsubtitletwoLabel.text! = self.digitalmarketinglistarr[0].insp_scheduled_category_name
                        
                        let DMAll = main["DMAll"]?.arrayValue
                        
                        DMAll!.forEach({ (obj) in
                            self.dmallleadslistarr.append(DMAllModelClass.init(data: obj))
                        })
                        
                        
                        self.secondboxtitleLabel.text! = "Total"
                        self.secondboxtotalcountLabel.text! = String(self.dmallleadslistarr[0].all_count)
                        
                        let gfpercentageValue = self.dmallleadslistarr[0].google_percent
                        let gfformattedPercentage = String(format: "%.f%%", gfpercentageValue!)
                        self.secondboxsubpercentoneLabel.text! = gfformattedPercentage
                        
                        self.secondboxsubcountoneLabel.text! = String(self.dmallleadslistarr[0].google_count)
                        self.secondboxsubtitleoneLabel.text! = self.dmallleadslistarr[0].google_category_name
                        
                        let facebookpercentageValue = self.dmallleadslistarr[0].facebook_percent
                        let facebookformattedPercentage = String(format: "%.f%%", facebookpercentageValue!)
                        self.secondboxsubpercebttwoLabel.text! = facebookformattedPercentage
                        
                        self.secondboxcounttwoLabel.text! = String(self.dmallleadslistarr[0].facebook_count)
                        self.secondboxsubtitletwoLabel.text! = self.dmallleadslistarr[0].facebook_category_name
                        
                        
                      //  self.leadsdataCollectionView.reloadData()
                        self.newpagecontrol.numberOfPages = self.digitalmarketinglistarr.count + self.dmallleadslistarr.count
                        
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
    
    func whatsappdataleadslistServiceCall() {
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

        Webservice().call(cRequest: CRequest.getRequest(url: CUrls.BaseUrl, suffix: CUrls.newmobiledashboardmodule.get_leadapi_getFavDetailsWhatasapp, method: .get, contentType: .urlencode, params: ["textId":self.dateid,"typeId":self.leadtype_id,"month":"","year":"","employeeId":selectedserviceemployessste,"fromDate":self.fromdate,"toDate":self.todate,"categoryId":self.maincategory_id,"subcategoryId":self.subcategoryid], headers: ["Authorization": "Bearer " ,"X-Device-Imei":imei,"Content-Type":"application/json"])) { (response, auth) in
            
                self.view.StopLoading()
        //    self.activityloader.isHidden = true

            if auth {
                sectionExpiredClass.ClearData(controller: self)
            }
            else {
                self.whatsappNegativelistarr.removeAll()
                self.whatsappalllistarr.removeAll()
           
                switch response.result {
                
                case .success(let jsonResponse):
                    
                    if jsonResponse.responseType.isSuccess {
                        
                        print("get_leadapi_getFavDetailsWhatasapp:" + "\(jsonResponse.response)");
                        
                        let main = jsonResponse.response.dictionaryValue
                        
                        let WhatsappNegative = main["WhatsappNegative"]?.arrayValue
                        
                        WhatsappNegative!.forEach({ (obj) in
                            self.whatsappNegativelistarr.append(WhatsappNegativeModelClass.init(data: obj))
                        })
                        
                        self.firstboxalldetailsBackView.isHidden = true
                        self.secondboxalldetailsBackView.isHidden = false
                        self.thirdboxdmdetailsBackView.isHidden = false
                        
                        self.thirdboxdateLabel.text! = self.datetitleLabel.text!
                        self.secondboxdateLabel.text! = self.datetitleLabel.text!
                        
                        self.thirdboxalltitleLabel.text! = self.whatsappNegativelistarr[0].all_category_name
                        self.thirdboxallcountLabel.text! = "Total:" + String(self.whatsappNegativelistarr[0].all_count)
                        
                        let percentageValue = self.whatsappNegativelistarr[0].rnr_percent
                        let formattedPercentage = String(format: "%.f%%", percentageValue!)
                        self.thirdboxsubpercentoneLabel.text! = formattedPercentage
                        
                        self.thirdboxsubcountoneLabel.text! = String(self.whatsappNegativelistarr[0].rnr_count)
                        self.thirdboxsubtitleoneLabel.text! = self.whatsappNegativelistarr[0].rnr_category_name
                        
                        let wapercentageValue = self.whatsappNegativelistarr[0].negative_msg_percent
                        let waformattedPercentage = String(format: "%.f%%", wapercentageValue!)
                        self.thirdboxsubpercentLabel.text! = waformattedPercentage
                        
                        self.thirdboxsubcounttwoLabel.text! = String(self.whatsappNegativelistarr[0].negative_msg_count)
                        self.thirdboxsubtitletwoLabel.text! = self.whatsappNegativelistarr[0].negative_msg_category_name
                        
                        let WhatsappAll = main["WhatsappAll"]?.arrayValue
                        
                        WhatsappAll!.forEach({ (obj) in
                            self.whatsappalllistarr.append(WhatsappAllModelClass.init(data: obj))
                        })
                        
                        self.secondboxtitleLabel.text! = "Total"
                        self.secondboxtotalcountLabel.text! = String(self.whatsappalllistarr[0].all_count)
                        
                        let gfpercentageValue = self.whatsappalllistarr[0].positive_msg_percent
                        let gfformattedPercentage = String(format: "%.f%%", gfpercentageValue!)
                        self.secondboxsubpercentoneLabel.text! = gfformattedPercentage
                        
                        self.secondboxsubcountoneLabel.text! = String(self.whatsappalllistarr[0].positive_msg_count)
                        self.secondboxsubtitleoneLabel.text! = self.whatsappalllistarr[0].positive_msg_category_name
                        
                        let facebookpercentageValue = self.whatsappalllistarr[0].floow_up_percent
                        let facebookformattedPercentage = String(format: "%.f%%", facebookpercentageValue!)
                        self.secondboxsubpercebttwoLabel.text! = facebookformattedPercentage
                        
                        self.secondboxcounttwoLabel.text! = String(self.whatsappalllistarr[0].floow_up_count)
                        self.secondboxsubtitletwoLabel.text! = self.whatsappalllistarr[0].floow_up_category_name
                        
                     //   self.leadsdataCollectionView.reloadData()
                        self.newpagecontrol.numberOfPages = self.whatsappNegativelistarr.count + self.whatsappalllistarr.count
                        
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
                        self.transactionsTableView.reloadData()
//                        if self.leadbystatuslistarr.count == 0 {
//                         //   self.htOfmainView.constant = 845
//                            self.htOfstatustableView.constant = 100
//                        }else if self.leadbystatuslistarr.count == 1 {
//                        //    self.htOfmainView.constant = 1195
//                            self.htOfstatustableView.constant = 115
//                        }else if self.leadbystatuslistarr.count == 2 {
//                          //  self.htOfmainView.constant = 1245
//                            self.htOfstatustableView.constant = 165
//                        }else if self.leadbystatuslistarr.count == 3 {
//                          //  self.htOfmainView.constant = 1325
//                            self.htOfstatustableView.constant = 220
//                        }else if self.leadbystatuslistarr.count == 4 {
//                         //   self.htOfmainView.constant = 1380
//                            self.htOfstatustableView.constant = 275
//                        }else if self.leadbystatuslistarr.count == 5 {
//                          //  self.htOfmainView.constant = 1400
//                            self.htOfstatustableView.constant = 345
//                        }else{
//                          //  self.htOfmainView.constant = 1485
//                            self.htOfstatustableView.constant = 385
//                        }
                        self.htOfmainView.constant = 1485
                        self.htOfstatustableView.constant = 385
//                        }else if self.leadbystatuslistarr.count == 7 {
//                            self.htOfmainView.constant = 1580
//                            self.htOfstatustableView.constant = 485
//                        }else if self.leadbystatuslistarr.count == 8 {
//                            self.htOfmainView.constant = 1595
//                            self.htOfstatustableView.constant = 530
//                        }else if self.leadbystatuslistarr.count == 9 {
//                            self.htOfmainView.constant = 1680
//                            self.htOfstatustableView.constant = 585
//                        }else if self.leadbystatuslistarr.count == 10 {
//                            self.htOfmainView.constant = 1680
//                            self.htOfstatustableView.constant = 630
//                        }else if self.leadbystatuslistarr.count == 11 {
//                            self.htOfmainView.constant = 1880
//                            self.htOfstatustableView.constant = 675
//                        }else if self.leadbystatuslistarr.count == 12 {
//                            self.htOfmainView.constant = 1880
//                            self.htOfstatustableView.constant = 720
//                        }else if self.leadbystatuslistarr.count == 13 {
//                            self.htOfmainView.constant = 1930
//                            self.htOfstatustableView.constant = 810
//                        }else if self.leadbystatuslistarr.count == 14 {
//                            self.htOfmainView.constant = 1930
//                            self.htOfstatustableView.constant = 810
//                        }else if self.leadbystatuslistarr.count == 15 {
//                            self.htOfmainView.constant = 1930
//                            self.htOfstatustableView.constant = 810
//                        }else{
//                            self.htOfmainView.constant = 2180
//                            self.htOfstatustableView.constant = 810
//                        }
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

        Webservice().call(cRequest: CRequest.getRequest(url: CUrls.BaseUrl, suffix: CUrls.newmobiledashboardmodule.get_leadapi_getTotalSaleData, method: .get, contentType: .urlencode, params: ["textId":self.lastmonthorthismonth_id,"typeId":self.leadtype_id,"month":self.selected_amountmonth,"year":self.selecetd_amountyear,"employeeId":selectedserviceemployessste,"fromDate":"","toDate":"","categoryId":"","subcategoryId":""], headers: ["Authorization": "Bearer " ,"X-Device-Imei":imei,"Content-Type":"application/json"])) { (response, auth) in
            
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
                        
                        let ConsolidateData = main["ConsolidateData"]?.arrayValue
                        ConsolidateData!.forEach({ (obj) in
                            self.Consolidatalistarr.append(ConsolidateDataModelClass.init(data: obj))
                        })
                        if self.Consolidatalistarr.count == 0 {
                            
                        }else{
                                //    self.totalsalestitleLabel.text! = self.Consolidatalistarr[0].category_name
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
                            
                                    self.btocpercentageLabel.text! = String(self.Consolidatalistarr[2].percent) + "%"
                            
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
                                self.dealerstitleunderlineLabel.isHidden = false
                                self.dealerpurchaseddataBtn.isHidden = false
                            }

                            self.dmpercenatgeLabel.text! = String(self.Consolidatalistarr[1].total_count)
                            
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
                                self.btocwarrantysaletotalamountLabel.text! = "Rs." + btocwformattedAmount
                            } else {
                                self.btocwarrantysaletotalamountLabel.text! = "Invalid amount"
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
                        
                        let TotalSaleData = main["TotalSaleData"]?.arrayValue
                        
                        TotalSaleData!.forEach({ (obj) in
                            self.totalsaleslistarr.append(TotalSaleDataModelClass.init(data: obj))
                        })
                        self.salesdatabasedonsourceCollectionView.reloadData()
                        
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
                        self.alldatesTableVIew.reloadData()

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
                        self.allemployeesdetailsTableVIew.reloadData()
                        
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
    
    func allleadtypeslistServiceCall() {
        if !InternetReachable.ValidateInternet {
            Message.NoInternetAlert(self)
            return
        }
        
     
       
        let imei = UIDevice.current.clientID
       
            self.view.StartLoading()

        Webservice().call(cRequest: CRequest.getRequest(url: CUrls.BaseUrl, suffix: CUrls.newmobiledashboardmodule.get_leadapi_GetTypeList, method: .get, contentType: .urlencode, params: [:], headers: ["Authorization": "Bearer " ,"X-Device-Imei":imei,"Content-Type":"application/json"])) { (response, auth) in
            
                self.view.StopLoading()
        //    self.activityloader.isHidden = true

            if auth {
                sectionExpiredClass.ClearData(controller: self)
            }
            else {
                self.alltypeslistarr.removeAll()
           
                switch response.result {
                
                case .success(let jsonResponse):
                    
                    if jsonResponse.responseType.isSuccess {
                        
                        print("get_leadapi_GetTypeList:" + "\(jsonResponse.response)");
                        
                        let main = jsonResponse.response.dictionaryValue
                        
                        let LeadTypeList = main["LeadTypeList"]?.arrayValue
                        LeadTypeList!.forEach({ (obj) in
                            self.alltypeslistarr.append(LeadTypeListModelClass.init(data: obj))
                        })
                        
                        self.differenttypesTableView.reloadData()

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
    
    
    @IBAction func selecttypesubmitActionBtn(_ sender: Any) {
        leadbycategoryServiceCall()
        self.alltypesBackView.isHidden = true
        self.filterBackView.isHidden = true
    }
    
    @IBAction func selectemployeessubmitActionBtn(_ sender: Any) {
        leadbycategoryServiceCall()
        self.dataofallemployeesBackView.isHidden = true
        self.filterBackView.isHidden = true
    }
    
    @IBAction func selectdatesubmitActionBtn(_ sender: Any) {
        leadbycategoryServiceCall()
        self.daterangeBackView.isHidden = true
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
                    //        self.statusbarchartView.isHidden = true
                            
                        }else{
                            
                       //     self.statusbarchartView.isHidden = false
                            
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
//
//                            //new code
//
//                            var barChartData: [HIData] = []
//                            let colors: [UIColor] = [.green, .blue, .orange]
//                         //   let colors: [String] = ["#00FF00", "#0000FF", "#FFA500"] // Define custom hexadecimal colors here
//                            for index in 0..<min(5, self.leadsbystatusbarlistarr.count) {
//                                let data = HIData()
//                                data.name = self.leadsbystatusbarlistarr[index].status_name
//                                data.y = self.leadsbystatusbarlistarr[index].count_1 as NSNumber?
//                            //    data.color = HIColor.init(hexValue: colors[index % colors.count]) // Define custom hexadecimal colors here
//                                data.color = HIColor.init(uiColor: colors[index % colors.count])
//                                barChartData.append(data)
//                            }
//                            browsers.data = barChartData
//
//                               options.series = [browsers]
//
//                               chartView.options = options
//
//                               self.statusbarchartView.addSubview(chartView)
//
                            // Define the data for count and percentage separately
                            var countData: [HIData] = []
                            var percentageData: [HIData] = []

                            for index in 0..<min(10, self.leadsbystatusbarlistarr.count) {
                                let countItem = HIData()
                                countItem.name = self.leadsbystatusbarlistarr[index].status_name
                                countItem.y = self.leadsbystatusbarlistarr[index].count as NSNumber?
                                countData.append(countItem)
                                
                                let percentageItem = HIData()
                                percentageItem.name = self.leadsbystatusbarlistarr[index].status_name
                                percentageItem.y = self.leadsbystatusbarlistarr[index].percent as NSNumber?
                                percentageData.append(percentageItem)
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

                            for index in 0..<min(5, self.leadsbystatusbarlistarr.count) {
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
                        self.allfollowupleadempdataCollectionView.reloadData()
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
                            self.htOffollowupstatusdataView.constant = 100
                        }else{
                            self.htOffollowupstatusdataView.constant = 50
                        }
//                        self.followupleadagingstatus_id = String(self.followupstatuslistarr[0].status_id)
//                        self.followupstatuslistarr[0].was_selected = true
                        self.leadfollowupagingstatusdataCollectionView.reloadData()
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
                       
                        self.totaldataofallinspectionsCollectionView.reloadData()
                        
                        
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
                       
                        self.allinspectiondataTableView.reloadData()
                        
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
                       
                        self.allvehlistbasedoninspstatusTableView.reloadData()
                        
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
                            
                       
                        self.allvehlistbasedoninspstatusTableView.reloadData()
                        
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
    
    
    func brandslistServiceCall() {
        if !InternetReachable.ValidateInternet {
            Message.NoInternetAlert(self)
            return
        }
        
        let imei = UIDevice.current.clientID
       
            self.view.StartLoading()

        Webservice().call(cRequest: CRequest.getRequest(url: CUrls.BaseUrl, suffix: CUrls.newmobiledashboardmodule.get_leadapi_GetBrandList, method: .get, contentType: .urlencode, params: [:], headers: ["Authorization": "Bearer " ,"X-Device-Imei":imei,"Content-Type":"application/json"])) { (response, auth) in
            
                self.view.StopLoading()
        //    self.activityloader.isHidden = true

            if auth {
                sectionExpiredClass.ClearData(controller: self)
            }
            else {
                self.brandiconlistarr.removeAll()
           
                switch response.result {
                
                case .success(let jsonResponse):
                    
                    if jsonResponse.responseType.isSuccess {
                        
                        print("get_leadapi_GetBrandList:" + "\(jsonResponse.response)");
                        
                        let main = jsonResponse.response.dictionaryValue
                        
                        let BrandList = main["BrandList"]?.arrayValue
                        
                        BrandList!.forEach({ (obj) in
                            self.brandiconlistarr.append(BrandListModelClass.init(data: obj))
                        })
                        
                        self.allbrandsdataCollectionView.reloadData()
                        
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
                        
                        self.b2bdealersalesdataTableView.reloadData()
                      
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
                        
//                        let main = jsonResponse.response.dictionaryValue
//
//                        let leadsummarydashboard = main["leadsummarydashboard"]?.arrayValue
//
//                        leadsummarydashboard!.forEach({ (obj) in
//                            self.leadsummarytypelistarr.append(leadsummarydashboardModelClass.init(data: obj))
//                        })
//                        if self.leadsummarytypelistarr.count == 0 {
//
//                        }else{
//                            self.leadsummarytypelistarr[1].is_selected = true
//                            self.leadsummarytype_id = self.leadsummarytypelistarr[1].insp_type_id
//                            self.leadsummarytotalleadscountLabel.text! = String(self.leadsummarytypelistarr[0].count)
//                            self.leadssummarylistServiceCall()
//                        }
//
//                        self.leadfollowupagingstatusdataCollectionView.reloadData()
                        
//                        let main = jsonResponse.response.dictionaryValue
//                        if let leadsummarydashboard = main["leadsummarydashboard"]?.arrayValue {
//                            leadsummarydashboard.dropFirst().forEach { obj in
//                                self.leadsummarytypelistarr.append(leadsummarydashboardModelClass(data: obj))
//                            }
//
//                            if self.leadsummarytypelistarr.isEmpty {
//                                // Handle the case when leadsummarytypelistarr is empty
//                            } else {
//                                self.leadsummarytypelistarr[0].is_selected = true
//                                self.leadsummarytype_id = self.leadsummarytypelistarr[0].insp_type_id
//                                self.leadsummarytotalleadscountLabel.text! = String(self.leadsummarytypelistarr[0].count)
//                                self.leadssummarylistServiceCall()
//                            }
//                            self.leadfollowupagingstatusdataCollectionView.reloadData()
//                        } else {
//                            // Handle the case when leadsummarydashboard is nil or not an array
//                        }
                        
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
                                    self.leadsummarytotalleadscountLabel.text = "\(count)"
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
                                self.leadfollowupagingstatusdataCollectionView.reloadData()
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
    
    
    func reloadCalendar() {
            calendar.reloadData()
        }

}

extension newhomePageVC: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView.tag == 11 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "listofmaincollectioncell", for: indexPath) as! listofmaincollectioncell
            self.leadcategorycount = String(mainlistarr[indexPath.row].count)
            cell.nameofmainLabel.text = mainlistarr[indexPath.row].utm_source + " " + "(" + self.leadcategorycount + ")"
            if self.mainlistarr[indexPath.row].is_seleceted == true {
                cell.mainBackView.backgroundColor = UIColor.init(hexString: "E9F0FA")
                cell.nameofmainLabel.textColor = UIColor.init(hexString: "252a40")
            }else{
                cell.mainBackView.backgroundColor = UIColor.init(hexString: "f2f2f7")
                cell.nameofmainLabel.textColor = .lightGray
            }
            cell.htOfmainCell.constant = 45
            cell.mainBtn.tag = indexPath.row
            cell.mainBtn.addTarget(self, action: #selector(mainBtnAction(sender:)), for: UIControl.Event.touchUpInside)
            return cell
        }else if collectionView.tag == 22 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "sublistforselectedmaincollectioncell", for: indexPath) as! sublistforselectedmaincollectioncell
            self.subcartehorycount = String(secondlistarr[indexPath.row].count)
            cell.googleLabel.text = secondlistarr[indexPath.row].utm_medium + " " + "(" + self.subcartehorycount + ")"
            if secondlistarr[indexPath.row].seleceted == true {
                cell.secondBackView.backgroundColor = UIColor.init(hexString: "FFFCEFF1")
                cell.googleLabel.textColor = UIColor.init(hexString: "252a40")
            }else{
                cell.wtOfsecondCell.constant = 125
                cell.secondBackView.backgroundColor = UIColor.init(hexString: "f2f2f7")
                cell.googleLabel.textColor = .lightGray
            }
            if self.secondlistarr[indexPath.row].utm_medium == "" || self.secondlistarr[indexPath.row].utm_medium == nil {
                cell.wtOfsecondCell.constant = 100
            }else if self.secondlistarr[indexPath.row].utm_medium == "All" {
                cell.wtOfsecondCell.constant = 100
            }else if self.secondlistarr[indexPath.row].utm_medium == "Google" {
                cell.wtOfsecondCell.constant = 125
            }else{
                cell.wtOfsecondCell.constant = 155
            }
            cell.htOfsecondCell.constant = 45
            cell.secondBtn.tag = indexPath.row
            cell.secondBtn.addTarget(self, action: #selector(secondBtnAction(sender:)), for: UIControl.Event.touchUpInside)
            return cell
        }else if collectionView.tag == 33 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "newlistforthirddatacollectioncell", for: indexPath) as! newlistforthirddatacollectioncell
            self.sourcecampaigncount = String(thirdlistarr[indexPath.row].count)
            cell.nameofthirdLabel.text = thirdlistarr[indexPath.row].utm_campaign + " " + "(" + self.sourcecampaigncount + ")"
            if thirdlistarr[indexPath.row].was_select == true {
                cell.thirdBackView.backgroundColor = UIColor.init(hexString: "E2FFEE")
                cell.nameofthirdLabel.textColor = UIColor.init(hexString: "252a40")
            }else{
                cell.thirdBackView.backgroundColor = UIColor.init(hexString: "f2f2f7")
                cell.nameofthirdLabel.textColor = .lightGray
            }
            
            if self.thirdlistarr[indexPath.row].utm_campaign == "All" {
                cell.wtOfthirdCell.constant = 100
            }else if self.thirdlistarr[indexPath.row].utm_campaign == "No Campaign" || self.thirdlistarr[indexPath.row].utm_campaign == "Customer App" || self.thirdlistarr[indexPath.row].utm_campaign == "Online Partnership" || self.thirdlistarr[indexPath.row].utm_campaign == "Website Enquiry" || self.thirdlistarr[indexPath.row].utm_campaign == "Facebook-Inspection" {
                cell.wtOfthirdCell.constant = 200
            }else if self.thirdlistarr[indexPath.row].utm_campaign == "Car_Service_General_Service" || self.thirdlistarr[indexPath.row].utm_campaign == "Car_Service_Website_2" || self.thirdlistarr[indexPath.row].utm_campaign == "Website Direct (Inspection)" || self.thirdlistarr[indexPath.row].utm_campaign == "Google-Free Inspection " {
                cell.wtOfthirdCell.constant = 255
            }else{
                cell.wtOfthirdCell.constant = 155
            }
                
            cell.htOfthirdCell.constant = 45
            
            cell.thirdBtn.tag = indexPath.row
            cell.thirdBtn.addTarget(self, action: #selector(thirdBtnAction(sender:)), for: UIControl.Event.touchUpInside)
            
        return cell
        }else if collectionView.tag == 44 {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "detailsforleadslistcollectioncell", for: indexPath) as! detailsforleadslistcollectioncell
            if self.maincategory_id == "99" {
                if indexPath.item < allleadsdatalistarr.count {
                    // Use firstArrayList for the first type of cell
                    let data = allleadsdatalistarr[indexPath.item]
//                    cell.leadstitleLabel.text = data.category_name
//                    cell.leadcompletedcountorpercentLabel.text = String(data.count)
//                    let percentageValue = data.percent
//                    let formattedPercentage = String(format: "%.f%%", percentageValue!)
//                    cell.targetpercentageLabel.text = formattedPercentage
                    
                } else if indexPath.item < allleadsdatalistarr.count + upsellrenewallistarr.count {
                    // Use secondArrayList for the second type of cell
                    let data = upsellrenewallistarr[indexPath.item - allleadsdatalistarr.count]
//                    cell.leadstitleLabel.text = data.lead_type
//                    cell.leadcompletedcountorpercentLabel.text = String(data.count)
//                    let percentageValue = data.percent
//                    let formattedPercentage = String(format: "%.f%%", percentageValue!)
//                    cell.targetpercentageLabel.text = formattedPercentage
                }
                cell.leadsfrondateLabel.text! = self.datetitleLabel.text!
                cell.wtOfleadsCell.constant = collectionView.frame.size.width
                cell.htOfleadsCell.constant = 135
            }else if self.maincategory_id == "1" {
                if indexPath.item < digitalmarketinglistarr.count {
                    // Use firstArrayList for the first type of cell
                    let data = digitalmarketinglistarr[indexPath.item]
//                    cell.leadstitleLabel.text = data.status_name
//                    cell.leadcompletedcountorpercentLabel.text = String(data.count)
//                    let percentageValue = data.percent
//                    let formattedPercentage = String(format: "%.f%%", percentageValue!)
//                    cell.targetpercentageLabel.text = formattedPercentage
                } else if indexPath.item < digitalmarketinglistarr.count + dmallleadslistarr.count {
                    // Use secondArrayList for the second type of cell
//                    let data = dmallleadslistarr[indexPath.item - digitalmarketinglistarr.count]
//                    cell.leadstitleLabel.text = data.sub_category_name
//                    cell.leadcompletedcountorpercentLabel.text = String(data.count)
//                    let percentageValue = data.percent
//                    let formattedPercentage = String(format: "%.f%%", percentageValue!)
//                    cell.targetpercentageLabel.text = formattedPercentage
                }
                cell.leadsfrondateLabel.text! = self.datetitleLabel.text!
                cell.wtOfleadsCell.constant = collectionView.frame.size.width
                cell.htOfleadsCell.constant = 135
            }else{
                if indexPath.item < whatsappalllistarr.count {
                    // Use firstArrayList for the first type of cell
//                    let data = whatsappalllistarr[indexPath.item]
//                    cell.leadstitleLabel.text = data.status_name
//                    cell.leadcompletedcountorpercentLabel.text = String(data.count)
//                    let percentageValue = data.percent
//                    let formattedPercentage = String(format: "%.f%%", percentageValue!)
//                    cell.targetpercentageLabel.text = formattedPercentage
                } else if indexPath.item < whatsappalllistarr.count + whatsappNegativelistarr.count {
                    // Use secondArrayList for the second type of cell
//                    let data = whatsappNegativelistarr[indexPath.item - whatsappalllistarr.count]
//                    cell.leadstitleLabel.text = data.status_name
//                    cell.leadcompletedcountorpercentLabel.text = String(data.count)
//                    let percentageValue = data.percent
//                    let formattedPercentage = String(format: "%.f%%", percentageValue!)
//                    cell.targetpercentageLabel.text = formattedPercentage
                }
                cell.leadsfrondateLabel.text! = self.datetitleLabel.text!
                cell.wtOfleadsCell.constant = collectionView.frame.size.width
                cell.htOfleadsCell.constant = 135
            }

                return cell
            
            
        }else if collectionView.tag == 55 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "numberofsalesfromdiffsourcescollectioncell", for: indexPath) as! numberofsalesfromdiffsourcescollectioncell
            cell.nameofsourcesLabel.text = totalsaleslistarr[indexPath.row].category_name
            let percentageValue = totalsaleslistarr[indexPath.row].percent
            let formattedPercentage = String(format: "%.1f%%", percentageValue!)
            cell.percentageofsalesbysourcesLabel.text = formattedPercentage
            if cell.percentageofsalesbysourcesLabel.text! == "100.0%" {
                cell.percentageofsalesbysourcesLabel.text! = "100%"
            }else{
                cell.percentageofsalesbysourcesLabel.text = formattedPercentage
            }
            let amount: Double = totalsaleslistarr[indexPath.row].sales_sum

            let numberFormatter = NumberFormatter()
            numberFormatter.numberStyle = .decimal

            if let formattedAmount = numberFormatter.string(from: NSNumber(value: amount)) {
                let result = "Rs. " + formattedAmount
                print(result) // Output: Rs. 1,234,454
                cell.amountforsourcesLabel.text = result
            }
            
            return cell
        }else if collectionView.tag == 66 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "listoffollowupleademployeelistCollectionCell", for: indexPath) as! listoffollowupleademployeelistCollectionCell
                cell.followupleadempnameLabel.text! = followupleadagingemplistarr[indexPath.row].employee_name
                if cell.followupleadempnameLabel.text! == "All" {
                    cell.wtOffollowupleadempCell.constant = 100
                }else{
                    cell.wtOffollowupleadempCell.constant = 155
                }
                if self.followupleadagingemplistarr[indexPath.row].is_selected == true {
                    cell.selectfollowupleadempbgBackView.backgroundColor = UIColor.init(hexString: "E9F0FA")
                    cell.followupleadempnameLabel.textColor = UIColor.init(hexString: "252a40")
                }else{
                    cell.selectfollowupleadempbgBackView.backgroundColor = UIColor.init(hexString: "f2f2f7")
                    cell.followupleadempnameLabel.textColor = .lightGray
                }
               
            cell.htOffollowupleadempCell.constant = 45
            cell.selectfollowupleadempBtn.tag = indexPath.row
            cell.selectfollowupleadempBtn.addTarget(self, action: #selector(selectfollowupleadempBtnAction(sender:)), for: UIControl.Event.touchUpInside)
       
        return cell
        }else if collectionView.tag == 77 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "detailsforleadfollowupstatusagingcollectioncell", for: indexPath) as! detailsforleadfollowupstatusagingcollectioncell
            if self.fromwhichaging == "Leads summary" {
                self.leadsummarytypecount = String(self.leadsummarytypelistarr[indexPath.row].count)
                cell.statusnameofleadfollowupLabel.text! = leadsummarytypelistarr[indexPath.row].type_name + "(" + self.leadsummarytypecount + ")"
                if cell.statusnameofleadfollowupLabel.text! == "All" {
                    cell.wtOffollowupstatusCell.constant = 100
                }else{
                    cell.wtOffollowupstatusCell.constant = 155
                }
                    if self.leadsummarytypelistarr[indexPath.row].is_selected == true {
                        cell.selectfollowupagingstatusbgBackView.backgroundColor = UIColor.init(hexString: "E9F0FA")
                        cell.statusnameofleadfollowupLabel.textColor = UIColor.init(hexString: "252a40")
                    }else{
                        cell.selectfollowupagingstatusbgBackView.backgroundColor = UIColor.init(hexString: "f2f2f7")
                        cell.statusnameofleadfollowupLabel.textColor = .lightGray
                    
                }
                cell.htOffollowupstatusCell.constant = 45
            }else{
                self.followupstatuscount = String(followupstatuslistarr[indexPath.row].count)
                cell.statusnameofleadfollowupLabel.text = followupstatuslistarr[indexPath.row].status_name + " " + "(" + self.followupstatuscount + ")"
                if self.followupstatuslistarr[indexPath.row].was_selected == true {
                    cell.selectfollowupagingstatusbgBackView.backgroundColor = UIColor.init(hexString: "E9F0FA")
                    cell.statusnameofleadfollowupLabel.textColor = UIColor.init(hexString: "252a40")
                }else{
                    cell.selectfollowupagingstatusbgBackView.backgroundColor = UIColor.init(hexString: "f2f2f7")
                    cell.statusnameofleadfollowupLabel.textColor = .lightGray
                }
                if cell.statusnameofleadfollowupLabel.text! == "Follow Up" || cell.statusnameofleadfollowupLabel.text! == "Inspection" {
                    cell.wtOffollowupstatusCell.constant = 155
                }else{
                    cell.wtOffollowupstatusCell.constant = 200
                }
                
                cell.htOffollowupstatusCell.constant = 45
            }
           
            cell.selectstatusofleadfollowupagingBtn.tag = indexPath.row
            cell.selectstatusofleadfollowupagingBtn.addTarget(self, action: #selector(selectstatusofleadfollowupagingBtnAction(sender:)), for: UIControl.Event.touchUpInside)
            return cell
        }else if collectionView.tag == 88 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "wdinspectiondetailscollectioncell", for: indexPath) as! wdinspectiondetailscollectioncell
            self.insptypecount = String(inspheadingslistarr[indexPath.row].count)
            cell.headingofinspectionLabel.text! = inspheadingslistarr[indexPath.row].insp_name + " " + "(" + self.insptypecount + ")"
            if self.inspheadingslistarr[indexPath.row].selected == true {
                cell.inspectionheadingbgBackView.backgroundColor = UIColor.init(hexString: "E9F0FA")
                cell.headingofinspectionLabel.textColor = UIColor.init(hexString: "252a40")
            }else{
                cell.inspectionheadingbgBackView.backgroundColor = UIColor.init(hexString: "f2f2f7")
                cell.headingofinspectionLabel.textColor = .lightGray
            }
            cell.wtOfinspheadingCell.constant = 100
            cell.htOfinspheadingCell.constant = 45
            cell.selectinspectionheadingBtn.tag = indexPath.row
            cell.selectinspectionheadingBtn.addTarget(self, action: #selector(selectinspectionheadingBtnAction(sender:)), for: UIControl.Event.touchUpInside)
            return cell
            
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "brandofcarslistCollectionCell", for: indexPath) as! brandofcarslistCollectionCell
            if self.brandiconlistarr[indexPath.row].brand_icon == "" {
                cell.brandlogoimageVie.image = #imageLiteral(resourceName: "wisedrive_logo")
            }else{
                cell.brandlogoimageVie.pin_updateWithProgress = true
                let aString = self.brandiconlistarr[indexPath.row].brand_icon
                let newString = aString!.replacingOccurrences(of: " ", with: "%20", options: .literal, range: nil)
                cell.brandlogoimageVie.pin_setImage(from: URL(string: newString)!, placeholderImage: #imageLiteral(resourceName: "ford-logo-2017"))
            }
            if self.brandiconlistarr[indexPath.row].was_selected == true {
                cell.brandlogoBackView.BorderColor = UIColor.init(hexString: "252a40")
                cell.brandlogoBackView.BorderWidth = 2
            }else{
                cell.brandlogoBackView.BorderColor = .clear
                cell.brandlogoBackView.BorderWidth = 0
            }
            cell.selectbrandBtn.tag = indexPath.row
            cell.selectbrandBtn.addTarget(self, action: #selector(sselectbrandBtnAction(sender:)), for: UIControl.Event.touchUpInside)
            cell.htOfbrandCell.constant = 65
            cell.wtOfbrandCell.constant = 65
            return cell
        }
           
        
    }
    
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView.tag == 11 {
            return mainlistarr.count
        }else if collectionView.tag == 22 {
            return secondlistarr.count
        }else if collectionView.tag == 33 {
            return thirdlistarr.count
        }else if collectionView.tag == 44 {
            if self.maincategory_id == "99" {
                return allleadsdatalistarr.count + upsellrenewallistarr.count
            }else{
                return digitalmarketinglistarr.count + dmallleadslistarr.count
            }
        }else if collectionView.tag == 55 {
            return totalsaleslistarr.count
        }else if collectionView.tag == 66 {
           
                return followupleadagingemplistarr.count
            
        }else if collectionView.tag == 77 {
            if self.fromwhichaging == "Leads summary" {
                return leadsummarytypelistarr.count
            }else{
                return followupstatuslistarr.count
            }
        }else if collectionView.tag == 88 {
            return inspheadingslistarr.count
        }else{
            return brandiconlistarr.count
        }
            
    
        }
    
    @objc func mainBtnAction(sender:UIButton!) {
        for n in 0..<mainlistarr.count {
            
            if sender.tag == n {
                mainlistarr[n].is_seleceted = true
                self.maincategory_id = mainlistarr[n].utm_source
            }else{
                mainlistarr[n].is_seleceted = false
                
            }
        }
       self.mainalldataCollectionView.reloadData()
        self.leadbysubcategoryServiceCall()
        self.leadbystatuslistServiceCall()
        
    }
    
    @objc func secondBtnAction(sender:UIButton!) {
        for n in 0..<secondlistarr.count {
            
            if sender.tag == n {
                secondlistarr[n].seleceted = true
                self.subcategoryid = secondlistarr[n].utm_medium
            }else{
                secondlistarr[n].seleceted = false
                
            }
        }
       self.secondlistCollectionView.reloadData()
        
        self.leadbysourcecampaignServiceCall()
        
    }
    
    @objc func thirdBtnAction(sender:UIButton!) {
        for n in 0..<thirdlistarr.count {
            
            if sender.tag == n {
                thirdlistarr[n].was_select = true
                self.sourcecampignid = thirdlistarr[n].utm_campaign
            }else{
                thirdlistarr[n].was_select = false
                
            }
        }
       self.thirddetailsCollectionView.reloadData()
        
        self.leadbystatuslistServiceCall()
        
    }
    
    @objc func selectfollowupleadempBtnAction(sender:UIButton!) {
       
            for n in 0..<followupleadagingemplistarr.count {
                
                if sender.tag == n {
                    followupleadagingemplistarr[n].is_selected = true
                    self.followupleadagingemp_id = String(self.followupleadagingemplistarr[n].employee_id)
                }else{
                    followupleadagingemplistarr[n].is_selected = false
                    
                }
            }
            self.allfollowupleadempdataCollectionView.reloadData()
            self.followupleaddatalistServiceCall()
            self.followupleadagingstatuslistServiceCall()
    
       
    }
    
    @objc func selectstatusofleadfollowupagingBtnAction(sender:UIButton!) {
        if self.fromwhichaging == "Leads summary" {
            for n in 0..<leadsummarytypelistarr.count {
                
                if sender.tag == n {
                    leadsummarytypelistarr[n].is_selected = true
                    self.leadsummarytype_id = String(self.leadsummarytypelistarr[n].insp_type_id)
                }else{
                    leadsummarytypelistarr[n].is_selected = false
                    
                }
            }
            self.leadfollowupagingstatusdataCollectionView.reloadData()
            if self.leadsummarytype_id == "" {
                
            }else{
                self.leadssummarylistServiceCall()
            }
            
        }else{
            self.followupstatuslistarr[sender.tag].was_selected = !self.followupstatuslistarr[sender.tag].was_selected
            self.leadfollowupagingstatusdataCollectionView.reloadData()
            self.followupleaddatalistServiceCall()
        }
       
    }
    
    @objc func selectinspectionheadingBtnAction(sender:UIButton!) {
        for n in 0..<inspheadingslistarr.count {
            
            if sender.tag == n {
                inspheadingslistarr[n].selected = true
                self.inspectiontype_id = self.inspheadingslistarr[n].id
            }else{
                inspheadingslistarr[n].selected = false
                
            }
        }
       self.totaldataofallinspectionsCollectionView.reloadData()
        
        self.allinspectionscountlistServiceCall()
        
    }
    
    @objc func sselectbrandBtnAction(sender:UIButton!) {
        self.brandiconlistarr[sender.tag].was_selected = !self.brandiconlistarr[sender.tag].was_selected
        self.selectbrandid = String(brandiconlistarr[sender.tag].id)
        self.allbrandsdataCollectionView.reloadData()
        }
    
   
    
   }


class listofmaincollectioncell : UICollectionViewCell {
    @IBOutlet weak var nameofmainLabel: UILabel!
    @IBOutlet weak var mainBackView: UIView!
    @IBOutlet weak var mainBtn: UIButton!
    @IBOutlet weak var htOfmainCell: NSLayoutConstraint!
    @IBOutlet weak var wtOfmainCell: NSLayoutConstraint!
    
}

class sublistforselectedmaincollectioncell : UICollectionViewCell {
    @IBOutlet weak var googleLabel: UILabel!
    @IBOutlet weak var secondBackView: UIView!
    @IBOutlet weak var secondBtn: UIButton!
    @IBOutlet weak var htOfsecondCell: NSLayoutConstraint!
    @IBOutlet weak var wtOfsecondCell: NSLayoutConstraint!
    
}

class newlistforthirddatacollectioncell : UICollectionViewCell {
    @IBOutlet weak var nameofthirdLabel: UILabel!
    @IBOutlet weak var thirdBtn: UIButton!
    @IBOutlet weak var thirdBackView: UIView!
    @IBOutlet weak var htOfthirdCell: NSLayoutConstraint!
    @IBOutlet weak var wtOfthirdCell: NSLayoutConstraint!
    
}

class detailsforleadslistcollectioncell : UICollectionViewCell {
    @IBOutlet weak var leadsfrondateLabel: UILabel!
    @IBOutlet weak var lastmonthamountLabel: UILabel!
    @IBOutlet weak var targetpercentageLabel: UILabel!
    @IBOutlet weak var htOfleadsCell: NSLayoutConstraint!
    @IBOutlet weak var wtOfleadsCell: NSLayoutConstraint!
    @IBOutlet weak var leadcompletedcountorpercentLabel: UILabel!
    @IBOutlet weak var leadstitleLabel: UILabel!
    @IBOutlet weak var dmLabel: UILabel!
    @IBOutlet weak var waLabel: UILabel!
    @IBOutlet weak var mainbgBackView: UIView!
    
}

class numberofsalesfromdiffsourcescollectioncell : UICollectionViewCell {
    @IBOutlet weak var percentageofsalesbysourcesLabel: UILabel!
    @IBOutlet weak var nameofsourcesLabel: UILabel!
    @IBOutlet weak var amountforsourcesLabel: UILabel!
    @IBOutlet weak var htOfssCell: NSLayoutConstraint!
    @IBOutlet weak var wtOfssCell: NSLayoutConstraint!
    
}


class listoffollowupleademployeelistCollectionCell : UICollectionViewCell {
    @IBOutlet weak var followupleadempnameLabel: UILabel!
    @IBOutlet weak var selectfollowupleadempBtn: UIButton!
    @IBOutlet weak var selectfollowupleadempbgBackView: UIView!
    @IBOutlet weak var htOffollowupleadempCell: NSLayoutConstraint!
    @IBOutlet weak var wtOffollowupleadempCell: NSLayoutConstraint!
    
}

class detailsforleadfollowupstatusagingcollectioncell : UICollectionViewCell {
    @IBOutlet weak var statusnameofleadfollowupLabel: UILabel!
    @IBOutlet weak var selectstatusofleadfollowupagingBtn: UIButton!
    @IBOutlet weak var selectfollowupagingstatusbgBackView: UIView!
    @IBOutlet weak var htOffollowupstatusCell: NSLayoutConstraint!
    @IBOutlet weak var wtOffollowupstatusCell: NSLayoutConstraint!
    
}

class wdinspectiondetailscollectioncell : UICollectionViewCell {
    @IBOutlet weak var headingofinspectionLabel: UILabel!
    @IBOutlet weak var inspectionheadingbgBackView: UIView!
    @IBOutlet weak var selectinspectionheadingBtn: UIButton!
    @IBOutlet weak var htOfinspheadingCell: NSLayoutConstraint!
    @IBOutlet weak var wtOfinspheadingCell: NSLayoutConstraint!
    
}

class brandofcarslistCollectionCell : UICollectionViewCell {
    @IBOutlet weak var brandlogoimageVie: UIImageView!
    @IBOutlet weak var selectbrandBtn: UIButton!
    @IBOutlet weak var brandlogoBackView: UIView!
    @IBOutlet weak var htOfbrandCell: NSLayoutConstraint!
    @IBOutlet weak var wtOfbrandCell: NSLayoutConstraint!
    
}

extension newhomePageVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView.tag == 2222 {
            return daterangelistarr.count
        }else if tableView.tag == 3333 {
            return subfilterlistarr.count
        }else if tableView.tag == 4444 {
            return leadbystatuslistarr.count
        }else if tableView.tag == 5555 {
            return allemployeelistarr.count
        }else if tableView.tag == 6666 {
            return alltypeslistarr.count
        }else if tableView.tag == 7777 {
            if self.fromwhichaging == "Lead aging" {
                return leadaginglistarr.count
            }else if self.fromwhichaging == "Leads summary" {
                return leadsummarylistarr.count
            }else{
                return followupleadagelistarr.count
            }
        }else if tableView.tag == 8888 {
            return allinspectionscountlistarr.count
        }else if tableView.tag == 999 {
            if self.insp_status == "Approved" {
                return approvedvehlistarr.count
            }else{
                return allcarlistarr.count
            }
            
        }else{
            return dealerpurchasedpacklistarr.count
        }
        
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView.tag == 2222 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "daterangedetailstablecell", for: indexPath) as! daterangedetailstablecell
            cell.nameoddateLabel.text = daterangelistarr[indexPath.row].text_type
            if self.daterangelistarr[indexPath.row].is_selected == true {
            cell.nameoddateLabel.textColor = UIColor.init(hexString: "0619c3")
            cell.selectdatetickImageView.isHidden = false
        }else{
            cell.nameoddateLabel.textColor = UIColor.init(hexString: "252a40")
            cell.selectdatetickImageView.isHidden = true
        }
            cell.selectdaterangeBtn.tag = indexPath.row
            cell.selectdaterangeBtn.addTarget(self, action: #selector(selectdaterangeBtnAction(sender:)), for: UIControl.Event.touchUpInside)
        cell.htOfdtCell.constant = 60
            return cell
        }else if tableView.tag == 3333{
            let cell = tableView.dequeueReusableCell(withIdentifier: "subfilterlisttablecell", for: indexPath) as! subfilterlisttablecell
            cell.nameofsubfilterLabel.text = subfilterlistarr[indexPath.row]
            cell.htOfsubfilterCEll.constant = 75
            return cell
        }else if tableView.tag == 4444 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "alltransactionlisttablecell", for: indexPath) as! alltransactionlisttablecell
            cell.customernameLabel.text = leadbystatuslistarr[indexPath.row].status_name
            cell.priceLabel.text = String(leadbystatuslistarr[indexPath.row].count)
            let percentageValue = leadbystatuslistarr[indexPath.row].percent
            let formattedPercentage = String(format: "%.1f%%", percentageValue!)
            cell.percentageLabel.text = formattedPercentage
            cell.htOftCell.constant = 55
            cell.selecttransctionBtn.tag = indexPath.row
            cell.selecttransctionBtn.addTarget(self, action: #selector(selecttransctionBtnAction(sender:)), for: UIControl.Event.touchUpInside)
            return cell
        }else if tableView.tag == 5555 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "listofwdemployeestablecell", for: indexPath) as! listofwdemployeestablecell
            cell.nameofemployeeLabel.text = allemployeelistarr[indexPath.row].employee_name
            if self.allemployeelistarr[indexPath.row].is_seleceted == true {
                cell.selectemployeetickImageView.isHidden = false
            }else{
                cell.selectemployeetickImageView.isHidden = true
            }
            cell.selectempBtn.tag = indexPath.row
            cell.selectempBtn.addTarget(self, action: #selector(selectempBtnAction(sender:)), for: UIControl.Event.touchUpInside)
            cell.htOfempCell.constant = 55
            return cell
        }else if tableView.tag == 6666 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "typesdatatablecell", for: indexPath) as! typesdatatablecell
            cell.nameoftypeLabel.text = alltypeslistarr[indexPath.row].lead_type
            if self.alltypeslistarr[indexPath.row].was_selected == true {
                cell.selecttypetickImageView.isHidden = false
            }else{
                cell.selecttypetickImageView.isHidden = true
            }
            cell.selecttypeBtn.tag = indexPath.row
            cell.selecttypeBtn.addTarget(self, action: #selector(selecttypeBtnAction(sender:)), for: UIControl.Event.touchUpInside)
            return cell
        }else if tableView.tag == 7777 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ageoffollowupleadtablecell", for: indexPath) as! ageoffollowupleadtablecell
            if self.fromwhichaging == "Lead aging" {
                cell.ageoffollowupLabel.text = leadaginglistarr[indexPath.row].age_name
                cell.agecountLabel.text = String(leadaginglistarr[indexPath.row].count)
                let percentageValue = leadaginglistarr[indexPath.row].percentage
                let formattedPercentage = String(format: "%.1f%%", percentageValue!)
                cell.ageoffollowupleadpercentageLabel.text = formattedPercentage
                cell.agepercentageBackView.isHidden = false
                cell.wtOfagepercent.constant = 55
                cell.htOffollowupageCell.constant = 55
            }else if self.fromwhichaging == "Leads summary" {
                cell.ageoffollowupLabel.text = leadsummarylistarr[indexPath.row].status_name
                cell.agecountLabel.text = String(leadsummarylistarr[indexPath.row].count)
                let percentageValue = leadsummarylistarr[indexPath.row].percentage
                let formattedPercentage = String(format: "%.1f%%", percentageValue!)
                cell.ageoffollowupleadpercentageLabel.text = formattedPercentage
                cell.agepercentageBackView.isHidden = false
                cell.wtOfagepercent.constant = 55
                cell.htOffollowupageCell.constant = 55
            }else{
                cell.ageoffollowupLabel.text = followupleadagelistarr[indexPath.row].follow_up_name
                cell.agecountLabel.text = String(followupleadagelistarr[indexPath.row].count)
                let percentageValue = followupleadagelistarr[indexPath.row].percentage
                let formattedPercentage = String(format: "%.1f%%", percentageValue!)
                cell.ageoffollowupleadpercentageLabel.text = formattedPercentage
                cell.agepercentageBackView.isHidden = false
                cell.wtOfagepercent.constant = 55
                cell.htOffollowupageCell.constant = 55
            }
            return cell
        }else if tableView.tag == 8888 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "statusofinspectionlistTableCell", for: indexPath) as! statusofinspectionlistTableCell
            cell.statusnameLabel.text! = allinspectionscountlistarr[indexPath.row].inspection_status
            cell.statuscountLabel.text! = String(allinspectionscountlistarr[indexPath.row].count)
            let percentageValue = allinspectionscountlistarr[indexPath.row].percentage
            let formattedPercentage = String(format: "%.1f%%", percentageValue!)
            cell.statuspercentageLabel.text! = formattedPercentage
            if self.allinspectionscountlistarr[indexPath.row].percentage > 70 {
                cell.inspectionstatuspercentBackView.backgroundColor = UIColor.init(hexString: "4BAE4F")
                cell.statuspercentageLabel.textColor = .white
            }else if self.allinspectionscountlistarr[indexPath.row].percentage > 50 && self.allinspectionscountlistarr[indexPath.row].percentage < 70 {
                cell.inspectionstatuspercentBackView.backgroundColor = UIColor.init(hexString: "F68B33")
                cell.statuspercentageLabel.textColor = .white
            }else{
                cell.inspectionstatuspercentBackView.backgroundColor = UIColor.init(hexString: "F7F7F7")
                cell.statuspercentageLabel.textColor = UIColor.init(hexString: "252a40")
            }
            cell.statususeercountlabel.text! = String(allinspectionscountlistarr[indexPath.row].lead_count)
            cell.htOfstatusinspCell.constant = 55
            if self.allinspectionscountlistarr[indexPath.row].inspection_status == "Repair Requested" || self.allinspectionscountlistarr[indexPath.row].inspection_status == "Rejected" || self.allinspectionscountlistarr[indexPath.row].inspection_status == "Approved" {
                if self.allinspectionscountlistarr[indexPath.row].count == 0 {
                    cell.statusBtn.isHidden = true
                    cell.statuscountunderlineLabel.isHidden = true
                }else{
                    cell.statusBtn.isHidden = false
                    cell.statuscountunderlineLabel.isHidden = false
                }
            }else{
                cell.statusBtn.isHidden = true
                cell.statuscountunderlineLabel.isHidden = true
            }
            
            if self.inspectiontype_id == "4" || self.inspectiontype_id == "5" {
                cell.inspstatusleadagingunderlineLabel.isHidden = true
                cell.leadagingsdataBtn.isHidden = true
            }else{
                cell.inspstatusleadagingunderlineLabel.isHidden = false
                cell.leadagingsdataBtn.isHidden = false
            }
            
            cell.statusBtn.tag = indexPath.row
            cell.statusBtn.addTarget(self, action: #selector(statusBtnAction(sender:)), for: UIControl.Event.touchUpInside)
            cell.leadagingsdataBtn.tag = indexPath.row
            cell.leadagingsdataBtn.addTarget(self, action: #selector(leadagingsdataBtnAction(sender:)), for: UIControl.Event.touchUpInside)
            return cell
        }else if tableView.tag == 999 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "carslistbasedoninspstatusTableCell", for: indexPath) as! carslistbasedoninspstatusTableCell
            if self.insp_status == "Approved" {
                cell.carmakeLabel.text! = approvedvehlistarr[indexPath.row].vehicle_make
                cell.carmodelLabel.text! = approvedvehlistarr[indexPath.row].vehicle_model
                cell.carfueltypeLabel.text! = approvedvehlistarr[indexPath.row].fuel_type
                cell.cartransmissiontypeLabel.text! = approvedvehlistarr[indexPath.row].transmission_type
                cell.carmfgyearLabel.text! = approvedvehlistarr[indexPath.row].manufacturing_year
                cell.carcountLabel.text! = String(approvedvehlistarr[indexPath.row].count)
                if self.approvedvehlistarr[indexPath.row].is_with_package == "Y" || self.approvedvehlistarr[indexPath.row].is_with_package == "y" {
                    cell.vehilcesBackView.backgroundColor = UIColor.init(hexString: "E2FFEE")
                }else{
                    cell.vehilcesBackView.backgroundColor = .white
                }
                cell.htOfcarlistCell.constant = 75
            }else{
                cell.carmakeLabel.text! = allcarlistarr[indexPath.row].vehicle_make
                cell.carmodelLabel.text! = allcarlistarr[indexPath.row].vehicle_model
                cell.carfueltypeLabel.text! = allcarlistarr[indexPath.row].fuel_type
                cell.cartransmissiontypeLabel.text! = allcarlistarr[indexPath.row].transmission_type
                cell.carmfgyearLabel.text! = allcarlistarr[indexPath.row].manufacturing_year
                cell.carcountLabel.text! = String(allcarlistarr[indexPath.row].count)
                cell.htOfcarlistCell.constant = 75
                cell.vehilcesBackView.backgroundColor = .white
            }
           
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "purchasedpackdetailsoftablecell", for: indexPath) as! purchasedpackdetailsoftablecell
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
                cell.dealerpurchasedpaymentbgBakcView.backgroundColor = UIColor.init(hexString: "E9F0FA")
            }else{
                cell.dealerpurchasedpaymentbgBakcView.backgroundColor = .white
            }
            if self.dealerpurchasedpacklistarr[indexPath.row].dealer6monthdata.count == 0 {
                cell.dealerpacksdatesBackView.isHidden = true
                cell.htOfdealerpacksdatesView.constant = 0
            }else{
                cell.dealerpacksdatesBackView.isHidden = false
                cell.htOfdealerpacksdatesView.constant = 50
            }
            cell.innerarrofdata = self.dealerpurchasedpacklistarr[indexPath.row].dealer6monthdata
           
            cell.comboreloaddataofcell(index: indexPath.row)
            return cell
        }
           
       }
    
    @objc func selectdaterangeBtnAction(sender:UIButton!) {
        
        for n in 0..<daterangelistarr.count {
            
            if sender.tag == n {
                daterangelistarr[n].is_selected = true
                
                if self.fromwhereselectdate == "Followup" {
                    self.customdatetitleLabel.text = "Custom date"
                    self.followupfromdate = ""
                    self.followuptodate = ""
                    self.reloadCalendar()
                    self.followupdatetitleLabel.text! = daterangelistarr[n].text_type
                    self.followupagingselecteddate = String(daterangelistarr[n].id)
                    self.followupleaddatalistServiceCall()
                }else{
                    self.customdatetitleLabel.text = "Custom date"
                    self.fromdate = ""
                    self.todate = ""
                    self.reloadCalendar()
                    self.datetitleLabel.text! = daterangelistarr[n].text_type
                    self.dateid = String(daterangelistarr[n].id)
                    if self.daterangelistarr[n].id == 1 {
                        self.newtBackView.backgroundColor = UIColor.init(hexString: "252a40")
                        self.newtletterLabel.textColor = .white
                        self.newmBackView.backgroundColor = UIColor.init(hexString: "f2f2f7")
                        self.newmletterLabel.textColor = UIColor.init(hexString: "252a40")
                    }else if self.daterangelistarr[n].id == 9 {
                        self.newtBackView.backgroundColor = UIColor.init(hexString: "f2f2f7")
                        self.newtletterLabel.textColor = UIColor.init(hexString: "252a40")
                        self.newmBackView.backgroundColor = UIColor.init(hexString: "252a40")
                        self.newmletterLabel.textColor = .white
                    }else{
                        self.newtBackView.backgroundColor = UIColor.init(hexString: "f2f2f7")
                        self.newtletterLabel.textColor = UIColor.init(hexString: "252a40")
                        self.newmBackView.backgroundColor = UIColor.init(hexString: "f2f2f7")
                        self.newmletterLabel.textColor = UIColor.init(hexString: "252a40")
                    }
                    self.leadbycategoryServiceCall()
                }
                self.daterangeBackView.isHidden = true
                
               
                
            }else{
                daterangelistarr[n].is_selected = false
                
            }
        }
       self.alldatesTableVIew.reloadData()
    
    }
    
    @objc func selectempBtnAction(sender:UIButton!) {
        
        self.allemployeelistarr[sender.tag].is_seleceted = !self.allemployeelistarr[sender.tag].is_seleceted
        self.selectallemployeestickImageView.isHidden = true
        
        if self.allemployeelistarr[sender.tag].is_seleceted == true {
            self.employeecount = employeecount + 1
            self.employeetitileLabel.text = "Employee" + "(" + String(self.employeecount) + ")"
            self.allemployeesdetailsTableVIew.reloadData()
        }else{
            self.employeecount = employeecount - 1
            self.employeetitileLabel.text = "Employee" + "(" + String(self.employeecount) + ")"
            self.allemployeesdetailsTableVIew.reloadData()
            if self.employeetitileLabel.text == "0" {
                self.employeetitileLabel.text = "Employee" + ""
            }else{
                self.employeetitileLabel.text = "Employee" + "(" + String(self.employeecount) + ")"
            }
            
        }
    
    }
    
    @objc func selecttransctionBtnAction(sender:UIButton!) {
        let index = sender.tag
        self.ageofallfollowupleaddataBackView.isHidden = false
        self.fromwhichaging = "Inspection followup aging"
        self.agingfollowupemployeedataBackView.isHidden = true
        self.htOfaggingfollowupempView.constant = 0
        self.agingfollowupstatusBackView.isHidden = true
        self.htOffollowupstatusdataView.constant = 0
        self.leadsummarytotalleaddscountBackView.isHidden = true
        self.htOfleadsummarytotalleadView.constant = 0
        self.newfollowupleadstatusid = self.leadbystatuslistarr[index].status_id
        self.followupleadagingtitleLabel.text! = self.leadbystatuslistarr[index].status_name
        self.DurationtitleLabel.text! = "Duration"
        self.leadsummarylastmonthBackView.isHidden = true
        self.leadsummaryoneBackView.isHidden = true
        self.leadsummarytwoBackView.isHidden = true
        self.leadsummarygraphBackView.isHidden = true
        self.leadstatusdatalistServiceCall()
    
    }
    
    @objc func selecttypeBtnAction(sender:UIButton!) {
        
            self.alltypeslistarr[sender.tag].was_selected = !self.alltypeslistarr[sender.tag].was_selected
            
            if self.alltypeslistarr[sender.tag].was_selected == true {
                self.count = count + 1
                self.typeTitleLabel.text = "Type" + "(" + String(self.count) + ")"
                self.differenttypesTableView.reloadData()
            }else{
                self.count = count - 1
                self.typeTitleLabel.text = "Type" + "(" + String(self.count) + ")"
                self.differenttypesTableView.reloadData()
                if self.typeTitleLabel.text == "0" {
                    self.typeTitleLabel.text = "Type" + ""
                }else{
                    self.typeTitleLabel.text = "Type" + "(" + String(self.count) + ")"
                }
                
            }
        
    }
    
    @objc func statusBtnAction(sender:UIButton!) {
        let index = sender.tag
        self.vehiclelistBackView.isHidden = false
        let bottomInset = vehiclefilterBackView.frame.height
        allvehlistbasedoninspstatusTableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: bottomInset, right: 0)
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
    
    @objc func leadagingsdataBtnAction(sender:UIButton!) {
        let index = sender.tag
        self.ageofallfollowupleaddataBackView.isHidden = false
        self.agingfollowupemployeedataBackView.isHidden = true
        self.htOfaggingfollowupempView.constant = 0
        self.agingfollowupstatusBackView.isHidden = true
        self.htOffollowupstatusdataView.constant = 0
        self.leadsummarytotalleaddscountBackView.isHidden = true
        self.htOfleadsummarytotalleadView.constant = 0
        self.insp_status = self.allinspectionscountlistarr[index].inspection_status
        self.followupleadagingtitleLabel.text! = "Lead Aging"
        self.DurationtitleLabel.text! = "Duration"
        self.fromwhichaging = "Lead aging"
        self.leadsummarylastmonthBackView.isHidden = true
        self.leadsummaryoneBackView.isHidden = true
        self.leadsummarytwoBackView.isHidden = true
        self.leadsummarygraphBackView.isHidden = true
        self.leadsaginglistServiceCall()
    }
    
    }

class daterangedetailstablecell : UITableViewCell {
    @IBOutlet weak var nameoddateLabel: UILabel!
    @IBOutlet weak var selectdatetickImageView: UIImageView!
    @IBOutlet weak var selectdaterangeBtn: UIButton!
    @IBOutlet weak var htOfdtCell: NSLayoutConstraint!
    
}

class subfilterlisttablecell : UITableViewCell {
    @IBOutlet weak var nameofsubfilterLabel: UILabel!
    @IBOutlet weak var htOfsubfilterCEll: NSLayoutConstraint!
    
}

class alltransactionlisttablecell : UITableViewCell {
    @IBOutlet weak var customernameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var htOftCell: NSLayoutConstraint!
    @IBOutlet weak var percentageLabel: UILabel!
    @IBOutlet weak var selecttransctionBtn: UIButton!
    
    
}

class listofwdemployeestablecell : UITableViewCell {
    @IBOutlet weak var nameofemployeeLabel: UILabel!
    @IBOutlet weak var selectemployeetickImageView: UIImageView!
    @IBOutlet weak var htOfempCell: NSLayoutConstraint!
    @IBOutlet weak var selectempBtn: UIButton!
    
}

class typesdatatablecell : UITableViewCell {
    @IBOutlet weak var nameoftypeLabel: UILabel!
    @IBOutlet weak var selecttypetickImageView: UIImageView!
    @IBOutlet weak var selecttypeBtn: UIButton!
    @IBOutlet weak var htOftypeCell: NSLayoutConstraint!
    
}

class ageoffollowupleadtablecell : UITableViewCell {
    @IBOutlet weak var ageoffollowupLabel: UILabel!
    @IBOutlet weak var agecountLabel: UILabel!
    @IBOutlet weak var htOffollowupageCell: NSLayoutConstraint!
    @IBOutlet weak var ageoffollowupleadpercentageLabel: UILabel!
    @IBOutlet weak var agepercentageBackView: UIView!
    @IBOutlet weak var wtOfagepercent: NSLayoutConstraint!
    
}

class statusofinspectionlistTableCell : UITableViewCell {
    @IBOutlet weak var statusnameLabel: UILabel!
    @IBOutlet weak var statuscountLabel: UILabel!
    @IBOutlet weak var statuscountunderlineLabel: UILabel!
    @IBOutlet weak var htOfstatusinspCell: NSLayoutConstraint!
    @IBOutlet weak var statuspercentageLabel: UILabel!
    @IBOutlet weak var statususeercountlabel: UILabel!
    @IBOutlet weak var statusBtn: UIButton!
    @IBOutlet weak var leadagingsdataBtn: UIButton!
    @IBOutlet weak var inspstatusleadagingunderlineLabel: UILabel!
    @IBOutlet weak var inspectionstatuspercentBackView: UIView!
    
}

class carslistbasedoninspstatusTableCell : UITableViewCell {
    @IBOutlet weak var carmakeLabel: UILabel!
    @IBOutlet weak var carmodelLabel: UILabel!
    @IBOutlet weak var carmfgyearLabel: UILabel!
    @IBOutlet weak var carfueltypeLabel: UILabel!
    @IBOutlet weak var cartransmissiontypeLabel: UILabel!
    @IBOutlet weak var carcountLabel: UILabel!
    @IBOutlet weak var htOfcarlistCell: NSLayoutConstraint!
    @IBOutlet weak var vehilcesBackView: UIView!
    
}

class purchasedpackdetailsoftablecell : UITableViewCell {
    @IBOutlet weak var dealernameLabel: UILabel!
    @IBOutlet weak var dealerpackagenameLabel: UILabel!
    @IBOutlet weak var dealeramountLabel: UILabel!
    @IBOutlet weak var dealerpurchasedpaymentbgBakcView: UIView!
    @IBOutlet weak var dealerpurchasespackdatedataCollectionView: UICollectionView!
    @IBOutlet weak var dealerpacksdatesBackView: UIView!
    @IBOutlet weak var htOfdealerpacksdatesView: NSLayoutConstraint!
    
    var controller : newhomePageVC!
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
               self.dealerpurchasespackdatedataCollectionView.delegate = self
               self.dealerpurchasespackdatedataCollectionView.dataSource = self
               self.dealerpurchasespackdatedataCollectionView.reloadData()
               self.indee = index
       }
}


extension purchasedpackdetailsoftablecell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "sublistofpurchasedpackdatesCollectionCell", for: indexPath) as! sublistofpurchasedpackdatesCollectionCell
            cell.dateofpurchasedpackLabel.text! = innerarrofdata[indexPath.row].payment_month
            cell.htOfdatepurchasedpackCell.constant = 45
            return cell
        
        
    }
    
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       
            return innerarrofdata.count
        
    
        }
    
   
   }

class sublistofpurchasedpackdatesCollectionCell : UICollectionViewCell {
    @IBOutlet weak var dateofpurchasedpackLabel: UILabel!
    @IBOutlet weak var htOfdatepurchasedpackCell: NSLayoutConstraint!
    
}

extension newhomePageVC: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageWidth = scrollView.frame.width
        let currentPage = Int((scrollView.contentOffset.x + pageWidth / 2) / pageWidth)
        newpagecontrol.currentPage = currentPage
    }
}

extension newhomePageVC: RangeSeekSliderDelegate {

    func rangeSeekSlider(_ slider: RangeSeekSlider, didChange minValue: CGFloat, maxValue: CGFloat) {
        let roundedMinValue = Int(round(minValue))
        let roundedMaxValue = Int(round(maxValue))
       
        print("year slider updated. Min Value: \(roundedMinValue) Max Value: \(roundedMaxValue)")
        self.yearmaximum = "\(roundedMaxValue)"
        self.yearminimum = "\(roundedMinValue)"
    }

    func didStartTouches(in slider: RangeSeekSlider) {
        print("did start touches")
    }

    func didEndTouches(in slider: RangeSeekSlider) {
        // Handle touch end if needed
    }
}

