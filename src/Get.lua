local HttpService = game:GetService("HttpService")

export type FetchOptions = {
    headers: Dictionary<any>?, 
    nocache: boolean?
}

return function (url: string, options: FetchOptions)
    local success,result = pcall(function()
        return HttpService:GetAsync(url, (options and options.nocache) or false, (options and options.headers) or nil)		
    end)

    if not success then
        return error(result)
    end

    return result
end