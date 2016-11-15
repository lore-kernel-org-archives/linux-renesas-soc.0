Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:38378 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S938597AbcKOBq7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 14 Nov 2016 20:46:59 -0500
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [GIT PULL FOR renesas-drivers] R-Car DU M3-W support
Date: Tue, 15 Nov 2016 03:47:07 +0200
Message-ID: <14645714.0LuXQt2l6b@avalon>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

The following changes since commit 1001354ca34179f3db924eb66672442a173147dc:

  Linux 4.9-rc1 (2016-10-15 12:17:50 -0700)

are available in the git repository at:

  git://linuxtv.org/pinchartl/media.git drm/r8a7796/next

for you to fetch changes up to 3bd092b7a3dc1b2f82ac11c34114be4f996f7cbd:

  Merge branch 'drm/r8a7796/fcp' into drm/r8a7796/next (2016-11-15 03:35:09 
+0200)

I have split the patches in topic branches named drm/r8a7796/clk, 
drm/r8a7796/dt, drm/r8a7796/du and drm/r8a7796/fcp and have merged them all in 
drm/r8a7796/next. Please feel free to merge those topic branches instead if 
that's easier for you.

----------------------------------------------------------------
Laurent Pinchart (13):
      dt-bindings: media: renesas-fcp: Remove SoC-specific compatible strings
      arm64: dts: renesas: r8a7795: Remove FCP SoC-specific compatible strings
      arm64: dts: renesas: r8a7796: Add FCPF and FCPV instances
      arm64: dts: renesas: r8a7796: Add VSP instances
      arm64: dts: renesas: r8a7796: Add DU device to DT
      arm64: dts: renesas: r8a7796-salvator-x: Enable DU
      drm: rcar-du: Add R8A7796 device support
      clk: renesas: r8a7796: Add FCP clocks
      clk: renesas: r8a7796: Add VSP clocks
      clk: renesas: r8a7796: Add DU and LVDS clocks
      Merge branch 'drm/r8a7796/dt' into drm/r8a7796/next
      Merge branch 'drm/r8a7796/du' into drm/r8a7796/next
      Merge branch 'drm/r8a7796/fcp' into drm/r8a7796/next

 .../devicetree/bindings/display/renesas,du.txt     |   4 +-
 .../devicetree/bindings/media/renesas,fcp.txt      |   8 +-
 arch/arm64/boot/dts/renesas/r8a7795.dtsi           |  24 ++--
 arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts |  48 +++++++
 arch/arm64/boot/dts/renesas/r8a7796.dtsi           | 131 ++++++++++++++++++++
 drivers/clk/renesas/r8a7796-cpg-mssr.c             |  17 +++
 drivers/gpu/drm/rcar-du/rcar_du_drv.c              |  25 ++++
 7 files changed, 237 insertions(+), 20 deletions(-)

-- 
Regards,

Laurent Pinchart
