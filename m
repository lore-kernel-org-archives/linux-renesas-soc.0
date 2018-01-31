Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from vsp-unauthed02.binero.net ([195.74.38.227]:47307 "EHLO
        bin-vsp-out-01.atm.binero.net" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1753364AbeAaQSc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 31 Jan 2018 11:18:32 -0500
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Simon Horman <horms@verge.net.au>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 0/5] arm64: dts: renesas: r8a77970: enable HDMI output
Date: Wed, 31 Jan 2018 17:18:06 +0100
Message-Id: <20180131161811.12699-1-niklas.soderlund@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Hi,

This series enables the HDMI out put on V3M. It is based on top of the 
latest renesas-drivers release and depends on patches from both Laurent 
and Sergei.

- [PATCH v2 00/12] R-Car DU: Convert LVDS code to bridge driver
- [PATCH v2 0/2] Add R-Car V3M (R8A77970) support to the DU driver
- [PATCH 0/3] Add R-Car V3M (R8A77970) support to the R-Car LVDS driver

It is tested on V3M by connecting the HDMI output to a monitor and 
booting the board. To console shall eventually show up on the screen.

Niklas Söderlund (5):
  arm64: dts: renesas: r8a77970: add FCPVD node
  arm64: dts: renesas: r8a77970: Add VSPD instance
  arm64: dts: renesas: r8a77970: add DU instance
  arm64: dts: renesas: r8a77970: add the LVDS instance
  arm64: dts: renesas: eagle: add HDMI output using the ADV7511W

 arch/arm64/boot/dts/renesas/r8a77970-eagle.dts | 66 +++++++++++++++++++++++
 arch/arm64/boot/dts/renesas/r8a77970.dtsi      | 72 ++++++++++++++++++++++++++
 2 files changed, 138 insertions(+)

-- 
2.16.1
