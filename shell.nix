{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  # The 'packages' attribute lists all the system-level tools
  # you want to have available inside the shell.
  packages = [
    pkgs.ffmpeg  # Provides the ffmpeg command
    pkgs.rar     # Provides the official 'rar' command-line tool
  ];

  # (Optional) A shell hook runs commands right after you enter the shell.
  # This is useful for setting up the environment or printing a welcome message.
  shellHook = ''
    echo ""
    echo "✅ FFMpeg and RAR are now available in your environment."
    echo ""
    # Check the versions to confirm they are working
    echo "-> FFMpeg version: $(ffmpeg -version | head -n 1)"
    echo "-> RAR version: $(rar | head -n 2 | tail -n 1)"
    echo ""
  '';
}
