// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/

import MozillaAppServices

enum HighlightItemType {
    case group
    case item
}

protocol HighlightItem {
    var displayTitle: String { get }
    var description: String? { get }
    var url2: URL? { get }
    var type: HighlightItemType { get }
}

extension ASGroup: HighlightItem {
    var type: HighlightItemType {
        return .group
    }

    var displayTitle: String {
        return searchTerm
    }

    var description: String? {
        // TODO: YRD check what to do for the string "sites"
        return "\(groupedItems.count) sites"
    }

    var url2: URL? {
        return nil
    }
}

extension HistoryHighlight: HighlightItem {
    var type: HighlightItemType {
        return .item
    }
    
    var displayTitle: String {
        return title ?? url
    }

    var description: String? {
        return nil
    }

    var url2: URL? {
        return URL(string: url)
    }
}
