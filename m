Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from twhmllg3.macronix.com ([122.147.135.201]:45352 "EHLO
        TWHMLLG3.macronix.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725874AbeLCJTY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 3 Dec 2018 04:19:24 -0500
From: Mason Yang <masonccyang@mxic.com.tw>
To: broonie@kernel.org, marek.vasut@gmail.com,
        linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
        boris.brezillon@bootlin.com, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc: juliensu@mxic.com.tw, Simon Horman <horms@verge.net.au>,
        zhengxunli@mxic.com.tw, Mason Yang <masonccyang@mxic.com.tw>
Subject: [PATCH v2 0/2] spi: Add Renesas R-Car Gen3 RPC SPI driver 
Date: Mon,  3 Dec 2018 17:18:38 +0800
Message-Id: <1543828720-18345-1-git-send-email-masonccyang@mxic.com.tw>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Mark,

This Renesas R-Car Gen3 RPC SPI driver is based on Boris's new
spi-mem direct mapping read/write mode [1][2] and v2 patch is from
Marek and Geert's comments including RPC clock control,
run time PM, RPC module software reset, regmap and so on.

thanks for your review.

best regards,
Mason

[1] https://patchwork.kernel.org/patch/10670753
[2] https://patchwork.kernel.org/patch/10670747

Mason Yang (2):
  spi: Add Renesas R-Car Gen3 RPC SPI controller driver
  dt-binding: spi: Document Renesas R-Car Gen3 RPC controller bindings

 .../devicetree/bindings/spi/spi-renesas-rpc.txt    |  35 +
 drivers/spi/Kconfig                                |   6 +
 drivers/spi/Makefile                               |   1 +
 drivers/spi/spi-renesas-rpc.c                      | 808 +++++++++++++++++++++
 4 files changed, 850 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/spi/spi-renesas-rpc.txt
 create mode 100644 drivers/spi/spi-renesas-rpc.c

-- 
1.9.1
