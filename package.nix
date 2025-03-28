# Copied and modified from nixpkgs, licensed MIT
{
  lib,
  buildGoModule,
  fetchFromGitHub,
}:

buildGoModule {
  pname = "git-pr";
  version = "0.0.2-unstable-2025-03-24";

  src = fetchFromGitHub {
    owner = "picosh";
    repo = "git-pr";
    rev = "c5d9c3c045ed4a4e75607ffe23133936119194a0";
    hash = "sha256-sC2+8dBRkF2oKl96eaBqfjpyFLO0HuXDiLqzJaLFS+U=";
  };

  vendorHash = "sha256-0s6wIsfm8vIjrzA0l7vWg/CV4WF1aYcatZBa9N8WBMU=";

  postInstall = ''
    mv $out/bin/ssh $out/bin/git-pr-ssh
    mv $out/bin/web $out/bin/git-pr-web
  '';

  meta = {
    homepage = "https://pr.pico.sh";
    description = "Simple git collaboration tool";
    license = lib.licenses.bsd3;
    maintainers = with lib.maintainers; [ sigmanificient ];
    mainProgram = "git-pr";
  };
}
