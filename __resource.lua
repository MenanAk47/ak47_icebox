resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'
ui_page "nui/ui.html"

client_scripts {
	"config.lua",
	"client/utils.lua",
	"client/main.lua",
	"client/job.lua",

	"locales/locale.lua",
	"locales/en.lua",
}

server_scripts {
	"@mysql-async/lib/MySQL.lua",
	"config.lua",
	"server/utils.lua",
	"server/main.lua",
	"server/job.lua",

	"locales/locale.lua",
	"locales/en.lua",
}

files {
	"nui/**/*",
}