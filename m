Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor1.renesas.com ([210.160.252.171]:50383 "EHLO
        relmlie4.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751443AbdHIMXG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 9 Aug 2017 08:23:06 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: laurent.pinchart@ideasonboard.com, geert+renesas@glider.be,
        linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 0/8] pinctrl: sh-pfc: r8a77995: Initial R8A77995 PFC support
Date: Wed,  9 Aug 2017 21:19:39 +0900
Message-Id: <1502281187-24068-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This patch set is based on the renesas-drivers.git /
topic/r8a77995-integration branch.


Takeshi Kihara (7):
  pinctrl: sh-pfc: Initial R8A77995 PFC support
  pinctrl: sh-pfc: r8a77995: Add SCIF pins, groups and functions
  pinctrl: sh-pfc: r8a77995: Add I2C pins, groups and functions
  pinctrl: sh-pfc: r8a77995: Add EthernetAVB pins, groups and functions
  pinctrl: sh-pfc: r8a77995: Add USB2.0 host support
  pinctrl: sh-pfc: r8a77995: Add MMC pins, groups and functions
  pinctrl: sh-pfc: r8a77995: Add voltage switch operations for MMC

Yoshihiro Shimoda (1):
  pinctrl: sh-pfc: Add PORT_GP_{10,2[01]} helper macros

 .../bindings/pinctrl/renesas,pfc-pinctrl.txt       |    1 +
 drivers/pinctrl/sh-pfc/Kconfig                     |    5 +
 drivers/pinctrl/sh-pfc/Makefile                    |    1 +
 drivers/pinctrl/sh-pfc/core.c                      |    6 +
 drivers/pinctrl/sh-pfc/pfc-r8a77995.c              | 2005 ++++++++++++++++++++
 drivers/pinctrl/sh-pfc/sh_pfc.h                    |   23 +-
 6 files changed, 2036 insertions(+), 5 deletions(-)
 create mode 100644 drivers/pinctrl/sh-pfc/pfc-r8a77995.c

-- 
1.9.1
