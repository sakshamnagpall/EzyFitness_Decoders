//
//  Calendar.swift
//  EzyFitness_Decoders
//
//  Created by Student on 03/05/24.
//
//import Foundation
//import UIKit
//import FSCalendar
//
//class CalenderViewController: UIViewController, FSCalendarDelegate, FSCalendarDataSource{
//    
//    var openedDates: [Date] = []
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        let dummyDate = DateComponents(calendar: Calendar.current, year: 2024, month: 5, day: 5).date!
//        openedDates.append(dummyDate)
//        createCalender()
//        view.backgroundColor = .white
//        
//        
//    }
//    
//    private func createCalender() {
////        let calendar = FSCalendar(frame: CGRect(x: 10, y: 40, width: view.frame.size.width - 20, height: 800))
//        let calendar = FSCalendar(frame: CGRect(x: 0, y: 40, width: view.bounds.width, height: view.bounds.height - 40))
//        calendar.dataSource = self
//        calendar.delegate = self
//        calendar.backgroundColor = .black
//        calendar.tintColor = .white
//        
//        calendar.appearance.headerTitleFont = .boldSystemFont(ofSize: 30)
//        calendar.appearance.headerTitleColor = .orange
////
//        calendar.appearance.weekdayTextColor = .white
//        calendar.appearance.titleDefaultColor = .white
//        calendar.appearance.titleSelectionColor = .black
//        calendar.appearance.selectionColor = .orange
//        calendar.appearance.todayColor = .darkGray
//        calendar.appearance.todaySelectionColor = .red
//        
//        calendar.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//        
//        view.addSubview(calendar)
//    }
//    
//    // MARK: - FSCalendarDelegate
//    
//    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
//        let formatter = DateFormatter()
//        formatter.dateFormat = "yyyy-MM-dd"
//        print("Selected date: \(formatter.string(from: date))")
//        
//        
//    }
//    
//}


//
//
//import Foundation
//import UIKit
//import FSCalendar
//
//class CalenderViewController: UIViewController, FSCalendarDelegate, FSCalendarDataSource {
//    
//    var openedDates: [Date] = []
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        
//        createCalendar()
//        view.backgroundColor = .white
//    }
//    
//    private func createCalendar() {
//        let calendar = FSCalendar(frame: CGRect(x: 0, y: 40, width: view.bounds.width, height: view.bounds.height - 40))
//        calendar.dataSource = self
//        calendar.delegate = self
//        calendar.backgroundColor = .black
//        calendar.tintColor = .white
//        
//        calendar.appearance.headerTitleFont = .boldSystemFont(ofSize: 30)
//        calendar.appearance.headerTitleColor = .orange
//        calendar.appearance.weekdayTextColor = .white
//        calendar.appearance.titleDefaultColor = .white
//        calendar.appearance.titleSelectionColor = .black
//        calendar.appearance.selectionColor = .orange
//        calendar.appearance.todayColor = .darkGray
//        calendar.appearance.todaySelectionColor = .red
//        
//        
//        
//        calendar.appearance.eventDefaultColor = .orange
//        calendar.appearance.eventSelectionColor = .orange
//        calendar.appearance.titleTodayColor = .orange
//        
//        calendar.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//        
//        view.addSubview(calendar)
//    }
//    
//    // MARK: - FSCalendarDelegate
//    
//    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
//        let formatter = DateFormatter()
//        formatter.dateFormat = "yyyy-MM-dd"
//        print("Selected date: \(formatter.string(from: date))")
//    }
//    
//}




import Foundation
import UIKit
import FSCalendar

class CalenderViewController: UIViewController, FSCalendarDelegate, FSCalendarDataSource {
    
    var openedDates: [Date] = []
    let formatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createCalendar()
        view.backgroundColor = .white
    }

    
    private func createCalendar() {
        let calendar = FSCalendar(frame: CGRect(x: 0, y: 40, width: view.bounds.width, height: view.bounds.height - 40))
        calendar.dataSource = self
        calendar.delegate = self
        calendar.backgroundColor = .black
        calendar.tintColor = .white
        
        calendar.appearance.headerTitleFont = .boldSystemFont(ofSize: 30)
        calendar.appearance.headerTitleColor = .orange
        calendar.appearance.weekdayTextColor = .white
        calendar.appearance.titleDefaultColor = .white
        calendar.appearance.titleSelectionColor = .black
        calendar.appearance.selectionColor = .orange
        calendar.appearance.todayColor = .darkGray
        calendar.appearance.todaySelectionColor = .red
        
        calendar.appearance.eventDefaultColor = .yellow // Set event color to yellow
        calendar.appearance.eventSelectionColor = .yellow // Set event selection color to yellow
        
        
        
        calendar.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        view.addSubview(calendar)
    }
    
    // MARK: - FSCalendarDelegate
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        formatter.dateFormat = "yyyy-MM-dd"
        print("Selected date: \(formatter.string(from: date))")
    }
    
}

