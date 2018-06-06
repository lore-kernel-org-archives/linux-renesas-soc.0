Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:11561 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S932164AbeFFGn4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 6 Jun 2018 02:43:56 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: laurent.pinchart@ideasonboard.com, geert+renesas@glider.be,
        linus.walleij@linaro.org
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 0/2] pinctrl: sh-pfc: r8a77990: Add USB2.0 pins, groups and funcrions
Date: Wed,  6 Jun 2018 15:43:03 +0900
Message-Id: <1528267385-19017-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This patch set is based on renesas-drivers.git /
renesas-drivers-2018-06-05-v4.17 tag.

Takeshi Kihara (1):
  pinctrl: sh-pfc: r8a77990: Add USB2.0 pins, groups and functions

Yoshihiro Shimoda (1):
  pinctrl: sh-pfc: r8a77990: Revise USB ID pin name

 drivers/pinctrl/sh-pfc/pfc-r8a77990.c | 42 +++++++++++++++++++++++++++++++++--
 1 file changed, 40 insertions(+), 2 deletions(-)

-- 
1.9.1
