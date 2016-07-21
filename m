Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f48.google.com ([209.85.215.48]:33533 "EHLO
	mail-lf0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752276AbcGUM0F (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Thu, 21 Jul 2016 08:26:05 -0400
Received: by mail-lf0-f48.google.com with SMTP id b199so60517379lfe.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 21 Jul 2016 05:26:04 -0700 (PDT)
From: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
To: Simon Horman <horms@verge.net.au>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Subject: [PATCH 0/2] arm64: renesas: add H3ULCB board
Date: Thu, 21 Jul 2016 15:26:02 +0300
Message-Id: <1469103962-20378-1-git-send-email-vladimir.barinov@cogentembedded.com>
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

 arch/arm64/boot/dts/renesas/Makefile           |   2 +-
 arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts | 326 +++++++++++++++++++++++++
 Documentation/devicetree/bindings/arm/shmobile.txt | 2 ++
 3 files changed, 329 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts
