Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:60904 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726193AbeITV6r (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 20 Sep 2018 17:58:47 -0400
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        Stefan Lengfeld <contact@stefanchrist.eu>,
        preid@electromag.com.au, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, Keerthy <j-keerthy@ti.com>,
        Tero Kristo <t-kristo@ti.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [RFC PATCH 0/4] i2c: core: introduce master_xfer_irqless
Date: Thu, 20 Sep 2018 18:14:19 +0200
Message-Id: <20180920161423.13990-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

To keep the discussion about master_xfer_irqless going, I post here a
draft how I envision the changes to the I2C core. They are only build
tested. I am unsure if I can test them on hardware before next week, so
I'll send them around as RFC already, so people can get an idea and
comment. Maybe Stefan has some bandwidth to test his imx driver
implementation on top of this?

A branch can be found here:

git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/i2c/xfer_irqless

Happy hacking and thanks for all the input to this,

   Wolfram


Wolfram Sang (4):
  i2c: core: remove outdated DEBUG output
  i2c: core: remove level of indentation in i2c_transfer
  i2c: core: use I2C locking behaviour also for SMBUS
  i2c: core: introduce master_xfer_irqless callback

 drivers/i2c/i2c-core-base.c  | 44 +++++++++++++-----------------------
 drivers/i2c/i2c-core-smbus.c |  7 +++++-
 drivers/i2c/i2c-core.h       | 12 ++++++++++
 include/linux/i2c.h          | 10 +++++---
 4 files changed, 41 insertions(+), 32 deletions(-)

-- 
2.18.0
