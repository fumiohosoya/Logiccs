Rails.application.routes.draw do
  
#follow 3 lines for admin loginsession  
  get  'admin', to: 'admin#new'
  post 'admin', to: 'admin#create'
  delete 'admin', to: 'admin#destroy'

  get  'adminpanel', to: 'admin#index'
  get  'newadmin', to: "admin#newadmin"
  post 'createadmin', to: "admin#createadmin"
  get  'admin_setuser', to: "admin#setuser"
  get  'listadmin', to: "admin#listadmin"
  resources :admin do 
    member do
      delete "destroyadmin"
    end
  end
    
  

  
  get 'new/trackhistories'
  
  get 'vehicle_kartes/home'
  get 'vehicle_kartes', to: 'vehicle_kartes#home'
  get 'vehicle_kartes/show'
  
  get  'vehicle_kartes/:id/order',  to: 'vehicle_kartes#order', as: 'karte_pdf'
  
  get 'static_pages/home'
  
  root to: 'static_pages#home'
  get     'list',   to: 'static_pages#list'
  get     'signup', to: 'users#new'
  get     'login' , to: 'sessions#new'
  post    'login' , to: 'sessions#create'
  delete  'logout', to: 'sessions#destroy'
  
  get     'dlogin', to: 'dsessions#new'
  post    'dlogin', to: 'dsessions#create'
  delete  'dlogout', to: 'dsessions#destroy'
  
  
  resources :dealerusers
  
  resources :users do
    member do
      get 'dashboard'
      get 'list'
      get 'trailerlist'
      get 'admin_setuser'
    end
  end
  
    
  get  'tireadminpanel/:id',  to: "tireadmins#list", as: 'tireadminpanel'
  get  'newtireadmin', to: "admin#newtireadmin"
  post 'createtireadmin', to: "admin#createtireadmin"
  get  'edittireadmin/:id', to: "admin#edittireadmin", as: "edittireadmin"
  put  'updatetireadmin/:id', to: "admin#updatetireadmin"
  patch  'updatetireadmin/:id', to: "admin#updatetireadmin", as: "updatetireadmin"
  get   'listtireadmin', to: "admin#listtireadmin"
  delete 'deletetireadmin/:id', to: "admin#deletetireadmin", as: 'deletetireadmin'
  #delete 'tireadmin', to: 'tireadmins#destroy'
  #get  'tireadminpanel/:id',  to: "tireadmins#list", as: 'tireadminpanel'
  get  'tireadmin', to: "tireadmins#new"
  post 'tireadmin', to: "tireadmins#create"
  resources :tireadmins do
    member do
      get 'dashboard'
      get 'list'
    end
  end
  
  delete  'tireadminlogout', to: 'tireadmins#destroy', as: "tireadminlogout"
 
  
  get     '/companies/all', to: 'companies#all'
  resources :companies

  get     '/branches/:id/all', to: 'branches#all'
  resources :branches

  get     '/trucks/:branch_id/all', to: 'trucks#all'
  get     '/trucks/:id/json', to: 'trucks#json'
  get     '/trucks/numbershow', to: 'trucks#numbershow'
  resources :trucks do
    member do
      get 'record'
      get 'initset'
      post 'recordinit'
      get  'tirerotation'
      get  'adjust'
      post 'adjust'
      get  'adjustmileage'
    end
  end
  resources :truckrelationships,  only: [:create, :destroy]
  resources :truckhistories,      only: [:create, :index, :destroy]

  resources :maintains

  get     '/trailers/:branch_id/all', to: 'trailers#all'

  resources :trailers do
    member do
      get  'karte'
      get  'karteB'
    end
  end
  resources :trailerrelationships,  only: [:create, :destroy]


  resources :maintains,           only: [:create]

  resources :tirehistories
  resources :trailertirehistories
  
  resources :adhoc_truck_rts
  resources :adhoc_trailer_rts

  resources :partscosts
  resources :laborcosts
  
  get 'kartes/:id'   => 'vehicle_kartes#karte', as: :karte
  get 'bookings/:id' => 'vehicle_kartes#booking', as: :booking
  
  post 'branches/update_branch_usermenus' => 'branches#update_branch_usermenus', as: :branch_usermenus
  post 'branches/update_branch_truckmenus' => 'branches#update_branch_truckmenus', as: :branch_truckmenus
  post 'branches/update_branch_trailermenus' => 'branches#update_branch_trailermenus', as: :branch_trailermenus
  post 'branches/update_branch_tireadminmenus' => 'branches#update_branch_tireadminmenus', as: :branch_tireadminmenus

  post 'dealerbranches/update_branch_usermenus' => 'dealerbranches#update_branch_usermenus', as: :dealerbranch_usermenus

  post 'trucks/params_copy' => "trucks#params_copy"
  
  resources :oilprices
  resources :loginotes
  
  resources :dealercompanies
  resources :dealerbranches
  resources :dealerusers
  resources :approvers
  
  #resources :bookings, only: [:create, :destroy]
  
  get '/sendbookings/:truck_id' => 'sendbookings#create', as: :sendbooking
  
  
  get '/approve' => 'sendbookings#approve', as: :approve
  patch '/approveOK' => 'sendbookings#approveOK', as: :approve_ok
  patch '/approveCancel' => 'sendbookings#approveCancel', as: :approve_cancel
  
  
  get '/access' => 'logithreads#access', as: :access
  get '/confirm/:id' => "logithreads#confirm", as: :confirm
  
  resources :logithreads do
    member do
      resources :logiposts
    end
  end
end
  