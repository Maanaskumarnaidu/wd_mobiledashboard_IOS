//
//  newviewmapPageVC.swift
//  wisedrivedashboard
//
//  Created by Maanas Kumar on 06/11/23.
//

import UIKit
import MapKit
import Alamofire
import SDWebImage
import GoogleMaps
import WebKit



class newviewmapPageVC: UIViewController, MKMapViewDelegate, WKNavigationDelegate {
    
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var googlempaView: GMSMapView!
    
    
    
    
    var allmapslistarr = [ShowRoomDataModelClass]()
    
    var allAnnotations = [CustomAnnotation]()
        var annotationViewMap = [CustomAnnotation: MKAnnotationView]()
    
    var alladdresslistarr = [
        "Mandovi Motors Pvt Ltd #15 Uttarahalli Village Kengeri Main Road Rajarajeshwari Nagar Bengaluru Karnataka 560060",
        "Mandovi #70 Bannerghatta Main Rd Sarakki Industrial Layout 3rd Phase JP. Nagar Bengaluru Karnataka 560078",
        "#24/4 7th Main Road NGO Colony Wilson Garden Bengaluru Karnataka 560027",
        "Sri Ganga Garden Hennur Main Road Kalyan Nagar Bengaluru Karnataka 560043",
        "Mandovi 4C Jolly Estate Old Madras Rd opp. RMZ Infinity Nagavarapalya Bengaluru Karnataka 560093",
        "Mandovi Motors 2/106 17th Cross Chord Rd next to Kassia Bldg Extn Vijayanagar Bengaluru Karnataka 560040",
        "Mandovi Motors Pvt Ltd. #15 Uttarahalli Village Kengeri Main Road Rajarajeshwari Nagar Bengaluru Karnataka 560060",
        "Outer Ring Road Yeshwanthpur Industrial Area Goraguntepalya Yeswanthpur Bengaluru Karnataka 560022",
        "60/2 Whitefield Main Rd Kamadhenu Nagar B Narayanapura Mahadevapura Bengaluru Karnataka 560016",
        "Hope Farm Circle 1079 ITPL Main Rd near KTM Showroom Prasanth Layout Bengaluru Karnataka 560066",
        "# 1043/105 Kodigehalli Bus Stop Hebbal Near Kodigehalli signal Bengaluru Karnataka 560092",
        "S.Y.No.39 & 40 Bommasandra Industrial Area Hosur Rd Electronic City Bengaluru Karnataka 560099",
        "Lakshmi Hyundai opp. to D-Mart Devanahalli Southegowdanahalli Karnataka 562110",
        "No 33/445 30/6G & 31/1 Hosur Rd Muneswara Nagar Roopena Agrahara Bommanahalli Bengaluru Karnataka 560068",
        "No. 122/1C Shankar Reddy Layout Outer Ring Rd Kalyan Nagar Bengaluru Karnataka 560043",
        "Sy.No 18 Kengeri Hobli 1B Mysore Rd next to Rajarajeshwari Arch Nayanda Halli Bengaluru Karnataka 560039",
        "Sy.No 102/3 Sulikunte Village Varthur-2 Sarjapur - Marathahalli Rd Dommasandra Post Bengaluru Karnataka 562125",
        "3 Industrial Suburb 2nd Stage Goraguntepalya Yeswanthpur Bengaluru Karnataka 560022",
        "2 Rd Number 2 Phase 2 Brookefield Bengaluru Karnataka 560066",
        "Banaswadi ward no 88 Service Road 88/364/51 Outer Ring Rd Banaswadi Bengaluru Karnataka 560043",
        "43 Krishna Rajendra Rd Tata Silk Farm Jayanagar Bengaluru Karnataka 560028",
        "Municipal No. 372/344/269 Sy. No. 69/5 NH 44 Bommanahalli Bengaluru Karnataka 560068",
        "Khata No 1129/23/4A/23/3 Ward No 01 Venkatala Habli Yelahanka Bengaluru Karnataka 560064",
        "No 2/3 Survey No 8 MES Road near Taj Vivanta Yeswanthpur Bengaluru Karnataka 560022",
        "No 27/2 Kanakapura Rd next to KSIT College Raghuvanahalli Bengaluru Karnataka 560062",
        "No 55 Hosur Rd next to Ozone Tech Park Kudlu Gate Hongasandra Bengaluru Karnataka 560068",
        "Raja Industrial Estate Yeswanthpur Bengaluru Karnataka 560022",
        "54 Sonnapanahalli Rd Yelahanka Bengaluru Karnataka 562157",
        "No 7A KR Puram Devasandra Main Rd Industrial Area Mahadevapura Bengaluru Karnataka 560048",
        "151 1 600/677 Bannerghatta Main Rd Opp IIMB Krishnaraju Layout Amalodbhavi Nagar Panduranga Nagar Bengaluru Karnataka 560076",
        "8/1 Hunsemaranahalli Next to Indian Oil Petrol Pump New Kempegowda International Airport Road North Taluk Bengaluru Karnataka 562157",
        "Indira Gandhi Housing Colony Arekere Bengaluru Karnataka 560076",
        "Binnyston Garden No 2 Magadi Main Rd Keshava Nagar Binnipete Bengaluru Karnataka 560023",
        "Site No 12 1st Cross Janakiram Layout Hennur Main Road Post Kalyan Nagar Bengaluru Karnataka 560043",
        "Y No. 49/8 9-10 Hosur Rd Aishwarya Crystal Layout Singasandra Bengaluru Karnataka 560100",
        "#16th D Main Rd HAL 2nd Stage Kodihalli Bengaluru Karnataka 560008",
        "No.102 1 Outer Ring Rd A Narayanapura Kamadhenu Nagar B Narayanapura Krishnarajapura Bengaluru Karnataka 560016",
        "No.79/2 city centre Building Hennur Bellary Outer Ring Road Hebbal village Subramani Nagar Kasaba Uttarahalli Hobli Bengaluru 560024",
        "No.102 1 Outer Ring Road Maruti Nagar B Narayanapura Mahadevapura Bengaluru Karnataka 560048",
        "Sy No 9/1 Marathalli Ring Rda Doddanekundi KR Puram Bengaluru Karnataka 560037",
    ]
    
//
//    override func viewDidLoad() {
//            super.viewDidLoad()
//
//            viewmapServiceCall()
//
//            mapView.mapType = .standard
//            mapView.showsUserLocation = true
//            mapView.delegate = self
//
//            // Set the initial region and center on Bengaluru
//            let initialLocation = CLLocation(latitude: 12.9716, longitude: 77.5946)
//            let regionRadius: CLLocationDistance = 10000
//            let coordinateRegion = MKCoordinateRegion(center: initialLocation.coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
//            mapView.setRegion(coordinateRegion, animated: true)
//
//            // Create and add annotations for showroom locations
//        let showroomLocations: [(latitude: Double, longitude: Double, title: String, subtitle: String, carBrand: String, brandLogoURL: String)] = [
//            (latitude: 12.90388366, longitude: 77.50926588, title: "Mandovi Motors", subtitle: "Maruti Suzuki", carBrand: "Maruti Suzuki", brandLogoURL: "https://ab-prod-container.s3.us-east-2.amazonaws.com/DealerApp/car_brand_logo/Maruti_2x.png"),
//            // Add more showroom locations here with the same tuple structure
//        ]
//
//
//
//            for location in showroomLocations {
//                let coordinate = CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)
//                let annotation = CustomAnnotation(coordinate: coordinate, title: location.title, subtitle: location.subtitle, carBrand: location.carBrand, brandLogoURL: location.brandLogoURL)
//                mapView.addAnnotation(annotation)
//            }
//        }
//
//        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
//            guard let annotation = annotation as? CustomAnnotation else {
//                return nil
//            }
//
//            let identifier = "CustomAnnotation"
//            var annotationView: MKAnnotationView
//
//            if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) {
//                annotationView = dequeuedView
//            } else {
//                annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: identifier)
//                annotationView.canShowCallout = true
//            }
//
//            // Load the brand logo image from the URL and set it as the marker icon
//            if let brandLogoURL = annotation.brandLogoURL, let url = URL(string: brandLogoURL) {
//                if let data = try? Data(contentsOf: url), let image = UIImage(data: data) {
//                    annotationView.image = image
//                }
//            }
//
//            return annotationView
//        }
//
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        navigationController?.setNavigationBarHidden(true, animated: animated)
//    }
//
//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(animated)
//        navigationController?.setNavigationBarHidden(false, animated: animated)
//    }
//
    @IBAction func backActionBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
//
//    func viewmapServiceCall() {
//        if !InternetReachable.ValidateInternet {
//            Message.NoInternetAlert(self)
//            return
//        }
//
//
//
//        let imei = UIDevice.current.clientID
//
//            self.view.StartLoading()
//
//        Webservice().call(cRequest: CRequest.getRequest(url: CUrls.BaseUrl, suffix: CUrls.newmobiledashboardmodule.get_ShowRoomDataForMap_getShowRoomData, method: .get, contentType: .urlencode, params: [:], headers: ["Authorization": "Bearer " ,"X-Device-Imei":imei,"Content-Type":"application/json"])) { (response, auth) in
//
//                self.view.StopLoading()
//        //    self.activityloader.isHidden = true
//
//            if auth {
//                sectionExpiredClass.ClearData(controller: self)
//            }
//            else {
//
//
//                switch response.result {
//
//                case .success(let jsonResponse):
//
//                    if jsonResponse.responseType.isSuccess {
//
//                        print("get_ShowRoomDataForMap_getShowRoomData:" + "\(jsonResponse.response)");
//
//                        let main = jsonResponse.response.dictionaryValue
//
//                        let ShowRoomData = main["ShowRoomData"]?.arrayValue
//
//                        ShowRoomData!.forEach({ (obj) in
//                            self.allmapslistarr.append(ShowRoomDataModelClass.init(data: obj))
//                        })
//                        for showroom in self.allmapslistarr {
//                                                let annotation = MKPointAnnotation()
//                                                annotation.coordinate = CLLocationCoordinate2D(latitude: showroom.Latitude, longitude: showroom.Longitude)
//                                                annotation.title = showroom.car_brand
//                                                annotation.subtitle = showroom.Showroom_name
//                                                self.mapView.addAnnotation(annotation)
//                                            }
//
//                    } else {
//
//                        if let code = response.response?.statusCode {
//                            if code == 401 || code == 403{
//                                sectionExpiredClass.ClearData(controller: self)
//
//                            }
//                        }
//
//                        print("post_dashBoardHome_homeTabService :" + "\(jsonResponse)")
//                        //                        self.view.ShowBlackTostWithText(message: jsonResponse.responseMessage, Interval: 2)
//                        self.view.ShowBlackTostWithText(message: jsonResponse.response["message"].stringValue, Interval: 3)
//
//                    }
//
//                    break
//                case .failure(let error):
//                    print(error.localizedDescription)
//                    //                    Message.SomethingWrongAlert(self)
//
//                    if let code = response.response?.statusCode {
//                        if code == 401 {
//
//                        }
//                    }
//
//                    break
//                }
//            }
//        }
//    }
//
//
//}
//
//
//class CustomAnnotation: NSObject, MKAnnotation {
//    var coordinate: CLLocationCoordinate2D
//    var title: String?
//    var subtitle: String?
//    var carBrand: String?
//    var brandLogoURL: String?
//
//    init(coordinate: CLLocationCoordinate2D, title: String?, subtitle: String?, carBrand: String?, brandLogoURL: String?) {
//        self.coordinate = coordinate
//        self.title = title
//        self.subtitle = subtitle
//        self.carBrand = carBrand
//        self.brandLogoURL = brandLogoURL
//        super.init()
//    }
    
    override func viewDidLoad() {
            super.viewDidLoad()

        
//        mapView.showsUserLocation = true
//                mapView.delegate = self
//                viewmapServiceCall()
//                // Set the initial region and center on Bengaluru
                let initialLocation = CLLocation(latitude: 12.9716, longitude: 77.5946)
                let regionRadius: CLLocationDistance = 10000
                let coordinateRegion = MKCoordinateRegion(center: initialLocation.coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
                mapView.setRegion(coordinateRegion, animated: true)
        
                mapView.delegate = self
                mapView.showsUserLocation = true
                mapView.register(MKMarkerAnnotationView.self, forAnnotationViewWithReuseIdentifier: MKMapViewDefaultClusterAnnotationViewReuseIdentifier)
            
                webView.navigationDelegate = self
        
        let camera = GMSCameraPosition.camera(withLatitude: 12.9716, longitude: 77.5946, zoom: 50.0)
        let mapView = GMSMapView.map(withFrame: .zero, camera: camera)
        self.googlempaView.mapType = .normal // or other map types like .satellite, .hybrid
        
        
          // viewMapServiceCall()
        viewmapServiceCall()
        }

        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            navigationController?.setNavigationBarHidden(true, animated: animated)
        }

        override func viewWillDisappear(_ animated: Bool) {
            super.viewWillDisappear(animated)
            navigationController?.setNavigationBarHidden(false, animated: animated)
        }
    

    

    
   
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            guard let annotation = annotation as? CustomAnnotation else {
                return nil
            }

            let identifier = "CustomAnnotation"
            var annotationView: MKAnnotationView

            if let existingAnnotationView = annotationViewMap[annotation] {
                annotationView = existingAnnotationView
            } else {
                annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                annotationView.canShowCallout = true
                annotationView.image = UIImage(named: "your_placeholder_image_name")

                annotationViewMap[annotation] = annotationView
            }

            return annotationView
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

                        let ShowRoomData = main["ShowRoomData"]?.arrayValue

                        ShowRoomData!.forEach({ (obj) in
                            self.allmapslistarr.append(ShowRoomDataModelClass.init(data: obj))
                        })


                        for showroom in self.allmapslistarr {
                                    let annotation = CustomAnnotation(
                                        coordinate: CLLocationCoordinate2D(latitude: showroom.Latitude, longitude: showroom.Longitude),
                                        title: showroom.car_brand,
                                        subtitle: showroom.Showroom_name,
                                        brandLogoURL: showroom.brand_logo
                                    )

                            self.allAnnotations.append(annotation)
                            self.mapView.addAnnotation(annotation)
                            self.loadImageForAnnotation(annotation)
                                }

                        var markerString = ""

                        for location in self.allmapslistarr {
                                    if let latitude = location.Latitude, let longitude = location.Longitude {
                                        // Construct the marker for each location
                                        markerString += "&markers=\(latitude),\(longitude)"
                                    }
                                }

                                if !markerString.isEmpty {
                                    let googleMapsURLString = "https://www.google.com/maps?q=loc:\(markerString)"

                                    if let url = URL(string: googleMapsURLString) {
                                        let request = URLRequest(url: url)
                                        self.webView.load(request)
                                    }
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
    
//    func viewMapServiceCall() {
//        if !InternetReachable.ValidateInternet {
//            Message.NoInternetAlert(self)
//            return
//        }
//
//        let imei = UIDevice.current.clientID
//        self.view.StartLoading()
//
//        Webservice().call(cRequest: CRequest.getRequest(url: CUrls.BaseUrl, suffix: CUrls.newmobiledashboardmodule.get_ShowRoomDataForMap_getShowRoomData, method: .get, contentType: .urlencode, params: [:], headers: ["Authorization": "Bearer ", "X-Device-Imei": imei, "Content-Type": "application/json"])) { (response, auth) in
//            self.view.StopLoading()
//
//            if auth {
//                sectionExpiredClass.ClearData(controller: self)
//            } else {
//
//                switch response.result {
//                case .success(let jsonResponse):
//                    if jsonResponse.responseType.isSuccess {
//                        print("get_ShowRoomDataForMap_getShowRoomData:" + "\(jsonResponse.response)")
//
//                        let main = jsonResponse.response.dictionaryValue
//                        let ShowRoomData = main["ShowRoomData"]?.arrayValue
//
//                            ShowRoomData!.forEach({ (obj) in
//                            self.allmapslistarr.append(ShowRoomDataModelClass.init(data: obj))
//                                })
//
//
//                        let query = self.alladdresslistarr.joined(separator: "+")
//
//                        // Ensure the query is properly encoded
//                        if let encodedQuery = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) {
//                            // Create the Google Maps URL with the encoded query parameter
//                            if let googleMapsURLString = "https://www.google.com/maps?q=\(encodedQuery)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) {
//                                // Open the Google Maps URL
//                                if let url = URL(string: googleMapsURLString) {
//                                    if UIApplication.shared.canOpenURL(url) {
//                                        UIApplication.shared.open(url, options: [:], completionHandler: nil)
//                                        print("Opened Google Maps for all addresses")
//                                    } else {
//                                        print("Unable to open Google Maps URL")
//                                    }
//                                } else {
//                                    print("Invalid URL")
//                                }
//                            }
//                        } else {
//                            print("Failed to encode query")
//                        }
//
//
//
//
//
//
//                    } else {
//                        if let code = response.response?.statusCode {
//                            if code == 401 || code == 403 {
//                                sectionExpiredClass.ClearData(controller: self)
//                            }
//                        }
//                        print("post_dashBoardHome_homeTabService :" + "\(jsonResponse)")
//                        self.view.ShowBlackTostWithText(message: jsonResponse.response["message"].stringValue, Interval: 3)
//                    }
//                    break
//                case .failure(let error):
//                    print(error.localizedDescription)
//                    if let code = response.response?.statusCode {
//                        if code == 401 {
//                            // Handle unauthorized case
//                        }
//                    }
//                    break
//                }
//            }
//        }
//    }

   
    
    
  
    
    func loadImageForAnnotation(_ annotation: CustomAnnotation) {
        guard let brandLogoURL = annotation.brandLogoURL, let url = URL(string: brandLogoURL) else {
            return
        }

        URLSession.shared.dataTask(with: url) { [weak self] (data, _, _) in
            if let data = data, let image = UIImage(data: data) {
                let resizedImage = self?.resizeImage(image, targetSize: CGSize(width: 30, height: 30))
                annotation.image = resizedImage
                DispatchQueue.main.async {
                    if let annotationView = self?.annotationViewMap[annotation] {
                        annotationView.image = resizedImage
                    }
                }
            }
        }.resume()
    }

    func resizeImage(_ image: UIImage?, targetSize: CGSize) -> UIImage? {
        guard let image = image else { return nil }

        UIGraphicsBeginImageContext(targetSize)
        image.draw(in: CGRect(origin: .zero, size: targetSize))

        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return newImage
    }

    
}





//class CustomAnnotation: NSObject, MKAnnotation {
//    var coordinate: CLLocationCoordinate2D
//    var title: String?
//    var subtitle: String?
//    var brandLogoURL: String?
//    var image: UIImage? // You can set a default image here if needed
//
//    init(coordinate: CLLocationCoordinate2D, title: String?, subtitle: String?, brandLogoURL: String?) {
//        self.coordinate = coordinate
//        self.title = title
//        self.subtitle = subtitle
//        self.brandLogoURL = brandLogoURL
//        super.init()
//    }
//
//    func loadImage(completion: @escaping (UIImage?) -> Void) {
//        if let brandLogoURL = brandLogoURL, let url = URL(string: brandLogoURL) {
//            URLSession.shared.dataTask(with: url) { (data, _, _) in
//                if let data = data, let image = UIImage(data: data) {
//                    completion(image)
//                } else {
//                    completion(nil)
//                }
//            }.resume()
//        } else {
//            completion(nil)
//        }
//    }
//}

//class CustomAnnotation: NSObject, MKAnnotation {
//    var coordinate: CLLocationCoordinate2D
//    var title: String?
//    var subtitle: String?
//    var brandLogoURL: String?
//    var image: UIImage? // You can set a default image here if needed
//    var annotationView: MKAnnotationView?
//    var identifier: String
//
//    init(coordinate: CLLocationCoordinate2D, title: String?, subtitle: String?, brandLogoURL: String?, identifier: String) {
//        self.coordinate = coordinate
//        self.title = title
//        self.subtitle = subtitle
//        self.brandLogoURL = brandLogoURL
//        self.identifier = identifier
//        super.init()
//    }
//
//    func loadImage(completion: @escaping (UIImage?) -> Void) {
//        if let brandLogoURL = brandLogoURL, let url = URL(string: brandLogoURL) {
//            URLSession.shared.dataTask(with: url) { [weak self] (data, _, _) in
//                if let data = data, let image = UIImage(data: data) {
//                    completion(image)
//                    // Set the image for the associated annotation view when the image is loaded
//                    self?.annotationView?.image = image
//                } else {
//                    completion(nil)
//                }
//            }.resume()
//        } else {
//            completion(nil)
//        }
//    }
//}


class CustomAnnotation: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    var brandLogoURL: String?
    var image: UIImage? // You can set a default image here if needed

    init(coordinate: CLLocationCoordinate2D, title: String?, subtitle: String?, brandLogoURL: String?) {
        self.coordinate = coordinate
        self.title = title
        self.subtitle = subtitle
        self.brandLogoURL = brandLogoURL
        super.init()
    }
}

