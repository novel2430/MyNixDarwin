{pkgs, ...}:
''
require('lspconfig')['omnisharp'].setup {
  cmd = {
    -- vim.fn.executable('OmniSharp') == 1 and 'OmniSharp' or 'omnisharp',
    '${pkgs.omnisharp-roslyn}/bin/OmniSharp',
    '-z', -- https://github.com/OmniSharp/omnisharp-vscode/pull/4300
    '--hostPID',
    tostring(vim.fn.getpid()),
    'DotNet:enablePackageRestore=false',
    '--encoding',
    'utf-8',
    '--languageserver',
  }
}
''
