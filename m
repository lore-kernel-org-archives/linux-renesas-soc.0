Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:33959 "EHLO
        mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932717AbeGDGTz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 4 Jul 2018 02:19:55 -0400
Received: by mail-wm0-f67.google.com with SMTP id l15-v6so12111665wmc.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 03 Jul 2018 23:19:55 -0700 (PDT)
Date: Wed, 4 Jul 2018 07:19:52 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Marek Vasut <marek.vasut@gmail.com>
Cc: linux-kernel@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Mark Brown <broonie@kernel.org>,
        Steve Twiss <stwiss.opensource@diasemi.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [GIT PULL] Immutable branch between MFD and Regulator due for the
 v4.19 merge window
Message-ID: <20180704061951.GW20176@dell>
References: <20180611115851.1987-1-marek.vasut+renesas@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20180611115851.1987-1-marek.vasut+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

[This set really should have a 0th patch (a.k.a. a cover-letter)]

Enjoy!

The following changes since commit ce397d215ccd07b8ae3f71db689aedb85d56ab40:

  Linux 4.18-rc1 (2018-06-17 08:04:49 +0900)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git ib-mfd-regulator-v4.19

for you to fetch changes up to c287572b739ad18b7fd298f3af3bec21037a55f7:

  mfd: da9063: Add DA9063L support (2018-07-04 07:17:13 +0100)

----------------------------------------------------------------
Immutable branch between MFD and Regulator due for the v4.19 merge window

----------------------------------------------------------------
Marek Vasut (14):
      mfd: da9063: Replace regmap_add_irq_chip with devm counterpart
      mfd: da9063: Replace mfd_add_devices with devm counterpart
      mfd: da9063: Use regmap_reg_range
      mfd: da9063: Use REGMAP_IRQ_REG
      mfd: da9063: Use PLATFORM_DEVID_NONE
      mfd: da9063: Replace DA9063_NUM_IRQ with ARRAY_SIZE
      mfd: da9063: Rename PMIC_DA9063 to PMIC_CHIP_ID_DA9063
      mfd: da9063: Replace model with type
      mfd: da9063: Add DA9063L type
      mfd: da9063: Add custom regmap for DA9063L
      mfd: da9063: Add custom IRQ map for DA9063L
      mfd: da9063: Register RTC only on DA9063L
      regulator: da9063: Handle less LDOs on DA9063L
      mfd: da9063: Add DA9063L support

 drivers/mfd/da9063-core.c            |  44 +++---
 drivers/mfd/da9063-i2c.c             | 239 +++++++++++++------------------
 drivers/mfd/da9063-irq.c             | 264 ++++++++++++++++++-----------------
 drivers/regulator/da9063-regulator.c |  84 ++++++-----
 include/linux/mfd/da9063/core.h      |  15 +-
 5 files changed, 316 insertions(+), 330 deletions(-)

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
