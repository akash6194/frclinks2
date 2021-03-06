# Copyright 2017 Patrick Fairbank. All Rights Reserved.
# @author pat@patfairbank.com (Patrick Fairbank)
#
# Script for starting/stopping the FRCLinks server.

require "bundler/setup"
require "daemons"
require "pathological"
require "thin"

pwd = Dir.pwd
Daemons.run_proc("frclinks_server", :monitor => true) do
  Dir.chdir(pwd)  # Fix working directory after daemons sets it to /.
  require "frclinks_server"

  Thin::Server.start("0.0.0.0", CheesyCommon::Config.port, FrcLinks::Server)
end
