--!strict

--[[
    Lightweight package made for easier request handling.
]]

local Promise = require(script.modules.promise)

type FetchOptions = {
    method: string?, 
    content_type: Enum.HttpContentType?, 
    headers: {}?, 
    body: {}?, 
    compress: boolean?, 
    nocache: boolean?
}



return function (url: string, options: FetchOptions?)
    return Promise.new(function(resolve)
        if not url then
            return error("No request URL has been passed.")
        end
    
        local method = (options and options.method) or "GET"

        if method == "POST" then
            resolve(require(script.Post)(url, {options.body, options.content_type, options.compress, options.headers}))
        else
            resolve(require(script.Get)(url, {options.nocache, options.headers}))
        end
    end)
end