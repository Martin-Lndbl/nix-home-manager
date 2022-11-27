{ pkgs }:

let 

  syntax-nix = pkgs.vimUtils.buildVimPluginsFrom2Nix rec {
    pname = "syntax-nix";
    version = "7d23e97d13c40fcc6d603b291fe9b6e5f92516ee";
    src = pkgs.fetchFromGitHub {
      owner = "LnL7";
      repo = "vim-nix";
      rev = version;
      sha256 = "";
    };
  };

  telescope-ctags-outline = pkgs.vimUtils.buildVimPluginsFrom2Nix rec {
    pname = "telescope-ctags-outline";
    version = "88767c2f79b4c10369e82dcd661af67182c00991";
    src = pkgs.fetchFromGitHub {
      owner = "fcying";
      repo = "${pname}.nvim";
      rev = version;
      sha256 = "";
    };
  };


  diff-fold = pkgs.vimUtils.buildVimPluginsFrom2Nix rec {
    pname = "diff-fold";
    version = "48b4505c1b6f14ceb4e4be732aad337147ef36cd";
    src = pkgs.fetchFromGitHub {
      owner = "sgeb";
      repo = "vim-${pname}"
      rev = version;
      sha256 = "";
    };
  };


  vdebug = pkgs.vimUtils.buildVimPluginsFrom2Nix rec {
    pname = "vdebug";
    version = "v2.0.0";
    src = pkgs.fetchFromGitHub {
      owner = "joonty";
      repo = pname;
      rev = version;
      sha256 = "";
    };
  };


  spacecamp = pkgs.vimUtils.buildVimPluginsFrom2Nix rec {
    pname = "spacecamp";
    version = "";
    src = pkgs.fetchFromGitHub {
      owner = "Martin-Lndbl";
      repo = pname;
      rev = version;
      sha256 = "";
    };
  };

  tree-sitter-languages = languages: builtins.foldl' (
    acc: new:
    ''
      vim.treesitter.require_language("${new}", "${
        "${pkgs.tree-sitter.builtGrammars."tree-sitter-${new}"}/parser"
      }")${"\n\n"}${acc}
    ''
  ) "" langages;

in

{
  enable = true;
  vimAlias = true;
  extraConfig = builtins.readFile ./neovom/neovim.vim;
  
  plugins = with pkgs.vimPlugins; {
  
    airline
    {
      plugin = nerdtree;
      config = builtins.readFile ./neovim/plugins/nerdtree.vim;
    }
    
    {
      plugin = undotree;
      config = builtins.readFile ./neovim/plugins/undotree.vim;
    }

    {
      plugin = tagbar;
      config = builtins.readFile ./neovim/plugins/tagbar.vim;
    }

    {
      plugin = telescope-nvim;
      type = "lua";
      config = builtins.readFile ./neovim/plugins/telescope.lua;
    }

    {
      plugin = telescope-ctags-outline;
      type = "lua";
      config = builtins.readFile ./neovim/plugins/telescope-ctags-outline.lua;
    }

    {
      plugin = nvim-treesitter;
      type = "lua";
      config = builtins.readFile ./neovim/plugins/treesitter.lua; +
        tree-sitter-languages [
          "bash"
          "c"
          "cpp"
          "css"
          "html"
          "graphql"
          "javascript"
          "json"
          "lua"
          "make"
          "markdown"
          "nix"
          "rust"
          "toml"
          "yaml"
        ];
    }

    syntax-nix
    i3config-vim
    typescript-vim

    {
      plugin = vim-rooter;
      config = builtins.readFile ./neovim/plugins/rooter.vim;
    }
   
    diff-fold
    BufOnly-vim

    fugitive

    vim-commentary
    vim-indent-object
 
    {
      plugin = vdebug;
      config = builtins.readFile ./neovim/plugins/vdebug.vim;
    }
   
    delimitMate
    vim-css-color
    awesome-vim-colorschemes
    spacecamp

    vim-devicons
  
    {
      plugin = nvim-lspconfig;
      type = "lua";
      config = builtins.readFile ./neovim/plugins/lsp-config.lua;
    }
    {
      plugin = nvim-compe;
      type = "lua";
      config = builtins.readFile ./neovim/plugins/nvim-compe.lua;
    }
    {
      plugin = lsp_signature-nvim;
      type = "lua";
      config = builtins.readFile ./neovim/plugins/lsp-signature.lua;
    }
    vim-vsnip
  };
  
  extraPackages = with pkgs; [
  ];
}
