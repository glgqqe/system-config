{ config , pkgs , ... }:
{
	programs.zsh = {
		enable = true;
		enableCompletion = true;
		autosuggestion.enable = true;
		syntaxHighlighting.enable = true;

		sessionVariables = {
			GIT_DISCOVERY_ACROSS_FILESYSTEM = true;
		};

		shellAliases = {
			ls = "lsd";
			rebuild = "sudo zapret-service stop && sudo nixos-rebuild switch --flake /etc/nixos && sudo zapret-service start";
			update = "sudo zapret-service stop && home-manager switch --flake ~/.config/home-manager && sudo zapret-service start";
			cleanup = "home-manager expire-generations '-0 days' && sudo nix-collect-garbage -d";
			upload = "bash /home/glg/system-config/upload.sh";
			glg = "ssh root@31.76.245.159";
			servag = "ssh -p 2244 glg@89.107.116.126";
		};

		oh-my-zsh = {
			enable = true;
			theme = "oxide";
			custom = "${./themes}";
			plugins = [
				"git"
				"sudo"
				"dirhistory"
			];	
		};
	};
}
