// Copyright © 2020 Metabolist. All rights reserved.

import Foundation

public enum NavigationEvent {
    case collectionNavigation(CollectionViewModel)
    case urlNavigation(URL)
    case share(URL)
}

extension NavigationEvent {
    init?(_ event: CollectionItemEvent) {
        switch event {
        case .ignorableOutput:
            return nil
        case let .navigation(item):
            switch item {
            case let .url(url):
                self = .urlNavigation(url)
            case let .statusList(statusListService):
                self = .collectionNavigation(StatusListViewModel(statusListService: statusListService))
            case let .accountStatuses(accountStatusesService):
                self = .collectionNavigation(AccountStatusesViewModel(accountStatusesService: accountStatusesService))
            }
        case let .accountListNavigation(accountListViewModel):
            self = .collectionNavigation(accountListViewModel)
        case let .share(url):
            self = .share(url)
        }
    }
}
