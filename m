Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wj0-f196.google.com ([209.85.210.196]:34386 "EHLO
        mail-wj0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753112AbcLGQox (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 7 Dec 2016 11:44:53 -0500
Received: by mail-wj0-f196.google.com with SMTP id xy5so50774558wjc.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 07 Dec 2016 08:44:52 -0800 (PST)
From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
To: linux-renesas-soc@vger.kernel.org, horms@verge.net.au,
        geert@linux-m68k.org
Cc: magnus.damm@gmail.com,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Subject: [PATCH v2 0/4] r8a7796 HSCIF integration
Date: Wed,  7 Dec 2016 17:44:44 +0100
Message-Id: <1481129088-22026-1-git-send-email-ulrich.hecht+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi!

This revision adds dmac2 references and Reviewed-bys where appropriate, plus
the missing C pin group for HSCIF2.

(Unlike the SCIF series, the DMA assignments in this one are not completely
bogus. Go figure.)

Based on renesas-devel-20161207-v4.9-rc8.

CU
Uli


Ulrich Hecht (4):
  clk: shmobile: r8a7796: Add HSCIF clocks
  pinctrl: sh-pfc: r8a7796: Add HSCIF pins, groups, and functions
  arm64: renesas: r8a7796 dtsi: Add all HSCIF nodes
  arm64: renesas: r8a7796: Enable HSCIF DMA

 arch/arm64/boot/dts/renesas/r8a7796.dtsi |  83 +++++++++
 drivers/clk/renesas/r8a7796-cpg-mssr.c   |   5 +
 drivers/pinctrl/sh-pfc/pfc-r8a7796.c     | 283 +++++++++++++++++++++++++++++++
 3 files changed, 371 insertions(+)

-- 
2.7.4
