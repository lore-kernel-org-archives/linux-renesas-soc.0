Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:45522 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732187AbeGJVnW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 10 Jul 2018 17:43:22 -0400
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Eddie James <eajames@linux.vnet.ibm.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v2 0/3] i2c: recovery: make sure pulses are not misinterpreted
Date: Tue, 10 Jul 2018 23:42:14 +0200
Message-Id: <20180710214217.1336-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

As the 'incomplete_write_byte' fault injector has shown, we need to take care
that pulses used for recovery will not be misinterpreted as a regular cycle.
This series implements that. This approach makes sure that STOP signals put on
the bus do not create additional pulses. We still do 9 pulses only, but
generate a STOP signal in case SDA was released again.

The first patch implements it in a minimal way, so it is suitable for stable.
The second patch adds some sanity checking and documentation on top which is
not suitable for stable. The third patch simplifies the logic because of the
new behaviour.

It has been tested with a Renesas Lager board (R-Car H2). I will test it
tomorrow a bit more once I taught the GPIO driver bus recovery.

A branch (with further improvements) can be found here:

git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/i2c/recovery/write-byte-fix

Looking forward to comments.

Kind regards,

   Wolfram

Changes since V1:

* we create STOP now always when set_sda is available independent of get_sda
  being available or not. This is much safer and allows for a cleaner logic
  implemented in the new patch 3.
* hopefully improved comments

Wolfram Sang (3):
  i2c: recovery: if possible send STOP with recovery pulses
  i2c: recovery: require either get_sda or set_sda
  i2c: recovery: refactor recovery function

 drivers/i2c/i2c-core-base.c | 36 +++++++++++++++++++-----------------
 include/linux/i2c.h         | 12 ++++++------
 2 files changed, 25 insertions(+), 23 deletions(-)

-- 
2.11.0
