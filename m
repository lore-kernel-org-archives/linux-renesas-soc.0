Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:43662 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751301AbdKTPql (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Nov 2017 10:46:41 -0500
Received: by mail-wm0-f66.google.com with SMTP id x63so19723032wmf.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Nov 2017 07:46:41 -0800 (PST)
From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
To: linux-renesas-soc@vger.kernel.org, horms@verge.net.au,
        geert@linux-m68k.org
Cc: wsa@the-dreams.de, Chris.Paterson2@renesas.com,
        magnus.damm@gmail.com,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Subject: [PATCH v2 0/3] R-Car D3 (r8a77995) SYS-DMAC integration
Date: Mon, 20 Nov 2017 16:46:33 +0100
Message-Id: <1511192796-2268-1-git-send-email-ulrich.hecht+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi!

This adds DT nodes and bindings for the SYS-DMAC on R-Car D3 and enables
the DMAs for SCIF2.

Thanks to Chris, Geert and Simon for the review. This revision adds the
second pair of DMAs to SCIF2 and fixes a typo in the subject line.

CU
Uli


Ulrich Hecht (3):
  arm64: dts: r8a77995: add SYS-DMAC nodes
  arm64: dts: r8a77995: add DMA for SCIF2
  dmaengine: rcar-dmac: Document R-Car D3 bindings

 .../devicetree/bindings/dma/renesas,rcar-dmac.txt  |  1 +
 arch/arm64/boot/dts/renesas/r8a77995.dtsi          | 75 ++++++++++++++++++++++
 2 files changed, 76 insertions(+)

-- 
2.7.4
