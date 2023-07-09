// Release notes and vendor URLs
user_pref("app.releaseNotesURL", "http://127.0.0.1/");
user_pref("app.vendorURL", "http://127.0.0.1/");
user_pref("app.privacyURL", "http://127.0.0.1/");

// Disable plugin installer
user_pref("plugins.hide_infobar_for_missing_plugin", true);
user_pref("plugins.hide_infobar_for_outdated_plugin", true);
user_pref("plugins.notifyMissingFlash", false);

//Speeding it up
user_pref("network.http.pipelining", true);
user_pref("network.http.proxy.pipelining", true);
user_pref("network.http.pipelining.maxrequests", 10);
user_pref("nglayout.initialpaint.delay", 0);

// Disable third party cookies
user_pref("network.cookie.cookieBehavior", 1);

//privacy.firstparty.isolate
user_pref("privacy.firstparty.isolate", true);

// Tor
user_pref("network.proxy.socks", "127.0.0.1");
user_pref("network.proxy.socks_port", 9050);

// Extensions cannot be updated without permission
user_pref("extensions.update.enabled", false);
// Use LANG environment variable to choose locale
user_pref("intl.locale.matchOS", true);
// Allow unsigned langpacks
user_pref("extensions.langpacks.signatures.required", false);
// Disable default browser checking.
user_pref("browser.shell.checkDefaultBrowser", false);
// Prevent EULA dialog to popup on first run
user_pref("browser.EULA.override", true);
// Don't disable extensions dropped in to a system
// location, or those owned by the application
user_pref("extensions.autoDisableScopes", 3);
//user_pref("extensions.enabledScopes", 15);
// Don't display the one-off addon selection dialog when
// upgrading from a version of Firefox older than 8.0
user_pref("extensions.shownSelectionUI", true);
// Don't call home for blacklisting
user_pref("extensions.blocklist.enabled", false);

// disable app updater url
user_pref("app.update.url", "http://127.0.0.1/");

user_pref("startup.homepage_welcome_url", "");
user_pref("browser.startup.homepage_override.mstone", "ignore");

// Help URL
user_pref ("app.support.baseURL", "http://127.0.0.1/");
user_pref ("app.support.inputURL", "http://127.0.0.1/");
user_pref ("app.feedback.baseURL", "http://127.0.0.1/");
user_pref ("browser.uitour.url", "http://127.0.0.1/");
user_pref ("browser.uitour.themeOrigin", "http://127.0.0.1/");
user_pref ("plugins.update.url", "http://127.0.0.1/");
user_pref ("browser.customizemode.tip0.learnMoreUrl", "http://127.0.0.1/");

// Dictionary download user_preference
user_pref("browser.dictionaries.download.url", "http://127.0.0.1/");
user_pref("browser.search.searchEnginesURL", "http://127.0.0.1/");
user_pref("layout.spellcheckDefault", 0);

// Apturl user_preferences
user_pref("network.protocol-handler.app.apt","/usr/bin/apturl");
user_pref("network.protocol-handler.warn-external.apt",false);
user_pref("network.protocol-handler.app.apt+http","/usr/bin/apturl");
user_pref("network.protocol-handler.warn-external.apt+http",false);
user_pref("network.protocol-handler.external.apt",true);
user_pref("network.protocol-handler.external.apt+http",true);

// Quality of life stuff
user_pref("browser.startup.homepage", "seeingangelz.neocities.org"); 
user_pref("browser.download.useDownloadDir", false);
user_pref("browser.aboutConfig.showWarning", false);
user_pref("browser.toolbars.bookmarks.visibility", "never");
user_pref("browser.tabs.firefox-view", false);
user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);
user_pref("browser.urlbar.groupLabels.enabled", false);
user_pref("browser.urlbar.quicksuggest.enabled", false);
user_pref("browser.urlbar.speculativeConnect.enabled", false);
user_pref("browser.urlbar.trimURLs", false);

// Privacy & Freedom Issues
// https://webdevelopmentaid.wordpress.com/2013/10/21/customize-privacy-settings-in-mozilla-firefox-part-1-aboutconfig/
// https://panopticlick.eff.org
// http://ip-check.info
// http://browserspy.dk
// https://wiki.mozilla.org/Fingerprinting
// http://www.browserleaks.com
// http://fingerprint.pet-portal.eu
user_pref("browser.translation.engine", "");
user_pref("media.gmp-provider.enabled", false);
user_pref("browser.urlbar.update2.engineAliasRefresh", true);
user_pref("browser.newtabpage.activity-stream.feeds.topsites", false);
user_pref("browser.newtabpage.activity-stream.showSponsored", false);
user_pref("browser.newtabpage.activity-stream.showSponsoredTopSites", false);
user_pref("browser.newtabpage.activity-stream.asrouter.userprefs.cfr.addons", false);
user_pref("browser.newtabpage.activity-stream.asrouter.userprefs.cfr.features", false);
user_pref("browser.urlbar.suggest.engines", false);
user_pref("browser.urlbar.suggest.topsites", false);
user_pref("security.OCSP.enabled", 0);
user_pref("security.OCSP.require", false);
user_pref("browser.discovery.containers.enabled", false);
user_pref("browser.discovery.enabled", false);
user_pref("browser.discovery.sites", "http://127.0.0.1/");
user_pref("services.sync.prefs.sync.browser.startup.homepage", false);
user_pref("browser.contentblocking.report.monitor.home_page_url", "http://127.0.0.1/");
user_pref("dom.ipc.plugins.flash.subprocess.crashreporter.enabled", false);
user_pref("browser.safebrowsing.enabled", false);
user_pref("browser.safebrowsing.downloads.remote.enabled", false);
user_pref("browser.safebrowsing.malware.enabled", false);
user_pref("browser.safebrowsing.provider.google.updateURL", "");
user_pref("browser.safebrowsing.provider.google.gethashURL", "");
user_pref("browser.safebrowsing.provider.google4.updateURL", "");
user_pref("browser.safebrowsing.provider.google4.gethashURL", "");
user_pref("browser.safebrowsing.provider.mozilla.gethashURL", "");
user_pref("browser.safebrowsing.provider.mozilla.updateURL", "");
user_pref("browser.safebrowsing.appRepURL", "");
user_pref("browser.safebrowsing.blockedURIs.enabled", false);
user_pref("browser.safebrowsing.downloads.enabled", false);
user_pref("browser.safebrowsing.downloads.remote.url", "");
user_pref("browser.safebrowsing.phishing.enabled", false);
user_pref("browser.send_pings", false);
user_pref("browser.sessionstore.privacy_level", 0);
user_pref("services.sync.privacyURL", "http://127.0.0.1/");
user_pref("browser.newtabpage.activity-stream.feeds.telemetry", false);
user_pref("browser.ping-centre.telemetry", false);
user_pref("browser.tabs.crashReporting.sendReport", false);
user_pref("social.enabled", false);
user_pref("social.remote-install.enabled", false);
user_pref("datareporting.policy.dataSubmissionEnabled", false);
user_pref("datareporting.healthreport.uploadEnabled", false);
user_pref("datareporting.healthreport.about.reportUrl", "http://127.0.0.1/");
user_pref("datareporting.healthreport.documentServerURI", "http://127.0.0.1/");
user_pref("healthreport.uploadEnabled", false);
user_pref("social.toast-notifications.enabled", false);
user_pref("datareporting.policy.dataSubmissionEnabled", false);
user_pref("datareporting.healthreport.service.enabled", false);
user_pref("browser.slowStartup.notificationDisabled", true);
user_pref("network.http.sendRefererHeader", 2);
user_pref("network.http.referer.spoofSource", true);
// We don't want to send the Origin header
user_pref("network.http.originextension", false);
//http://grack.com/blog/2010/01/06/3rd-party-cookies-dom-storage-and-privacy/
//user_pref("dom.storage.enabled", false);
user_pref("dom.security.https_only_mode", true);
user_pref("dom.security.https_only_mode_ever_enabled", true);
user_pref("dom.event.clipboardevents.enabled",false);
user_pref("network.user_prefetch-next", false);
user_pref("network.dns.disablePrefetch", true);
user_pref("network.dns.disablePrefetchFromHTTPS", true);
user_pref("network.http.sendSecureXSiteReferrer", false);
user_pref("toolkit.telemetry.enabled", false);
user_pref("toolkit.telemetry.server", "");
user_pref("experiments.manifest.uri", ""); 
user_pref("toolkit.telemetry.unified", false);
user_pref("app.normandy.api_url", "");
user_pref("app.normandy.enabled", false);
user_pref("app.shield.optoutstudies.enabled", false);
user_pref("breakpad.reportURL", "");
user_pref("browser.cache.offline.enable", false);
user_pref("browser.crashReports.unsubmittedCheck.autoSubmit", false);
user_pref("browser.crashReports.unsubmittedCheck.autoSubmit2", false);
user_pref("browser.crashReports.unsubmittedCheck.enabled", false);
user_pref("browser.disableResetPrompt", true);
user_pref("browser.newtab.preload", false);
// Make sure updater telemetry is disabled; see <https://trac.torproject.org/25909>.
user_pref("toolkit.telemetry.updatePing.enabled", false);
// Do not tell what plugins do we have enabled: https://mail.mozilla.org/pipermail/firefox-dev/2013-November/001186.html
user_pref("plugins.enumerable_names", "");
user_pref("plugin.state.flash", 0);
// Do not autoupdate search engines
user_pref("browser.search.update", false);
// Warn when the page tries to redirect or refresh
//user_pref("accessibility.blockautorefresh", true);
user_pref("dom.battery.enabled", false);
user_pref("device.sensors.enabled", false);
user_pref("device.sensors.motion.enabled", false);
user_pref("device.sensors.orientation.enabled", false);
user_pref("device.sensors.proximity.enabled", false);
user_pref("camera.control.face_detection.enabled", false);
user_pref("camera.control.autofocus_moving_callback.enabled", false);
user_pref("network.http.speculative-parallel-limit", 0);
// No search suggestions
user_pref("browser.urlbar.userMadeSearchSuggestionsChoice", true);
user_pref("browser.search.suggest.enabled", false);
// Always ask before restoring the browsing session
user_pref("browser.sessionstore.max_resumed_crashes", 0);
// Don't ping Mozilla for MitM detection, see <https://bugs.torproject.org/32321>
user_pref("security.certerrors.mitm.priming.enabled", false);
user_pref("security.certerrors.recordEventTelemetry", false);
// Disable shield/heartbeat
user_pref("extensions.shield-recipe-client.enabled", false);
// Don't download ads for the newtab page
user_pref("browser.newtabpage.enabled", false);
user_pref("browser.newtabpage.directory.source", "");
user_pref("browser.newtabpage.directory.ping", "");
user_pref("browser.newtabpage.introShown", true);
// Always ask before restoring the browsing session
user_pref("browser.sessionstore.max_resumed_crashes", 0);
// Disable tracking protection since it makes you stick out
user_pref("privacy.trackingprotection.enabled", true);
user_pref("privacy.trackingprotection.pbmode.enabled", false);
user_pref("urlclassifier.trackingTable", "test-track-simple,base-track-digest256,content-track-digest256");
user_pref("privacy.donottrackheader.enabled", false);
user_pref("privacy.trackingprotection.introURL", "https://www.mozilla.org/%LOCALE%/firefox/%VERSION%/tracking-protection/start/");
user_pref("security.ssl.disable_session_identifiers", true);
user_pref("services.sync.prefs.sync.browser.newtabpage.activity-stream.showSponsoredTopSite", false);
user_pref("signon.autofillForms", false);
// Disable geolocation
user_pref("geo.enabled", false);
user_pref("geo.wifi.uri", "");
user_pref("browser.search.geoip.url", "");
user_pref("browser.search.geoSpecificDefaults", false);
user_pref("browser.search.geoSpecificDefaults.url", "");
user_pref("browser.search.modernConfig", false);
// Disable captive portal detection
user_pref("captivedetect.canonicalURL", "");
user_pref("network.captive-portal-service.enabled", false);
// Disable shield/heartbeat
user_pref("extensions.shield-recipe-client.enabled", false);
// Canvas fingerprint protection
// This also enables useragent spoofing
user_pref("privacy.resistFingerprinting", true);
user_pref("privacy.resistFingerprinting.letterboxing", true);
user_pref("webgl.disabled", true);
user_pref("beacon.enabled", false);
user_pref("privacy.trackingprotection.cryptomining.enabled", true);
user_pref("privacy.trackingprotection.fingerprinting.enabled", true);
user_pref("general.useragent.override", "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36");

// Services
user_pref("gecko.handlerService.schemes.mailto.0.name", "");
user_pref("gecko.handlerService.schemes.mailto.1.name", "");
user_pref("handlerService.schemes.mailto.1.uriTemplate", "");
user_pref("gecko.handlerService.schemes.mailto.0.uriTemplate", "");
user_pref("browser.contentHandlers.types.0.title", "");
user_pref("browser.contentHandlers.types.0.uri", "");
user_pref("browser.contentHandlers.types.1.title", "");
user_pref("browser.contentHandlers.types.1.uri", "");
user_pref("gecko.handlerService.schemes.webcal.0.name", "");
user_pref("gecko.handlerService.schemes.webcal.0.uriTemplate", "");
user_pref("gecko.handlerService.schemes.irc.0.name", "");
user_pref("gecko.handlerService.schemes.irc.0.uriTemplate", "");

// Disable channel updates
user_pref("app.update.enabled", false);
user_pref("app.update.auto", false);

// EME
user_pref("media.eme.enabled", false);
user_pref("media.eme.apiVisible", false);

// Firefox Accounts
user_pref("identity.fxaccounts.enabled", false);

// WebRTC
user_pref("media.peerconnection.enabled", false);
user_pref("media.navigator.enabled", false);
// Don't reveal your internal IP when WebRTC is enabled
user_pref("media.peerconnection.ice.no_host", true);
user_pref("media.peerconnection.ice.default_address_only", true);

// Use the proxy server to do DNS lookups when using SOCKS
// <http://kb.mozillazine.org/Network.proxy.socks_remote_dns>
user_pref("network.proxy.socks_remote_dns", true);

// Services
user_pref("gecko.handlerService.schemes.mailto.0.name", "");
user_pref("gecko.handlerService.schemes.mailto.1.name", "");
user_pref("handlerService.schemes.mailto.1.uriTemplate", "");
user_pref("gecko.handlerService.schemes.mailto.0.uriTemplate", "");
user_pref("browser.contentHandlers.types.0.title", "");
user_pref("browser.contentHandlers.types.0.uri", "");
user_pref("browser.contentHandlers.types.1.title", "");
user_pref("browser.contentHandlers.types.1.uri", "");
user_pref("gecko.handlerService.schemes.webcal.0.name", "");
user_pref("gecko.handlerService.schemes.webcal.0.uriTemplate", "");
user_pref("gecko.handlerService.schemes.irc.0.name", "");
user_pref("gecko.handlerService.schemes.irc.0.uriTemplate", "");
// https://kiwiirc.com/client/irc.247cdn.net/?nick=Your%20Nickname#underwater-hockey
// Don't call home for blacklisting
user_pref("extensions.blocklist.enabled", false);
 


user_pref("font.default.x-western", "sans-serif");

// Preferences for the Get Add-ons panel
user_pref ("extensions.webservice.discoverURL", "http://127.0.0.1/");
user_pref ("extensions.getAddons.search.url", "http://127.0.0.1/");
user_pref ("extensions.getAddons.search.browseURL", "http://127.0.0.1/");
user_pref ("extensions.getAddons.get.url", "http://127.0.0.1/");
user_pref ("extensions.getAddons.link.url", "http://127.0.0.1/");
user_pref ("extensions.getAddons.discovery.api_url", "http://127.0.0.1/");

user_pref ("extensions.systemAddon.update.url", "");
user_pref ("extensions.systemAddon.update.enabled", false);

// FIXME: find better URLs for these:
user_pref ("extensions.getAddons.langpacks.url", "http://127.0.0.1/");
user_pref ("lightweightThemes.getMoreURL", "http://127.0.0.1/");
user_pref ("browser.geolocation.warning.infoURL", "");
user_pref ("browser.xr.warning.infoURL", "");
user_pref ("app.feedback.baseURL", "");

// Mobile
user_pref("privacy.announcements.enabled", false);
user_pref("browser.snippets.enabled", false);
user_pref("browser.snippets.syncPromo.enabled", false);
user_pref("identity.mobilepromo.android", "http://127.0.0.1/");
user_pref("browser.snippets.geoUrl", "http://127.0.0.1/");
user_pref("browser.snippets.updateUrl", "http://127.0.0.1/");
user_pref("browser.snippets.statsUrl", "http://127.0.0.1/");
user_pref("datareporting.policy.firstRunTime", 0);
user_pref("datareporting.policy.dataSubmissionPolicyVersion", 2);
user_pref("browser.webapps.checkForUpdates", 0);
user_pref("browser.webapps.updateCheckUrl", "http://127.0.0.1/");
user_pref("app.faqURL", "http://127.0.0.1/");

// PFS url
user_pref("pfs.datasource.url", "http://127.0.0.1/");
user_pref("pfs.filehint.url", "http://127.0.0.1/");

// Disable Gecko media plugins: https://wiki.mozilla.org/GeckoMediaPlugins
user_pref("media.gmp-manager.url.override", "data:text/plain,");
user_pref("media.gmp-manager.url", "");
user_pref("media.gmp-manager.updateEnabled", false);
user_pref("media.gmp-provider.enabled", false);
// Don't install openh264 codec
user_pref("media.gmp-gmpopenh264.enabled", false);
user_pref("media.gmp-eme-adobe.enabled", false);

//Disable middle click content load
//Avoid loading urls by mistake 
user_pref("middlemouse.contentLoadURL", false);

//Disable heartbeat
user_pref("browser.selfsupport.url", "");

//Disable Link to FireFox Marketplace, currently loaded with non-free "apps"
user_pref("browser.apps.URL", "");

//Disable Firefox Hello
user_pref("loop.enabled",false);

// Use old style user_preferences, that allow javascript to be disabled
user_pref("browser.user_preferences.inContent",false);

// Disable JS in pdfs
user_pref("pdfjs.enableScripting", false);

// Don't download ads for the newtab page
user_pref("browser.newtabpage.directory.source", "");
user_pref("browser.newtabpage.directory.ping", "");
user_pref("browser.newtabpage.introShown", true);
user_pref("browser.newtabpage.activity-stream.showSponsoredTopSites", false);

// Disable home snippets
user_pref("browser.aboutHomeSnippets.updateUrl", "data:text/html");

// In <about:user_preferences>, hide "More from Mozilla"
// (renamed to "More from GNU" by the global renaming)
user_pref("browser.user_preferences.moreFromMozilla", false);

// Disable hardware acceleration
//user_pref("layers.acceleration.disabled", false);
user_pref("gfx.direct2d.disabled", true);

// Disable SSDP
user_pref("browser.casting.enabled", false);

//Disable directory service
user_pref("social.directories", "");

// Don't report TLS errors to Mozilla
user_pref("security.ssl.errorReporting.enabled", false);

// Crypto hardening
// https://gist.github.com/haasn/69e19fc2fe0e25f3cff5
//General settings
user_pref("security.tls.unrestricted_rc4_fallback", false);
user_pref("security.tls.insecure_fallback_hosts.use_static_list", false);
user_pref("security.tls.version.min", 1);
user_pref("security.ssl.require_safe_negotiation", false);
user_pref("security.ssl.treat_unsafe_negotiation_as_broken", true);
user_pref("security.ssl3.rsa_seed_sha", true);

// Avoid logjam attack
user_pref("security.ssl3.dhe_rsa_aes_128_sha", false);
user_pref("security.ssl3.dhe_rsa_aes_256_sha", false);
user_pref("security.ssl3.dhe_dss_aes_128_sha", false);
user_pref("security.ssl3.dhe_rsa_des_ede3_sha", false);
user_pref("security.ssl3.rsa_des_ede3_sha", false);

// Disable Pocket integration
user_pref("browser.pocket.enabled", false);
user_pref("extensions.pocket.enabled", false);

// Disable More from Mozilla
user_pref("browser.preferences.moreFromMozilla", false);

// enable extensions by default in private mode
user_pref("extensions.allowPrivateBrowsingByDefault", true);

// Do not show unicode urls https://www.xudongz.com/blog/2017/idn-phishing/
user_pref("network.IDN_show_punycode", true);

// disable screenshots extension
user_pref("extensions.screenshots.disabled", true);
// disable onboarding
user_pref("browser.onboarding.newtour", "performance,private,addons,customize,default");
user_pref("browser.onboarding.updatetour", "performance,library,singlesearch,customize");
user_pref("browser.onboarding.enabled", false);

// New tab settings
user_pref("browser.newtabpage.activity-stream.showTopSites",false);
user_pref("browser.newtabpage.activity-stream.feeds.section.topstories",false);
user_pref("browser.newtabpage.activity-stream.feeds.snippets",false);
user_pref("browser.newtabpage.activity-stream.disableSnippets", true);
user_pref("browser.newtabpage.activity-stream.tippyTop.service.endpoint", "");

// Enable xrender
user_pref("gfx.xrender.enabled",true);

// Disable push notifications 
user_pref("dom.webnotifications.enabled",false); 
user_pref("dom.webnotifications.serviceworker.enabled",false); 
user_pref("dom.push.enabled",false); 

// Disable recommended extensions
user_pref("browser.newtabpage.activity-stream.asrouter.useruser_prefs.cfr", false);
user_pref("extensions.htmlaboutaddons.discover.enabled", false);
user_pref("extensions.htmlaboutaddons.recommendations.enabled", false);

// Disable the settings server
user_pref("services.settings.server", "");

// Disable use of WiFi region/location information
user_pref("browser.region.network.scan", false);
user_pref("browser.region.network.url", "");

// Disable VPN/mobile promos
user_pref("browser.contentblocking.report.hide_vpn_banner", true);
user_pref("browser.contentblocking.report.mobile-ios.url", "");
user_pref("browser.contentblocking.report.mobile-android.url", "");
user_pref("browser.contentblocking.report.show_mobile_app", false);
user_pref("browser.contentblocking.report.vpn.enabled", false);
user_pref("browser.contentblocking.report.vpn.url", "");
user_pref("browser.contentblocking.report.vpn-promo.url", "");
user_pref("browser.contentblocking.report.vpn-android.url", "");
user_pref("browser.contentblocking.report.vpn-ios.url", "");
user_pref("browser.privatebrowsing.promoEnabled", false);
