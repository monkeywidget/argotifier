# frozen_string_literal: true
# Routes, in order:
Rails.application.routes.draw do
  # this has to go ABOVE the default!
  match 'words/count' => 'words#count', :via => :get
  match 'translated_words/by_translation/:translation' => 'translated_words#show_by_translation', :via => :get
  match 'translated_words/by_original_word/:wordtext' => 'translated_words#show_by_original_word', :via => :get

  # default: does the other RESTful routes
  resources :words
  # resources :translated_words
  # resources :sentences
  # resources :paragraphs
  # resources :documents
end
