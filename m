Return-Path: <SRS0=RXSY=2V=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E00E0C2D0C2
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 31 Dec 2019 16:14:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A99DF206E4
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 31 Dec 2019 16:14:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727074AbfLaQOf (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 31 Dec 2019 11:14:35 -0500
Received: from sauhun.de ([88.99.104.3]:51504 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727064AbfLaQOf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 31 Dec 2019 11:14:35 -0500
Received: from localhost (p5486C426.dip0.t-ipconnect.de [84.134.196.38])
        by pokefinder.org (Postfix) with ESMTPSA id 463F12C04EC;
        Tue, 31 Dec 2019 17:14:33 +0100 (CET)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Luca Ceresoli <luca@lucaceresoli.net>,
        Kieran Bingham <kieran@ksquared.org.uk>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [RFC PATCH 0/5] i2c: implement mechanism to retrieve an alias device
Date:   Tue, 31 Dec 2019 17:13:55 +0100
Message-Id: <20191231161400.1688-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Finally, here is my prototype to request an unused I2C address at
runtime. This is needed by serial/deserializer pairs like GMSL or
FPD-Link. This is the first outcome of various discussions how to
support the above devices.

It is only for obtaining the alias. I started sketching actual use cases
for GMSL and FPD-Link, but they should not be part of this series. I am
eager to get feedback on this, if this really matches what we discussed
and if it is useful for downstream users as-is.

I don't have GMSL hardware myself, so the last patch is a simple
testcase which can be copied to any I2C driver you probe during boot.

More testing is still needed, especially regression testing for the
refactored functions in patch 1. kdocs are missing, too. I'd like some
feedback on the approach first.

While I think some kind of caching is useful, I am not super-happy with
the actual implementation in patch 4. The use of another I2C_CLIENT_*
flag just for the caching looks a bit too much to me. Still, I wanted to
keep it simple for the users of this mechanism and not enforce a
'return-the-alias' function call.

Anyhow, I hope this series is useful to you and will spawn fruitful
discussion.

Thanks for all your cooperation and working together in 2019. I am
looking forward to continue that path in 2020.

Have a great new year, everyone,

   Wolfram


Wolfram Sang (5):
  i2c: core: refactor scanning for a client
  i2c: core: add new variant to check for a client
  i2c: core: add function to request an alias
  i2c: core: add simple caching to the 'alias' scanning
  simple test case for the I2C alias functionality

 drivers/i2c/i2c-core-base.c | 109 +++++++++++++++++++++++++-----------
 include/linux/i2c.h         |   4 ++
 sound/soc/codecs/ak4642.c   |  20 +++++++
 3 files changed, 101 insertions(+), 32 deletions(-)

-- 
2.20.1

