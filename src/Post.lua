local HttpService = game:GetService("HttpService")

export type FetchOptions = {
    content_type: Enum.HttpContentType?,
    headers: Dictionary<any>?,
    body: Dictionary<any>,
    compress: boolean?,
}

return function (url: string, options: FetchOptions)
    local success,result = pcall(function()
        local body = HttpService:JSONEncode(options.body)
        return HttpService:PostAsync(url, body, options.content_type or Enum.HttpContentType.ApplicationJson, options.compress or false, options.headers or {})			
    end)

    if not success then
        return error(result)
    end

    return result
end