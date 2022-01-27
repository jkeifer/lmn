module Lmn.Cli.Env
  ( Commands
  , parser
  , handler
  )
where


import Lmn.Cli.Lib
import qualified Options.Applicative as OA


data Commands
  = Init TemplateName
  | Status
  deriving (Show)

parser :: OA.Parser Commands
parser = subparser
  [ CmdDef "init" "initialize a lmn workspace" _init
  , CmdDef "status" "check workspace status" (pure Status)
  ]
  where
    _init = Init <$> templateNameOpt
    templateNameOpt = OA.strOption
      (  OA.long "template"
      <> OA.short 't'
      <> OA.help "env template name"
      <> OA.value ""
      <> OA.showDefault
      <> OA.metavar "TEMPLATE_NAME"
      )

handler :: Commands -> IO ()
handler cmd =
  case cmd of
    Init templateName ->
      print templateName
    Status ->
      print "status"
