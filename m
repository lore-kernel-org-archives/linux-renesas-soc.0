Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:36544 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756600AbdLOPO4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 15 Dec 2017 10:14:56 -0500
Received: by mail-wm0-f65.google.com with SMTP id b76so18356203wmg.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 15 Dec 2017 07:14:55 -0800 (PST)
From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
To: linux-renesas-soc@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com, magnus.damm@gmail.com,
        geert@linux-m68k.org, Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Subject: [PATCH 0/4] r8a7796 bits required for out-of-tree GSX module
Date: Fri, 15 Dec 2017 16:14:46 +0100
Message-Id: <1513350890-2446-1-git-send-email-ulrich.hecht+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi!

This is a minimized set of patches required to get the PowerVR GPU driver
to work on mainline (based on renesas-drivers-2017-12-12-v4.15-rc3).

I suppose the GSX-related DT entries are not upstreamable, but what about
the ZG clock?

CU
Uli


Gaku Inami (1):
  arm64: dts: r8a7796: Add DEVFREQ support for GSX

Takeshi Kihara (3):
  clk: renesas: r8a7796: Add ZG clock
  clk: renesas: rcar-gen3: Add ZG clock divider support
  arm64: dts: r8a7796: Add GSX device node

 arch/arm64/boot/dts/renesas/r8a7796.dtsi |  30 ++++++++
 drivers/clk/renesas/r8a7796-cpg-mssr.c   |   2 +
 drivers/clk/renesas/rcar-gen3-cpg.c      | 120 +++++++++++++++++++++++++++++++
 drivers/clk/renesas/rcar-gen3-cpg.h      |   1 +
 4 files changed, 153 insertions(+)

-- 
2.7.4
