local dap_setup, dap = pcall(require, "dap")
if not dap_setup then
	return
end

dap.adapters.cppdbg = {
	id = "cppdbg",
	type = "executable",
	command = "/Users/rohan/cpptools/extension/debugAdapters/bin/OpenDebugAD7",
}

dap.configurations.cpp = {
	{
		name = "C/C++: clang++ build and debug active file",
		type = "cppdbg",
		request = "launch",
		MIMode = "lldb",
		stopAtEntry = true,
		cwd = "${workspaceFolder}",
		externalConsole = true,
		program = function()
			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
		end,
	},
}
