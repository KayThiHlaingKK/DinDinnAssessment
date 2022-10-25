//
//  Constants.swift
//  SampleShop
//
//  Created by Hive Innovation on 23/10/2022.
//

import Foundation

enum AssetsColor: String {
    case CellBGColor = "CellBGColor"
    case primaryColor = "PrimaryColor"
    case primaryTextColor = "PrimaryTextColor"
    case secondaryTextColor = "SecondaryTextColor"
    case SecondaryViewColor = "SecondaryViewColor"
    case UnfavouriteColor = "UnfavouriteColor"
}


enum StepperControl: Int {
    case minus = 0, plus
}


enum ImageAssets: String {
    case home = "Home"
    case favourite = "favourite"
    case profile = "profile"
    case unfavourite = "heart"
    case favourited = "valentines-heart-2"
    case basket = "basket"
}

let categoryList = [Category(title: "About me", icon: "aboutMe"),
                    Category(title: "My Orders", icon: "myOrders"),
                    Category(title: "My Favourites", icon: "myFavourites"),
                    Category(title: "My Address", icon: "myAddress"),
                    Category(title: "Credit Cards", icon: "creditCards"),
                    Category(title: "Transactions", icon: "transactions"),
                    Category(title: "Notifications", icon: "notifications"),
                    Category(title: "Categories", icon: "categories"),
                    Category(title: "Sign Out", icon: "signOut")]

let sorryTitle = "Sorry"
let sorryMessage = "This service is unavailable."


