//
//  onlygooglempaPageVc.swift
//  wisedrivedashboard
//
//  Created by Maanas Kumar on 22/11/23.
//

import UIKit
import GoogleMaps
import Alamofire
import Highcharts

class onlygooglempaPageVc: UIViewController {
    
    @IBOutlet weak var mapView: GMSMapView!
    @IBOutlet weak var spidermap: HIChartView!
    @IBOutlet weak var connectBackView: UIView!
    @IBOutlet weak var connecttitleLabel: UILabel!
    @IBOutlet weak var allshowroomsdataCollectionView: UICollectionView!
    
    var allmapslistarr = [ShowRoomDataModelClass]()
    
    var allshowroomslistarr = [NewShowRoomDataModelClass]()
    
    var is_connected = "n"
    
    var uniqueCarBrands: [String] = []
    
    var brand_id = ""
    
    var distanceLabels: [UILabel] = []
    
//    var selectedBrand: String?
//
//        // Property to store showroom markers
//        var showroomMarkers = [String: [GMSMarker]]()
//
//    var brandPolylines = [String: GMSPolyline]()
//
//        // Property to store brand colors
//        var brandColors: [String: UIColor] = [
//            "Maruti Suzuki": UIColor.blue,
//            "Mahindra": UIColor.black,
//            "Ford": UIColor.yellow,
//            "Volkswagen": UIColor.lightGray,
//            "Tata": UIColor.white,
//            "Renault": UIColor.purple,
//            "Hyundai": UIColor.orange
//        ]

    

    override func viewDidLoad() {
        super.viewDidLoad()

        let camera = GMSCameraPosition.camera(withLatitude: 12.9716, longitude: 77.5946, zoom: 12.0)
                mapView.camera = camera

                // Add a marker for Bangalore
                let marker = GMSMarker()
                marker.position = CLLocationCoordinate2D(latitude: 12.9716, longitude: 77.5946)
                marker.title = "Bangalore"
                marker.snippet = "Karnataka, India"
                marker.map = mapView
        
//        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(handlePinchGesture(_:)))
//            mapView.addGestureRecognizer(pinchGesture)
//
//        mapView.isUserInteractionEnabled = true
        self.connectBackView.backgroundColor = UIColor.init(hexString: "f2f2f7")
        self.connecttitleLabel.textColor = UIColor.init(hexString: "252a40")
        
        showroomlistServiceCall()
        
        
    }
    
//    @objc func handlePinchGesture(_ gesture: UIPinchGestureRecognizer) {
//        if gesture.state == .changed {
//            let currentZoom = mapView.camera.zoom
//            var newZoom = currentZoom / Float(gesture.scale)
//
//            // Adjust the zoom range as needed
//            newZoom = max(min(newZoom, 21.0), 1.0)
//
//            let camera = GMSCameraPosition.camera(withLatitude: mapView.camera.target.latitude, longitude: mapView.camera.target.longitude, zoom: newZoom)
//            mapView.animate(to: camera)
//
//            // Reset the scale factor to 1.0 to avoid exponential zoom
//            gesture.scale = 1.0
//        }
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
    
    @IBAction func connectdisconnectActionBtn(_ sender: Any) {
        if self.is_connected == "n" {
            self.connectBackView.backgroundColor = UIColor.init(hexString: "252a40")
            self.connecttitleLabel.textColor = UIColor.init(hexString: "ffffff")
            self.is_connected = "y"
          //  self.connectshowMarkersOnMap()
            self.newconnectShowMarkersOnMap()
        //    self.connectShowMarkersOnMap()
        }else{
            self.connectBackView.backgroundColor = UIColor.init(hexString: "f2f2f7")
            self.connecttitleLabel.textColor = UIColor.init(hexString: "252a40")
            self.is_connected = "n"
            self.showMarkersOnMap()
        }
    }
    
    func showroomlistServiceCall() {
        if !InternetReachable.ValidateInternet {
            Message.NoInternetAlert(self)
            return
        }

        let imei = UIDevice.current.clientID

            self.view.StartLoading()

        Webservice().call(cRequest: CRequest.getRequest(url: CUrls.BaseUrl, suffix: CUrls.newmobiledashboardmodule.get_ShowRoomDataForMap_getShowRoomDataBrandWise, method: .get, contentType: .urlencode, params: [:], headers: ["Authorization": "Bearer " ,"X-Device-Imei":imei,"Content-Type":"application/json"])) { (response, auth) in

                self.view.StopLoading()

            if auth {
                sectionExpiredClass.ClearData(controller: self)
            }
            else {
                self.allshowroomslistarr.removeAll()

                switch response.result {

                case .success(let jsonResponse):

                    if jsonResponse.responseType.isSuccess {

                        print("get_ShowRoomDataForMap_getShowRoomDataBrandWise:" + "\(jsonResponse.response)");

                        let main = jsonResponse.response.dictionaryValue

                        let ShowRoomData = main["ShowRoomData"]?.arrayValue

                        ShowRoomData!.forEach({ (obj) in
                            self.allshowroomslistarr.append(NewShowRoomDataModelClass.init(data: obj))
                      //      self.uniqueCarBrands = Array(Set(self.allshowroomslistarr.map { $0.car_brand }))
                        })
                        self.allshowroomsdataCollectionView.reloadData()
                        self.viewmapServiceCall()

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
    
    
    func viewmapServiceCall() {
        if !InternetReachable.ValidateInternet {
            Message.NoInternetAlert(self)
            return
        }



        let imei = UIDevice.current.clientID

            self.view.StartLoading()

        Webservice().call(cRequest: CRequest.getRequest(url: CUrls.BaseUrl, suffix: CUrls.newmobiledashboardmodule.get_ShowRoomDataForMap_getShowRoomData, method: .get, contentType: .urlencode, params: ["brandId":self.brand_id], headers: ["Authorization": "Bearer " ,"X-Device-Imei":imei,"Content-Type":"application/json"])) { (response, auth) in

                self.view.StopLoading()

            if auth {
                sectionExpiredClass.ClearData(controller: self)
            }
            else {
                self.allmapslistarr.removeAll()

                switch response.result {

                case .success(let jsonResponse):

                    if jsonResponse.responseType.isSuccess {

                        print("get_ShowRoomDataForMap_getShowRoomData:" + "\(jsonResponse.response)");

                        let main = jsonResponse.response.dictionaryValue

                        let ShowRoomData = main["ShowRoomData"]?.arrayValue

                        ShowRoomData!.forEach({ (obj) in
                            self.allmapslistarr.append(ShowRoomDataModelClass.init(data: obj))
                        })
                        if self.brand_id == "" {
                            self.showMarkersOnMap()
                        }else{
                         //   self.connectshowMarkersOnMap()
                            self.newconnectShowMarkersOnMap()
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
    
    // Inside your view controller
    // Inside your view controller
    // Inside your view controller
    // Inside your view controller
    func showMarkersOnMap() {
        mapView.clear() // Clear existing markers

        for showroomDataModel in allmapslistarr {
            // Convert the Latitude and Longitude strings to Doubles
            let latitude = showroomDataModel.Latitude
            let longitude = showroomDataModel.Longitude

            // Create a marker with custom icon
            let marker = GMSMarker()
            marker.position = CLLocationCoordinate2D(latitude: latitude ?? 0.0, longitude: longitude ?? 0.0)
            marker.title = showroomDataModel.Showroom_name
            marker.snippet = showroomDataModel.location

            // Set custom marker icon using the brand logo URL
            if let brandLogoURL = URL(string: showroomDataModel.brand_logo) {
                // Download the brand logo image asynchronously
                DispatchQueue.global().async {
                    if let data = try? Data(contentsOf: brandLogoURL),
                       let brandLogo = UIImage(data: data) {
                        // Resize the image if needed
                        let resizedBrandLogo = self.resizeImage(brandLogo, targetSize: CGSize(width: 30, height: 30))

                        // Set the resized brand logo as the marker icon on the main thread
                        DispatchQueue.main.async {
                            marker.icon = resizedBrandLogo
                            marker.map = self.mapView
                        }
                    }
                }
            }
        }
    }
    
    
//    func newconnectShowMarkersOnMap() {
//        mapView.clear() // Clear existing markers
//
//        var path = GMSMutablePath() // Create a mutable path to store the polyline points
//
//        for (index, showroomDataModel) in allmapslistarr.enumerated() {
//            // Convert the Latitude and Longitude strings to Doubles
//            let latitude = showroomDataModel.Latitude ?? 0.0
//            let longitude = showroomDataModel.Longitude ?? 0.0
//
//            // Create a marker with custom icon
//            let marker = GMSMarker()
//            marker.position = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
//            marker.title = showroomDataModel.Showroom_name
//            marker.snippet = showroomDataModel.location
//            marker.map = mapView
//
//            // Add the marker position to the path
//            path.add(CLLocationCoordinate2D(latitude: latitude, longitude: longitude))
//
//            // Set custom marker icon using the brand logo URL
//            if let brandLogoURL = URL(string: showroomDataModel.brand_logo) {
//                // Download the brand logo image asynchronously
//                DispatchQueue.global().async {
//                    if let data = try? Data(contentsOf: brandLogoURL),
//                       let brandLogo = UIImage(data: data) {
//                        // Resize the image if needed
//                        let resizedBrandLogo = self.resizeImage(brandLogo, targetSize: CGSize(width: 30, height: 30))
//
//                        // Set the resized brand logo as the marker icon on the main thread
//                        DispatchQueue.main.async {
//                            marker.icon = resizedBrandLogo
//                        }
//                    }
//                }
//            }
//        }
//
//        // Draw polyline connecting all showrooms
//        if allmapslistarr.count > 1 {
//            let firstShowroom = allmapslistarr.first!
//            let firstLatitude = firstShowroom.Latitude ?? 0.0
//            let firstLongitude = firstShowroom.Longitude ?? 0.0
//
//            path.add(CLLocationCoordinate2D(latitude: firstLatitude, longitude: firstLongitude))
//
//            let lastShowroom = allmapslistarr.last!
//            let lastLatitude = lastShowroom.Latitude ?? 0.0
//            let lastLongitude = lastShowroom.Longitude ?? 0.0
//
//            path.add(CLLocationCoordinate2D(latitude: lastLatitude, longitude: lastLongitude))
//
//            let polyline = GMSPolyline(path: path)
//            polyline.strokeColor = UIColor.blue
//            polyline.strokeWidth = 2.0
//            polyline.map = mapView
//        }
//    }
    
    
    
    
    func newconnectShowMarkersOnMap() {
        mapView.clear() // Clear existing markers

        var path = GMSMutablePath() // Create a mutable path to store the polyline points

        var totalDistance: Double = 0.0 // Variable to store the total distance

        for (index, showroomDataModel) in allmapslistarr.enumerated() {
            // Convert the Latitude and Longitude strings to Doubles
            let latitude = showroomDataModel.Latitude ?? 0.0
            let longitude = showroomDataModel.Longitude ?? 0.0

            // Create a marker with custom icon
            let marker = GMSMarker()
            marker.position = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
            marker.title = showroomDataModel.Showroom_name
            marker.snippet = showroomDataModel.location
            marker.map = mapView

            // Add the marker position to the path
            path.add(CLLocationCoordinate2D(latitude: latitude, longitude: longitude))

            // Set custom marker icon using the brand logo URL
            if let brandLogoURL = URL(string: showroomDataModel.brand_logo) {
                // Download the brand logo image asynchronously
                DispatchQueue.global().async {
                    if let data = try? Data(contentsOf: brandLogoURL),
                       let brandLogo = UIImage(data: data) {
                        // Resize the image if needed
                        let resizedBrandLogo = self.resizeImage(brandLogo, targetSize: CGSize(width: 30, height: 30))

                        // Set the resized brand logo as the marker icon on the main thread
                        DispatchQueue.main.async {
                            marker.icon = resizedBrandLogo
                        }
                    }
                }
            }

        }

//        // Draw polyline connecting all showrooms
////        if allmapslistarr.count > 1 {
////            let firstShowroom = allmapslistarr.first!
////            let firstLatitude = firstShowroom.Latitude ?? 0.0
////            let firstLongitude = firstShowroom.Longitude ?? 0.0
////
////            path.add(CLLocationCoordinate2D(latitude: firstLatitude, longitude: firstLongitude))
////
////            let lastShowroom = allmapslistarr.last!
////            let lastLatitude = lastShowroom.Latitude ?? 0.0
////            let lastLongitude = lastShowroom.Longitude ?? 0.0
////
////            path.add(CLLocationCoordinate2D(latitude: lastLatitude, longitude: lastLongitude))
////
////            let polyline = GMSPolyline(path: path)
////            polyline.strokeColor = UIColor.blue
////            polyline.strokeWidth = 2.0
////            polyline.map = mapView
////
////            // Display the total distance on the map
//////            let totalDistanceText = String(format: "Total Distance: %.2f km", totalDistance)
//////            self.showDistanceLabel(position: CLLocationCoordinate2D(latitude: lastLatitude, longitude: lastLongitude), text: totalDistanceText)
////        }
//
//        // ...
//
//        // ...
//
//        // ...
//
//        // Draw polyline connecting all showrooms
//        if allmapslistarr.count > 1 {
//            for index in 1..<allmapslistarr.count {
//                let previousShowroom = allmapslistarr[index - 1]
//                let showroom = allmapslistarr[index]
//
//                let previousLatitude = previousShowroom.Latitude ?? 0.0
//                let previousLongitude = previousShowroom.Longitude ?? 0.0
//                let latitude = showroom.Latitude ?? 0.0
//                let longitude = showroom.Longitude ?? 0.0
//
//                // Calculate the distance between consecutive showrooms
//                let distance = calculateDistance(lat1: previousLatitude, lon1: previousLongitude, lat2: latitude, lon2: longitude)
//                let distanceText = String(format: "%.2f km", distance)
//
//                // Calculate the midpoint between consecutive showrooms
//                let midLatitude = (previousLatitude + latitude) / 2
//                let midLongitude = (previousLongitude + longitude) / 2
//                let midPosition = CLLocationCoordinate2D(latitude: midLatitude, longitude: midLongitude)
//
//                // Show the distance label below the polyline and at the midpoint
//                self.showDistanceLabel(position: midPosition, text: distanceText)
//
//                // Add the segment to the polyline path
//                path.add(CLLocationCoordinate2D(latitude: latitude, longitude: longitude))
//
//                // Draw polyline segment
//                let polyline = GMSPolyline(path: path)
//                polyline.strokeColor = UIColor.blue
//                polyline.strokeWidth = 2.0
//                polyline.map = mapView
//            }
//
//            // Connect the last showroom to the first showroom
//            let firstShowroom = allmapslistarr.first!
//            let firstLatitude = firstShowroom.Latitude ?? 0.0
//            let firstLongitude = firstShowroom.Longitude ?? 0.0
//
//            path.add(CLLocationCoordinate2D(latitude: firstLatitude, longitude: firstLongitude))
//
//            let lastShowroom = allmapslistarr.last!
//            let lastLatitude = lastShowroom.Latitude ?? 0.0
//            let lastLongitude = lastShowroom.Longitude ?? 0.0
//
//            path.add(CLLocationCoordinate2D(latitude: lastLatitude, longitude: lastLongitude))
//
//            // Calculate the midpoint between the last and first showrooms
//            let midLatitude = (firstLatitude + lastLatitude) / 2
//            let midLongitude = (firstLongitude + lastLongitude) / 2
//            let midPosition = CLLocationCoordinate2D(latitude: midLatitude, longitude: midLongitude)
//
//            // Draw the polyline connecting the last showroom to the first showroom
//            let polyline = GMSPolyline(path: path)
//            polyline.strokeColor = UIColor.blue
//            polyline.strokeWidth = 2.0
//            polyline.map = mapView
//
//            // Show the distance label below the polyline and at the midpoint
//            let totalDistance = calculateDistance(lat1: firstLatitude, lon1: firstLongitude, lat2: lastLatitude, lon2: lastLongitude)
//            let totalDistanceText = String(format: "%.2f km", totalDistance)
//            self.showDistanceLabel(position: midPosition, text: totalDistanceText)
//        }
        
        // ...

        // Draw polyline connecting all showrooms
        // ...

        // Draw polyline connecting all showrooms
        if allmapslistarr.count > 1 {
            for index in 0..<allmapslistarr.count {
                let showroom = allmapslistarr[index]
                let latitude = showroom.Latitude ?? 0.0
                let longitude = showroom.Longitude ?? 0.0

                // Add the showroom position to the path
                path.add(CLLocationCoordinate2D(latitude: latitude, longitude: longitude))
 
                // Draw polyline segment if it's not the last showroom
                if index < allmapslistarr.count - 1 {
                    let nextShowroom = allmapslistarr[index + 1]
                    let nextLatitude = nextShowroom.Latitude ?? 0.0
                    let nextLongitude = nextShowroom.Longitude ?? 0.0

                    // Add the next showroom position to the path
                    path.add(CLLocationCoordinate2D(latitude: nextLatitude, longitude: nextLongitude))

                    // Draw polyline segment
                    let polyline = GMSPolyline(path: path)
                    polyline.strokeColor = UIColor.blue
                    polyline.strokeWidth = 2.0
                    polyline.map = mapView

                    // Clear the path for the next segment
                    path = GMSMutablePath()

                    // Calculate the distance between consecutive showrooms
                    let distance = calculateDistance(lat1: latitude, lon1: longitude, lat2: nextLatitude, lon2: nextLongitude)
                    let distanceText = String(format: "%.2f km", distance)

                    // Calculate the midpoint between consecutive showrooms
                    let midLatitude = (latitude + nextLatitude) / 2
                    let midLongitude = (longitude + nextLongitude) / 2
                    let midPosition = CLLocationCoordinate2D(latitude: midLatitude, longitude: midLongitude)

                    // Show the distance label below the polyline and at the midpoint
                    self.showDistanceLabel(position: midPosition, text: distanceText)
                }
            }

            // Connect the last showroom to the first showroom
            if let firstShowroom = allmapslistarr.first, let lastShowroom = allmapslistarr.last {
                let firstLatitude = firstShowroom.Latitude ?? 0.0
                let firstLongitude = firstShowroom.Longitude ?? 0.0
                let lastLatitude = lastShowroom.Latitude ?? 0.0
                let lastLongitude = lastShowroom.Longitude ?? 0.0

                // Add the last showroom position to the path
                path.add(CLLocationCoordinate2D(latitude: lastLatitude, longitude: lastLongitude))

                // Draw polyline segment for the connection from the last to the first showroom
                let polyline = GMSPolyline(path: path)
                polyline.strokeColor = UIColor.blue
                polyline.strokeWidth = 2.0
                polyline.map = mapView

                // Calculate the distance between the last and first showrooms
                let distance = calculateDistance(lat1: lastLatitude, lon1: lastLongitude, lat2: firstLatitude, lon2: firstLongitude)
                let distanceText = String(format: "%.2f km", distance)

                // Calculate the midpoint between the last and first showrooms
                let midLatitude = (lastLatitude + firstLatitude) / 2
                let midLongitude = (lastLongitude + firstLongitude) / 2
                let midPosition = CLLocationCoordinate2D(latitude: midLatitude, longitude: midLongitude)

                // Show the distance label below the polyline and at the midpoint
                self.showDistanceLabel(position: midPosition, text: distanceText)
            }
        }



        // ...



        // ...

        
        for index in 1..<allmapslistarr.count {
                let previousShowroom = allmapslistarr[index - 1]
                let showroom = allmapslistarr[index]

                let previousLatitude = previousShowroom.Latitude ?? 0.0
                let previousLongitude = previousShowroom.Longitude ?? 0.0
                let latitude = showroom.Latitude ?? 0.0
                let longitude = showroom.Longitude ?? 0.0

                // Calculate the midpoint between consecutive showrooms
                let midLatitude = (previousLatitude + latitude) / 2
                let midLongitude = (previousLongitude + longitude) / 2
                let midPosition = CLLocationCoordinate2D(latitude: midLatitude, longitude: midLongitude)

                // Calculate distance between consecutive showrooms
                let distance = calculateDistance(lat1: previousLatitude, lon1: previousLongitude, lat2: latitude, lon2: longitude)
                let distanceText = String(format: "%.2f km", distance)

                // Show the distance label at the midpoint
                self.showDistanceLabel(position: midPosition, text: distanceText)
            }
        
    }

    // Function to calculate the distance between two sets of coordinates using the Haversine formula
    func calculateDistance(lat1: Double, lon1: Double, lat2: Double, lon2: Double) -> Double {
        let R = 6371.0 // Earth radius in kilometers

        let dLat = (lat2 - lat1).toRadians()
        let dLon = (lon2 - lon1).toRadians()

        let a = sin(dLat / 2) * sin(dLat / 2) + cos(lat1.toRadians()) * cos(lat2.toRadians()) * sin(dLon / 2) * sin(dLon / 2)
        let c = 2 * atan2(sqrt(a), sqrt(1 - a))

        return R * c
    }

    // Extension to convert degrees to radians
  

    // Function to display distance label on the map
    func showDistanceLabel(position: CLLocationCoordinate2D, text: String) {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 150, height: 30))
        label.text = text
        label.textColor = UIColor.blue
        label.font = UIFont(name: "Gilroy-SemiBold", size: 18.0)
        label.layer.cornerRadius = 5.0
        label.layer.masksToBounds = true

        let marker = GMSMarker(position: position)
        marker.iconView = label
        marker.map = mapView
    }

    
    
    
    
    
    
    
    
    
    
    
    



////    func connectshowMarkersOnMap() {
////        mapView.clear() // Clear existing markers and polylines
////
////        // Create a dictionary to store showroom names and corresponding markers
////        var showroomMarkers = [String: [GMSMarker]]()
////
////        // Create a dictionary to map each brand to a color
////        var brandColors: [String: UIColor] = [
////            "Maruti Suzuki": UIColor.blue,
////            "Mahindra": UIColor.black,
////            "Ford": UIColor.yellow,
////            "Volkswagen": UIColor.lightGray,
////            "Tata": UIColor.red,
////            "Renault": UIColor.purple,
////            "Hyundai": UIColor.orange
////        ]
////
////        for showroomDataModel in allmapslistarr {
////            // Convert the Latitude and Longitude strings to Doubles
////            let latitude = showroomDataModel.Latitude
////            let longitude = showroomDataModel.Longitude
////
////            // Create a marker with a custom icon
////            let marker = GMSMarker()
////            marker.position = CLLocationCoordinate2D(latitude: latitude ?? 0.0, longitude: longitude ?? 0.0)
////            marker.title = showroomDataModel.Showroom_name
////            marker.snippet = showroomDataModel.location
////
////            // Set the custom marker icon using the brand logo URL
////            if let brandLogoURL = URL(string: showroomDataModel.brand_logo),
////               let brandName = showroomDataModel.car_brand {
////                // Download the brand logo image asynchronously
////                DispatchQueue.global().async {
////                    if let data = try? Data(contentsOf: brandLogoURL),
////                       let brandLogo = UIImage(data: data) {
////                        // Resize the image if needed
////                        let resizedBrandLogo = self.resizeImage(brandLogo, targetSize: CGSize(width: 30, height: 30))
////
////                        // Set the resized brand logo as the marker icon on the main thread
////                        DispatchQueue.main.async {
////                            marker.icon = resizedBrandLogo
////                            marker.map = self.mapView
////
////                            // Add the marker to the dictionary using the showroom name as the key
////                            if showroomMarkers[brandName] == nil {
////                                showroomMarkers[brandName] = [GMSMarker]()
////                            }
////                            showroomMarkers[brandName]?.append(marker)
////
////                            // Check if there are multiple markers for the same showroom
////                            if let markers = showroomMarkers[brandName], markers.count > 1 {
////                                // Create a polyline to connect the markers
////                                let polyline = GMSPolyline()
////
////                                // Create a new mutable path
////                                let path = GMSMutablePath()
////
////                                for connectedMarker in markers {
////                                    // Add each coordinate to the mutable path
////                                    path.add(connectedMarker.position)
////                                }
////
////                                // Add the first coordinate again to complete the loop
////                                if let firstMarker = markers.first {
////                                    path.add(firstMarker.position)
////                                }
////
////                                // Assign the mutable path to the polyline
////                                polyline.path = path
////
////                                // Use the brand name to determine the color
////                                if let brandColor = brandColors[brandName] {
////                                    polyline.strokeColor = brandColor
////                                } else {
////                                    // Default color if the brand is not in the dictionary
////                                    polyline.strokeColor = UIColor.gray
////                                }
////
////                                polyline.strokeWidth = 2.0
////                                polyline.map = self.mapView
////                            }
////                        }
////                    }
////                }
////            }
////        }
////    }
//
//
//    func newconnectShowMarkersOnMap() {
//        mapView.clear() // Clear existing markers and polylines
//        removeDistanceLabels()
//        // Create a dictionary to store showroom names and corresponding markers
//        var showroomMarkers = [String: [GMSMarker]]()
//
//        // Create a dictionary to map each brand to a color
//        var brandColors: [String: UIColor] = [
//            "Maruti Suzuki": UIColor.blue,
//            "Mahindra": UIColor.black,
//            "Ford": UIColor.yellow,
//            "Volkswagen": UIColor.lightGray,
//            "Tata": UIColor.red,
//            "Renault": UIColor.purple,
//            "Hyundai": UIColor.orange
//        ]
//
//        for showroomDataModel in allmapslistarr {
//            // Convert the Latitude and Longitude strings to Doubles
//            let latitude = showroomDataModel.Latitude
//            let longitude = showroomDataModel.Longitude
//
//            // Create a marker with a custom icon
//            let marker = GMSMarker()
//            marker.position = CLLocationCoordinate2D(latitude: latitude ?? 0.0, longitude: longitude ?? 0.0)
//            marker.title = showroomDataModel.Showroom_name
//            marker.snippet = showroomDataModel.location
//
//            // Set the custom marker icon using the brand logo URL
//            if let brandLogoURL = URL(string: showroomDataModel.brand_logo),
//               let brandName = showroomDataModel.car_brand {
//                // Download the brand logo image asynchronously
//                DispatchQueue.global().async {
//                    if let data = try? Data(contentsOf: brandLogoURL),
//                       let brandLogo = UIImage(data: data) {
//                        // Resize the image if needed
//                        let resizedBrandLogo = self.resizeImage(brandLogo, targetSize: CGSize(width: 30, height: 30))
//
//                        // Set the resized brand logo as the marker icon on the main thread
//                        DispatchQueue.main.async {
//                            marker.icon = resizedBrandLogo
//                            marker.map = self.mapView
//
//                            // Add the marker to the dictionary using the showroom name as the key
//                            if showroomMarkers[brandName] == nil {
//                                showroomMarkers[brandName] = [GMSMarker]()
//                            }
//                            showroomMarkers[brandName]?.append(marker)
//
//                            // Check if there are multiple markers for the same showroom
//                            if let markers = showroomMarkers[brandName], markers.count > 1 {
//                                // Create polylines and display distances for each consecutive pair
//                                for i in 0..<markers.count - 1 {
//                                    let polyline = GMSPolyline()
//
//                                    let path = GMSMutablePath()
//                                    path.add(markers[i].position)
//                                    path.add(markers[i + 1].position)
//
//                                    polyline.path = path
//
//                                    if let brandColor = brandColors[brandName] {
//                                        polyline.strokeColor = brandColor
//                                    } else {
//                                        polyline.strokeColor = UIColor.gray
//                                    }
//
//                                    polyline.strokeWidth = 2.0
//                                    polyline.map = self.mapView
//
//                                    // Calculate and display the distance for the pair
//                                    let distance = self.calculateDistanceBetweenMarkers([markers[i], markers[i + 1]])
//                                    self.addDistanceLabel(distance, polyline: polyline)
//                                }
//                            }
//                        }
//                    }
//                }
//            }
//        }
//    }
//
//    func calculateDistanceBetweenMarkers(_ markers: [GMSMarker]) -> CLLocationDistance {
//        var totalDistance: CLLocationDistance = 0.0
//
//        for i in 0..<markers.count - 1 {
//            let coordinate1 = markers[i].position
//            let coordinate2 = markers[i + 1].position
//
//            let location1 = CLLocation(latitude: coordinate1.latitude, longitude: coordinate1.longitude)
//            let location2 = CLLocation(latitude: coordinate2.latitude, longitude: coordinate2.longitude)
//
//            totalDistance += location1.distance(from: location2)
//        }
//
//        return totalDistance
//    }
//
//    func addDistanceLabel(_ distance: CLLocationDistance, polyline: GMSPolyline) {
//        // Get the coordinates of the start and end points of the polyline
//        guard let startPoint = polyline.path?.coordinate(at: 0),
//              let endPoint = polyline.path?.coordinate(at: UInt(polyline.path!.count() - 1)) else {
//            return
//        }
//
//        // Calculate the midpoint between the start and end points
//        let midPoint = CLLocationCoordinate2D(
//            latitude: (startPoint.latitude + endPoint.latitude) / 2,
//            longitude: (startPoint.longitude + endPoint.longitude) / 2
//        )
//
//        // Create a label and position it below the polyline
//        let label = UILabel()
//        label.text = String(format: "%.2f km", distance / 1000.0)
//        label.textColor = UIColor.black
//        label.font = UIFont(name: "Gilroy-SemiBold", size: 18.0)
//        label.sizeToFit()
//
//        // Calculate the slope of the line
//        let slope = (endPoint.latitude - startPoint.latitude) / (endPoint.longitude - startPoint.longitude)
//
//        // Calculate the angle of rotation
//        let angle = atan(slope)
//
//        // Set the label position below the polyline with an offset
//        let offset: CGFloat = 15.0 // Adjust this value to change the vertical offset
//        let labelPosition = self.mapView.projection.point(for: midPoint)
//        let xOffset = labelPosition.x - offset * sin(angle)
//        let yOffset = labelPosition.y + offset * cos(angle)
//
//        label.center = CGPoint(x: xOffset, y: yOffset)
//
//        // Rotate the label to match the line's slope
//        label.transform = CGAffineTransform(rotationAngle: angle)
//
//        // Add the label to the map view
//        self.mapView.addSubview(label)
//    }
//
//
//    func removeDistanceLabels() {
//        for label in distanceLabels {
//            label.removeFromSuperview()
//        }
//        // Clear the array
//        distanceLabels.removeAll()
//    }



    
    
    
    
    
    
    
    
    
//    func connectShowMarkersOnMap() {
//        mapView.clear() // Clear existing markers and polylines
//
//        // Create a dictionary to store showroom names and corresponding markers
//        var showroomMarkers = [String: [GMSMarker]]()
//
//        // Create a dictionary to map each brand to a color
//        var brandColors: [String: UIColor] = [
//            "Maruti Suzuki": UIColor.blue,
//            "Mahindra": UIColor.black,
//            "Ford": UIColor.yellow,
//            "Volkswagen": UIColor.lightGray,
//            "Tata": UIColor.red,
//            "Renault": UIColor.purple,
//            "Hyundai": UIColor.orange
//        ]
//
//        for showroomDataModel in allmapslistarr {
//            // Convert the Latitude and Longitude strings to Doubles
//            let latitude = showroomDataModel.Latitude
//            let longitude = showroomDataModel.Longitude
//
//            // Create a marker with a custom icon
//            let marker = GMSMarker()
//            marker.position = CLLocationCoordinate2D(latitude: latitude ?? 0.0, longitude: longitude ?? 0.0)
//            marker.title = showroomDataModel.Showroom_name
//            marker.snippet = showroomDataModel.location
//
//            // Set the custom marker icon using the brand logo URL
//            if let brandLogoURL = URL(string: showroomDataModel.brand_logo),
//               let brandName = showroomDataModel.car_brand {
//                // Download the brand logo image asynchronously
//                DispatchQueue.global().async {
//                    if let data = try? Data(contentsOf: brandLogoURL),
//                       let brandLogo = UIImage(data: data) {
//                        // Resize the image if needed
//                        let resizedBrandLogo = self.resizeImage(brandLogo, targetSize: CGSize(width: 30, height: 30))
//
//                        // Set the resized brand logo as the marker icon on the main thread
//                        DispatchQueue.main.async {
//                            marker.icon = resizedBrandLogo
//                            marker.map = self.mapView
//
//                            // Add the marker to the dictionary using the showroom name as the key
//                            if showroomMarkers[brandName] == nil {
//                                showroomMarkers[brandName] = [GMSMarker]()
//                            }
//                            showroomMarkers[brandName]?.append(marker)
//
//                            // Check if there are multiple markers for the same showroom
//                            if let markers = showroomMarkers[brandName], markers.count > 1 {
//                                // Create a polyline to connect the markers
//                                let polyline = GMSPolyline()
//
//                                // Create a new mutable path
//                                let path = GMSMutablePath()
//
//                                for connectedMarker in markers {
//                                    // Add each coordinate to the mutable path
//                                    path.add(connectedMarker.position)
//                                }
//
//                                // Add the first coordinate again to complete the loop
//                                if let firstMarker = markers.first {
//                                    path.add(firstMarker.position)
//                                }
//
//                                // Assign the mutable path to the polyline
//                                polyline.path = path
//
//                                // Use the brand name to determine the color
//                                if let brandColor = brandColors[brandName] {
//                                    polyline.strokeColor = brandColor
//                                } else {
//                                    // Default color if the brand is not in the dictionary
//                                    polyline.strokeColor = UIColor.gray
//                                }
//
//                                polyline.strokeWidth = 2.0
//                                polyline.map = self.mapView
//
//                                // Display the total distance above the polyline
//                                let totalDistance = self.calculateTotalDistance(for: markers)
//                                let distanceLabel = UILabel()
//                                distanceLabel.text = String(format: "%.2f km", totalDistance / 1000)
//                                distanceLabel.textColor = .black
//                                distanceLabel.backgroundColor = .white
//                                distanceLabel.sizeToFit()
//
//                                // Position the label at the midpoint of the polyline
//                                let midpointIndex = markers.count / 2
//                                let midpointCoordinate = markers[midpointIndex].position
//                                let midpointPoint = self.mapView.projection.point(for: midpointCoordinate)
//                                distanceLabel.center = CGPoint(x: midpointPoint.x, y: midpointPoint.y - 20) // Adjust the y-coordinate as needed
//
//                                self.mapView.addSubview(distanceLabel)
//                            }
//                        }
//                    }
//                }
//            }
//        }
//    }
//
//    func calculateTotalDistance(for markers: [GMSMarker]) -> CLLocationDistance {
//        var totalDistance: CLLocationDistance = 0.0
//
//        for index in 0..<markers.count - 1 {
//            let currentLocation = CLLocation(latitude: markers[index].position.latitude, longitude: markers[index].position.longitude)
//            let nextLocation = CLLocation(latitude: markers[index + 1].position.latitude, longitude: markers[index + 1].position.longitude)
//            let distance = currentLocation.distance(from: nextLocation)
//            totalDistance += distance
//        }
//
//        return totalDistance
//    }

    
    // Declare a property to store the currently selected brand
  

    // Modify the showMarkersOnMap function
   


    // Helper function to resize the image
    func resizeImage(_ image: UIImage, targetSize: CGSize) -> UIImage {
        let size = image.size

        let widthRatio  = targetSize.width  / size.width
        let heightRatio = targetSize.height / size.height

        let newSize: CGSize
        if widthRatio > heightRatio {
            newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
        } else {
            newSize = CGSize(width: size.width * widthRatio,  height: size.height * widthRatio)
        }

        let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)

        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        image.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return newImage ?? UIImage() // Return the resized image or an empty UIImage if resizing fails
    }


}

extension onlygooglempaPageVc: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {


    func numberOfSections(in collectionView: UICollectionView) -> Int {
            return 1
        }

        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "detailsofshowroomscollectioncell", for: indexPath) as! detailsofshowroomscollectioncell

            let showroom = allshowroomslistarr[indexPath.row]
                    cell.nameofshowroomLabel.text = showroom.car_brand
            if showroom.is_selected {
                        cell.showroombackView.backgroundColor = UIColor(hexString: "E9F0FA")
                        cell.nameofshowroomLabel.textColor = UIColor(hexString: "252a40")
                    } else {
                        cell.showroombackView.backgroundColor = UIColor(hexString: "f2f2f7")
                        cell.nameofshowroomLabel.textColor = .lightGray
                    }

            cell.htOfCell.constant = 45
            // Add your styling logic here...

            cell.selectshowroomBtn.tag = indexPath.row
            cell.selectshowroomBtn.addTarget(self, action: #selector(selectshowroomBtnAction(sender:)), for: UIControl.Event.touchUpInside)

            return cell
        }

        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            // Get the count of unique car brand names
            let uniqueCarBrandsCount = Set(allshowroomslistarr.map { $0.car_brand }).count
            return uniqueCarBrandsCount
        }

    
    @objc func selectshowroomBtnAction(sender: UIButton) {
        let selectedIndex = sender.tag

        // Toggle the isSelected property for the selected car brand
        allshowroomslistarr[selectedIndex].is_selected.toggle()

        // Deselect all other items if the selected item is now selected
        if allshowroomslistarr[selectedIndex].is_selected {
            for n in 0..<allshowroomslistarr.count {
                if sender.tag != n {
                    allshowroomslistarr[n].is_selected = false
                }
            }

            print("Selected: \(String(describing: allshowroomslistarr[selectedIndex].brand_id))")
            self.brand_id = String(self.allshowroomslistarr[selectedIndex].brand_id)
        } else {
            print("Unselected: \(String(describing: allshowroomslistarr[selectedIndex].brand_id))")
            self.brand_id = ""
        }

        // Reload the entire collection view to reflect the changes
        self.allshowroomsdataCollectionView.reloadData()

        // Perform any other operations, such as service call, after reloading the collection view
        self.viewmapServiceCall()
    }




   }

class detailsofshowroomscollectioncell : UICollectionViewCell {
    @IBOutlet weak var nameofshowroomLabel: UILabel!
    @IBOutlet weak var htOfCell: NSLayoutConstraint!
    @IBOutlet weak var showroombackView: UIView!
    @IBOutlet weak var selectshowroomBtn: UIButton!
    
}

extension Double {
    func toRadians() -> Double {
        return self * .pi / 180.0
    }
}
