import Language.C

data MonoErrorLifeTime = Straight [MonoFunctionCall] |
 {- Instructions before branch and then branch -}
	Branching [MonoFunctionCall] [MonoErrorLifeTime]

type MonoErrorLifeTimes = [MonoErrorLifeTime]

{- Whether item at slot is MonoError -}
data MonoFunctionSignature = [Bool]

isMonoError :: CDeclarationSpecifier -> Boolean
isMonoError (CDeclarationSpecifier _ (CTypeSpec typ) _ _ ) = 
	case typ of 
		CTypeDef name =>
			case name of =>
				Ident "MonoError" => True
				_ => False
		_ => False

makeFunctionSignature :: CFunDef -> MonoFunctionSignature
makeFunctionSignature (CFunDeF specifiers declarator decllist stmt) = 
	map isMonoError $ specifiers

makeErrorLifeTimes :: 

data MonoFunction = MonoFunction MonoFunctionSignature MonoErrorLifeTimes

process :: String -> IO [MonoFunction]

main :: IO ()
main = do
	files <- getArgs
	functions <- mapM process files
	mapM (putStr . show) functions
