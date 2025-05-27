func solution(_ cacheSize:Int, _ cities:[String]) -> Int {
    var cache: [String] = []
    var runningTime = 0

    for city in cities {
        let city = city.lowercased()

        if let index = cache.firstIndex(of: city) {
            cache.remove(at: index)
            cache.append(city)
            runningTime += 1
        } else {
            if cacheSize > 0 && cache.count == cacheSize { cache.removeFirst() }
            if cacheSize > 0 { cache.append(city) }
            runningTime += 5
        }
    }

    return runningTime
}