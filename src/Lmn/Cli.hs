module Lmn.Cli ( cli ) where

import Lmn.Cli.Lib
import qualified Lmn.Cli.Env as Env
import qualified Lmn.Cli.Repo as Repo
import qualified Lmn.Cli.Template as Template
import qualified Options.Applicative as OA


type EnvCommands = Env.Commands
type RepoCommands = Repo.Commands
type TemplateCommands = Template.Commands


data TopCommands
  = Env EnvCommands
  | Repo RepoCommands
  | Template TemplateCommands
  deriving (Show)

cliParser :: OA.Parser TopCommands
cliParser = subparser
  [ CmdDef "env" "Env commands" env
  , CmdDef "repo" "Repo commands" repo
  , CmdDef "template" "Template commands" template
  ]
  where
    env = Env <$> Env.parser
    repo = Repo <$> Repo.parser
    template = Template <$> Template.parser


cliParserInfo :: OA.ParserInfo TopCommands
cliParserInfo = info cliParser "Top-level commands"


cli :: IO ()
cli = do
  _cmd <- showHelpOnErrorExecParser cliParserInfo
  case _cmd of
    Env cmd -> Env.handler cmd
    Repo cmd -> Repo.handler cmd
    Template cmd -> Template.handler cmd
