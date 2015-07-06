require "launch/engine"
require "launch/helper"

ActiveSupport.on_load(:action_view) { include Launch::Helper }

module Launch
end
