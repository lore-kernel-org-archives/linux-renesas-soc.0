Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor2.renesas.com ([210.160.252.172]:46354 "EHLO
        relmlie1.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1750925AbdIACo4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 31 Aug 2017 22:44:56 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: kishon@ti.com
Cc: linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v3 0/4] phy: rcar-gen3-usb2: add support for r8a77995
Date: Fri,  1 Sep 2017 11:41:21 +0900
Message-Id: <1504233685-17947-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This patch set is based on the latest phy.git / next branch
(the commit id = d9c51f4c53ae2af03aa8bd001d46f21b0adcdab8).

After this patch set is applied, a usb 2.0 host node that is combined
with usb 2.0 peripheral needs 'dr_mode = "otg";' property.

Changes from v2:
 - Revise the commit log ("SoCs" is not third-person singular present).

Changes from v1:
 - Revise typo "wronly" to "wrongly".
 - Remove RCAR_GEN3_PHY_HAS_DEDICATED_PINS from generic gen3 entry in
   patch 3/4
 - Remove the driver change from patch 4/4.
 - Revise the commit log of patch 4/4.

Yoshihiro Shimoda (4):
  phy: rcar-gen3-usb2: check dr_mode for otg mode
  phy: rcar-gen3-usb2: split the two meaning of "has_otg"
  phy: rcar-gen3-usb2: add SoC-specific parameter for dedicated pins
  phy: rcar-gen3-usb2: add binding for r8a77995

 .../devicetree/bindings/phy/rcar-gen3-phy-usb2.txt |  2 +
 drivers/phy/renesas/phy-rcar-gen3-usb2.c           | 93 ++++++++++++++++------
 2 files changed, 69 insertions(+), 26 deletions(-)

-- 
1.9.1
