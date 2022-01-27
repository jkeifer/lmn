module Lmn.Cli.Lib
  ( info
  , command
  , subparser
  , showHelpOnErrorExecParser
  , TemplateName
  , CmdDef (..)
  )
where


import qualified Data.Foldable as F
import qualified Options.Applicative as OA


type TemplateName = String
data CmdDef a = CmdDef
  { cmdName :: String
  , cmdDesc :: String
  , cmdParser :: OA.Parser a
  }

info :: OA.Parser a -> String -> OA.ParserInfo a
info p desc = OA.info p (OA.fullDesc <> OA.progDesc desc)

command :: CmdDef a -> OA.Mod OA.CommandFields a
command cmdDef = OA.command (cmdName cmdDef) (info (cmdParser cmdDef) (cmdDesc cmdDef))

subparser :: Foldable t => t (CmdDef a) -> OA.Parser a
subparser cmds = (OA.hsubparser . F.foldMap command) cmds

showHelpOnErrorExecParser :: OA.ParserInfo a -> IO a
showHelpOnErrorExecParser = OA.customExecParser (OA.prefs OA.showHelpOnError)
