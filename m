Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:52365 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752320AbdFUJbA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 21 Jun 2017 05:31:00 -0400
Received: from avalon.bb.dnainternet.fi (dfj612ybrt5fhg77mgycy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:2e86:4862:ef6a:2804])
        by galahad.ideasonboard.com (Postfix) with ESMTPSA id B134120218
        for <linux-renesas-soc@vger.kernel.org>; Wed, 21 Jun 2017 11:30:30 +0200 (CEST)
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 0/7] R-Car Salvator-X M3-W: Enable DU support
Date: Wed, 21 Jun 2017 12:31:26 +0300
Message-Id: <20170621093133.5677-1-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello,

This patch series enables DU support for the M3-W-based Salvator-X board.

Display support has no out-of-tree compile or runtime dependencies. HDMI
output support has a runtime dependency on

- [PATCH] clk: renesas: r8a7796: Add HDMI clock
- [PATCH 1/2] drm: rcar-du: Restrict DPLL duty cycle workaround to H3 ES1.x
- [PATCH 2/2] drm: rcar-du: Add HDMI outputs to R8A7796 device description

The first patch is queued for v4.13, the last two patches will be sent
upstream for v4.14. As the HDMI output will be automatically skipped by the DU
driver until the dependencies are available, this series can be queued for
v4.14 already without requiring any synchronization with the DRM/KMS tree.

Laurent Pinchart (7):
  dt-bindings: display: renesas: Add R-Car M3-W HDMI TX DT bindings
  arm64: dts: renesas: r8a7796: Add FCPF and FCPV instances
  arm64: dts: renesas: r8a7796: Add VSP instances
  arm64: dts: renesas: r8a7796: Add HDMI encoder instance
  arm64: dts: renesas: r8a7796: Add DU device to DT
  arm64: dts: renesas: r8a7796-salvator-x: Add DU external dot clocks
  arm64: dts: renesas: r8a7796-salvator-x: Enable HDMI output

 .../bindings/display/bridge/renesas,dw-hdmi.txt    |   1 +
 arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts |  29 +++++
 arch/arm64/boot/dts/renesas/r8a7796.dtsi           | 144 ++++++++++++++++++++-
 3 files changed, 173 insertions(+), 1 deletion(-)

-- 
Regards,

Laurent Pinchart
