require 'rails/railtie'
require 'virtual_view/active_record/base'

module VirtualView
  class Railtie < Rails::Railtie
    initializer 'virtual_view.load' do |_app|
      ActiveSupport.on_load(:active_record) do
        ::ActiveRecord::Base.include(VirtualView::ActiveRecord::Base)
      end
    end
  end
end
