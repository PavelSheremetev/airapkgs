{ mkDerivation, aeson, async, base, base58string, bytestring
, exceptions, generics-sop, hashable, hpack, pipes, memory
, microlens, monad-control, monad-logger, mtl, optparse-applicative
, containers, cryptonite, data-default, process, stdenv, text, web3
, fetchFromGitHub
}:

mkDerivation rec {
  pname = "robonomics-tools";
  version = "0.5.2.0";

  src = fetchFromGitHub {
    owner = "airalab";
    repo = pname;
    rev = "v${version}";
    sha256 = "14ix3ca9qaz4lcg785ap0jd6gij5cg7vwyymh27z8xbkxkpxi3vc";
  };

  isLibrary = false;
  isExecutable = true;

  preConfigure = "${hpack}/bin/hpack";
  executableHaskellDepends = [
    aeson async base base58string bytestring pipes
    containers cryptonite data-default exceptions generics-sop
    memory microlens monad-control monad-logger mtl hashable
    optparse-applicative process text web3
  ];

  homepage = "https://github.com/airalab/robonomics-tools#readme";
  description = "Robonomics.network tools";
  license = stdenv.lib.licenses.bsd3;
  maintainers = with stdenv.lib.maintainers; [ akru ];
}
