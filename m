Return-Path: <SRS0=IwST=O2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D813C43387
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 19:33:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 274B22084A
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 19:33:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388332AbeLQTdV (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 17 Dec 2018 14:33:21 -0500
Received: from sauhun.de ([88.99.104.3]:40514 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727116AbeLQTdV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Dec 2018 14:33:21 -0500
Received: from localhost (p54B3357B.dip0.t-ipconnect.de [84.179.53.123])
        by pokefinder.org (Postfix) with ESMTPSA id 81A982E3656;
        Mon, 17 Dec 2018 20:33:19 +0100 (CET)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-watchdog@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH] watchdog: add documentation for PM usage
Date:   Mon, 17 Dec 2018 20:33:14 +0100
Message-Id: <20181217193314.3487-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add the first rule we recently agreed on.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 Documentation/watchdog/watchdog-pm.txt | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 Documentation/watchdog/watchdog-pm.txt

diff --git a/Documentation/watchdog/watchdog-pm.txt b/Documentation/watchdog/watchdog-pm.txt
new file mode 100644
index 000000000000..7a4dd46e0d24
--- /dev/null
+++ b/Documentation/watchdog/watchdog-pm.txt
@@ -0,0 +1,19 @@
+The Linux WatchDog Timer Power Management Guide
+===============================================
+Last reviewed: 17-Dec-2018
+
+Wolfram Sang <wsa+renesas@sang-engineering.com>
+
+Introduction
+------------
+This document states rules about watchdog devices and their power management
+handling to ensure a uniform behaviour for Linux systems.
+
+
+Ping on resume
+--------------
+On resume, a watchdog timer shall be reset to its selected value to give
+userspace enough time to resume. [1] [2]
+
+[1] https://patchwork.kernel.org/patch/10252209/
+[2] https://patchwork.kernel.org/patch/10711625/
-- 
2.19.1

