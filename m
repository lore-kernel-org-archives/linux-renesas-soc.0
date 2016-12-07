Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wj0-f196.google.com ([209.85.210.196]:34832 "EHLO
        mail-wj0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752729AbcLGQoe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 7 Dec 2016 11:44:34 -0500
Received: by mail-wj0-f196.google.com with SMTP id he10so36605795wjc.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 07 Dec 2016 08:44:33 -0800 (PST)
From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
To: linux-renesas-soc@vger.kernel.org, horms@verge.net.au,
        geert@linux-m68k.org
Cc: magnus.damm@gmail.com,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Subject: [PATCH v2 0/3] r8a7796 SCIF integration
Date: Wed,  7 Dec 2016 17:44:24 +0100
Message-Id: <1481129067-21949-1-git-send-email-ulrich.hecht+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi!

This revision fixes the completely incorrect DMA assignments (must have
looked in the wrong datasheet), and adds dmac2 references and Reviewed-bys
where appropriate.

Based on renesas-devel-20161207-v4.9-rc8.

CU
Uli


Ulrich Hecht (3):
  clk: renesas: r8a7796: Add SCIF clocks
  arm64: renesas: r8a7796: Add all SCIF nodes
  arm64: renesas: r8a7796: Enable SCIF DMA

 arch/arm64/boot/dts/renesas/r8a7796.dtsi | 78 ++++++++++++++++++++++++++++++++
 drivers/clk/renesas/r8a7796-cpg-mssr.c   |  5 ++
 2 files changed, 83 insertions(+)

-- 
2.7.4
