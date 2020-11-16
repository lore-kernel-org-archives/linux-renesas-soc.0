Return-Path: <linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5002BC63697
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 16 Nov 2020 21:57:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1E320222EC
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 16 Nov 2020 21:57:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="mkloZQgW"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729870AbgKPV50 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 16 Nov 2020 16:57:26 -0500
Received: from www.zeus03.de ([194.117.254.33]:58836 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729179AbgKPV50 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 Nov 2020 16:57:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=XrKkK9//xmkuZclHuwqvzXUEPMT
        /g0ElH9PqUy+Et+w=; b=mkloZQgWyxFDs+JKvGwR+9xUWmC00hNDWbGzdx0lM7u
        WCQ68bZBL+uoJ54LA1bdY9NTRIP82OVoIxixZLJbE5Pxy3BUrPCUwOjhvunuhtFi
        rH1zYBXzldZemQXoStLczNLN1XBNLkrgc8B8de/W1K5GJAq2U2ujyWvEzEEz9S4U
        =
Received: (qmail 54261 invoked from network); 16 Nov 2020 22:57:24 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 16 Nov 2020 22:57:24 +0100
X-UD-Smtp-Session: l3s3148p1@4f+YdkC0VJogAwDPXwbiANfOM/mHw/ia
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-doc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH] Documentation: kernel-parameters: add missing '<'
Date:   Mon, 16 Nov 2020 22:57:11 +0100
Message-Id: <20201116215711.2291-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 Documentation/admin-guide/kernel-parameters.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/kernel-parameters.rst b/Documentation/admin-guide/kernel-parameters.rst
index 6d421694d98e..3addfe0963bb 100644
--- a/Documentation/admin-guide/kernel-parameters.rst
+++ b/Documentation/admin-guide/kernel-parameters.rst
@@ -60,7 +60,7 @@ Note that for the special case of a range one can split the range into equal
 sized groups and for each group use some amount from the beginning of that
 group:
 
-	<cpu number>-cpu number>:<used size>/<group size>
+	<cpu number>-<cpu number>:<used size>/<group size>
 
 For example one can add to the command line following parameter:
 
-- 
2.28.0

