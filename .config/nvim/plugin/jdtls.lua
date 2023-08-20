local java_cmds = vim.api.nvim_create_augroup("java_cmds", { clear = true })
local cache_vars = {}

-- `nvim-jdtls` will look for these files/folders
-- to determine the root directory of your project
local root_files = {
	".git",
	"mvnw",
	"gradlew",
	"pom.xml",
	"build.gradle",
}
-- gets all the paths needed to start the LSP server
local function get_jdtls_paths()
	if cache_vars.paths then
		return cache_vars.paths
	end

	local path = {}

	path.data_dir = vim.fn.stdpath("cache") .. "/nvim-jdtls"

	local jdtls_install = require("mason-registry").get_package("jdtls"):get_install_path()

	path.java_agent = jdtls_install .. "/lombok.jar"
	path.launcher_jar = vim.fn.glob(jdtls_install .. "/plugins/org.eclipse.equinox.launcher_*.jar")
	path.platform_config = jdtls_install .. "/config_mac"

	path.bundles = {}

	path.runtimes = {
		-- Note: the field `name` must be a valid `ExecutionEnvironment`,
		-- you can find the list here:
		-- https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
		--
		-- This example assume you are using sdkman: https://sdkman.io
		-- {
		--   name = 'JavaSE-17',
		--   path = vim.fn.expand('~/.sdkman/candidates/java/17.0.6-tem'),
		-- },
		-- {
		--   name = 'JavaSE-18',
		--   path = vim.fn.expand('~/.sdkman/candidates/java/18.0.2-amzn'),
		-- },
	}

	cache_vars.paths = path

	return path
end

-- executed everytime jdtls attaches to a file; contains keybindings
local function jdtls_on_attach(client, bufnr) end

local function jdtls_setup(event)
	local jdtls = require("jdtls")

	local path = get_jdtls_paths()
	local data_dir = path.data_dir .. "/" .. vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")

	if cache_vars.capabilities == nil then
		jdtls.extendedClientCapabilities.resolveAdditionalTextEditsSupport = true

		local ok_cmp, cmp_lsp = pcall(require, "cmp_nvim_lsp")
		cache_vars.capabilities = vim.tbl_deep_extend(
			"force",
			vim.lsp.protocol.make_client_capabilities(),
			ok_cmp and cmp_lsp.default_capabilities() or {}
		)
	end

	-- The command that starts the language server
	-- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
	local cmd = {
		"java",

		"-Declipse.application=org.eclipse.jdt.ls.core.id1",
		"-Dosgi.bundles.defaultStartLevel=4",
		"-Declipse.product=org.eclipse.jdt.ls.core.product",
		"-Dlog.protocol=true",
		"-Dlog.level=ALL",
		"-javaagent:" .. path.java_agent,
		"-Xms1g",
		"--add-modules=ALL-SYSTEM",
		"--add-opens",
		"java.base/java.util=ALL-UNNAMED",
		"--add-opens",
		"java.base/java.lang=ALL-UNNAMED",

		"-jar",
		path.launcher_jar,

		"-configuration",
		path.platform_config,

		"-data",
		data_dir,
	}

	local lsp_settings = {
		java = {
			-- jdt = {
			--   ls = {
			--     vmargs = "-XX:+UseParallelGC -XX:GCTimeRatio=4 -XX:AdaptiveSizePolicyWeight=90 -Dsun.zip.disableMemoryMapping=true -Xmx1G -Xms100m"
			--   }
			-- },
			eclipse = {
				downloadSources = true,
			},
			configuration = {
				updateBuildConfiguration = "interactive",
				runtimes = path.runtimes,
			},
			maven = {
				downloadSources = true,
			},
			implementationsCodeLens = {
				enabled = true,
			},
			referencesCodeLens = {
				enabled = true,
			},
			-- inlayHints = {
			--   parameterNames = {
			--     enabled = 'all' -- literals, all, none
			--   }
			-- },
			format = {
				enabled = true,
				-- settings = {
				--   profile = 'asdf'
				-- },
			},
		},
		signatureHelp = {
			enabled = true,
		},
		completion = {
			favoriteStaticMembers = {
				"org.hamcrest.MatcherAssert.assertThat",
				"org.hamcrest.Matchers.*",
				"org.hamcrest.CoreMatchers.*",
				"org.junit.jupiter.api.Assertions.*",
				"java.util.Objects.requireNonNull",
				"java.util.Objects.requireNonNullElse",
				"org.mockito.Mockito.*",
			},
		},
		contentProvider = {
			preferred = "fernflower",
		},
		extendedClientCapabilities = jdtls.extendedClientCapabilities,
		sources = {
			organizeImports = {
				starThreshold = 9999,
				staticStarThreshold = 9999,
			},
		},
		codeGeneration = {
			toString = {
				template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
			},
			useBlocks = true,
		},
	}

	-- This starts a new client & server,
	-- or attaches to an existing client & server depending on the `root_dir`.
	jdtls.start_or_attach({
		cmd = cmd,
		settings = lsp_settings,
		on_attach = jdtls_on_attach,
		capabilities = cache_vars.capabilities,
		root_dir = jdtls.setup.find_root(root_files),
		flags = {
			allow_incremental_sync = true,
		},
		init_options = {
			bundles = path.bundles,
		},
	})
end

vim.api.nvim_create_autocmd("FileType", {
	group = java_cmds,
	pattern = { "java" },
	desc = "Setup jdtls",
	callback = jdtls_setup,
})
