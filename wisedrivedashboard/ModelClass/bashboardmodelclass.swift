//
//  bashboardmodelclass.swift
//  wisedrivedashboard
//
//  Created by Maanas Kumar on 15/07/23.
//

import Foundation

class LeadByStatusListNewModelClass {
    var count_1 : Int!
    var percent : Double!
    var status_id : Int!
    var status_name : String!
    init(data : JSON) {
        self.count_1 = data["count_1"].intValue
        self.percent = data["percent"].doubleValue
        self.status_id = data["status_id"].intValue
        self.status_name = data["status_name"].stringValue
    }
}

class LeadStatuslistModelClass {
    var status_id : Int!
    var status_name : String!
    var was_selected : Bool!
    init(data : JSON) {
        self.status_id = data["status_id"].intValue
        self.status_name = data["status_name"].stringValue
        self.was_selected = data["was_selected"].boolValue
    }
}

class InsideSalesTeamListModelClass {
    var employee_id : String!
    var employee_no : String!
    var employee_name : String!
    var date_of_joining : String!
    var is_seleceted : Bool!
    init(data : JSON) {
        self.employee_id = data["employee_id"].stringValue
        self.employee_no = data["employee_no"].stringValue
        self.employee_name = data["employee_name"].stringValue
        self.date_of_joining = data["date_of_joining"].stringValue
        self.is_seleceted = data["is_seleceted"].boolValue
    }
}

class LeadTypeListModelClass {
    var lead_type : String!
    var type_id : String!
    var was_selected : Bool!
    init(data : JSON) {
        self.lead_type = data["lead_type"].stringValue
        self.type_id = data["type_id"].stringValue
        self.was_selected = data["was_selected"].boolValue
    }
}

class LeadByCategoryModelClass {
    var category_name : String!
    var category_id : Int!
    var count : Int!
    var is_seleceted : Bool!
    init(data : JSON) {
        self.category_name = data["category_name"].stringValue
        self.category_id = data["category_id"].intValue
        self.count = data["count"].intValue
        self.is_seleceted = data["is_seleceted"].boolValue
    }
}

class LeadBySubCategoryModelClass {
    var sub_category_id : Int!
    var count : Int!
    var sub_category_name : String!
    var seleceted : Bool!
    init(data : JSON) {
        self.sub_category_id = data["sub_category_id"].intValue
        self.count = data["count"].intValue
        self.sub_category_name = data["sub_category_name"].stringValue
        self.seleceted = data["seleceted"].boolValue
    }
}

class LeadBySourceCampaignModelClass {
    var count : Int!
    var source_id : Int!
    var source_name : String!
    var was_select : Bool!
    init(data : JSON) {
        self.count = data["count"].intValue
        self.source_id = data["source_id"].intValue
        self.source_name = data["source_name"].stringValue
        self.was_select = data["was_select"].boolValue
    }
}

class LeadByStatusNewModelClass {
    var status_id : Int!
    var status_name : String!
    var percent : Double!
    var count_1 : Int!
    var is_select : Bool!
    init(data : JSON) {
        self.status_id = data["status_id"].intValue
        self.status_name = data["status_name"].stringValue
        self.percent = data["percent"].doubleValue
        self.count_1 = data["count_1"].intValue
        self.is_select = data["LeadByStatusNew"].boolValue
    }
}

class TextTypeListModelClass {
    var text_type : String!
    var id : Int!
    var is_selected : Bool!
    init(data : JSON) {
        self.text_type = data["text_type"].stringValue
        self.id = data["id"].intValue
        self.is_selected = data["is_selected"].boolValue
    }
}

class TotalSaleDataModelClass {
    var sales_sum : Double!
    var percent : Double!
    var category_name : String!
    init(data : JSON) {
        self.sales_sum = data["sales_sum"].doubleValue
        self.percent = data["percent"].doubleValue
        self.category_name = data["category_name"].stringValue
    }
}

class ConsolidateDataModelClass {
    var sales_sum : Double!
    var percent : Double!
    var category_name : String!
    var total_count : Int!
    init(data : JSON) {
        self.sales_sum = data["sales_sum"].doubleValue
        self.percent = data["percent"].doubleValue
        self.category_name = data["category_name"].stringValue
        self.total_count = data["total_count"].intValue
    }
}

class SaleDurationDataModelClass {
    var tat : String!
    init(data : JSON) {
        self.tat = data["tat"].stringValue
    }
}

class AllLeadsModelClass {
    var wa_percent : Double!
    var dm_percent : Double!
    var dm_count : Int!
    var others_percent : Double!
    var all_count : Int!
    var all_percent : Double!
    var wa_count : Int!
    var others_count : Int!
    var all_category_name : String!
    var dm_category_name : String!
    var wa_category_name : String!
    var others_category_name : String!
    init(data : JSON) {
        self.wa_percent = data["wa_percent"].doubleValue
        self.dm_percent = data["dm_percent"].doubleValue
        self.dm_count = data["dm_count"].intValue
        self.others_percent = data["others_percent"].doubleValue
        self.all_count = data["all_count"].intValue
        self.all_percent = data["all_percent"].doubleValue
        self.wa_count = data["wa_count"].intValue
        self.others_count = data["others_count"].intValue
        self.all_category_name = data["all_category_name"].stringValue
        self.dm_category_name = data["dm_category_name"].stringValue
        self.wa_category_name = data["wa_category_name"].stringValue
        self.others_category_name = data["others_category_name"].stringValue
    }
}

class UpsellrenewalModelClass {
    var renewal_count : Int!
    var upselling_count : Int!
    var all_percent : Double!
    var renewal_percent : Double!
    var upselling_pecent : Double!
    var all_count : Int!
    var upselling_category_name : String!
    var renewal_category_name : String!
    init(data : JSON) {
        self.renewal_count = data["renewal_count"].intValue
        self.upselling_count = data["upselling_count"].intValue
        self.all_percent = data["all_percent"].doubleValue
        self.renewal_percent = data["renewal_percent"].doubleValue
        self.upselling_pecent = data["upselling_pecent"].doubleValue
        self.all_count = data["all_count"].intValue
        self.upselling_category_name = data["upselling_category_name"].stringValue
        self.renewal_category_name = data["renewal_category_name"].stringValue
    }
}


class DMStatusModelClass {
    var all_count : Int!
    var rnr_category_name : String!
    var rnr_count : Int!
    var rnr_percent : Double!
    var insp_scheduled_percent : Double!
    var insp_scheduled_count : Int!
    var insp_scheduled_category_name : String!
    var all_percent : Int!
    var all_category_name : String!
    init(data : JSON) {
        self.all_count = data["all_count"].intValue
        self.rnr_category_name = data["rnr_category_name"].stringValue
        self.rnr_count = data["rnr_count"].intValue
        self.rnr_percent = data["rnr_percent"].doubleValue
        self.insp_scheduled_percent = data["insp_scheduled_percent"].doubleValue
        self.insp_scheduled_count = data["insp_scheduled_count"].intValue
        self.insp_scheduled_category_name = data["insp_scheduled_category_name"].stringValue
        self.all_percent = data["all_percent"].intValue
        self.all_category_name = data["all_category_name"].stringValue
    }
}

class DMAllModelClass {
    var google_percent : Double!
    var all_count : Int!
    var google_count : Int!
    var facebook_category_name : String!
    var google_category_name : String!
    var all_percent : Double!
    var facebook_percent : Double!
    var all_category_name : String!
    var facebook_count : Int!
    init(data : JSON) {
        self.google_percent = data["google_percent"].doubleValue
        self.all_count = data["all_count"].intValue
        self.google_count = data["google_count"].intValue
        self.facebook_category_name = data["facebook_category_name"].stringValue
        self.google_category_name = data["google_category_name"].stringValue
        self.all_percent = data["all_percent"].doubleValue
        self.facebook_percent = data["facebook_percent"].doubleValue
        self.all_category_name = data["all_category_name"].stringValue
        self.facebook_count = data["facebook_count"].intValue
    }
}

class WhatsappNegativeModelClass {
    var rnr_category_name : String!
    var negative_msg_count : Int!
    var rnr_count : Int!
    var negative_msg_category_name : String!
    var all_percent : Double!
    var all_category_name : String!
    var all_count : Int!
    var rnr_percent : Double!
    var negative_msg_percent : Double!
    init(data : JSON) {
        self.rnr_category_name = data["rnr_category_name"].stringValue
        self.negative_msg_count = data["negative_msg_count"].intValue
        self.rnr_count = data["rnr_count"].intValue
        self.negative_msg_category_name = data["negative_msg_category_name"].stringValue
        self.all_percent = data["all_percent"].doubleValue
        self.all_category_name = data["all_category_name"].stringValue
        self.all_count = data["all_count"].intValue
        self.rnr_percent = data["rnr_percent"].doubleValue
        self.negative_msg_percent = data["negative_msg_percent"].doubleValue
    }
}

class WhatsappAllModelClass {
    var positive_msg_category_name : String!
    var positive_msg_count : Int!
    var positive_msg_percent : Double!
    var all_percent : Double!
    var floow_up_percent : Double!
    var all_category_name : String!
    var floow_up_category_name : String!
    var all_count : Int!
    var floow_up_count : Int!
    init(data : JSON) {
        self.positive_msg_category_name = data["positive_msg_category_name"].stringValue
        self.positive_msg_count = data["positive_msg_count"].intValue
        self.positive_msg_percent = data["positive_msg_percent"].doubleValue
        self.all_percent = data["all_percent"].doubleValue
        self.floow_up_percent = data["floow_up_percent"].doubleValue
        self.all_category_name = data["all_category_name"].stringValue
        self.floow_up_category_name = data["floow_up_category_name"].stringValue
        self.all_count = data["all_count"].intValue
        self.floow_up_count = data["floow_up_count"].intValue
    }
}

class InspDataModelClass {
    var count : Int!
    var percentage : Double!
    var lead_count : Int!
    var inspection_status : String!
    init(data : JSON) {
        self.count = data["count"].intValue
        self.percentage = data["percentage"].doubleValue
        self.lead_count = data["lead_count"].intValue
        self.inspection_status = data["inspection_status"].stringValue
    }
}

class UtmSourceDataMlodelClass {
    var count : Int!
    var utm_source : String!
    var is_seleceted : Bool!
    init(data : JSON) {
        self.count = data["count"].intValue
        self.utm_source = data["utm_source"].stringValue
        self.is_seleceted = data["is_seleceted"].boolValue
    }
}

class UtmmediumDataModelClass {
    var count : Int!
    var utm_medium : String!
    var seleceted : Bool!
    init(data : JSON) {
        self.count = data["count"].intValue
        self.utm_medium = data["utm_medium"].stringValue
        self.seleceted = data["seleceted"].boolValue
    }
}

class UtmCampaignDataModelClass {
    var count : Int!
    var utm_campaign : String!
    var was_select : Bool!
    init(data : JSON) {
        self.count = data["count"].intValue
        self.utm_campaign = data["utm_campaign"].stringValue
        self.was_select = data["was_select"].boolValue
    }
}

class UtmCampaignStatusDataModelClass {
    var percent : Double!
    var count : Int!
    var status_name : String!
    var status_id : String!
    var is_select : Bool!
    init(data : JSON) {
        self.percent = data["percent"].doubleValue
        self.count = data["count"].intValue
        self.status_name = data["status_name"].stringValue
        self.status_id = data["status_id"].stringValue
        self.is_select = data["is_select"].boolValue
    }
}

class LeadDataByFollowUpModelClass {
    var follow_up_name : String!
    var count : Int!
    var percentage : Double!
    init(data : JSON) {
        self.follow_up_name = data["follow_up_name"].stringValue
        self.count = data["count"].intValue
        self.percentage = data["percentage"].doubleValue
    }
}

class FollowUpStatusListModelClass {
    var status_name : String!
    var status_id : String!
    var count : Int!
    var was_selected : Bool!
    init(data : JSON) {
        self.status_name = data["status_name"].stringValue
        self.status_id = data["status_id"].stringValue
        self.count = data["count"].intValue
        self.was_selected = data["was_selected"].boolValue
    }
}

class FollowUpEmpListModelClass {
    var employee_id : String!
    var employee_name : String!
    var is_selected : Bool!
    init(data : JSON) {
        self.employee_id = data["employee_id"].stringValue
        self.employee_name = data["employee_name"].stringValue
        self.is_selected = data["is_selected"].boolValue
    }
}

class InspTypeListModelClass {
    var insp_name : String!
    var id : String!
    var selected : Bool!
    var count : Int!
    init(data : JSON) {
        self.insp_name = data["insp_name"].stringValue
        self.id = data["id"].stringValue
        self.selected = data["selected"].boolValue
        self.count = data["count"].intValue
    }
}

class reinsprepairDataModelClass {
    var vehicle_make : String!
    var manufacturing_year : String!
    var fuel_type : String!
    var vehicle_model : String!
    var transmission_type : String!
    var inspection_request_status : String!
    var count : Int!
    init(data : JSON) {
        self.vehicle_make = data["vehicle_make"].stringValue
        self.manufacturing_year = data["manufacturing_year"].stringValue
        self.fuel_type = data["fuel_type"].stringValue
        self.vehicle_model = data["vehicle_model"].stringValue
        self.transmission_type = data["transmission_type"].stringValue
        self.inspection_request_status = data["inspection_request_status"].stringValue
        self.count = data["count"].intValue
    }
}

class InspApprovedDataModelClass {
    var vehicle_no : String!
    var status_name : String!
    var fuel_type : String!
    var vehicle_make : String!
    var vehicle_model : String!
    var transmission_type : String!
    var count : Int!
    var is_with_package : String!
    var manufacturing_year : String!
    init(data : JSON) {
        self.vehicle_no = data["vehicle_no"].stringValue
        self.status_name = data["status_name"].stringValue
        self.fuel_type = data["fuel_type"].stringValue
        self.vehicle_make = data["vehicle_make"].stringValue
        self.vehicle_model = data["vehicle_model"].stringValue
        self.transmission_type = data["transmission_type"].stringValue
        self.count = data["count"].intValue
        self.is_with_package = data["is_with_package"].stringValue
        self.manufacturing_year = data["manufacturing_year"].stringValue
    }
}

class BrandListModelClass {
    var brand_icon : String!
    var id : String!
    var was_selected : Bool!
    init(data : JSON) {
        self.brand_icon = data["brand_icon"].stringValue
        self.id = data["id"].stringValue
        self.was_selected = data["was_selected"].boolValue
    }
}

class LeadagingInspDataModelClass {
    var count : Int!
    var age_name : String!
    var percentage : Double!
    init(data : JSON) {
        self.count = data["count"].intValue
        self.age_name = data["age_name"].stringValue
        self.percentage = data["percentage"].doubleValue
    }
}

class LeadSummaryModelClass {
    var status_name : String!
    var count : Int!
    var percentage : Double!
    init(data : JSON) {
        self.status_name = data["status_name"].stringValue
        self.count = data["count"].intValue
        self.percentage = data["percentage"].doubleValue
    }
}

class B2bSalesDetailsModelClass {
    var dealer_name : String!
    var product_id : Int!
    var final_price : Double!
    var assigned_executive_id : Int!
    var created_on : String!
    var package_name : String!
    var display_name : String!
    var payment_mode : String!
    var quantity : Int!
    var dealer6monthdata = [dealer6monthdataModelClass]()
    init(data : JSON) {
        self.dealer_name = data["dealer_name"].stringValue
        self.product_id = data["product_id"].intValue
        self.final_price = data["final_price"].doubleValue
        self.assigned_executive_id = data["assigned_executive_id"].intValue
        self.created_on = data["created_on"].stringValue
        self.package_name = data["package_name"].stringValue
        self.display_name = data["display_name"].stringValue
        self.payment_mode = data["payment_mode"].stringValue
        self.quantity = data["quantity"].intValue
        if(data["dealer6monthdata"].exists()) {
            data["dealer6monthdata"].arrayValue.forEach { (dataInner) in
                self.dealer6monthdata.append(dealer6monthdataModelClass.init(data: dataInner))
            }
            
        }
    }
}

class dealer6monthdataModelClass {
    var payment_month : String!
    init(data : JSON) {
        self.payment_month = data["payment_month"].stringValue
    }
}

class leadsummarydashboardModelClass {
    var insp_type_id : String!
    var type_name : String!
    var count : Int!
    var is_selected : Bool!
    init(data : JSON) {
        self.insp_type_id = data["insp_type_id"].stringValue
        self.type_name = data["type_name"].stringValue
        self.count = data["count"].intValue
        self.is_selected = data["is_selected"].boolValue
    }
}

class InspRejectedModelClass {
    var count : Int!
    var graph_month : String!
    init(data : JSON) {
        self.count = data["count"].intValue
        self.graph_month = data["graph_month"].stringValue
    }
}

class WarranrtPurchasedModelClass {
    var count : Int!
    var graph_month : String!
    init(data : JSON) {
        self.count = data["count"].intValue
        self.graph_month = data["graph_month"].stringValue
    }
}

class InspApprovedModelClass {
    var count : Int!
    var graph_month : String!
    init(data : JSON) {
        self.count = data["count"].intValue
        self.graph_month = data["graph_month"].stringValue
    }
}

class InspScheduledModelClass {
    var count : Int!
    var graph_month : String!
    init(data : JSON) {
        self.count = data["count"].intValue
        self.graph_month = data["graph_month"].stringValue
    }
}

class InspCancelledModelCLass {
    var count : Int!
    var graph_month : String!
    init(data : JSON) {
        self.count = data["count"].intValue
        self.graph_month = data["graph_month"].stringValue
    }
}

class FreeInspDataModelClass {
    var count : Int!
    var graph_month : String!
    init(data : JSON) {
        self.count = data["count"].intValue
        self.graph_month = data["graph_month"].stringValue
    }
}

class PaidInspDataModelClass {
    var count : Int!
    var graph_month : String!
    init(data : JSON) {
        self.count = data["count"].intValue
        self.graph_month = data["graph_month"].stringValue
    }
}

class AllInspDataModelClass {
    var count : Int!
    var graph_month : String!
    init(data : JSON) {
        self.count = data["count"].intValue
        self.graph_month = data["graph_month"].stringValue
    }
}

class InspCompletedModelClass {
    var count : Int!
    var graph_month : String!
    init(data : JSON) {
        self.count = data["count"].intValue
        self.graph_month = data["graph_month"].stringValue
    }
}

class AllLeadModelClass {
    var count : Int!
    var graph_month : String!
    init(data : JSON) {
        self.count = data["count"].intValue
        self.graph_month = data["graph_month"].stringValue
    }
}

class WarrantyBreakUpDataModelClass {
    var category_name : String!
    var total_count : Int!
    var sales_sum : Double!
    var percent : Double!
    var lead_count : Int!
    var leadCountNew : Dictionary<String, Any>!
    init(data : JSON) {
        self.category_name = data["category_name"].stringValue
        self.total_count = data["total_count"].intValue
        self.sales_sum = data["sales_sum"].doubleValue
        self.percent = data["percent"].doubleValue
        self.lead_count = data["lead_count"].intValue
        self.leadCountNew = data["leadCountNew"].dictionaryObject
    }
}

class leadCountNew {
    var new_lead_count : Int!
    init(data : JSON) {
        self.new_lead_count = data["new_lead_count"].intValue
    }
}

class InspBreakUpDataModelClass {
    var total_sales : Int!
    var sales_sum : Double!
    var category_name : String!
    var lead_count : Int!
    var leadCountNew : Dictionary<String, Any>!
    init(data : JSON) {
        self.total_sales = data["total_sales"].intValue
        self.sales_sum = data["sales_sum"].doubleValue
        self.category_name = data["category_name"].stringValue
        self.lead_count = data["lead_count"].intValue
        self.leadCountNew = data["leadCountNew"].dictionaryObject
    }
}



class ServicesBreakUpDataModeClass {
    var total_sales : Int!
    var avg_sum : Double!
    var category_name : String!
    var sales_sum : Double!
    init(data : JSON) {
        self.total_sales = data["total_sales"].intValue
        self.avg_sum = data["avg_sum"].doubleValue
        self.category_name = data["category_name"].stringValue
        self.sales_sum = data["sales_sum"].doubleValue
    }
}

class InspGraphDataApprovedModelClass {
    var total_count : Int!
    var graph_month : String!
    init(data : JSON) {
        self.total_count = data["total_count"].intValue
        self.graph_month = data["graph_month"].stringValue
    }
}

class InspGraphDataReinspectModelClass {
    var total_count : Int!
    var graph_month : String!
    init(data : JSON) {
        self.total_count = data["total_count"].intValue
        self.graph_month = data["graph_month"].stringValue
    }
}

class InspGraphDataInspModelClass {
    var total_count : Int!
    var graph_month : String!
    init(data : JSON) {
        self.total_count = data["total_count"].intValue
        self.graph_month = data["graph_month"].stringValue
    }
}

class InspGraphDataRequestedModelClass {
    var total_count : Int!
    var graph_month : String!
    init(data : JSON) {
        self.total_count = data["total_count"].intValue
        self.graph_month = data["graph_month"].stringValue
    }
}

class WarrantyActivatedDataSedanModelClass {
    var graph_month : String!
    var total_count : Int!
    init(data : JSON) {
        self.graph_month = data["graph_month"].stringValue
        self.total_count = data["total_count"].intValue
    }
}

class WarrantyActivatedDataHbModelClass {
    var graph_month : String!
    var total_count : Int!
    init(data : JSON) {
        self.graph_month = data["graph_month"].stringValue
        self.total_count = data["total_count"].intValue
    }
}

class WarrantyActivatedDataSuvModelClass {
    var graph_month : String!
    var total_count : Int!
    init(data : JSON) {
        self.graph_month = data["graph_month"].stringValue
        self.total_count = data["total_count"].intValue
    }
}

class ShowRoomDataModelClass {
    var Latitude : Double!
    var Longitude : Double!
    var car_brand : String!
    var id : Int!
    var Showroom_name : String!
    var brand_logo : String!
    var location : String!
    var is_seleceted : Bool!
    var brand_id : Int!
    init(data : JSON) {
        self.Latitude = data["Latitude"].doubleValue
        self.Longitude = data["Longitude"].doubleValue
        self.car_brand = data["car_brand"].stringValue
        self.id = data["id"].intValue
        self.Showroom_name = data["Showroom_name"].stringValue
        self.brand_logo = data["brand_logo"].stringValue
        self.location = data["location"].stringValue
        self.is_seleceted = data["is_seleceted"].boolValue
        self.brand_id = data["brand_id"].intValue
    }
    
}

class InspSalesModelClass {
    var sales_count : Int!
    var total_sales : Double!
    var payment_month : String!
    var created_on : String!
    init(data : JSON) {
        self.sales_count = data["sales_count"].intValue
        self.total_sales = data["total_sales"].doubleValue
        self.payment_month = data["payment_month"].stringValue
        self.created_on = data["created_on"].stringValue
    }
}

class ServiceSalesModelClass {
    var created_on : String!
    var payment_month : String!
    var total_sales : String!
    init(data : JSON) {
        self.created_on = data["created_on"].stringValue
        self.payment_month = data["payment_month"].stringValue
        self.total_sales = data["total_sales"].stringValue
    }
}

class TotalSalesModelClass {
    var created_on : String!
    var payment_month : String!
    var total_sales : String!
    init(data : JSON) {
        self.created_on = data["created_on"].stringValue
        self.payment_month = data["payment_month"].stringValue
        self.total_sales = data["total_sales"].stringValue
    }
}

class WarrantySalesModelClass {
    var created_on : String!
    var payment_month : String!
    var total_sales : String!
    var sales_count : Int!
    init(data : JSON) {
        self.created_on = data["created_on"].stringValue
        self.payment_month = data["payment_month"].stringValue
        self.total_sales = data["total_sales"].stringValue
        self.sales_count = data["sales_count"].intValue
    }
}

class WarrantyActivatedDataModelClass {
    var graph_month : String!
    var total_count : Int!
    var Quarter_2023 : Int!
    init(data : JSON) {
        self.graph_month = data["graph_month"].stringValue
        self.total_count = data["total_count"].intValue
        self.Quarter_2023 = data["Quarter_2023"].intValue
    }
}

class WarrantyActivatedDataBrandWiseModelClass {
    var id_2023 : Int!
    var inspection_date : String!
    var car_brand : String!
    var new_total_count : Int!
    var total_count : Int!
    var brand_id : Int!
    var count_1 : Int!
    var Quarter : String!
    init(data : JSON) {
        self.id_2023 = data["id_2023"].intValue
        self.inspection_date = data["inspection_date"].stringValue
        self.car_brand = data["car_brand"].stringValue
        self.new_total_count = data["new_total_count"].intValue
        self.total_count = data["total_count"].intValue
        self.brand_id = data["brand_id"].intValue
        self.count_1 = data["count_1"].intValue
        self.Quarter = data["Quarter"].stringValue
    }
}

class WarrantyActivatedDataModelWiseModelClass {
    var id_2023 : String!
    var new_total_count : Int!
    var car_brand : String!
    var total_count : Int!
    var brand_id : Int!
    var car_model : String!
    var Quarter : String!
    init(data : JSON) {
        self.id_2023 = data["id_2023"].stringValue
        self.new_total_count = data["new_total_count"].intValue
        self.car_brand = data["car_brand"].stringValue
        self.total_count = data["total_count"].intValue
        self.brand_id = data["brand_id"].intValue
        self.car_model = data["car_model"].stringValue
        self.Quarter = data["Quarter"].stringValue
    }
}

class SalesDataForIpadModelClass {
    var sales_sum : Double!
    var total_count : Int!
    var percent : Double!
    var category_name : String!
    init(data : JSON) {
        self.sales_sum = data["sales_sum"].doubleValue
        self.total_count = data["total_count"].intValue
        self.percent = data["percent"].doubleValue
        self.category_name = data["category_name"].stringValue
    }
}

class NewShowRoomDataModelClass {
    var Showroom_name : String!
    var car_brand : String!
    var brand_id : Int!
    var is_selected : Bool!
    init(data : JSON) {
        self.Showroom_name = data["Showroom_name"].stringValue
        self.car_brand = data["car_brand"].stringValue
        self.brand_id = data["brand_id"].intValue
        self.is_selected = data["is_selected"].boolValue
    }
}
