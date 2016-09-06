Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:49170 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932461AbcIFIZ1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 6 Sep 2016 04:25:27 -0400
Received: from avalon.bb.dnainternet.fi (85-23-193-79.bb.dnainternet.fi [85.23.193.79])
        by galahad.ideasonboard.com (Postfix) with ESMTPSA id F0C0C2003E
        for <linux-renesas-soc@vger.kernel.org>; Tue,  6 Sep 2016 10:24:59 +0200 (CEST)
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org
Subject: [PATCH 0/4] R-Car M3-W Salvator-X: Add ethernet support
Date: Tue,  6 Sep 2016 11:25:48 +0300
Message-Id: <1473150352-31081-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello,

This patch series adds support for the RAVB ethernet controller on the M3-W
(R8A7796) Salvator-X board.

The patches are based on top of Simon's latest devel branch, with the
following patches cherry-picked:

[PATCH/RFT 1/8] clk: renesas: r8a7796: Add GPIO clocks
[PATCH/RFT 4/8] gpio: rcar: Add r8a7796 (R-Car M3-W) support
[PATCH/RFT 6/8] arm64: dts: r8a7796: Add GPIO device nodes

I'd like to suggest merging the GPIO support without PFC if it helps getting
ethernet support in v4.9, as this is a very handy feature for development.

Laurent Pinchart (4):
  clk: shmobile: r8a7796: Add RAVB clock
  dt-bindings: net: renesas-ravb: Add support for R8A7796 RAVB
  arm64: dts: renesas: r8a7796: Add EthernetAVB instance
  arm64: dts: r8a7796: Enable EthernetAVB on Salvator-X

 .../devicetree/bindings/net/renesas,ravb.txt       |  3 +-
 arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts | 25 +++++++++++++
 arch/arm64/boot/dts/renesas/r8a7796.dtsi           | 43 ++++++++++++++++++++++
 drivers/clk/renesas/r8a7796-cpg-mssr.c             |  1 +
 4 files changed, 71 insertions(+), 1 deletion(-)

-- 
Regards,

Laurent Pinchart
