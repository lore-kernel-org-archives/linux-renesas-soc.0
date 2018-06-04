Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:40048 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753494AbeFDOc6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 4 Jun 2018 10:32:58 -0400
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 0/2] i2c: gpio: fault-injector: add new injector
Date: Mon,  4 Jun 2018 16:32:50 +0200
Message-Id: <20180604143252.325-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi,

here comes another fault injector which stress tests I2C bus recovery
implementations. The generic_scl algorithm in the I2C core doesn't handle this
yet. I have a prototype for a fix which I want to double check tomorrow. But
first, here is the test environment for it.

Please share your thoughts if you have any.

Thanks,

   Wolfram

Wolfram Sang (2):
  i2c: gpio: fault-injector: refactor incomplete transfer
  i2c: gpio: fault-injector: add incomplete_write_byte

 Documentation/i2c/gpio-fault-injection | 43 +++++++++++++++++++------
 drivers/i2c/busses/i2c-gpio.c          | 57 +++++++++++++++++++++++++---------
 2 files changed, 76 insertions(+), 24 deletions(-)

-- 
2.11.0
