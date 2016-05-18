//
//  STChartViewController.swift
//  Statistic
//
//  Created by winify on 5/17/16.
//  Copyright © 2016 Costraci Mihail. All rights reserved.
//

import UIKit
import SVProgressHUD
import Charts

class STChartViewController: STBaseViewController {

	let userStatistic: STStatisticConnnector = STStatisticConnnector()
	@IBOutlet var barChartView: BarChartView!

	@IBOutlet weak var pieChartView: PieChartView!
	var daysOfWeek: [String]!
	
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		barChartView.noDataText = "No data to show the chart."
		barChartView.infoTextColor = UIColor.orangeColor()
		barChartView.descriptionText = ""
		
	}
	
	override func viewDidAppear(animated: Bool) {
		super.viewDidAppear(animated)
		
		self.getStatistic()
		
		daysOfWeek = ["Mon", "Tue", "Wed", "Thur", "Fri", "Sat", "Sun"]
		let unitsSold = [8.0, 5.6, 0.0, 0.0, 0.0, 0.0, 0.0]
		
		setChart(daysOfWeek, values: unitsSold)
		setPieChart()
		
	}
	
	
	func getStatistic() -> Void {
		
		SVProgressHUD.show()
		userStatistic.getUserStatistic({ (userStatistic) in
			
			SVProgressHUD.dismiss()
			appDelegate.user.userStatistic = userStatistic
			
			print("daily: \(appDelegate.user.userStatistic!.daily)")
			print("workedDays: \(appDelegate.user.userStatistic!.workedDays)")
			print("fullName: \(appDelegate.user.userTime!.fullName)")
			print("loggedIn: \(appDelegate.user.userTime!.loggedIn)")
			
			
		}) { (failureError) in
			
			SVProgressHUD.dismiss()
			SVProgressHUD.showErrorWithStatus(failureError.description)
			SVProgressHUD.dismissWithDelay(3.0)
		}
		
	}
	
	
	
	//MARK: CHART SETTINGS
	//MARK:
	func setChart(dataPoints: [String], values: [Double]) {
		barChartView.noDataText = "You need to provide data for the chart."
		
		
		var dataEntries: [BarChartDataEntry] = []
		
		for i in 0..<dataPoints.count {
			let dataEntry = BarChartDataEntry(value: values[i], xIndex: i)
			dataEntries.append(dataEntry)
		}
		
		let chartDataSet = BarChartDataSet(yVals: dataEntries, label: "Current Week")
		let chartData = BarChartData(xVals: daysOfWeek, dataSet: chartDataSet)
		barChartView.data = chartData
		
		chartDataSet.colors = [NSUIColor.orangeColor()]
		
	}
	
	func setPieChart() {
		
		
		pieChartView.drawRect(CGRectMake(30, 30, 40, 40))
	}
	
}
