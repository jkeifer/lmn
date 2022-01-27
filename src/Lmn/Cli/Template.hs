module Lmn.Cli.Template
  ( Commands
  , parser
  , handler
  )
where


import Lmn.Cli.Lib
import qualified Options.Applicative as OA


data Commands
  = List
  | Resolve TemplateName
  | Create TemplateName
  | Copy TemplateName TemplateName
  deriving (Show)

parser :: OA.Parser Commands
parser = subparser
  [ CmdDef "list" "list all templates" (pure List)
  , CmdDef "resolve" "find the path to a specified template" resolve
  , CmdDef "create" "create a new template" create
  , CmdDef "copy" "copy an existing template" copy
  ]
  where
    create = Create <$> templateNameArg
    resolve = Resolve <$> templateNameArg
    copy = Copy <$> srcTemplateNameArg <*> dstTemplateNameArg

    templateNameArg = OA.strArgument
      (  OA.help "name of the new template"
      <> OA.metavar "TEMPLATE_NAME"
      )

    srcTemplateNameArg = OA.strArgument
      (  OA.help "name of the original template"
      <> OA.metavar "SRC_TEMPLATE_NAME"
      )

    dstTemplateNameArg = OA.strArgument
      (  OA.help "name of the new template"
      <> OA.metavar "DST_TEMPLATE_NAME"
      )

handler :: Commands -> IO ()
handler cmd =
  case cmd of
    List ->
      print "list"
    Resolve templateName ->
      print templateName
    Create templateName ->
      print templateName
    Copy srcTemplateName dstTemplateName ->
      print ("src: " ++ srcTemplateName ++ ", dst: " ++ dstTemplateName)
