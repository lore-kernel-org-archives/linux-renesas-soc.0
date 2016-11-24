Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:52202 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S965155AbcKXUP3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 24 Nov 2016 15:15:29 -0500
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH renesas-next 0/3] ARM: dts: shmobile: Use SoC-specific compat string for mmcif
Date: Thu, 24 Nov 2016 21:15:11 +0100
Message-Id: <1480018514-31718-1-git-send-email-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi,

this short series makes add of SoC-specific compat strings to the DT of
the r8a73a4, r8a7778 and sh73a0 SoCs. This is in keeping with the
rest of the Renesas ARM based SoCs with mmcif enabled in mainline.

Based on renesas-devel-20161123v2-v4.9-rc6

Documentation of these compat strings for the mmcif driver has been posted
separately as:
  "[PATCH] mmc: sh_mmcif: Document r8a73a4, r8a7779 and sh73a0 DT bindings".

Simon Horman (3):
  ARM: dts: r8a73a4: Use SoC-specific compat string for mmcif
  ARM: dts: r8a7778: Use SoC-specific compat string for mmcif
  ARM: dts: sh73a0: Use SoC-specific compat string for mmcif

 arch/arm/boot/dts/r8a73a4.dtsi | 4 ++--
 arch/arm/boot/dts/r8a7778.dtsi | 2 +-
 arch/arm/boot/dts/sh73a0.dtsi  | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

-- 
2.7.0.rc3.207.g0ac5344
