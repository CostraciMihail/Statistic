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
		
//		self.getStatistic()
		
		daysOfWeek = ["Mon", "Tue", "Wed", "Thur", "Fri", "Sat", "Sun"]
		let unitsSold = [8.0, 5.6, 0.0, 0.0, 0.0, 0.0, 0.0]
		
		setChart(daysOfWeek, values: unitsSold)
//		setupPieChartViewS(pieChartView)
		setPieChart(daysOfWeek, values: unitsSold)
		
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
	
	/**
	Setting the chart
	
	- parameter dataPoints: name of the points on the chart
	- parameter values:     value for each point on chart
	*/
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
        barChartView.animate(xAxisDuration: 1.0, yAxisDuration: 1.0, easingOption: .EaseInOutBounce)
		
	}
	
	
//    func setupPieChartViewS(chartView: PieChartView) {
//    
//    chartView.usePercentValuesEnabled = true;
//    chartView.drawSlicesUnderHoleEnabled = false;
//    chartView.holeRadiusPercent = 0.58;
//    chartView.transparentCircleRadiusPercent = 0.61;
//    chartView.descriptionText = "";
//    chartView.setExtraOffsets(left: 5.0, top: 10.0, right: 5.0, bottom: 5.0)
//        
//    chartView.drawCenterTextEnabled = true;
//        var paragraphStyle: NSMutableParagraphStyle = NSParagraphStyle.defaultParagraphStyle().mutableCopy() as! NSMutableParagraphStyle
//
//    paragraphStyle.lineBreakMode = .ByTruncatingTail;
//    paragraphStyle.alignment = .Center;
//    
//    var centerText: NSMutableAttributedString = NSMutableAttributedString(string: "iOS Charts\nby Daniel Cohen Gindi")
//
////	centerText.setAttributes(<#T##attrs: [String : AnyObject]?##[String : AnyObject]?#>, range: <#T##NSRange#>)
//		
////	[centerText setAttributes:@{
////    NSFontAttributeName: [UIFont fontWithName:@"HelveticaNeue-Light" size:12.f],
////    NSParagraphStyleAttributeName: paragraphStyle
////    } range:NSMakeRange(0, centerText.length)];
//////
////    [centerText addAttributes:@{
////    NSFontAttributeName: [UIFont fontWithName:@"HelveticaNeue-Light" size:10.f],
////    NSForegroundColorAttributeName: UIColor.grayColor
////    } range:NSMakeRange(10, centerText.length - 10)];
////		
////    [centerText addAttributes:@{
////    NSFontAttributeName: [UIFont fontWithName:@"HelveticaNeue-LightItalic" size:10.f],
////    NSForegroundColorAttributeName: [UIColor colorWithRed:51/255.f green:181/255.f blue:229/255.f alpha:1.f]
////    } range:NSMakeRange(centerText.length - 19, 19)];
//		
//    chartView.centerAttributedText = centerText;
//    chartView.drawHoleEnabled = true
//	chartView.rotationAngle = 0.0
//    chartView.rotationEnabled = true
//    chartView.highlightPerTapEnabled = true
//    
//	let l: ChartLegend = chartView.legend
//    l.position = .RightOfChart
//    l.xEntrySpace = 7.0
//    l.yEntrySpace = 0.0
//    l.yOffset = 0.0
//		
//	}

	
	func setPieChart(dataPoints: [String], values: [Double]) {
		
		var dataEntries: [ChartDataEntry] = []
		
		for i in 0..<dataPoints.count {
			let dataEntry = ChartDataEntry(value: values[i], xIndex: i)
			dataEntries.append(dataEntry)
		}
		
		let pieChartDataSet = PieChartDataSet(yVals: dataEntries, label: "Units Sold")
		let pieChartData = PieChartData(xVals: dataPoints, dataSet: pieChartDataSet)
		pieChartView.data = pieChartData
		
		var colors: [UIColor] = []
		
		for i in 0..<dataPoints.count {
			let red = Double(arc4random_uniform(256))
			let green = Double(arc4random_uniform(256))
			let blue = Double(arc4random_uniform(256))
			
			let color = UIColor(red: CGFloat(red/255), green: CGFloat(green/255), blue: CGFloat(blue/255), alpha: 1)
			colors.append(color)
		}
		
		pieChartDataSet.colors = colors
		
		
//		let lineChartDataSet = LineChartDataSet(yVals: dataEntries, label: "Units Sold")
//		let lineChartData = LineChartData(xVals: dataPoints, dataSet: lineChartDataSet)
//		lineChartView.data = lineChartData
		
	}
	
}
