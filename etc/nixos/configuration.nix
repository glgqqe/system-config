{ config, pkgs, lib, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./happ-nixos/happ-module.nix
    ];

  # Bootloader.
  boot = {
  	kernelPackages = pkgs.linuxPackages_zen;
  	loader = {
  		efi.canTouchEfiVariables = true;
  		timeout = 0;
  		grub = {
  			enable = true;
  			device = "nodev";
  			efiSupport = true;
  			gfxmodeEfi = "1600x900";
  			gfxmodeBios = "1600x900";
  			splashImage = null;
  		}; 
    };
    plymouth = {
    	enable = true;
    	theme = "blahaj";
    	themePackages = with pkgs; [
    		plymouth-blahaj-theme
    	];
    };
    consoleLogLevel = 3;
    initrd.kernelModules = [ "i915" ];
    initrd.systemd.enable = true;
    initrd.verbose = false;
    kernelParams = [
    	"quiet"
    	"rd.udev.log_level=3"
    	"rd..systemd.show_status=auto"
    	"i915.fastboot=1"
    ];
  };
  
  networking.hostName = "thinkpad"; # Define your hostname.
  networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.extraHosts = ''
  	### dns.geohide.ru: hosts file
  	# Последнее обновление: 15 июня 2026
  	# Домены взяты из этих источников:
  	# https://dns.geohide.ru:8443
  	# https://info.dns.malw.link/hosts
  	# https://iplist.opencck.org/ru
  	# https://freedom.mafioznik.xyz/file/hosts
  	# Только эти серверы принадлежат GeoHide DNS:
  	# 45.155.204.190
  	# 37.230.192.51
  	# 31.25.239.132
  	# В итоговом hosts указанно меньше сайтов чем проксируется через DNS.
  	
  	# ChatGPT (OpenAI)
  	45.155.204.190 ab.chatgpt.com
  	37.230.192.51 ab.chatgpt.com
  	45.155.204.190 android.chat.openai.com
  	37.230.192.51 android.chat.openai.com
  	45.155.204.190 api.chatgpt.com
  	37.230.192.51 api.chatgpt.com
  	45.155.204.190 api.openai.com
  	37.230.192.51 api.openai.com
  	45.155.204.190 arena.openai.com
  	37.230.192.51 arena.openai.com
  	45.155.204.190 auth.openai.com
  	37.230.192.51 auth.openai.com
  	45.155.204.190 auth0.openai.com
  	37.230.192.51 auth0.openai.com
  	45.155.204.190 beta.api.openai.com
  	37.230.192.51 beta.api.openai.com
  	45.155.204.190 beta.openai.com
  	37.230.192.51 beta.openai.com
  	45.155.204.190 blog.openai.com
  	37.230.192.51 blog.openai.com
  	45.155.204.190 cdn.auth0.com
  	37.230.192.51 cdn.auth0.com
  	45.155.204.190 cdn.oaistatic.com
  	37.230.192.51 cdn.oaistatic.com
  	45.155.204.190 cdn.openai.com
  	37.230.192.51 cdn.openai.com
  	45.155.204.190 cdn.platform.openai.com
  	37.230.192.51 cdn.platform.openai.com
  	45.155.204.190 chat.openai.com
  	37.230.192.51 chat.openai.com
  	45.155.204.190 chatgpt-async-webps-prod-centralus-0.chatgpt.com
  	37.230.192.51 chatgpt-async-webps-prod-centralus-0.chatgpt.com
  	45.155.204.190 chatgpt-async-webps-prod-centralus-1.chatgpt.com
  	37.230.192.51 chatgpt-async-webps-prod-centralus-1.chatgpt.com
  	45.155.204.190 chatgpt-async-webps-prod-centralus-2.chatgpt.com
  	37.230.192.51 chatgpt-async-webps-prod-centralus-2.chatgpt.com
  	45.155.204.190 chatgpt-async-webps-prod-centralus-3.chatgpt.com
  	37.230.192.51 chatgpt-async-webps-prod-centralus-3.chatgpt.com
  	45.155.204.190 chatgpt-async-webps-prod-centralus-4.chatgpt.com
  	37.230.192.51 chatgpt-async-webps-prod-centralus-4.chatgpt.com
  	45.155.204.190 chatgpt-async-webps-prod-centralus-5.chatgpt.com
  	37.230.192.51 chatgpt-async-webps-prod-centralus-5.chatgpt.com
  	45.155.204.190 chatgpt-async-webps-prod-eastus-0-9e29c0310a29a59b.chatgpt.com
  	37.230.192.51 chatgpt-async-webps-prod-eastus-0-9e29c0310a29a59b.chatgpt.com
  	45.155.204.190 chatgpt-async-webps-prod-eastus-0.chatgpt.com
  	37.230.192.51 chatgpt-async-webps-prod-eastus-0.chatgpt.com
  	45.155.204.190 chatgpt-async-webps-prod-eastus-1-9e29c0310a29a59b.chatgpt.com
  	37.230.192.51 chatgpt-async-webps-prod-eastus-1-9e29c0310a29a59b.chatgpt.com
  	45.155.204.190 chatgpt-async-webps-prod-eastus-1.chatgpt.com
  	37.230.192.51 chatgpt-async-webps-prod-eastus-1.chatgpt.com
  	45.155.204.190 chatgpt-async-webps-prod-eastus-2-9e29c0310a29a59b.chatgpt.com
  	37.230.192.51 chatgpt-async-webps-prod-eastus-2-9e29c0310a29a59b.chatgpt.com
  	45.155.204.190 chatgpt-async-webps-prod-eastus-2.chatgpt.com
  	37.230.192.51 chatgpt-async-webps-prod-eastus-2.chatgpt.com
  	45.155.204.190 chatgpt-async-webps-prod-eastus-3-9e29c0310a29a59b.chatgpt.com
  	37.230.192.51 chatgpt-async-webps-prod-eastus-3-9e29c0310a29a59b.chatgpt.com
  	45.155.204.190 chatgpt-async-webps-prod-eastus-3.chatgpt.com
  	37.230.192.51 chatgpt-async-webps-prod-eastus-3.chatgpt.com
  	45.155.204.190 chatgpt-async-webps-prod-eastus-4-9e29c0310a29a59b.chatgpt.com
  	37.230.192.51 chatgpt-async-webps-prod-eastus-4-9e29c0310a29a59b.chatgpt.com
  	45.155.204.190 chatgpt-async-webps-prod-eastus-4.chatgpt.com
  	37.230.192.51 chatgpt-async-webps-prod-eastus-4.chatgpt.com
  	45.155.204.190 chatgpt-async-webps-prod-eastus-5-9e29c0310a29a59b.chatgpt.com
  	37.230.192.51 chatgpt-async-webps-prod-eastus-5-9e29c0310a29a59b.chatgpt.com
  	45.155.204.190 chatgpt-async-webps-prod-eastus-5.chatgpt.com
  	37.230.192.51 chatgpt-async-webps-prod-eastus-5.chatgpt.com
  	45.155.204.190 chatgpt-async-webps-prod-southcentralus-0.chatgpt.com
  	37.230.192.51 chatgpt-async-webps-prod-southcentralus-0.chatgpt.com
  	45.155.204.190 chatgpt-async-webps-prod-southcentralus-1.chatgpt.com
  	37.230.192.51 chatgpt-async-webps-prod-southcentralus-1.chatgpt.com
  	45.155.204.190 chatgpt-async-webps-prod-southcentralus-2.chatgpt.com
  	37.230.192.51 chatgpt-async-webps-prod-southcentralus-2.chatgpt.com
  	45.155.204.190 chatgpt-async-webps-prod-southcentralus-3.chatgpt.com
  	37.230.192.51 chatgpt-async-webps-prod-southcentralus-3.chatgpt.com
  	45.155.204.190 chatgpt-async-webps-prod-southcentralus-4.chatgpt.com
  	37.230.192.51 chatgpt-async-webps-prod-southcentralus-4.chatgpt.com
  	45.155.204.190 chatgpt-async-webps-prod-southcentralus-5.chatgpt.com
  	37.230.192.51 chatgpt-async-webps-prod-southcentralus-5.chatgpt.com
  	45.155.204.190 chatgpt-async-webps-prod-westus-0-9e29c0310a29a59b.chatgpt.com
  	37.230.192.51 chatgpt-async-webps-prod-westus-0-9e29c0310a29a59b.chatgpt.com
  	45.155.204.190 chatgpt-async-webps-prod-westus-0.chatgpt.com
  	37.230.192.51 chatgpt-async-webps-prod-westus-0.chatgpt.com
  	45.155.204.190 chatgpt-async-webps-prod-westus-1-9e29c0310a29a59b.chatgpt.com
  	37.230.192.51 chatgpt-async-webps-prod-westus-1-9e29c0310a29a59b.chatgpt.com
  	45.155.204.190 chatgpt-async-webps-prod-westus-1.chatgpt.com
  	37.230.192.51 chatgpt-async-webps-prod-westus-1.chatgpt.com
  	45.155.204.190 chatgpt-async-webps-prod-westus-2-9e29c0310a29a59b.chatgpt.com
  	37.230.192.51 chatgpt-async-webps-prod-westus-2-9e29c0310a29a59b.chatgpt.com
  	45.155.204.190 chatgpt-async-webps-prod-westus-2.chatgpt.com
  	37.230.192.51 chatgpt-async-webps-prod-westus-2.chatgpt.com
  	45.155.204.190 chatgpt-async-webps-prod-westus-3-9e29c0310a29a59b.chatgpt.com
  	37.230.192.51 chatgpt-async-webps-prod-westus-3-9e29c0310a29a59b.chatgpt.com
  	45.155.204.190 chatgpt-async-webps-prod-westus-3.chatgpt.com
  	37.230.192.51 chatgpt-async-webps-prod-westus-3.chatgpt.com
  	45.155.204.190 chatgpt-async-webps-prod-westus-4-9e29c0310a29a59b.chatgpt.com
  	37.230.192.51 chatgpt-async-webps-prod-westus-4-9e29c0310a29a59b.chatgpt.com
  	45.155.204.190 chatgpt-async-webps-prod-westus-4.chatgpt.com
  	37.230.192.51 chatgpt-async-webps-prod-westus-4.chatgpt.com
  	45.155.204.190 chatgpt-async-webps-prod-westus-5-9e29c0310a29a59b.chatgpt.com
  	37.230.192.51 chatgpt-async-webps-prod-westus-5-9e29c0310a29a59b.chatgpt.com
  	45.155.204.190 chatgpt-async-webps-prod-westus-5.chatgpt.com
  	37.230.192.51 chatgpt-async-webps-prod-westus-5.chatgpt.com
  	45.155.204.190 chatgpt-async-webps-staging-eastus-0.chatgpt.com
  	37.230.192.51 chatgpt-async-webps-staging-eastus-0.chatgpt.com
  	45.155.204.190 chatgpt-async-webps-staging-southcentralus-0.chatgpt.com
  	37.230.192.51 chatgpt-async-webps-staging-southcentralus-0.chatgpt.com
  	45.155.204.190 chatgpt.com
  	37.230.192.51 chatgpt.com
  	45.155.204.190 community.openai.com
  	37.230.192.51 community.openai.com
  	45.155.204.190 contest.openai.com
  	37.230.192.51 contest.openai.com
  	45.155.204.190 d.docs.live.net
  	37.230.192.51 d.docs.live.net
  	45.155.204.190 debate-game.openai.com
  	37.230.192.51 debate-game.openai.com
  	45.155.204.190 developers.openai.com
  	37.230.192.51 developers.openai.com
  	45.155.204.190 discuss.openai.com
  	37.230.192.51 discuss.openai.com
  	45.155.204.190 edge.chatgpt.com
  	37.230.192.51 edge.chatgpt.com
  	45.155.204.190 files.oaiusercontent.com
  	37.230.192.51 files.oaiusercontent.com
  	45.155.204.190 gov-demo.chatgpt.com
  	37.230.192.51 gov-demo.chatgpt.com
  	45.155.204.190 gpt3-openai.com
  	37.230.192.51 gpt3-openai.com
  	45.155.204.190 gym.openai.com
  	37.230.192.51 gym.openai.com
  	45.155.204.190 help.openai.com
  	37.230.192.51 help.openai.com
  	45.155.204.190 hooks-staging.chatgpt.com
  	37.230.192.51 hooks-staging.chatgpt.com
  	45.155.204.190 ios.chat.openai.com
  	37.230.192.51 ios.chat.openai.com
  	45.155.204.190 jukebox.openai.com
  	37.230.192.51 jukebox.openai.com
  	45.155.204.190 labs.openai.com
  	37.230.192.51 labs.openai.com
  	45.155.204.190 microscope.openai.com
  	37.230.192.51 microscope.openai.com
  	45.155.204.190 mobile.events.data.microsoft.com
  	37.230.192.51 mobile.events.data.microsoft.com
  	45.155.204.190 oaistatic.com
  	37.230.192.51 oaistatic.com
  	45.155.204.190 ogimg.chatgpt.com
  	37.230.192.51 ogimg.chatgpt.com
  	45.155.204.190 openai.com
  	37.230.192.51 openai.com
  	45.155.204.190 openai.fund
  	37.230.192.51 openai.fund
  	45.155.204.190 openai.org
  	37.230.192.51 openai.org
  	45.155.204.190 operator.chatgpt.com
  	37.230.192.51 operator.chatgpt.com
  	45.155.204.190 platform.api.openai.com
  	37.230.192.51 platform.api.openai.com
  	45.155.204.190 platform.openai.com
  	37.230.192.51 platform.openai.com
  	45.155.204.190 privacy-pass-issuer.api.chatgpt.com
  	37.230.192.51 privacy-pass-issuer.api.chatgpt.com
  	45.155.204.190 realtime.chatgpt.com
  	37.230.192.51 realtime.chatgpt.com
  	45.155.204.190 search.chatgpt.com
  	37.230.192.51 search.chatgpt.com
  	45.155.204.190 sdmntpritalynorth.oaiusercontent.com
  	37.230.192.51 sdmntpritalynorth.oaiusercontent.com
  	45.155.204.190 sdmntprnortheu.oaiusercontent.com
  	37.230.192.51 sdmntprnortheu.oaiusercontent.com
  	45.155.204.190 sdmntprpolandcentral.oaiusercontent.com
  	37.230.192.51 sdmntprpolandcentral.oaiusercontent.com
  	45.155.204.190 sdmntprukwest.oaiusercontent.com
  	37.230.192.51 sdmntprukwest.oaiusercontent.com
  	45.155.204.190 sora.chatgpt.com
  	37.230.192.51 sora.chatgpt.com
  	45.155.204.190 spinningup.openai.com
  	37.230.192.51 spinningup.openai.com
  	45.155.204.190 tcr9i.chat.openai.com
  	37.230.192.51 tcr9i.chat.openai.com
  	45.155.204.190 universe.openai.com
  	37.230.192.51 universe.openai.com
  	45.155.204.190 videos.openai.com
  	37.230.192.51 videos.openai.com
  	45.155.204.190 webrtc-staging.chatgpt.com
  	37.230.192.51 webrtc-staging.chatgpt.com
  	45.155.204.190 webrtc.chatgpt.com
  	37.230.192.51 webrtc.chatgpt.com
  	45.155.204.190 ws.chatgpt.com
  	37.230.192.51 ws.chatgpt.com
  	45.155.204.190 www.chatgpt.com
  	37.230.192.51 www.chatgpt.com
  	45.155.204.190 www.openai.com
  	37.230.192.51 www.openai.com
  	
  	# Chess
  	45.155.204.190 assets-configurator.chess.com
  	37.230.192.51 assets-configurator.chess.com
  	45.155.204.190 chess.com
  	37.230.192.51 chess.com
  	45.155.204.190 www.chess.com
  	37.230.192.51 www.chess.com
  	
  	# Claude
  	45.155.204.190 a-api.anthropic.com
  	37.230.192.51 a-api.anthropic.com
  	45.155.204.190 a-cdn.anthropic.com
  	37.230.192.51 a-cdn.anthropic.com
  	45.155.204.190 anthropic.com
  	37.230.192.51 anthropic.com
  	45.155.204.190 api.anthropic.com
  	37.230.192.51 api.anthropic.com
  	45.155.204.190 api.claude.ai
  	37.230.192.51 api.claude.ai
  	45.155.204.190 api.claude.com
  	37.230.192.51 api.claude.com
  	45.155.204.190 api.console.anthropic.com
  	37.230.192.51 api.console.anthropic.com
  	45.155.204.190 assets-proxy.anthropic.com
  	37.230.192.51 assets-proxy.anthropic.com
  	45.155.204.190 auth.anthropic.com
  	37.230.192.51 auth.anthropic.com
  	45.155.204.190 claude.ai
  	37.230.192.51 claude.ai
  	45.155.204.190 claude.com
  	37.230.192.51 claude.com
  	45.155.204.190 claudemcpclient.com
  	37.230.192.51 claudemcpclient.com
  	45.155.204.190 console.anthropic.com
  	37.230.192.51 console.anthropic.com
  	45.155.204.190 downloads.claude.ai
  	37.230.192.51 downloads.claude.ai
  	45.155.204.190 platform.claude.ai
  	37.230.192.51 platform.claude.ai
  	45.155.204.190 platform.claude.com
  	37.230.192.51 platform.claude.com
  	45.155.204.190 s-cdn.anthropic.com
  	37.230.192.51 s-cdn.anthropic.com
  	45.155.204.190 statsig.anthropic.com
  	37.230.192.51 statsig.anthropic.com
  	45.155.204.190 status.anthropic.com
  	37.230.192.51 status.anthropic.com
  	45.155.204.190 support.anthropic.com
  	37.230.192.51 support.anthropic.com
  	45.155.204.190 www.anthropic.com
  	37.230.192.51 www.anthropic.com
  	45.155.204.190 www.claude.ai
  	37.230.192.51 www.claude.ai
  	45.155.204.190 www.claude.com
  	37.230.192.51 www.claude.com
  	45.155.204.190 www.claudemcpclient.com
  	37.230.192.51 www.claudemcpclient.com
  	
  	# GitHub Copilot
  	
  	
  	# Google AI
  	45.155.204.190 ai.google.dev
  	37.230.192.51 ai.google.dev
  	45.155.204.190 aisandbox-pa.googleapis.com
  	37.230.192.51 aisandbox-pa.googleapis.com
  	45.155.204.190 aistudio.google.com
  	37.230.192.51 aistudio.google.com
  	45.155.204.190 aitestkitchen.withgoogle.com
  	37.230.192.51 aitestkitchen.withgoogle.com
  	45.155.204.190 alkalicore-pa.clients6.google.com
  	37.230.192.51 alkalicore-pa.clients6.google.com
  	45.155.204.190 alkalimakersuite-pa.clients6.google.com
  	37.230.192.51 alkalimakersuite-pa.clients6.google.com
  	45.155.204.190 apis.google.com
  	37.230.192.51 apis.google.com
  	45.155.204.190 appcatalyst.pa.googleapis.com
  	37.230.192.51 appcatalyst.pa.googleapis.com
  	45.155.204.190 assistant-s3-pa.googleapis.com
  	37.230.192.51 assistant-s3-pa.googleapis.com
  	45.155.204.190 bard.google.com
  	37.230.192.51 bard.google.com
  	45.155.204.190 daily-cloudcode-pa.googleapis.com
  	37.230.192.51 daily-cloudcode-pa.googleapis.com
  	45.155.204.190 deepmind.com
  	37.230.192.51 deepmind.com
  	45.155.204.190 deepmind.google
  	37.230.192.51 deepmind.google
  	45.155.204.190 developerprofiles-pa.googleapis.com
  	37.230.192.51 developerprofiles-pa.googleapis.com
  	45.155.204.190 geller-pa.googleapis.com
  	37.230.192.51 geller-pa.googleapis.com
  	45.155.204.190 gemini.google
  	37.230.192.51 gemini.google
  	45.155.204.190 gemini.google.com
  	37.230.192.51 gemini.google.com
  	45.155.204.190 generativeai.google
  	37.230.192.51 generativeai.google
  	45.155.204.190 generativelanguage.googleapis.com
  	37.230.192.51 generativelanguage.googleapis.com
  	45.155.204.190 jules.google
  	37.230.192.51 jules.google
  	45.155.204.190 jules.google.com
  	37.230.192.51 jules.google.com
  	45.155.204.190 labs.google
  	37.230.192.51 labs.google
  	45.155.204.190 labs.google.com
  	37.230.192.51 labs.google.com
  	45.155.204.190 lookerstudio.google.com
  	37.230.192.51 lookerstudio.google.com
  	45.155.204.190 makersuite.google.com
  	37.230.192.51 makersuite.google.com
  	45.155.204.190 notebooklm.google
  	37.230.192.51 notebooklm.google
  	45.155.204.190 notebooklm.google.com
  	37.230.192.51 notebooklm.google.com
  	45.155.204.190 notebooklm-pa.googleapis.com
  	37.230.192.51 notebooklm-pa.googleapis.com
  	45.155.204.190 o.pki.goog
  	37.230.192.51 o.pki.goog
  	45.155.204.190 opal.google
  	37.230.192.51 opal.google
  	45.155.204.190 opal.google.com
  	37.230.192.51 opal.google.com
  	45.155.204.190 opal.withgoogle.com
  	37.230.192.51 opal.withgoogle.com
  	45.155.204.190 people-pa.clients6.google.com
  	37.230.192.51 people-pa.clients6.google.com
  	45.155.204.190 proactivebackend-pa.googleapis.com
  	37.230.192.51 proactivebackend-pa.googleapis.com
  	45.155.204.190 robinfrontend-pa.googleapis.com
  	37.230.192.51 robinfrontend-pa.googleapis.com
  	45.155.204.190 signaler-pa.clients6.google.com
  	37.230.192.51 signaler-pa.clients6.google.com
  	45.155.204.190 stitch.withgoogle.com
  	37.230.192.51 stitch.withgoogle.com
  	45.155.204.190 suggestqueries.google.com
  	37.230.192.51 suggestqueries.google.com
  	45.155.204.190 waa-pa.clients6.google.com
  	37.230.192.51 waa-pa.clients6.google.com
  	45.155.204.190 webchannel-alkalimakersuite-pa.clients6.google.com
  	37.230.192.51 webchannel-alkalimakersuite-pa.clients6.google.com
  	
  	# Grok
  	45.155.204.190 accounts.x.ai
  	37.230.192.51 accounts.x.ai
  	45.155.204.190 api.x.ai
  	37.230.192.51 api.x.ai
  	45.155.204.190 asia-south1-livekit.grok.com
  	37.230.192.51 asia-south1-livekit.grok.com
  	45.155.204.190 assets.grok.com
  	37.230.192.51 assets.grok.com
  	45.155.204.190 assets.x.ai
  	37.230.192.51 assets.x.ai
  	45.155.204.190 console.x.ai
  	37.230.192.51 console.x.ai
  	45.155.204.190 data.x.ai
  	37.230.192.51 data.x.ai
  	45.155.204.190 deferred-chat.x.ai
  	37.230.192.51 deferred-chat.x.ai
  	45.155.204.190 docs.x.ai
  	37.230.192.51 docs.x.ai
  	45.155.204.190 eu-west-1.api.x.ai
  	37.230.192.51 eu-west-1.api.x.ai
  	45.155.204.190 grok.com
  	37.230.192.51 grok.com
  	45.155.204.190 grok.x.ai
  	37.230.192.51 grok.x.ai
  	45.155.204.190 imgen.x.ai
  	37.230.192.51 imgen.x.ai
  	45.155.204.190 jf.x.ai
  	37.230.192.51 jf.x.ai
  	45.155.204.190 livekit.grok.com
  	37.230.192.51 livekit.grok.com
  	45.155.204.190 login.x.ai
  	37.230.192.51 login.x.ai
  	45.155.204.190 ssff.grok.com
  	37.230.192.51 ssff.grok.com
  	45.155.204.190 status.x.ai
  	37.230.192.51 status.x.ai
  	45.155.204.190 transcription.grok-v2.x.ai
  	37.230.192.51 transcription.grok-v2.x.ai
  	45.155.204.190 trust.x.ai
  	37.230.192.51 trust.x.ai
  	45.155.204.190 typeahead.grok.com
  	37.230.192.51 typeahead.grok.com
  	45.155.204.190 us-east-1.api.x.ai
  	37.230.192.51 us-east-1.api.x.ai
  	45.155.204.190 us-east-4-raw.api.x.ai
  	37.230.192.51 us-east-4-raw.api.x.ai
  	45.155.204.190 us-south-1-pltr.api.x.ai
  	37.230.192.51 us-south-1-pltr.api.x.ai
  	45.155.204.190 us-west-1.api.x.ai
  	37.230.192.51 us-west-1.api.x.ai
  	45.155.204.190 us-west-1-raw.api.x.ai
  	37.230.192.51 us-west-1-raw.api.x.ai
  	45.155.204.190 www.grok.com
  	37.230.192.51 www.grok.com
  	45.155.204.190 www.x.ai
  	37.230.192.51 www.x.ai
  	
  	# Imgur
  	45.155.204.190 api.imgur.com
  	37.230.192.51 api.imgur.com
  	
  	# Spotify
  	45.155.204.190 accounts.scdn.co
  	37.230.192.51 accounts.scdn.co
  	45.155.204.190 accounts.spotify.com
  	37.230.192.51 accounts.spotify.com
  	45.155.204.190 aet.spotify.com
  	37.230.192.51 aet.spotify.com
  	45.155.204.190 ap-gew1.spotify.com
  	37.230.192.51 ap-gew1.spotify.com
  	45.155.204.190 ap-gue1.spotify.com
  	37.230.192.51 ap-gue1.spotify.com
  	45.155.204.190 ap-gae2.spotify.com
  	37.230.192.51 ap-gae2.spotify.com
  	45.155.204.190 ap-guc3.spotify.com
  	37.230.192.51 ap-guc3.spotify.com
  	45.155.204.190 ap-gew4.spotify.com
  	37.230.192.51 ap-gew4.spotify.com
  	45.155.204.190 api-partner.spotify.com
  	37.230.192.51 api-partner.spotify.com
  	45.155.204.190 api.spotify.com
  	37.230.192.51 api.spotify.com
  	45.155.204.190 audio-fa-tls13.spotifycdn.com
  	37.230.192.51 audio-fa-tls13.spotifycdn.com
  	45.155.204.190 audio-fa.scdn.co
  	37.230.192.51 audio-fa.scdn.co
  	45.155.204.190 canvaz.scdn.co
  	37.230.192.51 canvaz.scdn.co
  	45.155.204.190 charts-images.scdn.co
  	37.230.192.51 charts-images.scdn.co
  	45.155.204.190 concerts.spotifycdn.com
  	37.230.192.51 concerts.spotifycdn.com
  	45.155.204.190 encore.scdn.co
  	37.230.192.51 encore.scdn.co
  	45.155.204.190 gew1-dealer.spotify.com
  	37.230.192.51 gew1-dealer.spotify.com
  	45.155.204.190 gew1-spclient.spotify.com
  	37.230.192.51 gew1-spclient.spotify.com
  	45.155.204.190 heads-fa-tls13.spotifycdn.com
  	37.230.192.51 heads-fa-tls13.spotifycdn.com
  	45.155.204.190 i-lo.scdn.co
  	37.230.192.51 i-lo.scdn.co
  	45.155.204.190 i.scdn.co
  	37.230.192.51 i.scdn.co
  	45.155.204.190 image-cdn-fa.spotifycdn.com
  	37.230.192.51 image-cdn-fa.spotifycdn.com
  	45.155.204.190 login5.spotify.com
  	37.230.192.51 login5.spotify.com
  	45.155.204.190 mrkt.spotifycdn.com
  	37.230.192.51 mrkt.spotifycdn.com
  	45.155.204.190 open-exp.spotifycdn.com
  	37.230.192.51 open-exp.spotifycdn.com
  	45.155.204.190 open.spotify.com
  	37.230.192.51 open.spotify.com
  	45.155.204.190 pickasso.spotifycdn.com
  	37.230.192.51 pickasso.spotifycdn.com
  	45.155.204.190 podz-content.spotifycdn.com
  	37.230.192.51 podz-content.spotifycdn.com
  	45.155.204.190 seed-mix-image.spotifycdn.com
  	37.230.192.51 seed-mix-image.spotifycdn.com
  	45.155.204.190 seektables.scdn.co
  	37.230.192.51 seektables.scdn.co
  	45.155.204.190 spclient.wg.spotify.com
  	37.230.192.51 spclient.wg.spotify.com
  	45.155.204.190 spotifycdn.com
  	37.230.192.51 spotifycdn.com
  	45.155.204.190 spotifycdn.net
  	37.230.192.51 spotifycdn.net
  	45.155.204.190 t.scdn.co
  	37.230.192.51 t.scdn.co
  	45.155.204.190 thisis-images.spotifycdn.com
  	37.230.192.51 thisis-images.spotifycdn.com
  	45.155.204.190 wap.spotifycdn.com
  	37.230.192.51 wap.spotifycdn.com
  	45.155.204.190 web-sdk-assets.spotifycdn.com
  	37.230.192.51 web-sdk-assets.spotifycdn.com
  	45.155.204.190 www-growth.scdn.co
  	37.230.192.51 www-growth.scdn.co
  	45.155.204.190 www.spotify.com
  	37.230.192.51 www.spotify.com
  	45.155.204.190 widget-content.spotify.com
  	37.230.192.51 widget-content.spotify.com
  	45.155.204.190 edge-web.dual-gslb.spotify.com
  	37.230.192.51 edge-web.dual-gslb.spotify.com
  	45.155.204.190 apresolve.spotify.com
  	37.230.192.51 apresolve.spotify.com
  	45.155.204.190 edge-web-gew1.dual-gslb.spotify.com
  	37.230.192.51 edge-web-gew1.dual-gslb.spotify.com
  	45.155.204.190 edge-web-gue1.dual-gslb.spotify.com
  	37.230.192.51 edge-web-gue1.dual-gslb.spotify.com
  	### dns.geohide.ru: end hosts file
  '';
  	
  networking.networkmanager.enable = true;

  time.timeZone = "Asia/Yekaterinburg";

  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "ru_RU.UTF-8";
    LC_IDENTIFICATION = "ru_RU.UTF-8";
    LC_MEASUREMENT = "ru_RU.UTF-8";
    LC_MONETARY = "ru_RU.UTF-8";
    LC_NAME = "ru_RU.UTF-8";
    LC_NUMERIC = "ru_RU.UTF-8";
    LC_PAPER = "ru_RU.UTF-8";
    LC_TELEPHONE = "ru_RU.UTF-8";
    LC_TIME = "ru_RU.UTF-8";
  };

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  users.users."glg" = {
    isNormalUser = true;
    description = "glg";
    extraGroups = [ "networkmanager" "wheel" "audio" "video" "adbusers" ];
    packages = with pkgs; [];
  };

  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  environment.systemPackages = with pkgs; [
	home-manager
	wget
	neovim
	vimPlugins.LazyVim
	micro
	yazi
	brightnessctl
	curl
	btop
	git
	wev
	niri
	fastfetch
	zsh
	lsd
	fuzzel
	apple-cursor
	noctalia
	material-cursors
	gruvbox-dark-gtk
	gruvbox-plus-icons
	loupe
	zip
	unzip
	xwayland
	xwayland-satellite
	plymouth
	grub2
	grub2_efi
	android-tools
	wayland-utils
  ];

  fonts.packages = with pkgs; [
  	jetbrains-mono
  	roboto-flex
  	google-fonts
  	googlesans-code
  	noto-fonts
  	roboto-flex
  	roboto
  	roboto-mono
  	nerd-fonts.jetbrains-mono
  	noto-fonts-color-emoji 
  ];
  systemd.tmpfiles.rules = [ "L+ /var/lib/dbus/machine-id - - - - /etc/machine-id" ];
  services.happ.enable = true;
  services.happ.forceXwayland = true;
  services.openssh.enable = true;
  services.displayManager.gdm.enable = true;
  programs.niri.enable = true;
  programs.git.enable = true;
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;
  programs.xwayland.enable = true;
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  services.upower.enable = true;
  security.polkit.enable = true;
  services.dbus.enable = true;
  security.rtkit.enable = true;
  services.xserver.enable = true;
  services.pipewire = {
  	enable = true;
  	alsa.enable = true;
  	pulse.enable = true;
  };
  xdg.portal = {
  	enable = true;
  	extraPortals = with pkgs; [
  		xdg-desktop-portal-gnome
  		xdg-desktop-portal-gtk
  	];
  	config.common.default = "*";
  };
  
  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "26.05"; # Did you read the comment?

}
