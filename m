Return-Path: <SRS0=sDbg=P5=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1303C2F3DB
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 21 Jan 2019 14:17:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9185B20861
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 21 Jan 2019 14:17:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729313AbfAUORK (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 21 Jan 2019 09:17:10 -0500
Received: from sauhun.de ([88.99.104.3]:44428 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729141AbfAUORK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Jan 2019 09:17:10 -0500
Received: from localhost (p54B3319E.dip0.t-ipconnect.de [84.179.49.158])
        by pokefinder.org (Postfix) with ESMTPSA id BA9162E354D;
        Mon, 21 Jan 2019 15:17:08 +0100 (CET)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 2/2] i2c: gpio: fault-injector: better SPHINX style in docs
Date:   Mon, 21 Jan 2019 15:16:57 +0100
Message-Id: <20190121141657.18924-3-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190121141657.18924-1-wsa+renesas@sang-engineering.com>
References: <20190121141657.18924-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

We don't use SPHINX currently in I2C documentation; but preparing the
I2C fault injector docs already is a good idea since it makes it easier
to read. Especially as new stuff is going to be added soon.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 Documentation/i2c/gpio-fault-injection | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/Documentation/i2c/gpio-fault-injection b/Documentation/i2c/gpio-fault-injection
index a4ce62090fd5..1a44e3edc0c4 100644
--- a/Documentation/i2c/gpio-fault-injection
+++ b/Documentation/i2c/gpio-fault-injection
@@ -1,3 +1,4 @@
+=========================
 Linux I2C fault injection
 =========================
 
@@ -13,6 +14,9 @@ mounted at /sys/kernel/debug. There will be a separate subdirectory per GPIO
 driven I2C bus. Each subdirectory will contain files to trigger the fault
 injection. They will be described now along with their intended use-cases.
 
+Wire states
+===========
+
 "scl"
 -----
 
@@ -34,10 +38,10 @@ I2C specification version 4, section 3.1.16) using the helpers of the Linux I2C
 core (see 'struct bus_recovery_info'). However, the bus recovery will not
 succeed because SDA is still pinned low until you manually release it again
 with "echo 1 > sda". A test with an automatic release can be done with the
-following class of fault injectors.
+"incomplete transfers" class of fault injectors.
 
-Introduction to incomplete transfers
-------------------------------------
+Incomplete transfers
+====================
 
 The following fault injectors create situations where SDA will be held low by a
 device. Bus recovery should be able to fix these situations. But please note:
-- 
2.11.0

