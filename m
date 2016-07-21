Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor2.renesas.com ([210.160.252.172]:29758 "EHLO
	relmlie1.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1751916AbcGUKrY (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Thu, 21 Jul 2016 06:47:24 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: <horms@verge.net.au>, <magnus.damm@gmail.com>,
	<robh+dt@kernel.org>, <mark.rutland@arm.com>
CC: <devicetree@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v3 0/5] arm64: dts: r8a7795: Add HSUSB device node and enable channel 0 of USB2.0
Date: Thu, 21 Jul 2016 19:46:56 +0900
Message-ID: <1469098021-7692-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This patch is based on the renesas.git / renesas-devel-20160718-v4.7-rc7 tag.

Changes from v2:
 - rebase on renesas.git / renesas-devel-20160718-v4.7-rc7.
  - maybe the panic issue disappears on the tree. but, if still happens,
    please try the following patch:
    https://git.kernel.org/cgit/linux/kernel/git/gregkh/usb.git/commit/?h=usb-next&id=c14f8a4032efa73d9c4e155add47c19252b3bdf4
 - remove the redundant instruction in patch 4.
 - add a new patch that enables HSUSB driver as kernel module on the defconfig.

Changes from v1:
 - fix compatible string of hsusb in patch 1.
 - fix patch 2 for "make dtbs W=1" warning.

Yoshihiro Shimoda (5):
  arm64: dts: r8a7795: Add HSUSB device node
  arm64: dts: salvator-x: enable usb2_phy of channel 0
  arm64: dts: salvator-x: enable USB 2.0 Host channel 0
  arm64: dts: salvator-x: enable HSUSB
  arm64: defconfig: Add Renesas R-Car HSUSB driver support as module

 arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts | 36 ++++++++++++++++++++++
 arch/arm64/boot/dts/renesas/r8a7795.dtsi           | 17 ++++++++++
 arch/arm64/configs/defconfig                       |  2 ++
 3 files changed, 55 insertions(+)

-- 
1.9.1
