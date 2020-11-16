test: neorocks
	# nvim --headless -c 'lua require("plenary.test_harness"):test_directory("luaunit", "./tests/plenary/lu/")'
	nvim --headless -u 'scripts/minimal.vim' -c 'lua require("plenary.test_harness"):test_directory("busted", "./tests/plenary/bu/")'

neorocks:
	nvim -u scripts/minimal.vim --noplugin -c 'lua require("plenary.neorocks").setup(true)' --headless
	nvim --headless -u 'scripts/minimal.vim' -c 'lua require("plenary.neorocks").install("penlight")'
