Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:26827 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S933163AbcILOQB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 12 Sep 2016 10:16:01 -0400
From: Chris Brandt <chris.brandt@renesas.com>
To: Ulf Hansson <ulf.hansson@linaro.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Simon Horman <horms+renesas@verge.net.au>,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH v3 0/3] mmc: sh_mobile_sdhi: Add r7s72100 support
Date: Mon, 12 Sep 2016 10:15:04 -0400
Message-Id: <20160912141507.6837-1-chris.brandt@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

For the most part, the SDHI controller in the RZ/A1 (r7s72100)
is the same as other Renesas SoC...except for the fact that the 
data port register was widened to 32-bits and the 16-bit accesses
in the current tmio driver aren't going to cut it.

Also, the tmio driver allows you to pass in what voltages you
support via the ocr_mask. For the RZ/A1, it's just simple 3.3v.
So, I added the ability to pass that when using DT.

Chris Brandt (3):
  mmc: sh_mobile_sdhi: add ocr_mask option
  mmc: tmio-mmc: add support for 32bit data port
  mmc: sh_mobile_sdhi: Add r7s72100 support

 Documentation/devicetree/bindings/mmc/tmio_mmc.txt |  1 +
 drivers/mmc/host/sh_mobile_sdhi.c                  |  9 +++++++
 drivers/mmc/host/tmio_mmc.h                        | 12 +++++++++
 drivers/mmc/host/tmio_mmc_pio.c                    | 30 ++++++++++++++++++++++
 include/linux/mfd/tmio.h                           |  5 ++++
 5 files changed, 57 insertions(+)

-- 
2.9.2
