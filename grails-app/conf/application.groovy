

// Added by the Spring Security Core plugin:
grails.plugin.springsecurity.userLookup.userDomainClassName = 'FilmApp.auth.User'
grails.plugin.springsecurity.userLookup.authorityJoinClassName = 'FilmApp.auth.UserRole'
grails.plugin.springsecurity.authority.className = 'FilmApp.auth.Role'
grails.plugin.springsecurity.successHandler.defaultTargetUrl = '/home/index'
grails.plugin.springsecurity.successHandler.alwaysUseDefault = true
grails.plugin.springsecurity.adh.errorPage = '/login/denied'
grails.plugin.springsecurity.controllerAnnotations.staticRules = [
	[pattern: '/',               access: ['permitAll']],
	[pattern: '/error',          access: ['permitAll']],
	[pattern: '/index',          access: ['permitAll']],
	[pattern: '/index.gsp',      access: ['permitAll']],
	[pattern: '/shutdown',       access: ['permitAll']],
	[pattern: '/assets/**',      access: ['permitAll']],
	[pattern: '/**/js/**',       access: ['permitAll']],
	[pattern: '/**/css/**',      access: ['permitAll']],
	[pattern: '/**/images/**',   access: ['permitAll']],
	[pattern: '/**/favicon.ico', access: ['permitAll']],
	[pattern: '/home/**', access: ['permitAll']],
    [pattern: '/film/**', access: ['permitAll']],
    [pattern: '/genre/**', access: ['ROLE_ADMIN']],
    [pattern: '/studio/**', access: ['ROLE_ADMIN']]
]

grails.plugin.springsecurity.filterChain.chainMap = [
	[pattern: '/assets/**',      filters: 'none'],
	[pattern: '/**/js/**',       filters: 'none'],
	[pattern: '/**/css/**',      filters: 'none'],
	[pattern: '/**/images/**',   filters: 'none'],
	[pattern: '/**/favicon.ico', filters: 'none'],
	[pattern: '/**',             filters: 'JOINED_FILTERS']
]

