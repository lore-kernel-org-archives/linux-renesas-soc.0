Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:48086 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S935532AbeFNB1b (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Jun 2018 21:27:31 -0400
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org, cerg2010cerg2010@mail.ru
Cc: linux-renesas-soc@vger.kernel.org,
        drivers_video-dri@kernel-bugs.osdl.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [RFT 0/2] i2c: algos: bit: try to fix bug #200045
Date: Thu, 14 Jun 2018 10:27:12 +0900
Message-Id: <20180614012714.5937-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This series tries to fix Bugzilla bug #200045. I can't reproduce the issue, so
this is my buest guess what could be wrong so far.

cerg2010cerg2010@mail.ru: can you try these patches? Preferably, one after the
other seperately?

Thank you very much for the report!


Wolfram Sang (2):
  i2c: algos: bit: apply generic delays on initial STOP
  i2c: algos: bit: make sure to send STOP

 drivers/i2c/algos/i2c-algo-bit.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

-- 
2.11.0
