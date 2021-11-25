local HttpService = game:GetService("HttpService")

type FetchOptions = {
    method: string?, 
    content_type: Enum.HttpContentType?, 
    headers: {}?, 
    body: {}?, 
    compress: boolean?, 
    nocache: boolean?
}

return function (url: string, options: FetchOptions)

local success,result = pcall(function()
    return HttpService:GetAsync(url, options.nocache or false, options.headers or {})			
end)

if success then
    return result
else
    return error(result)
end

end