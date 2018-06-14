Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:48314 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S935616AbeFNB4X (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Jun 2018 21:56:23 -0400
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Simon Horman <horms@verge.net.au>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v2 0/2] arch: convert to SPDX identifiers
Date: Thu, 14 Jun 2018 10:56:05 +0900
Message-Id: <20180614015607.7066-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

So, here is the rebased patch adding SPDX identifiers to mach-shmobile.
And a fixup patch to add the missing identifier in r8a7796.dtsi.

Thanks,

   Wolfram

Wolfram Sang (2):
  ARM: shmobile: convert to SPDX identifier
  arm64: dts: renesas: r8a7796 add missing SPDX identifier

 arch/arm/include/debug/renesas-scif.S              |  5 +----
 arch/arm/mach-shmobile/headsmp-apmu.S              |  5 +----
 arch/arm/mach-shmobile/platsmp-apmu.c              |  5 +----
 arch/arm/mach-shmobile/regulator-quirk-rcar-gen2.c | 10 +---------
 arch/arm/mach-shmobile/setup-emev2.c               | 10 +---------
 arch/arm/mach-shmobile/setup-r7s72100.c            | 10 +---------
 arch/arm/mach-shmobile/setup-r8a73a4.c             | 10 +---------
 arch/arm/mach-shmobile/setup-r8a7740.c             | 10 +---------
 arch/arm/mach-shmobile/setup-r8a7778.c             | 10 +---------
 arch/arm/mach-shmobile/setup-r8a7779.c             | 10 +---------
 arch/arm/mach-shmobile/setup-rcar-gen2.c           | 10 +---------
 arch/arm/mach-shmobile/setup-sh73a0.c              | 10 +---------
 arch/arm/mach-shmobile/smp-emev2.c                 | 10 +---------
 arch/arm/mach-shmobile/smp-r8a7779.c               | 10 +---------
 arch/arm64/boot/dts/renesas/r8a7796.dtsi           |  1 +
 15 files changed, 15 insertions(+), 111 deletions(-)

-- 
2.11.0
