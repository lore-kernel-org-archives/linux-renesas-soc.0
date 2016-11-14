Return-Path: <kieran+caf_=kieranbingham=gmail.com@ksquared.org.uk>
Return-Path: <laurent.pinchart+renesas@ideasonboard.com>
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org
Cc: kieran.bingham@ideasonboard.com
Subject: [PATCH 0/2] Salvator-X: Add GPIO keys support
Date: Mon, 14 Nov 2016 15:07:15 +0200
Message-Id: <1479128837-30985-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello,

This simple series adds GPIO keys support to both the H3- and M3-W-based
Salvator-X boards. Please see individual patches for details.

Laurent Pinchart (2):
  arm64: dts: r8a7795: salvator-x: Add GPIO keys support
  arm64: dts: r8a7796: salvator-x: Add GPIO keys support

 arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts | 63 ++++++++++++++++++++++
 arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts | 63 ++++++++++++++++++++++
 2 files changed, 126 insertions(+)

-- 
Regards,

Laurent Pinchart
