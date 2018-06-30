Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:56668 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751272AbeF3RHN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 30 Jun 2018 13:07:13 -0400
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 0/2] i2c: recovery: make sure pulses are not misinterpreted
Date: Sat, 30 Jun 2018 19:07:02 +0200
Message-Id: <20180630170704.13103-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

As the 'incomplete_write_byte' fault injector has shown, we need to take care
that pulses used for recovery will not be misinterpreted as a regular cycle.
This series implements that. This approach makes sure that STOP signals put on
the bus do not create additional pulses. We still do 9 pulses only, but
generate a STOP signal in case SDA was released again (and we cannot read SDA
status).

The first patch implements it in a minimal way, so it is suitable for stable.
The second patch adds some sanity checking and documentation on top which is
not suitable for stable.

Looking forward to comments.

Kind regards,

   Wolfram


Wolfram Sang (2):
  i2c: recovery: send STOP if get_sda is not available
  i2c: recovery: require either get_sda or set_sda

 drivers/i2c/i2c-core-base.c | 16 +++++++++++++++-
 include/linux/i2c.h         | 12 ++++++------
 2 files changed, 21 insertions(+), 7 deletions(-)

-- 
2.11.0
