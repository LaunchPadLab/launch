module Launch
  class Engine < ::Rails::Engine
    isolate_namespace Launch

    initializer "launch.assets.precompile" do |app|
      app.config.assets.precompile += %w(
        launch/icons/*
      )
    end
  end
end
