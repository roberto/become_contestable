require "action_pack"

require "action_controller/test_case"
require "action_controller/test_process"
require "action_view/test_case"

ActionController::Base.view_paths = [ File.dirname(__FILE__) + "/../views" ]
