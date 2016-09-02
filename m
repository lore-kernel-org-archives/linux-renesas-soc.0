Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f53.google.com ([209.85.215.53]:35191 "EHLO
        mail-lf0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932519AbcIBQXn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Sep 2016 12:23:43 -0400
Received: by mail-lf0-f53.google.com with SMTP id e198so53734195lfb.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 02 Sep 2016 09:23:42 -0700 (PDT)
From: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Subject: [PATCH v5 0/4] arm64: renesas: enable H3ULCB board peripherals
Date: Fri,  2 Sep 2016 19:23:39 +0300
Message-Id: <1472833419-26139-1-git-send-email-vladimir.barinov@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello,

This adds the folowing:
- R8A7795 SoC based H3ULCB board peripherals

Vladimir Barinov (4):
[1/4] arm64: dts: h3ulcb: enable GPIO leds
[2/4] arm64: dts: h3ulcb: enable GPIO keys
[3/4] arm64: dts: h3ulcb: enable SDHI0
[4/4] arm64: dts: h3ulcb: Sound SSI support

---
This patchset is against the 'kernel/git/horms/renesas.git' repo.

 arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts     | 189 +++++++++++++++++++++++++
 1 file changed, 189 insertions(+)
