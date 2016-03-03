Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: <kishon@ti.com>, <robh+dt@kernel.org>, <pawel.moll@arm.com>,
	<mark.rutland@arm.com>, <ijc+devicetree@hellion.org.uk>,
	<galak@codeaurora.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-renesas-soc@vger.kernel.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 0/3] phy: rcar-gen3-usb2: add vbus-supply and extcon
Date: Thu, 3 Mar 2016 19:09:03 +0900
Message-ID: <1456999746-2800-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This patch set is based on the latest linux-phy / next branch
(commit id = 89636adde4a05953e3bf18807ba1f6f205572f67)
and the following patches:

http://thread.gmane.org/gmane.linux.kernel/2166364
http://thread.gmane.org/gmane.linux.kernel.renesas-soc/1512/focus=1514

The patch "Add vbus-supply to handle VBUS on/off" has
Rob's Acked-by as the followings:
http://thread.gmane.org/gmane.linux.kernel.renesas-soc/1087/focus=1153

Yoshihiro Shimoda (3):
  phy: rcar-gen3-usb2: remove unnecesary struct rcar_gen3_data
  phy: rcar-gen3-usb2: Add vbus-supply to handle VBUS on/off
  phy: rcar-gen3-usb2: add extcon support

 .../devicetree/bindings/phy/rcar-gen3-phy-usb2.txt |  2 +
 drivers/phy/Kconfig                                |  1 +
 drivers/phy/phy-rcar-gen3-usb2.c                   | 87 +++++++++++++++++-----
 3 files changed, 71 insertions(+), 19 deletions(-)

-- 
1.9.1
