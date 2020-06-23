{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_rtbitcoin (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/zhangkai/rtbitcoin/.stack-work/install/x86_64-osx/ee8de4db07d0fc4409a373398073937d76c8a58b2966e2e04da3ed97dfa7146d/8.8.3/bin"
libdir     = "/Users/zhangkai/rtbitcoin/.stack-work/install/x86_64-osx/ee8de4db07d0fc4409a373398073937d76c8a58b2966e2e04da3ed97dfa7146d/8.8.3/lib/x86_64-osx-ghc-8.8.3/rtbitcoin-0.1.0.0-1yAZ3JJSJGs3QVjrMKe69T-rtbitcoin"
dynlibdir  = "/Users/zhangkai/rtbitcoin/.stack-work/install/x86_64-osx/ee8de4db07d0fc4409a373398073937d76c8a58b2966e2e04da3ed97dfa7146d/8.8.3/lib/x86_64-osx-ghc-8.8.3"
datadir    = "/Users/zhangkai/rtbitcoin/.stack-work/install/x86_64-osx/ee8de4db07d0fc4409a373398073937d76c8a58b2966e2e04da3ed97dfa7146d/8.8.3/share/x86_64-osx-ghc-8.8.3/rtbitcoin-0.1.0.0"
libexecdir = "/Users/zhangkai/rtbitcoin/.stack-work/install/x86_64-osx/ee8de4db07d0fc4409a373398073937d76c8a58b2966e2e04da3ed97dfa7146d/8.8.3/libexec/x86_64-osx-ghc-8.8.3/rtbitcoin-0.1.0.0"
sysconfdir = "/Users/zhangkai/rtbitcoin/.stack-work/install/x86_64-osx/ee8de4db07d0fc4409a373398073937d76c8a58b2966e2e04da3ed97dfa7146d/8.8.3/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "rtbitcoin_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "rtbitcoin_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "rtbitcoin_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "rtbitcoin_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "rtbitcoin_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "rtbitcoin_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
