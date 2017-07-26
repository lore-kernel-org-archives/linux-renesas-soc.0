Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:40239 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751047AbdGZLbN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 26 Jul 2017 07:31:13 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: laurent.pinchart@ideasonboard.com, geert+renesas@glider.be,
        linus.walleij@linaro.org
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 0/2] pinctrl: sh-pfc: r8a7795: add usb2.0 on R-Car H3 ES2.0
Date: Wed, 26 Jul 2017 20:28:09 +0900
Message-Id: <1501068491-3926-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This patch is based on the renesas-drivers.git /
renesas-drivers-2017-07-18-v4.13-rc1 tag.

Yoshihiro Shimoda (2):
  pinctrl: sh-pfc: r8a7795: Change USB3_{OVC,PWEN} definitions
  pinctrl: sh-pfc: r8a7795: Add USB 2.0 pins, groups and functions

 drivers/pinctrl/sh-pfc/pfc-r8a7795.c | 77 +++++++++++++++++++++++++++++++-----
 1 file changed, 67 insertions(+), 10 deletions(-)

-- 
1.9.1
