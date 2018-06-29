Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:46584 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753472AbeF2JMv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 29 Jun 2018 05:12:51 -0400
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v2 0/2] i2c: gpio: fault-injector: add new injector
Date: Fri, 29 Jun 2018 11:12:45 +0200
Message-Id: <20180629091247.32568-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi,

here comes another fault injector which stress tests I2C bus recovery
implementations. The generic_scl algorithm in the I2C core doesn't handle this
yet. I am at it. But first, here is the test environment for it.

Please share your thoughts if you have any.

Thanks,

   Wolfram

Changes since v1:
* rebased to v4.18-rc2
* made documentation hopefully more clear

Wolfram Sang (2):
  i2c: gpio: fault-injector: refactor incomplete transfer
  i2c: gpio: fault-injector: add incomplete_write_byte

 Documentation/i2c/gpio-fault-injection | 49 ++++++++++++++++++++++-------
 drivers/i2c/busses/i2c-gpio.c          | 57 +++++++++++++++++++++++++---------
 2 files changed, 81 insertions(+), 25 deletions(-)

-- 
2.11.0
