local HttpService = game:GetService("HttpService")

type FetchOptions = {
    content_type: Enum.HttpContentType?, 
    headers: Dictionary<any>?, 
    body: Dictionary<any>?, 
    compress: boolean?, 
}

return function (url: string, options: FetchOptions)


    print(options)

local success,result = pcall(function()
    return HttpService:PostAsync(url, options.body or {}, options.content_type or Enum.HttpContentType.ApplicationJson, options.compress or false, options.headers or {})			
end)

if success then
    return result
else
    return error(result)
end

end