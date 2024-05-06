//
//  Calendar.swift
//  EzyFitness_Decoders
//
//  Created by Student on 03/05/24.
//

import UIKit
import FSCalendar

class CalenderViewController: UIViewController, FSCalendarDelegate, FSCalendarDataSource{
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createCalender()
        view.backgroundColor = .white
    }
    
    private func createCalender() {
        let calendar = FSCalendar(frame: CGRect(x: 10, y: 40, width: view.frame.size.width - 20, height: 800))
        calendar.dataSource = self
        calendar.delegate = self
        calendar.backgroundColor = .black
        calendar.tintColor = .white
        
        
//
        calendar.appearance.weekdayTextColor = .white
        calendar.appearance.titleDefaultColor = .white
        calendar.appearance.titleSelectionColor = .black
        calendar.appearance.selectionColor = .orange
        calendar.appearance.todayColor = .darkGray
        calendar.appearance.todaySelectionColor = .red
        
        view.addSubview(calendar)
    }
    
    // MARK: - FSCalendarDelegate
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        print("Selected date: \(formatter.string(from: date))")
    }
}

