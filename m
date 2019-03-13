Return-Path: <SRS0=0QpP=RQ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E55BEC43381
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 13 Mar 2019 16:56:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B190A2147C
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 13 Mar 2019 16:56:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726880AbfCMQ4P (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 13 Mar 2019 12:56:15 -0400
Received: from sauhun.de ([88.99.104.3]:49240 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726656AbfCMQ4O (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Mar 2019 12:56:14 -0400
Received: from localhost (p54B33543.dip0.t-ipconnect.de [84.179.53.67])
        by pokefinder.org (Postfix) with ESMTPSA id 35B9E3E4304;
        Wed, 13 Mar 2019 17:56:12 +0100 (CET)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Kieran Bingham <kieran@ksquared.org.uk>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v7 0/3] i2c: improve i2c_new_{device|dummy}
Date:   Wed, 13 Mar 2019 17:55:23 +0100
Message-Id: <20190313165526.28588-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.11.0
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

I recently remembered this old series because I needed to add a dummy to the
DA9063 driver, so I had a look at it. I am somewhat sorry for the long delay,
yet the overload of patches is something I am not really responsible for :/

However, the series v6 from December 2017 was mostly OK. I decided to fix the
things I noticed right away, only minor stuff:

* instead of '__' prefix for the new functions, I added an 'errptr' suffix.
  '__' indicates internal use, mostly unlocked flavors. However, these functions
  could be exported somewhen and then it makes sense to have a more descriptive
  name. This also removes the inconsistency that the devm_* variant returned an
  errptr while the non-devm variant returned NULL. Now, the name makes it clear.

* some minor issues/typos in the kernel doc sections

This series does not include converting 'i2c_new_secondary_device' which I plan
to convert (including all users) to use errptr only. And maybe the same for
'i2c_new_probed_device', I am not sure about it yet.

I added a new user of this series, since at24 has changed a bit since back then.
Patch 3 is only for testing. First, this series needs to be applied.

Tested on a Renesas Lager board (R-Car Gen2).

If the feedback is positive, then I plan to create an immutable branch for the
at24- and MFD-trees after next rc1, so stuff can be based on top of it.

Looking forward to comments,

   Wolfram


Heiner Kallweit (2):
  i2c: core: improve return value handling of i2c_new_device and
    i2c_new_dummy
  i2c: core: add device-managed version of i2c_new_dummy

Wolfram Sang (1):
  mfd: da9063: occupy second I2C address, too

 Documentation/driver-model/devres.txt |   3 +
 drivers/i2c/i2c-core-base.c           | 114 ++++++++++++++++++++++++++++++----
 drivers/mfd/da9063-i2c.c              |   2 +
 include/linux/i2c.h                   |   3 +
 4 files changed, 109 insertions(+), 13 deletions(-)

-- 
2.11.0

