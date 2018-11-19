Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from twhmllg4.macronix.com ([211.75.127.132]:21750 "EHLO
        TWHMLLG4.macronix.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727728AbeKSVOB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Nov 2018 16:14:01 -0500
Received: from TWHMLLG4.macronix.com (localhost [127.0.0.2] (may be forged))
        by TWHMLLG4.macronix.com with ESMTP id wAJA2DSI036267
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Nov 2018 18:02:13 +0800 (GMT-8)
        (envelope-from masonccyang@mxic.com.tw)
From: Mason Yang <masonccyang@mxic.com.tw>
To: broonie@kernel.org, tpiepho@impinj.com,
        linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Simon Horman <horms@verge.net.au>
Cc: boris.brezillon@bootlin.com, juliensu@mxic.com.tw,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        zhengxunli@mxic.com.tw, Mason Yang <masonccyang@mxic.com.tw>
Subject: [PATCH 0/2] spi: Add Renesas R-Car D3 RPC SPI driver
Date: Mon, 19 Nov 2018 18:01:28 +0800
Message-Id: <1542621690-10229-1-git-send-email-masonccyang@mxic.com.tw>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Mark,

This Renesas R-Car D3 RPC SPI driver is based on Boris's 
new spi-mem direct mapping read/write mode[1][2] and
test on R-Car D3 Draak board.

thanks for your review.

best regards,
Mason

[1] https://patchwork.kernel.org/patch/10670753/
[2] https://patchwork.kernel.org/patch/10670747/


Mason Yang (2):
  spi: Add Renesas R-Car RPC SPI controller driver
  dt-binding: spi: Document Renesas R-Car RPC controller bindings

 .../devicetree/bindings/spi/spi-renesas-rpc.txt    |  33 +
 drivers/spi/Kconfig                                |   6 +
 drivers/spi/Makefile                               |   1 +
 drivers/spi/spi-renesas-rpc.c                      | 750 +++++++++++++++++++++
 4 files changed, 790 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/spi/spi-renesas-rpc.txt
 create mode 100644 drivers/spi/spi-renesas-rpc.c

-- 
1.9.1
