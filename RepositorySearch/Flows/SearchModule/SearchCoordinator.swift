
final class SearchCoordinator: BaseCoordinator {
  
  private let factory: SearchModuleFactory
  private let coordinatorFactory: CoordinatorFactory
  private let router: Router
  
  init(router: Router, factory: SearchModuleFactory, coordinatorFactory: CoordinatorFactory) {
    self.router = router
    self.factory = factory
    self.coordinatorFactory = coordinatorFactory
  }
  
  override func start() {
    showItemList()
  }
    
    private func showItemList() {
        let itemsOutput = factory.makeSearchOutput()
        let viewModel = SearchViewModel()
        viewModel.onShowDetail = { [weak self] repository in
            self?.showRepositoryDetail(repository)
        }
        
        itemsOutput.viewModel = viewModel
        router.setRootModule(itemsOutput)
    }
    
    private func showRepositoryDetail(_ item: RepositoryPresentable) {
        guard let url = item.url else {
            return
        }
        let output = factory.makeRepositoryDetailOutput(url: url)
        let viewModel = RepositoryDetailViewModel(url: url)
        viewModel.onFinishFlow = { [weak self] in
            self?.router.dismissModule()
        }
        output.viewModel = viewModel
        router.present(output)
    }

   
}
