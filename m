Return-Path: <SRS0=IwST=O2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABF78C43387
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 19:14:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8652821783
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 19:14:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387785AbeLQTOU (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 17 Dec 2018 14:14:20 -0500
Received: from sauhun.de ([88.99.104.3]:40418 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1733264AbeLQTOU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Dec 2018 14:14:20 -0500
Received: from localhost (p54B3357B.dip0.t-ipconnect.de [84.179.53.123])
        by pokefinder.org (Postfix) with ESMTPSA id 7E1872E3656;
        Mon, 17 Dec 2018 20:14:17 +0100 (CET)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-watchdog@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH] watchdog: docs: kernel-api: don't reference removed functions
Date:   Mon, 17 Dec 2018 20:14:11 +0100
Message-Id: <20181217191411.3254-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Those functions are not only deprecated, but gone for good.

Fixes: 62cd1c40ce1c ("watchdog: kill unref/ref ops")
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 Documentation/watchdog/watchdog-kernel-api.txt | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/Documentation/watchdog/watchdog-kernel-api.txt b/Documentation/watchdog/watchdog-kernel-api.txt
index 9b93953f69cf..3a91ef5af044 100644
--- a/Documentation/watchdog/watchdog-kernel-api.txt
+++ b/Documentation/watchdog/watchdog-kernel-api.txt
@@ -128,8 +128,6 @@ struct watchdog_ops {
 	int (*set_pretimeout)(struct watchdog_device *, unsigned int);
 	unsigned int (*get_timeleft)(struct watchdog_device *);
 	int (*restart)(struct watchdog_device *);
-	void (*ref)(struct watchdog_device *) __deprecated;
-	void (*unref)(struct watchdog_device *) __deprecated;
 	long (*ioctl)(struct watchdog_device *, unsigned int, unsigned long);
 };
 
@@ -218,8 +216,6 @@ they are supported. These optional routines/operations are:
   if a command is not supported. The parameters that are passed to the ioctl
   call are: watchdog_device, cmd and arg.
 
-The 'ref' and 'unref' operations are no longer used and deprecated.
-
 The status bits should (preferably) be set with the set_bit and clear_bit alike
 bit-operations. The status bits that are defined are:
 * WDOG_ACTIVE: this status bit indicates whether or not a watchdog timer device
-- 
2.19.1

