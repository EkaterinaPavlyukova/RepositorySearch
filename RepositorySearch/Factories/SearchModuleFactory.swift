
protocol SearchModuleFactory {
    func makeSearchOutput() -> SearchView
    func makeRepositoryDetailOutput(url: URL) -> RepositoryDetailView
}

