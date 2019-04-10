Return-Path: <SRS0=jOjt=SM=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B3E6C10F11
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 10 Apr 2019 14:55:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5100920693
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 10 Apr 2019 14:55:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732911AbfDJOz1 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 10 Apr 2019 10:55:27 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:8187 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1732766AbfDJOz1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 10 Apr 2019 10:55:27 -0400
X-IronPort-AV: E=Sophos;i="5.60,332,1549897200"; 
   d="scan'208";a="12656257"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 10 Apr 2019 23:55:25 +0900
Received: from be1yocto.ree.adwin.renesas.com (unknown [172.29.43.62])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 5162742272B3;
        Wed, 10 Apr 2019 23:55:22 +0900 (JST)
From:   Biju Das <biju.das@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Biju Das <biju.das@bp.renesas.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        devicetree@vger.kernel.org, Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH V5 00/13] Add USB2.0 support
Date:   Wed, 10 Apr 2019 15:48:37 +0100
Message-Id: <1554907730-14792-1-git-send-email-biju.das@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This series adds USB 2.0 support for the RZ/G1C SoC. RZ/G1C
SoC is similar to R-Car Gen2 SoC, but there are some differences

- It has a shared pll reset register for hsusb0/hsusb1 and this register 
  reside in hsusb0 block.

- Each USB host needs to deassert the pll reset of hsusb block apart from
  initializing interrupt enable,OVC detection timer and suspend/resume timer
  register.

To address the above scenarios, created a ehci-r8a77470 host controller
driver.

This patchset is based on linux_next next-20190410 branch.
V4-->V5
   * Incoporated Shimoda-san's review comment
     (https://patchwork.kernel.org/patch/10879893/)
V3-->V4
  * Incoporated Kishon and Shimoda-san's review comment
    (https://patchwork.kernel.org/patch/10883265/)
  * Added missing rcar-gen3-phy-usb2 phy in ohci1 node.

V2-->V3
 * Incorporated Alan's review comment for dropping ehci-r8a77470 host driver
 * Incorporated shimoda-san's comments.
   Ref: https://patchwork.kernel.org/patch/10879899/

V1-->V2
 * Incorporated Rob's review comment
   Ref: https://patchwork.kernel.org/patch/10655853/
 * Incorporated Shimoda-San's review comment
   Ref: https://patchwork.kernel.org/patch/10655855/
 * Created ehci-r8a77470 host driver.

Biju Das (13):
  dt-bindings: phy: rcar-gen2: Add r8a77470 support
  phy: renesas: phy-rcar-gen2: Add support for r8a77470
  dt-bindings: rcar-gen3-phy-usb2: Add r8a77470 support
  phy: rcar-gen3-usb2: Add support for r8a77470
  ARM: shmobile: Enable PHY_RCAR_GEN3_USB2 in shmobile_defconfig
  dt-bindings: usb: renesas_usbhs: Add support for r8a77470
  ARM: shmobile: Enable USB [EO]HCI HCD PLATFORM support in
    shmobile_defconfig
  ARM: dts: r8a77470: Add USB PHY DT support
  ARM: dts: iwg23s-sbc: Enable USB Phy[01]
  ARM: dts: r8a77470: Add USB2.0 Host (EHCI/OHCI) device
  ARM: dts: iwg23s-sbc: Enable USB USB2.0 Host
  ARM: dts: r8a77470: Add HSUSB device nodes
  ARM: dts: iwg23s-sbc: Enable HS-USB

 .../devicetree/bindings/phy/rcar-gen2-phy.txt      |  57 ++++++++-
 .../devicetree/bindings/phy/rcar-gen3-phy-usb2.txt |   6 +-
 .../devicetree/bindings/usb/renesas_usbhs.txt      |   1 +
 arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts          |  44 +++++++
 arch/arm/boot/dts/r8a77470.dtsi                    | 141 +++++++++++++++++++++
 arch/arm/configs/shmobile_defconfig                |   3 +
 drivers/phy/renesas/Kconfig                        |   2 +-
 drivers/phy/renesas/phy-rcar-gen2.c                | 130 +++++++++++++++++--
 drivers/phy/renesas/phy-rcar-gen3-usb2.c           |  39 +++++-
 9 files changed, 398 insertions(+), 25 deletions(-)

-- 
2.7.4

