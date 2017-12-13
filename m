Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:10327 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751049AbdLMGb6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Dec 2017 01:31:58 -0500
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: kishon@ti.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 0/5] phy: renesas: rcar-gen3-usb2: add gpio handling for R-Car D3
Date: Wed, 13 Dec 2017 15:27:35 +0900
Message-Id: <1513146460-20326-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This patch set is based on the latest linux-phy / next branch
(commit id = 4fbd8d194f06c8a3fd2af1ce560ddb31f7ec8323).

This new feature will be used by the renesas_usbhs driver on R-Car D3.

Yoshihiro Shimoda (5):
  phy: renesas: rcar-gen3-usb2: call INIT_WORK() anyway
  phy: renesas: rcar-gen3-usb2: unify OBINTEN handling
  phy: renesas: rcar-gen3-usb2: use prefix "has_otg_pins_" for dedicated
    pins handling
  phy: renesas: rcar-gen3-usb2: add rcar_gen3_role_swap_ops
  phy: renesas: rcar-gen3-usb2: add gpio handlings

 .../devicetree/bindings/phy/rcar-gen3-phy-usb2.txt |   2 +
 drivers/phy/renesas/phy-rcar-gen3-usb2.c           | 262 ++++++++++++++++-----
 2 files changed, 206 insertions(+), 58 deletions(-)

-- 
1.9.1
