module WhereUnlessBlank
  class Engine < ::Rails::Engine
    initializer "where_unless_blank" do
      ActiveRecord::Base.send(:include, WhereUnlessBlank)
    end
  end
end