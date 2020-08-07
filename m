Return-Path: <SRS0=llTS=BR=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DCD7C433E1
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  7 Aug 2020 23:21:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1C1952224D
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  7 Aug 2020 23:21:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ZOicoZIK"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726096AbgHGXVj (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 7 Aug 2020 19:21:39 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:48954 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726149AbgHGXVj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 7 Aug 2020 19:21:39 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id DD46AB91;
        Sat,  8 Aug 2020 01:21:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1596842497;
        bh=eZAihn7YKGz3HHIGU40HgYGj5i/+LyyCf3zokuJzc48=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ZOicoZIKu2gMIsL/61GDK4jKjURIEy63isfnrnj+7V2l2D+n3PQCUmfYx2XyJp46e
         t+S0/C0NpHBhlYhaTP1+RiRzNQG+9akmweK/9SPvJA3wY/efchHbwtCanFRrLk5U+W
         JaSbpFct/sEsIVCsBc+3cWkeg1TqZlCgfKTJRcRo=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [kms-tests] [PATCH 3/6] tests: crc: Disable CRTC regarless of test status
Date:   Sat,  8 Aug 2020 02:21:16 +0300
Message-Id: <20200807232119.28854-4-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200807232119.28854-1-laurent.pinchart@ideasonboard.com>
References: <20200807232119.28854-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The CRTC should be disabled when the test completes, regardless of
whether it succeeds or fails.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 tests/kms-test-crc.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/kms-test-crc.py b/tests/kms-test-crc.py
index dcdfcd4abb71..e3e31b34e2d4 100755
--- a/tests/kms-test-crc.py
+++ b/tests/kms-test-crc.py
@@ -105,7 +105,8 @@ class CRCTest(kmstest.KMSTest):
 
                 self.logger.log("CRC value 0x%08x" % crcs[0])
             else:
-                self.atomic_crtc_disable(crtc)
                 self.success()
 
+            self.atomic_crtc_disable(crtc)
+
 CRCTest().execute()
-- 
Regards,

Laurent Pinchart

