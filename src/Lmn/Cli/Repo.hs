module Lmn.Cli.Repo
  ( Commands
  , parser
  , handler
  )
where


import Lmn.Cli.Lib
import qualified Options.Applicative as OA


data Commands
  = Add FilePath
  | Untrack FilePath
  deriving (Show)

parser :: OA.Parser Commands
parser = subparser
  [ CmdDef "add" "add/update workspace manifest from a contained git repo" add
  , CmdDef "untrack" "remove a git repo from the workspace manifest" untrack
  ]
  where
    add = Add <$> repoPathArg
    untrack = Untrack <$> repoPathArg

    repoPathArg = OA.strArgument
      (  OA.help "path to repo"
      <> OA.metavar "REPO_PATH"
      )

handler :: Commands -> IO ()
handler cmd =
  case cmd of
    Add filePath ->
      print filePath
    Untrack filePath ->
      print filePath
