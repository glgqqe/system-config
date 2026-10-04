{ config, pkgs, lib, ... }:
{
	programs.vim = {
		enable = true;
		defaultEditor = true;
		extraConfig = ''
			syntax on
      set number
      set expandtab ts=2 sw=2
			'';
		};	
	}	
