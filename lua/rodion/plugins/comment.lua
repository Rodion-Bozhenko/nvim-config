local setup, comment = pcall(require, "Comment")
if not setup then
	return
end

comment.setup({
	--	pre_hook = function(ctx)
	-- 	return require("Comment.jsx").calculate(ctx)
	-- end,
})
