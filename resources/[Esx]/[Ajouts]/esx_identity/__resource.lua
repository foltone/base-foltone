resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description 'ESX Identity'

version '1.1.0'

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'@es_extended/locale.lua',
	'server/main.lua'
}

client_scripts {
	'@es_extended/locale.lua',
	'client/main.lua'
}

ui_page 'html/index.html'

files {
	'html/index.html',
	'html/css/bootstrap.min.css',
	'html/css/custom.css',
	'html/css/fontawesome-all.min.css',
	'html/css/style.css',
	'html/font/flaticon.css',
	'html/font/Flaticon.eot',
	'html/font/Flaticon.svg',
	'html/font/Flaticon.woff',
	'html/font/Flaticon.woff2',
	'html/font/Flaticond41d.eot',
	'html/img/background.jpg',
	'html/img/logo.png',
	'html/js/bootstrap.min.js',
	'html/js/imagesloaded.pkgd.min.js',
	'html/js/jquery-3.5.0.min.js',
	'html/js/main.js',
	'html/js/popper.min.js',
	'html/js/script.js',
	'html/js/validator.min.js',
	'html/webfonts/fa-brands-400.eot',
	'html/webfonts/fa-brands-400.html',
	'html/webfonts/fa-brands-400.ttf',
	'html/webfonts/fa-brands-400.woff',
	'html/webfonts/fa-brands-400.woff2',
	'html/webfonts/fa-brands-400d41d.eot',
	'html/webfonts/fa-regular-400.eot',
	'html/webfonts/fa-regular-400.html',
	'html/webfonts/fa-regular-400.ttf',
	'html/webfonts/fa-regular-400.woff',
	'html/webfonts/fa-regular-400.woff2',
	'html/webfonts/fa-regular-400d41d.eot',
	'html/webfonts/fa-solid-900.eot',
	'html/webfonts/fa-solid-900.html',
	'html/webfonts/fa-solid-900.ttf',
	'html/webfonts/fa-solid-900.woff',
	'html/webfonts/fa-solid-900.woff2',
	'html/webfonts/fa-solid-900d41d.eot'
}

dependency 'es_extended'