
extension Sequence where Iterator.Element: Hashable {
    func unique() -> [Iterator.Element] {
        var alreadyAdded = Set<Iterator.Element>()
        self.forEach({alreadyAdded.insert($0)})
        return alreadyAdded.map({$0})
    }
}
