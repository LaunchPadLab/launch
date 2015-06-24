require "launch/engine"
require "cells"
require "cells-erb"
require "launch/helper"

ActiveSupport.on_load(:action_view) { include Launch::Helper }

module Launch
end
