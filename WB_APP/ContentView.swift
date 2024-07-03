import SwiftUI
struct ContentView:View {
    @State var selectedDay = Date()
    @State var selectEmoji = "🇷🇺"
    var locale: [Locale] = [
        Locale(identifier: "ru"),
        Locale(identifier: "en-GB"),
        Locale(identifier: "fr-FR"),
        Locale(identifier: "de-DE"),
        Locale(identifier: "it-IT")
    ]
    var body: some View {
        DatePicker("Выберите дату", selection: $selectedDay)
            .padding(.top, 100)
        
        Picker("select contry", selection: $selectEmoji) {
            Text("🇷🇺").tag("🇷🇺")
            Text("🇬🇧").tag("🇬🇧")
            Text("🇫🇷").tag("🇫🇷")
            Text("🇩🇪").tag("🇩🇪")
            Text("🇮🇹").tag("🇮🇹")
        }
        .pickerStyle(SegmentedPickerStyle())
        .padding(.top, 100)
        List() {
            ForEach(makeString(selectedDay), id: \.self) { dateString in
                Text(dateString)
                    .font(dateString.contains("Today") ? .headline : .subheadline)
            }
        }
        Spacer()
    }
    private func getIndex() -> Int {
        switch selectEmoji {
        case "🇷🇺":
            return 0
        case "🇬🇧":
            return 1
        case "🇫🇷":
            return 2
        case "🇩🇪":
            return 3
        case "🇮🇹":
            return 4
        default:
            return 0
        }
    }
    private func makeString(_ date: Date) -> [String] {
        let days = ["Day before yesterday", "Yesterday", "Today", "Tommorow", "Day after tomorrow"]
        let calendar = Calendar(identifier: .gregorian)
        let components = calendar.dateComponents([.year, .month, .day], from: selectedDay)
        let date = [
            calendar.date(byAdding: .day, value: -2, to: date),
            calendar.date(byAdding: .day, value: -1, to: date),
            calendar.date(from: components),
            calendar.date(byAdding: .day, value: 1, to: date),
            calendar.date(byAdding: .day, value: 2, to: date)
        ]
        return days.enumerated().map { index, offset in
            return "\(days[index]):  \(spellOut: date[index] ?? Date(), locale: locale[getIndex()])"
        }
    }
}




#Preview {
    ContentView()
}
