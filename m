Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: kishon@ti.com
Cc: linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 0/4] phy: rcar-gen3-usb2: add support for r8a77995
Date: Thu, 31 Aug 2017 16:31:08 +0900
Message-Id: <1504164672-20677-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This patch set is based on the latest phy.git / next branch
(the commit id = d9c51f4c53ae2af03aa8bd001d46f21b0adcdab8).

After this patch set is applied, a usb 2.0 host node that is combined
with usb 2.0 peripheral needs 'dr_mode = "otg";' property.

Yoshihiro Shimoda (4):
  phy: rcar-gen3-usb2: check dr_mode for otg mode
  phy: rcar-gen3-usb2: split the two meaning of "has_otg"
  phy: rcar-gen3-usb2: add SoC-specific parameter for dedicated pins
  phy: rcar-gen3-usb2: add binding for r8a77995

 .../devicetree/bindings/phy/rcar-gen3-phy-usb2.txt |  2 +
 drivers/phy/renesas/phy-rcar-gen3-usb2.c           | 97 ++++++++++++++++------
 2 files changed, 73 insertions(+), 26 deletions(-)

-- 
1.9.1
