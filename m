Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f42.google.com ([209.85.215.42]:32832 "EHLO
        mail-lf0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753218AbdAZPNP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Jan 2017 10:13:15 -0500
Received: by mail-lf0-f42.google.com with SMTP id x1so60377485lff.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Jan 2017 07:13:14 -0800 (PST)
From: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Subject: [PATCH 0/2] arm64: renesas: enable H3ULCB board peripherals
Date: Thu, 26 Jan 2017 18:13:26 +0300
Message-Id: <1485443606-22566-1-git-send-email-vladimir.barinov@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello,

This adds the folowing:
- R8A7795 SoC based H3ULCB board peripherals

Vladimir Barinov (2):
[1/2] arm64: dts: h3ulcb: Update memory node to 4 GiB map
[2/2] arm64: dts: h3ulcb: enable HS200 for eMMC

---
This patchset is against the 'kernel/git/horms/renesas.git' repo.

 arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts     | 16 +++++++++++++++++++++++++
 1 file changed, 16 insertions(+)
