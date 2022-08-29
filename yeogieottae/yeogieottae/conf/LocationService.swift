//
//  LocationService.swift
//  yeogieottae
//
//  Created by 김재경 on 2022/08/29.
//

import Foundation
import CoreLocation

final class LocationService: NSObject, ObservableObject {
	@Published var location: CLLocation?
	private let locationManager = CLLocationManager()
	
	override init() {
		super.init()
		locationManager.desiredAccuracy = kCLLocationAccuracyBest
		locationManager.distanceFilter = kCLDistanceFilterNone
		locationManager.requestWhenInUseAuthorization()
		locationManager.startUpdatingHeading()
		locationManager.delegate = self
	}
}

extension LocationService: CLLocationManagerDelegate {
	/// 새 위치 업데이트 수신 함수
	/// 위치를 Array로 수신. 마지막 항목을 가져와 main thread에서 업데이트
	func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
		guard let location = locations.last else { return }
		DispatchQueue.main.async {
			self.location = location
		}
	}
}

//class LocationService : NSObject, CLLocationManagerDelegate {
//	private let manager = CLLocationManager()
//	var completionHandler: ((CLLocationCoordinate2D) -> (Void))?
//

//	//위치 정보 요청 - 정보 요청이 성공하면 실행될 completionHandler를 등록
//	func requestLocation(completion: @escaping ((CLLocationCoordinate2D) -> (Void))) {
//		completionHandler = completion
//		manager.requestLocation()
//
//	}
//	//위치 정보는 주기적으로 업데이트 되므로 이를 중단하기 위한 함수
//	func stopUpdatingLocation() {
//		manager.stopUpdatingHeading()
//	}
//
//	//위치 정보가 업데이트 될 때 호출되는 delegate 함수
//	func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//		guard let location = locations.last else {
//			return
//		}
//		//requestLocation 에서 등록한 completion handler를 통해 위치 정보를 전달
//		if let completion = self.completionHandler {
//			completion(location.coordinate)
//		}
//		//위치 정보 업데이트 중단
//		manager.stopUpdatingLocation()
//	}
//
//	func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
//		print(error)
//	}
//}
