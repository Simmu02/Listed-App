
import Foundation

struct ApiResponseModel: Codable {

    let status: Bool?
    let statusCode: Int?
    let message: String?
    let supportWhatsappNumber: String?
    let extraIncome: Double?
    let totalLinks: Int?
    let totalClicks: Int?
    let todayClicks: Int?
    let topSource: String?
    let topLocation: String?
    let startTime: String?
    let linksCreatedToday: Int?
    let appliedCampaign: Int?
    let data: Data?

    private enum CodingKeys: String, CodingKey {
        case status = "status"
        case statusCode = "statusCode"
        case message = "message"
        case supportWhatsappNumber = "support_whatsapp_number"
        case extraIncome = "extra_income"
        case totalLinks = "total_links"
        case totalClicks = "total_clicks"
        case todayClicks = "today_clicks"
        case topSource = "top_source"
        case topLocation = "top_location"
        case startTime = "startTime"
        case linksCreatedToday = "links_created_today"
        case appliedCampaign = "applied_campaign"
        case data = "data"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decodeIfPresent(Bool.self, forKey: .status)
        statusCode = try values.decodeIfPresent(Int.self, forKey: .statusCode)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        supportWhatsappNumber = try values.decodeIfPresent(String.self, forKey: .supportWhatsappNumber)
        extraIncome = try values.decodeIfPresent(Double.self, forKey: .extraIncome)
        totalLinks = try values.decodeIfPresent(Int.self, forKey: .totalLinks)
        totalClicks = try values.decodeIfPresent(Int.self, forKey: .totalClicks)
        todayClicks = try values.decodeIfPresent(Int.self, forKey: .todayClicks)
        topSource = try values.decodeIfPresent(String.self, forKey: .topSource)
        topLocation = try values.decodeIfPresent(String.self, forKey: .topLocation)
        startTime = try values.decodeIfPresent(String.self, forKey: .startTime)
        linksCreatedToday = try values.decodeIfPresent(Int.self, forKey: .linksCreatedToday)
        appliedCampaign = try values.decodeIfPresent(Int.self, forKey: .appliedCampaign)
        data = try values.decodeIfPresent(Data.self, forKey: .data)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(status, forKey: .status)
        try container.encodeIfPresent(statusCode, forKey: .statusCode)
        try container.encodeIfPresent(message, forKey: .message)
        try container.encodeIfPresent(supportWhatsappNumber, forKey: .supportWhatsappNumber)
        try container.encodeIfPresent(extraIncome, forKey: .extraIncome)
        try container.encodeIfPresent(totalLinks, forKey: .totalLinks)
        try container.encodeIfPresent(totalClicks, forKey: .totalClicks)
        try container.encodeIfPresent(todayClicks, forKey: .todayClicks)
        try container.encodeIfPresent(topSource, forKey: .topSource)
        try container.encodeIfPresent(topLocation, forKey: .topLocation)
        try container.encodeIfPresent(startTime, forKey: .startTime)
        try container.encodeIfPresent(linksCreatedToday, forKey: .linksCreatedToday)
        try container.encodeIfPresent(appliedCampaign, forKey: .appliedCampaign)
        try container.encodeIfPresent(data, forKey: .data)
    }

}

struct Data: Codable {
    var id = UUID().uuidString
    let recentLinks: [LinksData]?
    let topLinks: [LinksData]?
    let favouriteLinks: [Any]?
    let overallUrlChart: [String:Int]?

    private enum CodingKeys: String, CodingKey {
        case recentLinks = "recent_links"
        case topLinks = "top_links"
        case favouriteLinks = "favourite_links"
        case overallUrlChart = "overall_url_chart"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        recentLinks = try values.decodeIfPresent([LinksData].self, forKey: .recentLinks)
        topLinks = try values.decodeIfPresent([LinksData].self, forKey: .topLinks)
        favouriteLinks = []
        overallUrlChart = try values.decodeIfPresent([String:Int].self, forKey: .overallUrlChart)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(recentLinks, forKey: .recentLinks)
        try container.encodeIfPresent(topLinks, forKey: .topLinks)
        
    }

}

struct LinksData: Codable {

    let urlId: Int?
    let webLink: String?
    let smartLink: String?
    let title: String?
    let totalClicks: Int?
    let originalImage: String?
    let thumbnail: Any?
    let timesAgo: String?
    let createdAt: String?
    let domainId: String?
    let urlPrefix: Any?
    let urlSuffix: String?
    let app: String?
    let isFavourite: Bool?

    private enum CodingKeys: String, CodingKey {
        case urlId = "url_id"
        case webLink = "web_link"
        case smartLink = "smart_link"
        case title = "title"
        case totalClicks = "total_clicks"
        case originalImage = "original_image"
        case thumbnail = "thumbnail"
        case timesAgo = "times_ago"
        case createdAt = "created_at"
        case domainId = "domain_id"
        case urlPrefix = "url_prefix"
        case urlSuffix = "url_suffix"
        case app = "app"
        case isFavourite = "is_favourite"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        urlId = try values.decodeIfPresent(Int.self, forKey: .urlId)
        webLink = try values.decodeIfPresent(String.self, forKey: .webLink)
        smartLink = try values.decodeIfPresent(String.self, forKey: .smartLink)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        totalClicks = try values.decodeIfPresent(Int.self, forKey: .totalClicks)
        originalImage = try values.decodeIfPresent(String.self, forKey: .originalImage)
        thumbnail = Any?.self // TODO: Add code for decoding `thumbnail`, It was null at the time of model creation.
        timesAgo = try values.decodeIfPresent(String.self, forKey: .timesAgo)
        createdAt = try values.decodeIfPresent(String.self, forKey: .createdAt)
        domainId = try values.decodeIfPresent(String.self, forKey: .domainId)
        urlPrefix = (Any).self
        urlSuffix = try values.decodeIfPresent(String.self, forKey: .urlSuffix)
        app = try values.decodeIfPresent(String.self, forKey: .app)
        isFavourite = try values.decodeIfPresent(Bool.self, forKey: .isFavourite)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(urlId, forKey: .urlId)
        try container.encodeIfPresent(webLink, forKey: .webLink)
        try container.encodeIfPresent(smartLink, forKey: .smartLink)
        try container.encodeIfPresent(title, forKey: .title)
        try container.encodeIfPresent(totalClicks, forKey: .totalClicks)
        try container.encodeIfPresent(originalImage, forKey: .originalImage)
        try container.encodeIfPresent(timesAgo, forKey: .timesAgo)
        try container.encodeIfPresent(createdAt, forKey: .createdAt)
        try container.encodeIfPresent(domainId, forKey: .domainId)
        try container.encodeIfPresent(urlSuffix, forKey: .urlSuffix)
        try container.encodeIfPresent(app, forKey: .app)
        try container.encodeIfPresent(isFavourite, forKey: .isFavourite)
    }

}



