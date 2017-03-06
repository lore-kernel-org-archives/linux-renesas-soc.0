Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:60052 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752559AbdCFA3m (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 5 Mar 2017 19:29:42 -0500
Received: from avalon.bb.dnainternet.fi (dfj612ybrt5fhg77mgycy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:2e86:4862:ef6a:2804])
        by galahad.ideasonboard.com (Postfix) with ESMTPSA id 57B21201C1
        for <linux-renesas-soc@vger.kernel.org>; Mon,  6 Mar 2017 01:18:54 +0100 (CET)
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org
Subject: [PATCH v3 0/5] R-Car H3 HDMI output DT integration
Date: Mon,  6 Mar 2017 02:20:21 +0200
Message-Id: <20170306002026.15066-1-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello,

This patch series contains all the DT changes needed to integrate HDMI output
support for the H3 Salvator-X board.

The patches have previously been posted as part of other patch series with
driver changes. They are now submitted standalone as I expect the driver
patches to be merged soon.

Simon, please refrain from merging this for now, I will give you a green light
once the driver gets accepted.

For convenience, the patches are available from

	git://linuxtv.org/pinchartl/media.git drm-next-dt-v3-20170306

Koji Matsuoka (1):
  arm64: dts: r8a7795: salvator-x: Enable HDMI outputs

Laurent Pinchart (3):
  arm64: dts: r8a7795: salvator-x: Add DU1 and DU2 external dot clocks
  arm64: dts: r8a7795: salvator-x: Add DU0 and DU3 external dot clocks
  ARM: shmobile: dts: Switch to panel-lvds bindings for Mitsubishi
    panels

Ulrich Hecht (1):
  arm64: dts: r8a7795: Add HDMI encoder support

 arch/arm/boot/dts/r8a77xx-aa104xd12-panel.dtsi     |  3 +-
 arch/arm/boot/dts/r8a77xx-aa121td01-panel.dtsi     |  3 +-
 arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts | 95 ++++++++++++++++++++++
 arch/arm64/boot/dts/renesas/r8a7795.dtsi           | 50 ++++++++++++
 4 files changed, 149 insertions(+), 2 deletions(-)

-- 
Regards,

Laurent Pinchart
