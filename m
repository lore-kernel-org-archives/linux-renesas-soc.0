Return-Path: <SRS0=l30p=SD=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F327C43381
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  1 Apr 2019 13:00:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5222420828
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  1 Apr 2019 13:00:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726604AbfDANAT (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 1 Apr 2019 09:00:19 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:48084 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726421AbfDANAS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 1 Apr 2019 09:00:18 -0400
X-IronPort-AV: E=Sophos;i="5.60,296,1549897200"; 
   d="scan'208";a="11720701"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 01 Apr 2019 22:00:16 +0900
Received: from be1yocto.ree.adwin.renesas.com (unknown [172.29.43.62])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 8DE0B40104F3;
        Mon,  1 Apr 2019 22:00:13 +0900 (JST)
From:   Biju Das <biju.das@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Biju Das <biju.das@bp.renesas.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        devicetree@vger.kernel.org, Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH 00/12] Add USB2.0 support
Date:   Mon,  1 Apr 2019 13:53:40 +0100
Message-Id: <1554123232-58942-1-git-send-email-biju.das@bp.renesas.com>
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

This patchset is based on linux_next next-20190401 branch.

V1-->V2
 * Incorporated Rob's review comment
   Ref: https://patchwork.kernel.org/patch/10655853/
 * Incorporated Shimoda-San's review comment
   Ref: https://patchwork.kernel.org/patch/10655855/
 * Created ehci-r8a77470 host driver.

Biju Das (12):
  dt-bindings: phy: rcar-gen2: Add r8a77470 support
  phy: renesas: phy-rcar-gen2: Add support for r8a77470
  dt-bindings: usb: ehci-r8a77470 devicetree binding document
  usb: host: ehci-r8a77470: Add EHCI support for Renesas RZ/G1C devices
  ARM: shmobile: Enable USB [EO]HCI HCD PLATFORM support in
    shmobile_defconfig
  dt-bindings: usb: renesas_usbhs: Add support for r8a77470
  ARM: dts: r8a77470: Add USB PHY DT support
  ARM: dts: iwg23s-sbc: Enable USB Phy[01]
  ARM: dts: r8a77470: Add USB2.0 Host (EHCI/OHCI) device
  ARM: dts: iwg23s-sbc: Enable USB USB2.0 Host
  ARM: dts: r8a77470: Add HSUSB device nodes
  ARM: dts: iwg23s-sbc: Enable HS-USB

 .../devicetree/bindings/phy/rcar-gen2-phy.txt      |  57 +++-
 .../devicetree/bindings/usb/ehci-r8a77470.txt      |  35 +++
 .../devicetree/bindings/usb/renesas_usbhs.txt      |   1 +
 arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts          |  36 +++
 arch/arm/boot/dts/r8a77470.dtsi                    | 121 ++++++++
 arch/arm/configs/shmobile_defconfig                |   2 +
 drivers/phy/renesas/phy-rcar-gen2.c                |  88 +++++-
 drivers/usb/host/Kconfig                           |   9 +
 drivers/usb/host/Makefile                          |   1 +
 drivers/usb/host/ehci-r8a77470.c                   | 327 +++++++++++++++++++++
 10 files changed, 671 insertions(+), 6 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/usb/ehci-r8a77470.txt
 create mode 100644 drivers/usb/host/ehci-r8a77470.c

-- 
2.7.4

