-- Changes to loaded plugins and DAP configurations go here

-- =============================================================================
-- Options are
-- =============================================================================

-- C#: Debugging
-- -----------------------------------------------------------------------------
-- -- either define a ProcessName you don't need the full name just part of it.
-- vim.g.CsharpDebugTargetProcessSearch = "your_application";

-- -- Or overide the "Attach - config, with your won
--
-- require("dap").configurations.cs = {
--
--     {
--         name = "launch - netcoredbg",
--         type = "coreclr",
--         request = "launch",
--
--         program = vim.fn.getcwd() .. "/path/to/your_application.dll"
--      },
--
-- }
