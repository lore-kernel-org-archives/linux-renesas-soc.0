Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f47.google.com ([209.85.214.47]:36647 "EHLO
	mail-it0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752398AbcGXRp4 (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Sun, 24 Jul 2016 13:45:56 -0400
Received: by mail-it0-f47.google.com with SMTP id f6so70117941ith.1
        for <linux-renesas-soc@vger.kernel.org>; Sun, 24 Jul 2016 10:45:56 -0700 (PDT)
From: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
To: Simon Horman <horms@verge.net.au>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Subject: [PATCH v2 0/2] arm64: renesas: add H3ULCB board
Date: Sun, 24 Jul 2016 20:45:53 +0300
Message-Id: <1469382353-14847-1-git-send-email-vladimir.barinov@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello,

This adds the folowing:
- R8A7795 SoC based H3ULCB low cost board initial device tree
- Document DT bindings

Vladimir Barinov (2):
[1/2] arm64: renesas: h3ulcb: initial device tree
[2/2] dt: arm: shmobile: add H3ULCB board DT bindings

---
This patchset is against the 'kernel/git/horms/renesas.git' repo.

 arch/arm64/boot/dts/renesas/Makefile               |   2 +-
 arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts     | 316 +++++++++++++++++++++++++
 Documentation/devicetree/bindings/arm/shmobile.txt |   2 ++
 3 files changed, 319 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts
