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
			rebuild = "sudo nix flake update --flake /etc/nixos && sudo git -C /etc/nixos add /etc/nixos/flake.lock && sudo nixos-rebuild switch --flake /etc/nixos#thinkpad && sudo zapret-service start";
			update = "nix flake update --flake ~/.config/home-manager/ && git -C ~/.config/home-manager/ add ~/.config/home-manager/flake.lock && home-manager switch --flake ~/.config/home-manager/#glg";
			cleanup = "home-manager expire-generations '-0 days' && nix-collect-garbage -d && sudo nix-collect-garbage -d";
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
