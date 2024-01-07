# Pin npm packages by running ./bin/importmap

pin 'application'
pin '@hotwired/turbo-rails', to: 'turbo.min.js', preload: true
pin '@hotwired/stimulus', to: 'stimulus.min.js'
pin '@hotwired/stimulus-loading', to: 'stimulus-loading.js'
pin_all_from 'app/javascript/controllers', under: 'controllers'
pin 'flowbite', to: 'https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.2.1/flowbite.turbo.min.js'
pin 'stimulus-notification' # @2.2.0
pin 'hotkeys-js' # @3.13.3
pin 'stimulus-use' # @0.51.3
