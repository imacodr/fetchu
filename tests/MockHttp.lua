return function(callback: () -> any)
	_G.MockedHttpService = {}

	function _G.MockedHttpService:GetAsync(url: string, nocache: boolean, headers: any)
		return callback()
	end

	function _G.MockedHttpService:PostAsync(
		url: string,
		data: string,
		content_type: Enum.HttpContentType,
		compress: boolean,
		headers: any
	) end
end
