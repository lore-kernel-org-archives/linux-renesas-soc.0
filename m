Return-Path: <SRS0=hAs+=QY=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 346FBC43381
	for <linux-renesas-soc@archiver.kernel.org>; Sun, 17 Feb 2019 12:41:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 09B272192C
	for <linux-renesas-soc@archiver.kernel.org>; Sun, 17 Feb 2019 12:41:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728717AbfBQMlc (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sun, 17 Feb 2019 07:41:32 -0500
Received: from sauhun.de ([88.99.104.3]:51088 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728716AbfBQMlc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 17 Feb 2019 07:41:32 -0500
Received: from localhost (unknown [195.52.228.164])
        by pokefinder.org (Postfix) with ESMTPSA id 514792C08C3;
        Sun, 17 Feb 2019 13:41:29 +0100 (CET)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 0/2] i2c: gpio: fault-injector: add two new injectors
Date:   Sun, 17 Feb 2019 13:41:24 +0100
Message-Id: <20190217124126.7257-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.11.0
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

After sending out the 'lose_arbitration' injector as RFC, here is now a patch
series with that injector updated and another one added.

The first one successfully triggers an ARBITRATION_LOST interrupt on my Renesas
Lager board (R-Car H2). The other one leaves SCL low on the same board because
of the Kernel panic, so reboot handlers need to handle that. But more
interestingly, it causes a deadlock because it needs this I2C adapter to
trigger a reboot via the PMIC. This is a good testcase for the soon to be
developed master_xfer_atomic callback for the I2C core.

Wolfram Sang (2):
  i2c: gpio: fault-injector: add 'lose_arbitration' injector
  i2c: gpio: fault-injector: add 'inject_panic' injector

 Documentation/i2c/gpio-fault-injection | 51 ++++++++++++++++++
 drivers/i2c/busses/i2c-gpio.c          | 97 ++++++++++++++++++++++++++++++++++
 2 files changed, 148 insertions(+)

-- 
2.11.0

