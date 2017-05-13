Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:37488 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1758699AbdEMXQY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 13 May 2017 19:16:24 -0400
Received: from avalon.bb.dnainternet.fi (dfj612ybrt5fhg77mgycy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:2e86:4862:ef6a:2804])
        by galahad.ideasonboard.com (Postfix) with ESMTPSA id CCE3220004
        for <linux-renesas-soc@vger.kernel.org>; Sun, 14 May 2017 01:16:20 +0200 (CEST)
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org
Subject: [PATCH v5 0/6] R-Car H3 HDMI output DT integration
Date: Sun, 14 May 2017 02:16:12 +0300
Message-Id: <20170513231618.1715-1-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello,

This patch series contains all the DT changes needed to integrate HDMI output
support for the H3 Salvator-X board.

The patches have been rebased on top of a merge of Simon's latest devel branch
and v4.12-rc1, and have taken Geert's comments into account. For convenience,
they are available from

        git://linuxtv.org/pinchartl/media.git drm-next-dt-v5-20170513

Simon, this still depends on driver changes that were merged by Linus for
v4.12-rc1 (the checkpatch warnings related to unknown compatible strings will
then be gone). Again, please only apply these patches after you merge
v4.12-rc1 in your tree.

Koji Matsuoka (1):
  arm64: dts: renesas: r8a7795-salvator-x: Enable HDMI outputs

Laurent Pinchart (4):
  arm64: dts: renesas: salvator-x: Add DU external dot clock sources
  arm64: dts: renesas: salvator-x: Add HDMI output connectors
  arm64: dts: renesas: r8a7795-salvator-x: Add DU external dot clocks
  ARM: shmobile: dts: Switch to panel-lvds bindings for Mitsubishi
    panels

Ulrich Hecht (1):
  arm64: dts: renesas: r8a7795: Add HDMI encoder support

 arch/arm/boot/dts/r8a77xx-aa104xd12-panel.dtsi     |  3 +-
 arch/arm/boot/dts/r8a77xx-aa121td01-panel.dtsi     |  3 +-
 arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts | 48 ++++++++++++++++++++
 arch/arm64/boot/dts/renesas/r8a7795.dtsi           | 52 ++++++++++++++++++++++
 arch/arm64/boot/dts/renesas/salvator-x.dtsi        | 49 ++++++++++++++++++++
 5 files changed, 153 insertions(+), 2 deletions(-)

-- 
Regards,

Laurent Pinchart
