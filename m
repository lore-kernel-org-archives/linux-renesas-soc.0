Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor2.renesas.com ([210.160.252.172]:22644 "EHLO
        relmlie1.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1752131AbdLLStq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 12 Dec 2017 13:49:46 -0500
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Russell King <linux@armlinux.org.uk>
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/3] Add CMT support to r8a774[35]
Date: Tue, 12 Dec 2017 18:49:36 +0000
Message-Id: <1513104579-6333-1-git-send-email-fabrizio.castro@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This series adds CMT support for r8a7743 and r8a7745.

Thanks,

Fabrizio Castro (3):
  dt-bindings: timer: renesas, cmt: Document r8a774[35] CMT support
  ARM: dts: r8a7743: Add CMT SoC specific support
  ARM: dts: r8a7745: Add CMT SoC specific support

 .../devicetree/bindings/timer/renesas,cmt.txt      | 12 ++++++---
 arch/arm/boot/dts/r8a7743.dtsi                     | 30 ++++++++++++++++++++++
 arch/arm/boot/dts/r8a7745.dtsi                     | 30 ++++++++++++++++++++++
 3 files changed, 69 insertions(+), 3 deletions(-)

-- 
2.7.4
