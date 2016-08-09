Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:36597 "EHLO
	galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932203AbcHIM3I (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Tue, 9 Aug 2016 08:29:08 -0400
Received: from avalon.bb.dnainternet.fi (85-23-193-79.bb.dnainternet.fi [85.23.193.79])
	by galahad.ideasonboard.com (Postfix) with ESMTPSA id 31EDE2003E
	for <linux-renesas-soc@vger.kernel.org>; Tue,  9 Aug 2016 14:28:56 +0200 (CEST)
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 0/4] R-Car Gen3 DU enablement on Salvator-X board
Date: Tue,  9 Aug 2016 15:29:08 +0300
Message-Id: <1470745752-23738-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello,

This patch series enables DU support on the Salvator-X board. The first three
patches add the FCPV, VSP and DU devices to the r8a7795 .dtsi, while the last
patch enables DU support for the board. Only the VGA output is currently
supported, support for HDMI is work in progress.

All the related DT bindings have been merged upstream. There is thus nothing
blocking the series from being merged as well.

Changes compared to v1:

- Use GIC_SPI
- Rebase on top of latest devel branch

Laurent Pinchart (4):
  arm64: dts: renesas: r8a7795: Add FCPV nodes
  arm64: dts: renesas: r8a7795: Add VSP instances
  arm64: dts: renesas: r8a7795: Add DU device to DT
  arm64: dts: renesas: salvator-x: Enable DU

 arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts |  44 +++++
 arch/arm64/boot/dts/renesas/r8a7795.dtsi           | 199 +++++++++++++++++++++
 2 files changed, 243 insertions(+)

-- 
Regards,

Laurent Pinchart
