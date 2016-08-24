Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: <kishon@ti.com>, <robh+dt@kernel.org>, <mark.rutland@arm.com>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 0/2] phy: rcar-gen3-usb2: revise the dt doc and add support for r8a7796
Date: Wed, 24 Aug 2016 15:49:20 +0900
Message-ID: <1472021362-8085-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This patch set is based on the latest linux-phy.git / next branch.
(commit id = d9a6e11e10d657df9af1d321c0eccdead184f72a)

Yoshihiro Shimoda (2):
  phy: rcar-gen3-usb2: revise the example of device tree doc
  phy: rcar-gen3-usb2: Add a compatible string for r8a7796

 Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt | 6 ++++--
 drivers/phy/phy-rcar-gen3-usb2.c                             | 1 +
 2 files changed, 5 insertions(+), 2 deletions(-)

-- 
1.9.1
