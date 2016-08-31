Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f47.google.com ([209.85.215.47]:36829 "EHLO
        mail-lf0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1759216AbcHaKB4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 31 Aug 2016 06:01:56 -0400
Received: by mail-lf0-f47.google.com with SMTP id g62so32860287lfe.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 31 Aug 2016 03:01:56 -0700 (PDT)
From: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Subject: [PATCH v3 0/12] arm64: renesas: add H3ULCB board
Date: Wed, 31 Aug 2016 13:01:52 +0300
Message-Id: <1472637712-14583-1-git-send-email-vladimir.barinov@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello,

This adds the folowing:
- R8A7795 SoC based H3ULCB low cost board device tree
- Document DT bindings

Vladimir Barinov (12):
[01/12] dt: arm: shmobile: add H3ULCB board DT bindings
[02/12] arm64: dts: h3ulcb: initial device tree
[03/12] arm64: dts: h3ulcb: enable SCIF clk and pins
[04/12] arm64: dts: h3ulcb: enable EthernetAVB
[05/12] arm64: dts: h3ulcb: enable GPIO leds
[06/12] arm64: dts: h3ulcb: enable SDHI0
[07/12] arm64: dts: h3ulcb: enable I2C2
[08/12] arm64: dts: h3ulcb: enable EXTALR clk
[09/12] arm64: dts: h3ulcb: enable WDT
[10/12] arm64: dts: h3ulcb: enable USB2 PHY of channel 1
[11/12] arm64: dts: h3ulcb: enable USB2.0 Host channel 1
[12/12] arm64: dts: h3ulcb: Sound SSI support

---
This patchset is against the 'kernel/git/horms/renesas.git' repo.

 arch/arm64/boot/dts/renesas/Makefile               |   2 +-
 arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts     | 316 +++++++++++++++++++++++++
 Documentation/devicetree/bindings/arm/shmobile.txt |   2 ++
 3 files changed, 319 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts
