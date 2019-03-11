Return-Path: <SRS0=xQI0=RO=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEED9C10F06
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 11 Mar 2019 22:34:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A68ED2148D
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 11 Mar 2019 22:34:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726192AbfCKWeS (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 11 Mar 2019 18:34:18 -0400
Received: from sauhun.de ([88.99.104.3]:33336 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725932AbfCKWeS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 11 Mar 2019 18:34:18 -0400
Received: from localhost (p54B3359D.dip0.t-ipconnect.de [84.179.53.157])
        by pokefinder.org (Postfix) with ESMTPSA id 46CF73E6005;
        Mon, 11 Mar 2019 23:34:16 +0100 (CET)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org, Jean Delvare <jdelvare@suse.de>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH i2c-tools 1/2] tools: i2ctransfer: consequently document -a
Date:   Mon, 11 Mar 2019 23:33:34 +0100
Message-Id: <20190311223335.18586-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190311223335.18586-1-wsa+renesas@sang-engineering.com>
References: <20190311223335.18586-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The text describing the address to be used did not reflect the recent
change where some of the functionality of '-f' has been seperated into
'-a'.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 CHANGES             | 1 +
 tools/i2ctransfer.8 | 8 +++++---
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/CHANGES b/CHANGES
index e2ea015..e9d46b5 100644
--- a/CHANGES
+++ b/CHANGES
@@ -5,6 +5,7 @@ master
   tools: Consistently use snprintf instead of sprintf
   decode-dimms: Print SPD revision for DDR3 too
                 Move SDR-specific code
+  i2ctransfer: Mention '-a' everywhere in the manpage
 
 4.1 (2018-11-30)
   Makefile: Make STRIP, DESTDIR and PREFIX overridable
diff --git a/tools/i2ctransfer.8 b/tools/i2ctransfer.8
index 5d3cc27..1f8ed82 100644
--- a/tools/i2ctransfer.8
+++ b/tools/i2ctransfer.8
@@ -96,10 +96,12 @@ It is parsed as an unsigned 16 bit integer, but note that the Linux Kernel appli
 specifies the 7-bit address of the chip to be accessed for this message, and is an integer.
 If omitted, reuse the previous address.
 Normally, addresses outside the range of 0x03-0x77 and addresses with a kernel driver attached to them will be blocked.
-With
+This can be overridden with
+.I -a
+(all) or
 .I -f
-(force), all addresses can be used.
-Be very careful when using that!
+(force).
+Be very careful when using these!
 10-bit addresses are currently not supported at all.
 
 .PP
-- 
2.11.0

