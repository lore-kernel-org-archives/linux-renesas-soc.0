Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:57385 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934571AbcJQVe7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Oct 2016 17:34:59 -0400
Received: from avalon.bb.dnainternet.fi (dfj612ybrt5fhg77mgycy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:2e86:4862:ef6a:2804])
        by galahad.ideasonboard.com (Postfix) with ESMTPSA id 023802003E
        for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Oct 2016 23:34:08 +0200 (CEST)
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org
Subject: [PATCH 0/4] R-Car Salvator-X M3-W: Enable DU support
Date: Tue, 18 Oct 2016 00:34:47 +0300
Message-Id: <1476740091-7011-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello,

This patch series enables DU support for the M3-W-based Salvator-X board. It
depends on the previously posted "[PATCH 0/3] R-Car M3-W: Add FCP, VSP and DU
clocks", "[PATCH] drm: rcar-du: Add R8A7796 device support" and "[PATCH 0/2]
R-Car FDP: Remove SoC-specific compatible strings" patch series.

For convenience I've pushed all patches to

	git://linuxtv.org/pinchartl/media.git drm/r8a7796/next

Patch 4/4 enables the DU and should not be merged at this time as it would
block support of memory above the 32bit 4GB boundary. All other patches are
candidates for v4.10.

Laurent Pinchart (4):
  arm64: dts: renesas: r8a7796: Add FCPF and FCPV instances
  arm64: dts: renesas: r8a7796: Add VSP instances
  arm64: dts: renesas: r8a7796: Add DU device to DT
  arm64: dts: renesas: r8a7796-salvator-x: Enable DU

 arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts |  48 ++++++++
 arch/arm64/boot/dts/renesas/r8a7796.dtsi           | 131 +++++++++++++++++++++
 2 files changed, 179 insertions(+)

-- 
Regards,

Laurent Pinchart
