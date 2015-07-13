module Launch
  class Engine < ::Rails::Engine
    isolate_namespace Launch

    initializer 'launch.assets.precompile' do |app|
      %w(stylesheets javascripts images).each do |sub|
        app.config.assets.paths << root.join('app', 'assets', sub).to_s
      end
      app.config.assets.precompile << %r(\.(?:png|svg|gif)$)
    end
  end
end
