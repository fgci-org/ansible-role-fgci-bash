-- -*- lua -*-
-- vim:ft=lua:et:ts=4

-- Remember that you have to set the following environment variable:
-- export LMOD_PACKAGE_PATH=/appl/opt/lmod/apps

require("sandbox")

local Dbg = require("Dbg")
local Hook = require("Hook")

local dbg = Dbg:dbg()

sitePkgRoot = os.getenv("LMOD_PKG_ROOT") or "/appl/opt/lmod/apps"

-- ---------------------------------------------------------------------------
-- Module load usage logging using load hook
-- ---------------------------------------------------------------------------
function load_hook(t)
   dbg.start{"load_hook(t)"}
   if (mode() ~= "load") then return end
   local user = os.getenv("USER")
   local jobid = os.getenv("SLURM_JOB_ID") or "interactive"
   dbg.print{"user: ", user, "jobid: ", jobid, "\n"}
   local msg = string.format("user=%s,module=%s,job=%s", user,
                             t.modFullName, jobid)
   local cmd = "logger -t lmod " .. msg
   os.execute(cmd)
   dbg.fini()
end

Hook.register("load", load_hook)

sandbox_registration{ print = print,
                      load_hook = load_hook }

