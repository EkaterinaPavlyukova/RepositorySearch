protocol CoordinatorFactory {
    func makeTabbarCoordinator() -> (configurator: Coordinator, toPresent: Presentable?)
    func makeSearchCoordinator() -> Coordinator
    func makeSearchCoordinator(navController: UINavigationController?) -> Coordinator
    
    func makeAccountCoordinator() -> Coordinator
    func makeAccountCoordinator(navController: UINavigationController?) -> Coordinator
    
    func makeEditAccountCoordinatorBox(user: User) ->
        (configurator: Coordinator & EditAccountCoordinatorOutput,
        toPresent: Presentable?)
    func makeEditAccountCoordinatorBox(user: User, navController: UINavigationController?) ->
        (configurator: Coordinator & EditAccountCoordinatorOutput,
        toPresent: Presentable?)
    
    func makeAboutMasterCoordinatorBox(about: String?) ->
        (configurator: Coordinator & AboutMasterCoordinatorOutput,
        toPresent: Presentable?)
    func makeAboutMasterCoordinatorBox(about: String?, navController: UINavigationController?) ->
        (configurator: Coordinator & AboutMasterCoordinatorOutput,
        toPresent: Presentable?)
    
    func makeProfessionsCoordinatorBox(selected: [Profession]) ->
        (configurator: Coordinator & ProfessionsCoordinatorOutput,
        toPresent: Presentable?)
    func makeProfessionsCoordinatorBox(selected: [Profession], navController: UINavigationController?) ->
        (configurator: Coordinator & ProfessionsCoordinatorOutput,
        toPresent: Presentable?)
    
    func makeAddServiceCoordinatorBox(editedService: Service?, savedServices: [Service]) ->
        (configurator: Coordinator & AddServiceCoordinatorOutput,
        toPresent: Presentable?)
    func makeAddServiceCoordinatorBox(editedService: Service?, savedServices: [Service], navController: UINavigationController?) ->
        (configurator: Coordinator & AddServiceCoordinatorOutput,
        toPresent: Presentable?)
    
    func makeAddAddressCoordinatorBox(current: Location?) ->
        (configurator: Coordinator & AddressCoordinatorOutput,
        toPresent: Presentable?)
    func makeAddAddressCoordinatorBox(current: Location?, navController: UINavigationController?) ->
        (configurator: Coordinator & AddressCoordinatorOutput,
        toPresent: Presentable?)
    
    func makeSliderCoordinatorBox(currentIndex: IndexPath, source: [Image]) -> (configurator: SliderCoordinatorOutput & Coordinator, toPresent: Presentable?)
    
    func makeSliderCoordinatorBox(currentIndex: IndexPath, source: [Image], navController: UINavigationController?) -> (configurator: SliderCoordinatorOutput & Coordinator, toPresent: Presentable?) 
    
    func makeServiceTitleCoordinatorBox(title: String?) ->
        (configurator: Coordinator & ServiceTitleCoordinatorOutput,
        toPresent: Presentable?)
   func makeServiceTitleCoordinatorBox(title: String?, navController: UINavigationController?) ->
        (configurator: ServiceTitleCoordinatorOutput & Coordinator,
        toPresent: Presentable?)
    
    func makeServicePriceCoordinatorBox(price: Price?) ->
        (configurator: Coordinator & ServicePriceCoordinatorOutput,
        toPresent: Presentable?)
    func makeServicePriceCoordinatorBox(price: Price?, navController: UINavigationController?) ->
        (configurator: ServicePriceCoordinatorOutput & Coordinator,
        toPresent: Presentable?)
        
    func makeServicePhoneCoordinatorBox(phone: String?) ->
        (configurator: Coordinator & ServicePhoneCoordinatorOutput,
        toPresent: Presentable?)
    func makeServicePhoneCoordinatorBox(phone: String?, navController: UINavigationController?) ->
        (configurator: ServicePhoneCoordinatorOutput & Coordinator,
        toPresent: Presentable?)
    
    func makeAboutServiceCoordinatorBox(about: String?) ->
        (configurator: Coordinator & ServiceAboutCoordinatorOutput,
        toPresent: Presentable?)
    
    func makeAboutServiceCoordinatorBox(about: String?, navController: UINavigationController?) ->
        (configurator: Coordinator & ServiceAboutCoordinatorOutput,
        toPresent: Presentable?)
    
    func makeServiceScheduleCoordinatorBox(schedule: Schedule)->
        (configurator: Coordinator & ServiceScheduleCoordinatorOutput,
        toPresent: Presentable?)
    
    func makeServiceScheduleCoordinatorBox(schedule: Schedule, navController: UINavigationController?) ->
        (configurator: Coordinator & ServiceScheduleCoordinatorOutput,
        toPresent: Presentable?)
    
    func makeServiceDurationCoordinatorBox(duration: TimeInterval?) ->
        (configurator: Coordinator & ServiceDurationCoordinatorOutput,
        toPresent: Presentable?) 
    
    func makeServiceDurationCoordinatorBox(duration: TimeInterval?, navController: UINavigationController?) ->
        (configurator: Coordinator & ServiceDurationCoordinatorOutput,
        toPresent: Presentable?)
    
}

