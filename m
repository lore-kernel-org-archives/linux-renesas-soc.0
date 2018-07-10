Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:45904 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732272AbeGJWZi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 10 Jul 2018 18:25:38 -0400
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 0/2] i2c: recovery: add bus_free callback
Date: Wed, 11 Jul 2018 00:24:21 +0200
Message-Id: <20180710222423.7792-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add a new callback for IP cores which cannot report SDA directly but only a
'bus free' state. Implement this for the Renesas R-Car driver.

It has been tested with a Renesas Lager board (R-Car H2).

A branch (with further improvements) can be found here:

git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/i2c/recovery/write-byte-fix

Looking forward to comments.

Kind regards,

   Wolfram

Wolfram Sang (2):
  i2c: recovery: add get_bus_free callback
  i2c: rcar: use the new get_bus_free callback

 drivers/i2c/busses/i2c-rcar.c | 21 +++++++++++----------
 drivers/i2c/i2c-core-base.c   | 27 +++++++++++++++++++++++----
 include/linux/i2c.h           |  3 +++
 3 files changed, 37 insertions(+), 14 deletions(-)

-- 
2.11.0
