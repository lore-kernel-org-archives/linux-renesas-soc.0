Return-Path: <SRS0=PMmv=P3=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AA01C61CE4
	for <linux-renesas-soc@archiver.kernel.org>; Sat, 19 Jan 2019 12:17:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 552CF20821
	for <linux-renesas-soc@archiver.kernel.org>; Sat, 19 Jan 2019 12:17:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728053AbfASMRD (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sat, 19 Jan 2019 07:17:03 -0500
Received: from sauhun.de ([88.99.104.3]:56400 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727938AbfASMRD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 19 Jan 2019 07:17:03 -0500
Received: from localhost (p54B33180.dip0.t-ipconnect.de [84.179.49.128])
        by pokefinder.org (Postfix) with ESMTPSA id 71A922D1FE5;
        Sat, 19 Jan 2019 13:17:01 +0100 (CET)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 0/3] i2c: gpio/algo-bit: clean up headers
Date:   Sat, 19 Jan 2019 13:16:52 +0100
Message-Id: <20190119121655.5576-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.11.0
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

I wanted to sort headers in the i2c-gpio driver which produced a compile error.
So, I had to fix i2c-algo-bit a little, too. Since there is a dependency
between these patches, here is a small series.

Wolfram Sang (3):
  i2c: algo-bit: include main i2c header
  i2c: algo-bit: convert to SPDX header
  i2c: gpio: sort includes

 drivers/i2c/algos/i2c-algo-bit.c | 25 ++++++++-----------------
 drivers/i2c/busses/i2c-gpio.c    | 10 +++++-----
 include/linux/i2c-algo-bit.h     | 33 ++++++++++-----------------------
 3 files changed, 23 insertions(+), 45 deletions(-)

-- 
2.11.0

