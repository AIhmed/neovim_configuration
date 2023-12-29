local util = require 'lspconfig.util'

local function get_typescript_server_path(root_dir)

  local global_ts = '/usr/local/lib/node_modules/typescript/lib'
  local found_ts = ''
  local function check_dir(path)
    found_ts =  util.path.join(path, 'node_modules', 'typescript', 'lib')
    if util.path.exists(found_ts) then
      return path
    end
  end
  if util.search_ancestors(root_dir, check_dir) then
    return found_ts
  else
    return global_ts
  end
end

local volar_cmd = {'vue-language-server', '--stdio'}
local volar_root_dir = util.root_pattern 'package.json'
local volar_tsdk = '/usr/local/lib/node_modules/typescript/lib'
local volar_filetypes = {'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json'}

require'lspconfig'.volar.setup{
    cmd = volar_cmd,
    root_dir = volar_root_dir,
    init_options = {
        typescript = {
            tsdk = volar_tsdk
        }
    },
    filetypes = volar_filetypes,
    on_new_config = function(new_config, new_root_dir)
    new_config.init_options.typescript.tsdk = get_typescript_server_path(new_root_dir)
    end,

    languageFeatures = {
        implementation = true,
        references = true,
        definition = true,
        typeDefinition = true,
        callHierarchy = true,
        hover = true,
        rename = true,
        renameFileRefactoring = true,
        signatureHelp = true,
        codeAction = true,
        workspaceSymbol = true,
        completion = {
            defaultTagNameCase = 'both',
            defaultAttrNameCase = 'kebabCase',
            getDocumentNameCasesRequest = false,
            getDocumentSelectionRequest = false,
        }
    },
}

require('lspconfig.configs').volar_html = {
    default_config = {
        cmd = volar_cmd,
        root_dir = volar_root_dir,
        on_new_config = function(new_config, new_root_dir)
        new_config.init_options.typescript.tsdk = get_typescript_server_path(new_root_dir)
        end,

        filetypes = volar_filetypes,
        init_options = {
        typescript = {
            tsdk = volar_tsdk
        },
        documentFeatures = {
            selectionRange = true,
            foldingRange = true,
            linkedEditingRange = true,
            documentSymbol = true,
            -- not supported - https://github.com/neovim/neovim/pull/13654
            documentColor = false,
            documentFormatting = {
                defaultPrintWidth = 100,
            },
        }
    },
}
}
