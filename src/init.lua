--!strict

--[[
    Lightweight package made for easier request handling.
]]

local HttpService = game:GetService("HttpService")

local fetchu = {}


local Promise = require(script.modules.promise)

type GetOptions = {
    headers: any?, 
    nocache: boolean?
}

type PostOptions = {
    content_type: Enum.HttpContentType?, 
    headers: Dictionary<any>?, 
    body: Dictionary<any>?, 
    compress: boolean?, 
}

fetchu.json = function(input: table)
    HttpService:JSONEncode(input)
end

fetchu.tablefy = function(json: string)
    HttpService:JSONDecode(json)
end

fetchu.get = function (url: string, options: GetOptions?)
    return Promise.new(function(resolve)
        if not url then
            return error("No request URL has been passed.")
        end
            resolve(require(script.Get)(url, {options.nocache, options.headers}))
    end)
end

fetchu.post = function (url: string, options: PostOptions?)
    return Promise.new(function(resolve)
        if not url then
            return error("No request URL has been passed.")
        end    
            resolve(require(script.Post)(url, {options.body, options.content_type, options.compress, options.headers}))
    end)
end

return fetchu