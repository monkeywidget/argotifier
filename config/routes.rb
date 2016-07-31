Rails.application.routes.draw do
  # TODO BRING BACK for v2.0
    # match '/pager', :to => redirect('/public/pager.html')

    # this has to go ABOVE the default!

  # TODO BRING BACK for v2.0
    # match 'words/count' => 'words#count', :via => :get
    # match 'translated_words/by_translation/:translation' => 'translated_words#show_by_translation', :via => :get
    # match 'translated_words/by_original_word/:wordtext' => 'translated_words#show_by_original_word', :via => :get

    # default: does the other RESTful routes
    resources :words
    resources :translated_words
    resources :sentences
    resources :paragraphs
    resources :documents

    resources :pages, :only => [:show]  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
