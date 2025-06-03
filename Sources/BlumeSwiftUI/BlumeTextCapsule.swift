//
//  SwiftUIView.swift
//  BlumeSwiftUI
//
//  Created by Kent Onyx Arintok on 5/31/25.
//

import SwiftUI

/// A capsule-shaped text selection view that supports both single and multiple selection modes.
public struct BlumeTextCapsule: View {
    
    /// The items to be displayed in the capsule view
    public let items: [String]
    
    /// The currently selected item(s)
    @Binding public var selectedItems: [String]
    
    /// The selection mode of the capsule view
    public enum SelectionMode {
        /// Only one item can be selected at a time
        case single
        /// Multiple items can be selected
        case multiple(maxCount: Int)
    }
    
    /// The current selection mode
    public let selectionMode: SelectionMode
    
    /// Creates a new BlumeTextCapsule view
    /// - Parameters:
    ///   - items: The items to be displayed
    ///   - selectedItems: Binding to the selected items
    ///   - selectionMode: The selection mode (single or multiple)
    public init(items: [String], selectedItems: Binding<[String]>, selectionMode: SelectionMode = .single) {
        self.items = items
        self._selectedItems = selectedItems
        self.selectionMode = selectionMode
    }

    public var body: some View {
        FlowLayout(
            items: items,
            itemSpacing: 10,
            rowSpacing: 10
        ) { item in
            Button(action: {
                switch selectionMode {
                case .single:
                    selectedItems = [item]
                case .multiple(let maxCount):
                    if selectedItems.contains(item) {
                        selectedItems.removeAll { $0 == item }
                    } else if selectedItems.count < maxCount {
                        selectedItems.append(item)
                    }
                }
            }) {
                Text(item)
                    .font(.aeonikRegular(size: 15))
                    .foregroundStyle(.white)
                    .lineLimit(1)
                    .truncationMode(.tail)
                    .padding(.vertical, 9)
                    .padding(.horizontal, 15)
                    .background(
                        Capsule()
                            .fill(selectedItems.contains(item) ? Color(hex: "#327270") : .black)
                    )
            }
            .disabled(selectionMode.isMultiple && !selectedItems.contains(item) && selectedItems.count >= selectionMode.maxCount)
        }
    }
}

// MARK: - SelectionMode Extension
extension BlumeTextCapsule.SelectionMode {
    var isMultiple: Bool {
        switch self {
        case .single:
            return false
        case .multiple:
            return true
        }
    }
    
    var maxCount: Int {
        switch self {
        case .single:
            return 1
        case .multiple(let maxCount):
            return maxCount
        }
    }
}

// MARK: - FlowLayout

struct FlowLayout<Data: RandomAccessCollection, Content: View>: View where Data.Element: Hashable {
    let items: Data
    let itemSpacing: CGFloat
    let rowSpacing: CGFloat
    let content: (Data.Element) -> Content

    @State private var sizes: [AnyHashable: CGSize] = [:]
    @State private var totalHeight: CGFloat = 0

    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .topLeading) {
                // Hidden layout for measuring
                ForEach(items, id: \.self) { item in
                    content(item)
                        .fixedSize()
                        .background(
                            GeometryReader { geo in
                                Color.clear
                                    .preference(key: SizePreferenceKey.self, value: [AnyHashable(item): geo.size])
                            }
                        )
                        .opacity(0)
                        .accessibility(hidden: true)
                }

                // Actual layout once we have sizes
                if sizes.keys.count == items.count {
                    generateLayout(in: geometry)
                }
            }
            .onPreferenceChange(SizePreferenceKey.self) { preferences in
                self.sizes = preferences
            }
            .onPreferenceChange(HeightPreferenceKey.self) { height in
                self.totalHeight = height
            }
        }
        .frame(height: totalHeight) // This constrains the GeometryReader to only the needed height
    }

    private func generateLayout(in geometry: GeometryProxy) -> some View {
        var width: CGFloat = 0
        var rows: [[Data.Element]] = [[]]

        for item in items {
            let itemSize = sizes[item] ?? CGSize(width: 100, height: 40)
            if width + itemSize.width + itemSpacing > geometry.size.width {
                rows.append([item])
                width = itemSize.width + itemSpacing
            } else {
                rows[rows.count - 1].append(item)
                width += itemSize.width + itemSpacing
            }
        }

        return VStack(alignment: .leading, spacing: rowSpacing) {
            ForEach(rows, id: \.self) { row in
                HStack(spacing: itemSpacing) {
                    ForEach(row, id: \.self) { item in
                        content(item)
                    }
                }
            }
        }
        .background(
            GeometryReader { geo in
                Color.clear
                    .preference(key: HeightPreferenceKey.self, value: geo.size.height)
            }
        )
    }
}

// PreferenceKey to collect size info
private struct SizePreferenceKey: @preconcurrency PreferenceKey {
    @MainActor static let defaultValue: [AnyHashable: CGSize] = [:]

    static func reduce(value: inout [AnyHashable: CGSize], nextValue: () -> [AnyHashable: CGSize]) {
        value.merge(nextValue(), uniquingKeysWith: { $1 })
    }
}

// PreferenceKey to collect height info
private struct HeightPreferenceKey: PreferenceKey {
    static let defaultValue: CGFloat = 0

    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

#Preview {
    struct PreviewWrapper: View {
        @State var singleSelectedItems: [String] = ["English"]
        @State var multipleSelectedItems: [String] = ["English", "French"]
        
        var body: some View {
            VStack(spacing: 20) {
                BlumeTextCapsule(
                    items: ["🎒 High School", "🏫 Some College", "📗 Associate Degree", "🎓 Bachelor's Degree", "📘 Master's Degree", "🧠 Doctorate / PhD","❓Prefer Not to Say"],
                    selectedItems: $singleSelectedItems,
                    selectionMode: .single
                )

//                BlumeTextCapsule(
//                    items: ["English", "Hebrew", "Mandarin Chinese", "Arabic", "French", "Japanese"],
//                    selectedItems: $multipleSelectedItems,
//                    selectionMode: .multiple(maxCount: 4)
//                )
            }
        }
    }
    
    return PreviewWrapper()
}
