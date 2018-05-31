protocol SearchModuleFactory: ServiceModuleFactory {
    func makeSearchOutput() -> SearchView
    func makeGeneralServiceDetailOutput() -> GeneralServiceDetailView
    func makeMasterDetailOutput() -> MasterDetailView
}

protocol MasterDetailView: BaseViewPresentable {
    var viewModel: MasterDetailPresentable! { get set }
}

protocol MasterDetailPresentable: MasterHeaderPresentable {
    var serviceList: Driver<[Service]> { get set }
    var onServiceSelect: AnyObserver<Service> { get set }
    var showServiceDetail: Observable<Service> { get set }
}
