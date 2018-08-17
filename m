Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.84]:20256 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725800AbeHQQ0O (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Aug 2018 12:26:14 -0400
From: Ulrich Hecht <uli+renesas@fpond.eu>
To: linux-renesas-soc@vger.kernel.org
Cc: horms@verge.net.au, geert@linux-m68k.org,
        khiem.nguyen.xt@rvc.renesas.com, dien.pham.ry@renesas.com,
        takeshi.kihara.df@renesas.com, Ulrich Hecht <uli+renesas@fpond.eu>
Subject: [PATCH 0/5] H3/M3-W cpuidle support
Date: Fri, 17 Aug 2018 15:19:23 +0200
Message-Id: <1534511968-19634-1-git-send-email-uli+renesas@fpond.eu>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi!

This series adds CPU idle support for H3 and M3-W. It's a straight
up-port from the BSP.

The part that disables cpuidle for the CA53 cores on M3ULCB is a bit
dodgy. Is it a valid assumption that all M3ULCB boards have an ES1.0
SoC?

CU
Uli


Dien Pham (2):
  arm64: dts: r8a7795: Add cpuidle support for CA53 cores
  arm64: dts: r8a7796: Add cpuidle support for CA53 cores

Khiem Nguyen (2):
  arm64: dts: r8a7795: Add cpuidle support for CA57 cores
  arm64: dts: r8a7796: Add cpuidle support for CA57 cores

Takeshi Kihara (1):
  arm64: dts: r8a7796-m3ulcb: Disable cpuidle support for CA53 cores

 arch/arm64/boot/dts/renesas/r8a7795.dtsi       | 32 ++++++++++++++++++++++++++
 arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dts | 22 ++++++++++++++++++
 arch/arm64/boot/dts/renesas/r8a7796.dtsi       | 30 ++++++++++++++++++++++++
 3 files changed, 84 insertions(+)

-- 
2.7.4
