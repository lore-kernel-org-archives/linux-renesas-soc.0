Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor2.renesas.com ([210.160.252.172]:34284 "EHLO
        relmlie1.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1752069AbeB0IMy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 27 Feb 2018 03:12:54 -0500
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: laurent.pinchart@ideasonboard.com, geert+renesas@glider.be,
        linus.walleij@linaro.org
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 0/2] pinctrl: sh-pfc: r8a77965: Add USB[23] host pins, groups and functions
Date: Tue, 27 Feb 2018 17:08:00 +0900
Message-Id: <1519718882-27636-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This patch is based on the renesas-drivers.git / sh-pfc-for-v4.17 branch
(commit id = fbd452aeb49e552e7278c25c63198caa918deb04)

Takeshi Kihara (2):
  pinctrl: sh-pfc: r8a77965: Add USB2.0 host pins, groups and functions
  pinctrl: sh-pfc: r8a77965: Add USB3.0 host pins, groups and functions

 drivers/pinctrl/sh-pfc/pfc-r8a77965.c | 48 +++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

-- 
1.9.1
