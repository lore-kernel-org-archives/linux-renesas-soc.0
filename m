Return-Path: <SRS0=E5el=C2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D75ACC35264
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 17 Sep 2020 14:43:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5AF9220708
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 17 Sep 2020 14:43:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="dUiksMAR"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727533AbgIQO3x (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 17 Sep 2020 10:29:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727459AbgIQO2U (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 17 Sep 2020 10:28:20 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4377C061221
        for <linux-renesas-soc@vger.kernel.org>; Thu, 17 Sep 2020 07:06:59 -0700 (PDT)
Received: from Q.local (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3F815FD1;
        Thu, 17 Sep 2020 16:04:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1600351495;
        bh=+7sUnGZ68km0meTEvB8O1jKlI8Rh59owgpNCisitIns=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=dUiksMARFXCuahOKjFPCNOc+5g4PB8GhybVf0NlOcTm5uXUpdT+pLM1dzUE04zqj4
         nxv9Uewa4IUzIuaDPW7v2SXVvtpTLro8LSujZgjo5jLbQ4f/SfmP9NEtebOg5n2Rhm
         qi4e0gMo1YnUDEcFwFYJNwMZz1h3cUacfb23QDMg=
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [VSP-Tests PATCH v2 3/3] scripts/logger: Use new monotonic-ts tool
Date:   Thu, 17 Sep 2020 15:04:50 +0100
Message-Id: <20200917140450.12264-4-kieran.bingham@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200917140450.12264-1-kieran.bingham@ideasonboard.com>
References: <20200917140450.12264-1-kieran.bingham@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Utilise the new monotonic timestamping tool to remove the manual parsing of
timestamps via /proc/timer_list which can only be read by root.

This also simplifies the processing required and contains all timestamping
actions within a single process space.

Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

---
v2:
 - Fix shellcheck issues

 scripts/logger.sh | 20 ++++----------------
 1 file changed, 4 insertions(+), 16 deletions(-)

diff --git a/scripts/logger.sh b/scripts/logger.sh
index 97e1f582da2b..75426a51961a 100755
--- a/scripts/logger.sh
+++ b/scripts/logger.sh
@@ -2,23 +2,11 @@
 # SPDX-License-Identifier: GPL-2.0-or-later
 # SPDX-FileCopyrightText: 2016 Renesas Electronics Corporation
 
-now() {
-	awk '/^now/ {time=$3; printf("[%u.%06u]", time / 1000000000, (time % 1000000000) / 1000) ; exit}' /proc/timer_list
-}
-
 label=${1:+ [$1]}
 
 TRACE_MARKER=/sys/kernel/debug/tracing/trace_marker
-if [ -e $TRACE_MARKER ]; then
-	extra_log_files=$TRACE_MARKER
+if [ -e $TRACE_MARKER ] && [ "$(id -u)" = 0 ]; then
+	./monotonic-ts "$label" | tee -a $TRACE_MARKER
+else
+	./monotonic-ts "$label"
 fi
-
-while read line ; do
-	newline="$(now)$label $line"
-
-	echo "$newline"
-
-	for f in $extra_log_files; do
-		echo "$newline" >> $f;
-	done;
-done
-- 
2.25.1

