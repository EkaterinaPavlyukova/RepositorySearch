
final class ModuleFactoryImp:
SearchModuleFactory,
HistoryModuleFactory {
    
    func makeRepositoryDetailOutput(url: URL) -> RepositoryDetailView {
        let vc = RepositoryDetailController()
        vc.modalPresentationStyle = .overCurrentContext
        return vc
    }
    
    func makeSearchOutput() -> SearchView {
        let searchVC = SearchController()
        return searchVC
    }
    
    func makeHistoryOutput() -> HistoryView {
        let vc = HistoryController()
        return vc
    }
    
}

