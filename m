Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from smtp-4.sys.kth.se ([130.237.48.193]:45468 "EHLO
        smtp-4.sys.kth.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751798AbdKZAu3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 25 Nov 2017 19:50:29 -0500
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
To: linux-renesas-soc@vger.kernel.org
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 0/3] arm64: dts: renesas: r8a77970: connect VIN to CSI40
Date: Sun, 26 Nov 2017 01:50:09 +0100
Message-Id: <20171126005012.22573-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi,

This series describes how to connect VIN0-3 to CSI40 and the HDMI input 
of the adv7482 on the expansion board. It is tested on V3M together with 
V3M enablement for VIN and CSI-2 drivers on-top of Kieran's 
renesas-drivers-next-v3m branch [1].

It works and it's possible to program the EDID and capture frame frames.  
Remember to switch SW18 to the off position to route the CSI-2 bus to 
the expansion board instead of the MAX9286 for GMSL input.

1. git://git.kernel.org/pub/scm/linux/kernel/git/kbingham/rcar.git

Niklas Söderlund (3):
  arm64: dts: renesas: r8a77970: add VIN and CSI-2
  arm64: dts: renesas: eagle: expansion: enable and connect CSI40
  arm64: dts: renesas: eagle: enable VIN

 .../boot/dts/renesas/r8a77970-eagle-expansion.dtsi |  18 ++-
 arch/arm64/boot/dts/renesas/r8a77970-eagle.dts     |  16 +++
 arch/arm64/boot/dts/renesas/r8a77970.dtsi          | 151 +++++++++++++++++++++
 3 files changed, 184 insertions(+), 1 deletion(-)

-- 
2.15.0
