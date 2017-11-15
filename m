Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wr0-f193.google.com ([209.85.128.193]:51568 "EHLO
        mail-wr0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1758264AbdKOPZO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 Nov 2017 10:25:14 -0500
Received: by mail-wr0-f193.google.com with SMTP id z14so1996540wrb.8
        for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Nov 2017 07:25:13 -0800 (PST)
From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
To: linux-renesas-soc@vger.kernel.org, wsa@the-dreams.de,
        horms@verge.net.au, geert@linux-m68k.org
Cc: magnus.damm@gmail.com,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Subject: [PATCH 0/3] R-Car D3 (r8a77995) SYS-DMAC integration
Date: Wed, 15 Nov 2017 16:25:07 +0100
Message-Id: <1510759510-30295-1-git-send-email-ulrich.hecht+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi!

This adds DT nodes and bindings for the SYS-DMAC on R-Car D3 and enables
the DMAs for SCIF2.

CU
Uli


Ulrich Hecht (3):
  arm64: dts: r8a77995: add SYS-DMAC nodes
  arm64: dts: r8a7795: add DMA for SCIF2
  dmaengine: rcar-dmac: Document R-Car D3 bindings

 .../devicetree/bindings/dma/renesas,rcar-dmac.txt  |  1 +
 arch/arm64/boot/dts/renesas/r8a77995.dtsi          | 74 ++++++++++++++++++++++
 2 files changed, 75 insertions(+)

-- 
2.7.4
