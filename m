Return-Path: <kieran+caf_=kieranbingham=gmail.com@ksquared.org.uk>
Return-Path: <kieran@ksquared.org.uk>
Return-Path: <kieran@ksquared.org.uk>
Sender: Kieran Bingham <kieran@ksquared.org.uk>
From: Kieran Bingham <kieran@bingham.xyz>
To: Geert Uytterhoeven <geert@glider.be>,
	linux-renesas-soc@vger.kernel.org
Cc: Kieran Bingham <kieran@bingham.xyz>
Subject: [GIT PULL FOR renesas-drivers] FDP1 Fine Display Processor support
Date: Thu, 30 Jun 2016 10:29:04 +0100
Message-Id: <1467278944-17042-1-git-send-email-kieran@bingham.xyz>
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

The following changes since commit f50e3d0720c0f27476153c2c7129b18639228d1b:

  Merge branch 'drm/next/dt' into for/renesas-drivers (2016-06-21 18:01:05 +0300)

are available in the git repository at:

  https://github.com/kbingham/linux.git renesas/fdp1

for you to fetch changes up to 06f3e8e204a41e68ab649a26c557e7bc4c01c0f0:

  Merge branches 'renesas/fdp1-dt' and 'renesas/fdp1-driver' into renesas/fdp1 (2016-06-30 10:13:43 +0100)

----------------------------------------------------------------
Kieran Bingham (9):
      dt-bindings: Update Renesas R-Car FCP DT binding
      dt-bindings: Document Renesas R-Car FCP power-domains usage
      dt-bindings: Add Renesas R-Car FDP1 bindings
      arm64: dts: r8a7795: add FCPF device nodes
      arm64: dts: r8a7795: add FDP1 device nodes
      clk: renesas: r8a7795: Provide FDP1 clocks
      v4l: Extend FCP compatible list to support the FDP
      v4l: platform: Add Renesas R-Car FDP1 Driver
      Merge branches 'renesas/fdp1-dt' and 'renesas/fdp1-driver' into renesas/fdp1

Laurent Pinchart (1):
      v4l: ioctl: Clear the v4l2_pix_format_mplane reserved field

 .../devicetree/bindings/media/renesas,fcp.txt      |    5 +-
 .../devicetree/bindings/media/renesas,fdp1.txt     |   30 +
 MAINTAINERS                                        |    9 +
 arch/arm64/boot/dts/renesas/r8a7795.dtsi           |   48 +
 drivers/clk/renesas/r8a7795-cpg-mssr.c             |    3 +
 drivers/media/platform/Kconfig                     |   13 +
 drivers/media/platform/Makefile                    |    1 +
 drivers/media/platform/rcar-fcp.c                  |    1 +
 drivers/media/platform/rcar_fdp1.c                 | 2395 ++++++++++++++++++++
 drivers/media/v4l2-core/v4l2-ioctl.c               |    8 +-
 10 files changed, 2508 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/renesas,fdp1.txt
 create mode 100644 drivers/media/platform/rcar_fdp1.c

Regards
--
Kieran Bingham
