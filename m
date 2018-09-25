Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:35712 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726322AbeIYWln (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 25 Sep 2018 18:41:43 -0400
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Simon Horman <horms@verge.net.au>
Subject: [PATCH v3 0/4] R-Car D3/E3 display DT enablement
Date: Tue, 25 Sep 2018 19:33:33 +0300
Message-Id: <20180925163337.31212-1-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello,

The patches in this series enable display support for the D3 and E3 SoCs, on
the Draak and Ebisu boards respectively. They were previously part of the
"[PATCH v2 00/16] R-Car D3/E3 display support (with LVDS PLL)" series, and
have been split out now that the DT bindings have been accepted andon their
way to v4.20 through the DRM tree, along with the code changes.

Compared to v2, the VSPI MSTP clock index has been fixed, and the
patches rebased on top of Simon's latest devel branch.

Simon, could you please consider this as an update for v4.20 ?

Kieran Bingham (1):
  arm64: dts: renesas: r8a77995: Add LVDS support

Laurent Pinchart (2):
  arm64: dts: renesas: r8a77990: Add display output support
  arm64: dts: renesas: r8a77990: ebisu: Enable VGA and HDMI outputs

Ulrich Hecht (1):
  arm64: dts: renesas: r8a77995: draak: Enable HDMI display output

 arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts | 162 ++++++++++++++++++++++++
 arch/arm64/boot/dts/renesas/r8a77990.dtsi      | 167 +++++++++++++++++++++++++
 arch/arm64/boot/dts/renesas/r8a77995-draak.dts |  98 ++++++++++++++-
 arch/arm64/boot/dts/renesas/r8a77995.dtsi      |  56 +++++++++
 4 files changed, 482 insertions(+), 1 deletion(-)

-- 
Regards,

Laurent Pinchart
