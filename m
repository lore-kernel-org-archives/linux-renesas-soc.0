Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from stcim.de ([78.46.90.227]:49558 "EHLO stcim.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726448AbeJGWrk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 7 Oct 2018 18:47:40 -0400
From: Stefan Lengfeld <contact@stefanchrist.eu>
To: wsa+renesas@sang-engineering.com
Cc: linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        preid@electromag.com.au, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.or, j-keerthy@ti.com,
        t-kristo@ti.com, grygorii.strashko@ti.com,
        andriy.shevchenko@linux.intel.com
Subject: Re: [RFC PATCH 0/3] i2c: core: introduce master_xfer_irqless
Date: Sun,  7 Oct 2018 17:39:34 +0200
Message-Id: <20181007153937.16787-1-contact@stefanchrist.eu>
In-Reply-To: <20180923202034.qugs4fxucj7h4vri@porty>
References: <20180923202034.qugs4fxucj7h4vri@porty>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Wolfram,

I have ported my i.MX6 patches on your patch stack and tested the reboot
handler on my i.MX6 Solo Board.  Works without lockdep and non-atomic
warnings so far.

Kind Regards,
    Stefan


Stefan Christ (1):
  ARM: dts: phyboard-mira-dl: rely on PMIC for reboot and watchdog

Stefan Lengfeld (2):
  i2c: imx: implement master_xfer_irqless callback
  watchdog: da9062: avoid regmap in restart handler

 arch/arm/boot/dts/imx6dl-phytec-mira-rdk-nand.dts |   8 ++
 drivers/i2c/busses/i2c-imx.c                      | 128 ++++++++++++++++------
 drivers/mfd/da9062-core.c                         |   1 +
 drivers/watchdog/da9062_wdt.c                     |  17 ++-
 include/linux/mfd/da9062/core.h                   |   1 +
 5 files changed, 116 insertions(+), 39 deletions(-)

-- 
2.16.4
