Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from smtp6-v.fe.bosch.de ([139.15.237.11]:57106 "EHLO
        smtp6-v.fe.bosch.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751614AbdIFHFN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 6 Sep 2017 03:05:13 -0400
From: Dirk Behme <dirk.behme@de.bosch.com>
To: <linux-renesas-soc@vger.kernel.org>, <linux-spi@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
CC: Dirk Behme <dirk.behme@de.bosch.com>
Subject: [PATCH 0/8] spi: sh-msiof: Import some BSP patches
Date: Wed, 6 Sep 2017 09:04:59 +0200
Message-ID: <20170906070507.26223-1-dirk.behme@de.bosch.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Pick some patches and fixes from Renesas v4.9/rcar-3.5.8 BSP to make spi
on RCar3 more reliably.

Patches are done against renesas-drivers-2017-09-05-v4.13.

Should we consider

spi: sh-msiof: Fix DMA transfer size check
spi: sh-msiof: Fix MSIOF address for DMAC

for -stable?

Both have been introduced with

b0d0ce8b6b91a0f6f99045b6019
spi: sh-msiof: Add DMA support
v3.17

Best regards

Dirk
