Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:57760 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751483AbdEJHFC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 10 May 2017 03:05:02 -0400
Received: from avalon.ideasonboard.com (syi-ogw1-1554.syi.inet.fi [194.89.38.18])
        by galahad.ideasonboard.com (Postfix) with ESMTPSA id 3867420046
        for <linux-renesas-soc@vger.kernel.org>; Wed, 10 May 2017 09:03:55 +0200 (CEST)
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org
Subject: [PATCH v4 0/7] R-Car H3 HDMI output DT integration
Date: Wed, 10 May 2017 10:04:51 +0300
Message-Id: <20170510070458.21193-1-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello,

This patch series contains all the DT changes needed to integrate HDMI output
support for the H3 Salvator-X board.

The patches have been rebased on top of Simon's latest devel branch. Conflict
resolution led to the new 2/7 patch. For convenience, the patches are
available from

	git://linuxtv.org/pinchartl/media.git drm-next-dt-v4-20170510

Simon, this depends on driver changes that were merged by Linus for v4.12-rc1
(the checkpatch warnings related to unknown compatible strings will then be
gone). Could you please apply these patches once you merge v4.12-rc1 in your
tree ?

Koji Matsuoka (1):
  arm64: dts: renesas: salvator-x: Enable HDMI outputs

Laurent Pinchart (5):
  arm64: dts: r8a7796: Add display placeholders
  arm64: dts: r8a7795: salvator-x: Add DU1 and DU2 external dot clocks
  arm64: dts: r8a7795: salvator-x: Add DU0 and DU3 external dot clocks
  arm64: dts: r8a7795: salvator-x: Add panel backlight support
  ARM: shmobile: dts: Switch to panel-lvds bindings for Mitsubishi
    panels

Ulrich Hecht (1):
  arm64: dts: r8a7795: Add HDMI encoder support

 arch/arm/boot/dts/r8a77xx-aa104xd12-panel.dtsi |   3 +-
 arch/arm/boot/dts/r8a77xx-aa121td01-panel.dtsi |   3 +-
 arch/arm64/boot/dts/renesas/r8a7795.dtsi       |  50 +++++++++++
 arch/arm64/boot/dts/renesas/r8a7796.dtsi       |  22 +++++
 arch/arm64/boot/dts/renesas/salvator-x.dtsi    | 117 +++++++++++++++++++++++++
 5 files changed, 193 insertions(+), 2 deletions(-)

-- 
Regards,

Laurent Pinchart
