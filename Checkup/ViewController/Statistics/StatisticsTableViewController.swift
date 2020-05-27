//
//  StatisticsTableViewController.swift
//  Checkup
//
//  Created by yasmin mohsen on 5/21/20.
//  Copyright © 2020 Hassan Khamis. All rights reserved.
//

import UIKit
import Charts
import Firebase

class StatisticsTableViewController: UITableViewController ,IView{
    
    //    var year: [String]!
    //    var sample = [Double]()
    var yearArray=[String]()
    var yearPickerView=UIPickerView()
    var sampleObj:HbA1cSample!
    
    @IBOutlet weak var graphDescribtionLabel: UILabel!
    
    @IBOutlet weak var barChartView: BarChartView!
    @IBOutlet weak var yearTextField: UITextField!
      var index:Int!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        yearArray.append("Select Year")
        
        for n in 2020...2070 {
            var y = String(n)
            yearArray.append(y)
        }
        
        
        yearPickerView.delegate=self
        yearPickerView.dataSource=self
        yearTextField.inputView=yearPickerView
        
        graphDescribtionLabel.alpha=0
        
        createDatePicker()
    }
    
    
    @IBAction func doneBtn(_ sender: Any) {
        
        
        if yearTextField.text == ""{
            
            Alert.showSimpleAlert(title: "sorry",message: "Enter Year First", viewRef: self)
            
            
            
        }
        else{
            
            let selectedYear = yearTextField.text
            
            let statisticsPresenterRef=StatisticPresenter(statisticsViewRef: self)
            
            statisticsPresenterRef.getSample(userId: Auth.auth().currentUser!.uid, year: selectedYear!)
            
//            setChart(dataPoints: sampleObj.year!, values: sampleObj.sample!)
            
            
        }
        
    }
    func setChart(dataPoints:[String],values: [Double]) {
        barChartView.noDataText = "You need to provide data for the chart."
        barChartView.animate(xAxisDuration: 2.0, yAxisDuration: 2.0)
        barChartView.xAxis.labelPosition = .bottom
        barChartView.xAxis.decimals = 0
        let chartFormatter = ChartFormatter(myArr: sampleObj.year!)
        
        let xaxis = XAxis()
        
        var dataEntries:[BarChartDataEntry] = []
        var dataEntries1:[PieChartDataEntry]=[]
        for i in 0..<dataPoints.count{
            
            let dataEntry = BarChartDataEntry(x: Double(i), y: Double(values[i]) , data: dataPoints as AnyObject?)
            //                print(dataEntry)
            dataEntries.append(dataEntry)
            
            
            chartFormatter.stringForValue(Double(i), axis: xaxis)
            
            
            
            
            
        }
        xaxis.valueFormatter = chartFormatter
        barChartView.xAxis.valueFormatter = xaxis.valueFormatter
        
        barChartView.xAxis.granularityEnabled = true
        barChartView.xAxis.granularity = 1.0
        barChartView.leftAxis.axisMaximum=7
        self.barChartView.xAxis.drawGridLinesEnabled = false
        //             self.barChartView.legend.enabled = false
        self.barChartView.leftAxis.labelFont = UIFont.systemFont(ofSize: 10.0, weight:.bold)
        
        self.barChartView.xAxis.labelFont = UIFont.systemFont(ofSize: 10.0, weight:.bold)
        barChartView.rightAxis.enabled=false
        let chartDataSet = BarChartDataSet(entries: dataEntries, label: "HBA1C")
        let chartData = BarChartData(dataSet: chartDataSet)
        chartDataSet.colors=ChartColorTemplates.liberty()
        chartDataSet.valueFont=UIFont.systemFont(ofSize: 10.0, weight:.bold)
        barChartView.data = chartData
        let s="This graph show the percentage of HBA1C during ".localized
        graphDescribtionLabel.text=s+yearTextField.text!
        graphDescribtionLabel.alpha=1
        
    }
    
}
@objc(ChartFormatter)
class ChartFormatter: NSObject, IAxisValueFormatter {
    
    private var myArr: [String]!
    
    init(myArr: [String]) {
        
        
        self.myArr = myArr
    }
    
    func stringForValue(_ value: Double, axis: AxisBase?) -> String {
        
        return myArr[Int(value)  %  myArr.count]
        
    }
}

