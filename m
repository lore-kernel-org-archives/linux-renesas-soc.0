Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f48.google.com ([209.85.215.48]:34336 "EHLO
        mail-lf0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932323AbdIFWec (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 6 Sep 2017 18:34:32 -0400
Received: by mail-lf0-f48.google.com with SMTP id l196so20807254lfl.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 06 Sep 2017 15:34:31 -0700 (PDT)
From: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Subject: [PATCH 0/18] arm64: renesas: add ULCB Kingfisher board
Date: Thu,  7 Sep 2017 01:34:27 +0300
Message-Id: <1504737267-22829-1-git-send-email-vladimir.barinov@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello,

This adds the folowing:
- ULCB Kingfisher infotainment board device tree
- Document DT bindings

Vladimir Barinov (18):
[01/18] dt: arm: shmobile: add M3ULCB Kingfisher board DT
[02/18] dt: arm: shmobile: add H3ULCB Kingfisher board DT
[03/18] arm64: dts: ulcb-kf: initial device tree
[04/18] arm64: dts: m3ulcb-kf: initial device tree
[05/18] arm64: dts: h3ulcb-kf: ES1.x SoC initial device tree
[06/18] arm64: dts: h3ulcb-kf: ES2.0+ SoC initial device tree
[07/18] arm64: dts: ulcb-kf: enable SCIF1
[08/18] arm64: dts: ulcb-kf: enable CAN0/1
[09/18] arm64: dts: ulcb-kf: enable USB2 PHY of channel 0
[10/18] arm64: dts: ulcb-kf: enable HSUSB
[11/18] arm64: dts: ulcb-kf: enable USB2.0 Host channel 0
[12/18] arm64: dts: ulcb-kf: enable PCIE0/1
[13/18] arm64: dts: ulcb-kf: enable USB3.0 Host
[14/18] arm64: dts: ulcb-kf: enable PCA9539 on I2C2
[15/18] arm64: dts: ulcb-kf: enable PCA9539 on I2C4
[16/18] arm64: dts: ulcb-kf: enable PCA9548 on I2C2
[17/18] arm64: dts: ulcb-kf: enable PCA9548 on I2C4
[18/18] arm64: dts: ulcb-kf: hog USB3 hub control gpios

---
This patchset is against the 'kernel/git/horms/renesas.git' repo.

 Documentation/devicetree/bindings/arm/shmobile.txt    |    2 
 arch/arm64/boot/dts/renesas/Makefile                  |    3 
 arch/arm64/boot/dts/renesas/r8a7795-es1-h3ulcb-kf.dts |   17 +
 arch/arm64/boot/dts/renesas/r8a7795-h3ulcb-kf.dts     |   17 +
 arch/arm64/boot/dts/renesas/r8a7796-m3ulcb-kf.dts     |   17 +
 arch/arm64/boot/dts/renesas/ulcb-kf.dtsi              |  185 ++++++++++++++++++
 6 files changed, 241 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a7795-es1-h3ulcb-kf.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r8a7795-h3ulcb-kf.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r8a7796-m3ulcb-kf.dts
 create mode 100644 arch/arm64/boot/dts/renesas/ulcb-kf.dts
