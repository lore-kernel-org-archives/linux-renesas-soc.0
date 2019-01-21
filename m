Return-Path: <SRS0=sDbg=P5=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76FA8C2F3D9
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 21 Jan 2019 14:17:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 544AF20989
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 21 Jan 2019 14:17:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729141AbfAUORK (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 21 Jan 2019 09:17:10 -0500
Received: from sauhun.de ([88.99.104.3]:44410 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728912AbfAUORJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Jan 2019 09:17:09 -0500
Received: from localhost (p54B3319E.dip0.t-ipconnect.de [84.179.49.158])
        by pokefinder.org (Postfix) with ESMTPSA id 83D412CF60A;
        Mon, 21 Jan 2019 15:17:07 +0100 (CET)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 0/2] i2c: gpio: fault-injector: minor updates
Date:   Mon, 21 Jan 2019 15:16:55 +0100
Message-Id: <20190121141657.18924-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.11.0
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

While working on a new fault injector, I came up with these two small
improvements. They hopefully make reading docs/source easier when we add more
and more stuff.

Wolfram Sang (2):
  i2c: gpio: fault-injector: sort debugfs files alphabetically
  i2c: gpio: fault-injector: better SPHINX style in docs

 Documentation/i2c/gpio-fault-injection | 10 +++++++---
 drivers/i2c/busses/i2c-gpio.c          |  4 ++--
 2 files changed, 9 insertions(+), 5 deletions(-)

-- 
2.11.0

