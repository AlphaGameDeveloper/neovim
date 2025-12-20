-- Dumb plugin to show Wakatime time in the status bar.
-- Stupid how the actual plugin doesn't have this built in!
--
-- Requires the Wakatime CLI to be installed and configured.

local M = {}
M.time = "loading..."

local function update_wakatime()
    vim.fn.jobstart("~/.wakatime/wakatime-cli --today", {
        on_stdout = function(_, data, _)
            for _, line in ipairs(data) do
                if line ~= "" then
                    M.time = line
                    break
                end
            end
        end,
    })
end

function M.component()
    --vim.notify("Wakatime component called", vim.log.levels.DEBUG, {
    --    title = "Wakatime",
    -- })
    return M.time
end

---@diagnostic disable-next-line: undefined-field
local timer = vim.loop.new_timer()

timer:start(
    0,
    30000,
    vim.schedule_wrap(function()
        update_wakatime()
    end)
)
-- Initial update_wakatime
vim.schedule(function()
    update_wakatime()
end)

return {
    "wakatime-status-bar",
    virtual = true,
    component = M.component,
}
