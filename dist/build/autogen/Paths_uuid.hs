module Paths_uuid (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch


version :: Version
version = Version {versionBranch = [1,3,3], versionTags = []}
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/alain_odea/Documents/haskell/uuid/.cabal-sandbox/bin"
libdir     = "/home/alain_odea/Documents/haskell/uuid/.cabal-sandbox/lib/x86_64-linux-ghc-7.6.3/uuid-1.3.3"
datadir    = "/home/alain_odea/Documents/haskell/uuid/.cabal-sandbox/share/x86_64-linux-ghc-7.6.3/uuid-1.3.3"
libexecdir = "/home/alain_odea/Documents/haskell/uuid/.cabal-sandbox/libexec"
sysconfdir = "/home/alain_odea/Documents/haskell/uuid/.cabal-sandbox/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "uuid_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "uuid_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "uuid_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "uuid_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "uuid_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
