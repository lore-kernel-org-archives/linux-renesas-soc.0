Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-yw0-f171.google.com ([209.85.161.171]:35573 "EHLO
        mail-yw0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753234AbdGGCgV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 6 Jul 2017 22:36:21 -0400
Received: by mail-yw0-f171.google.com with SMTP id v193so8430695ywg.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 06 Jul 2017 19:36:20 -0700 (PDT)
From: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Subject: [PATCH 0/5] arm64: dts: renesas: ulcb: Enable HDMI
Date: Fri,  7 Jul 2017 05:36:16 +0300
Message-Id: <1499394976-14201-1-git-send-email-vladimir.barinov@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello,

This patch series enables HDMI support for the H3 and M3-W based ULCB boards

This has the following dependency:
- [PATCH v2 series] R-Car Salvator-X M3-W: Enable DU support
- [PATCH] arm64: dts: renesas: ulcb: Enable I2C4
- [PATCH] clk: vc5: Add support for IDT VersaClock 5P49V5925

Vladimir Barinov (5):
[1/5] arm64: dts: renesas: ulcb: Add DU external dot clock sources
[2/5] arm64: dts: renesas: r8a7795-h3ulcb: Add DU external dot clocks
[3/5] arm64: dts: renesas: r8a7796-m3ulcb: Add DU external dot clocks
[4/5] arm64: dts: renesas: ulcb: Add HDMI output connector
[5/5] arm64: dts: renesas: ulcb: Enable HDMI output

---
This patchset is against the 'kernel/git/horms/renesas.git' repo.

 r8a7795-h3ulcb.dts |   14 ++++++++++++++
 r8a7796-m3ulcb.dts |   12 ++++++++++++
 ulcb.dtsi          |   42 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 68 insertions(+)
