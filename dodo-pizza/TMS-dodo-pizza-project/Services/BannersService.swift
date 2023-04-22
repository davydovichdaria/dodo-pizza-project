import Foundation

class BannersService {
    var banners = [
        Banners.init(image: "banner1"),
        Banners.init(image: "banner2"),
        Banners.init(image: "banner3"),
        Banners.init(image: "banner4"),
        Banners.init(image: "banner5"),
        Banners.init(image: "banner6"),
        Banners.init(image: "banner7"),
        Banners.init(image: "banner8"),
        Banners.init(image: "banner9"),
        Banners.init(image: "banner10"),
        Banners.init(image: "banner11")
    ]
    
    //Получаем массив баннеров
    func fetchBanners() -> [Banners] {
        return banners
    }
}
