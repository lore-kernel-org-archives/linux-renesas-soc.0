Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:53760 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752033AbdHII0w (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 9 Aug 2017 04:26:52 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH v2 0/3] ARM, arm64: dts: renesas: Use R-Car SATA Gen[23] fallback compat strings
Date: Wed,  9 Aug 2017 10:26:40 +0200
Message-Id: <1502267203-12229-1-git-send-email-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Use newly added R-Car SATA Gen 2 and 3 fallback compat strings.

This should have no run-time effect as the driver matches against the
per-SoC compat string before considering the fallback compat string.

Changes since v1:
* Update patch changelogs to refer to SATA instead of GPIO,
  cut-and-paste madness in action

Based on renesas-devel-20170807-v4.13-rc4


Simon Horman (3):
  ARM: dts: r8a7790: Use R-Car SATA Gen2 fallback compat string
  ARM: dts: r8a7791: Use R-Car SATA Gen2 fallback compat string
  arm64: dts: r8a7795: Use R-Car SATA Gen3 fallback compat string

 arch/arm/boot/dts/r8a7790.dtsi           | 4 ++--
 arch/arm/boot/dts/r8a7791.dtsi           | 4 ++--
 arch/arm64/boot/dts/renesas/r8a7795.dtsi | 3 ++-
 3 files changed, 6 insertions(+), 5 deletions(-)

-- 
2.1.4
