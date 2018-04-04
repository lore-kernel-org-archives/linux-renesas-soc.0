Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:40202 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1750842AbeDDMwX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 4 Apr 2018 08:52:23 -0400
From: Biju Das <biju.das@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc: Biju Das <biju.das@bp.renesas.com>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, Simon Horman <horms@verge.net.au>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH 0/2] Add Renesas r8a77470 PFC driver
Date: Wed,  4 Apr 2018 13:48:32 +0100
Message-Id: <1522846114-1623-1-git-send-email-biju.das@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi,

This patch series aims to add support for r8a77470 PFC driver

This patch is tested against "sh-pfc" branch of 'renesas-drivers.git' 
repo. 

Biju Das (2):
  pinctrl: sh-pfc: Add r8a77470 PFC support
  pinctrl: sh-pfc: Add r8a77470 PFC support

 .../bindings/pinctrl/renesas,pfc-pinctrl.txt       |    1 +
 drivers/pinctrl/sh-pfc/Kconfig                     |    5 +
 drivers/pinctrl/sh-pfc/Makefile                    |    1 +
 drivers/pinctrl/sh-pfc/core.c                      |    6 +
 drivers/pinctrl/sh-pfc/pfc-r8a77470.c              | 2156 ++++++++++++++++++++
 drivers/pinctrl/sh-pfc/sh_pfc.h                    |    1 +
 6 files changed, 2170 insertions(+)
 create mode 100644 drivers/pinctrl/sh-pfc/pfc-r8a77470.c

-- 
2.7.4
