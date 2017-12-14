Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor2.renesas.com ([210.160.252.172]:49750 "EHLO
        relmlie1.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751422AbdLNK5M (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 14 Dec 2017 05:57:12 -0500
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Russell King <linux@armlinux.org.uk>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH 0/4] Add PWM and TPU support to r8a7745
Date: Thu, 14 Dec 2017 10:57:02 +0000
Message-Id: <1513249026-26759-1-git-send-email-fabrizio.castro@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Dear All,

this series includes all that is required to add PWM and TPU SoC specific
support for the r8a7745.

Thanks,

Fabrizio Castro (4):
  pinctrl: sh-pfc: r8a7794: Add PWM[0123456] support
  ARM: dts: r8a7745: Add PWM SoC support
  pinctrl: sh-pfc: r8a7794: Add tpu groups and function
  ARM: dts: r8a7745: Add TPU support

 arch/arm/boot/dts/r8a7745.dtsi       |  87 ++++++++++++
 drivers/pinctrl/sh-pfc/pfc-r8a7794.c | 266 +++++++++++++++++++++++++++++++++++
 2 files changed, 353 insertions(+)

-- 
2.7.4
