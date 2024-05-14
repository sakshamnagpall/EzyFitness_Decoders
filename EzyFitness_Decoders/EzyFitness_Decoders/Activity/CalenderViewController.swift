import Foundation
import UIKit

import FSCalendar

class CalenderViewController: UIViewController, FSCalendarDelegate, FSCalendarDataSource {
    
    // Array to hold dates that are opened
    var openedDates: [Date] = []
    
    // DateFormatter for formatting dates
    let formatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Call function to create calendar
        createCalendar()
        
        // Set background color of the view
        view.backgroundColor = .black
    }

    // Function to create FSCalendar instance and configure its appearance
    private func createCalendar() {
        // Create FSCalendar instance
        let calendar = FSCalendar(frame: CGRect(x: 0, y: 40, width: view.bounds.width, height: view.bounds.height - 40))
        
        // Set dataSource and delegate
        calendar.dataSource = self
        calendar.delegate = self
        
        // Set calendar appearance
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
        
        // Set autoresizing mask
        calendar.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        // Add calendar to the view
        view.addSubview(calendar)
    }
    
    // MARK: - FSCalendarDelegate
    
    // Delegate method called when a date is selected
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        // Format and print the selected date
        formatter.dateFormat = "yyyy-MM-dd"
        print("Selected date: \(formatter.string(from: date))")
    }
}
