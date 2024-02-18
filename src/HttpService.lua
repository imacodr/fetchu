if not _G.MockedHttpService then
	return game:GetService("HttpService")
end

return _G.MockedHttpService
