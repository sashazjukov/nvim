-- PoorMansTSqlFormatter for SQL formatting inside Neovim.
-- Replaces the built-in sqlfluff entry with `sqlformat` from
-- poor-mans-t-sql-formatter-cli (npm), which handles PowerBuilder
-- style :param variables without errors.
return {
  "stevearc/conform.nvim",
  optional = true,
  opts = function(_, opts)
    -- Override the "sqlfluff" formatter to use PoorMansTSqlFormatter instead.
    -- `inherit = false` skips merging with the built-in sqlfluff definition
    -- (which had require_cwd = true, causing "Root directory not found").
    -- `-e` ignores parsing errors so PowerBuilder :variable params pass through.
    opts.formatters.sqlfluff = {
      inherit = false,
      command = "sqlformat",
      args = { "-e" },
      stdin = true,
    }
    -- Variant with -C (no-expand comma lists) for a more compact style.
    opts.formatters.sqlformat_no_expand = {
      inherit = false,
      command = "sqlformat",
      args = { "-e", "-C" },
      stdin = true,
    }
    -- For PowerBuilder files, use conform's "injected" formatter so it finds
    -- SQL injection nodes via treesitter and formats them individually.
    opts.formatters_by_ft["powerbuilder"] = opts.formatters_by_ft["powerbuilder"] or {}
    table.insert(opts.formatters_by_ft["powerbuilder"], "injected")
  end,
}

-- Available sqlformat options (from `sqlformat --help`):
--   -e, --ignoreErrors              Return 0 even if parsing fails
--   -d, --indent <value>            Indentation unit [\t]
--   -m, --maxLineWidth <n>          Max line length before wrapping [999]
--   -s, --spacesPerTab <n>          Spaces per tab for line length calc [4]
--   -b, --statementBreaks <n>       Linebreaks between statements [2]
--   -l, --clauseBreaks <n>          Linebreaks between clauses [1]
--   -i, --expandInLists             Expand IN() items onto new lines
--   -j, --breakJoinOnSections       Break JOIN ... ON onto new lines
--   -U, --no-uppercaseKeywords      Disable auto-uppercasing keywords
--   --keywordStandardization        Replace less-common keywords with standard
--   -C, --no-expandCommaLists       Don't break comma lists onto new lines
--   -T, --no-trailingCommas         Commas at start of line instead of end
--   --spaceAfterExpandedComma       Add space after expanded comma
--   -O, --no-expandBooleanExprs     Don't break on AND/OR
--   -A, --no-expandCaseStatements   Don't break CASE WHEN/THEN
--   -W, --no-expandBetweenConds     Don't break BETWEEN min/max
--   -p, --errorOutputPrefix <value> Comment text if parsing failed
--   --inputEncoding <encoding>      Input encoding [utf-8]
--   --outputEncoding <encoding>     Output encoding [utf-8]
--   --forceOutputBOM                Add BOM to output
--
-- Example with custom options:
--   args = { "-e", "-d", "\t", "-m", "120", "-j", "-i" },
