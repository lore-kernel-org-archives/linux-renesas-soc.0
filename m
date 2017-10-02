Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:60394 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1750983AbdJBJtK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 2 Oct 2017 05:49:10 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: laurent.pinchart@ideasonboard.com, geert+renesas@glider.be,
        linus.walleij@linaro.org
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 0/2] pinctrl: sh-pfc: r8a7795{-es1}: Add USB3.0 host support
Date: Mon,  2 Oct 2017 18:45:23 +0900
Message-Id: <1506937525-16965-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This patch set is based on the renesas-drivers.git /
renesas-drivers-2017-09-19-v4.14-rc1 tag.

After this patch set is applied, I will submit integration patch for
salvator-common.dtsi. Since the bootloader of Salvator-X[S] enables
the USB3 pins, usb3.0 host works correctly. But, we should enable
the pins by linux kernel.

Takeshi Kihara (2):
  pinctrl: sh-pfc: r8a7795-es1: Add USB3.0 host support
  pinctrl: sh-pfc: r8a7795: Add USB3.0 host support

 drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c | 29 +++++++++++++++++++++++++++++
 drivers/pinctrl/sh-pfc/pfc-r8a7795.c     | 16 ++++++++++++++++
 2 files changed, 45 insertions(+)

-- 
1.9.1
