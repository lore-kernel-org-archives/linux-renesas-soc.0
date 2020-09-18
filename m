Return-Path: <SRS0=cDZa=C3=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33C04C43464
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 18 Sep 2020 20:26:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CFEE92085B
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 18 Sep 2020 20:26:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="W2VBGV0R"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726218AbgIRU00 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 18 Sep 2020 16:26:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726187AbgIRU00 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Sep 2020 16:26:26 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54181C0613CE
        for <linux-renesas-soc@vger.kernel.org>; Fri, 18 Sep 2020 13:26:25 -0700 (PDT)
Received: from localhost.localdomain (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B39D7B1A;
        Fri, 18 Sep 2020 22:26:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1600460780;
        bh=Ep93qXfQLfLgO5VailPeNB01dskRAe2VAtZkbIUti+A=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=W2VBGV0RsGiTX3YuWDZETHrbmp5klUmvbwTo7daRlLhLhUGp9AuBaDSJZPFUs7rNb
         A8Lp9gf//KAFg/EK76rBy50G4Qdfg/pwZtPVkDKL4ud8u4hF7Pqhxa7XMYsPDFqm6t
         CQnE0TlILYFVdZq+qtqci1Swb2Es4xFCm1+9rTBE=
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH 2/3] tests: Skip unbind/bind tests when not root
Date:   Fri, 18 Sep 2020 21:26:15 +0100
Message-Id: <20200918202616.55977-3-kieran.bingham@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200918202616.55977-1-kieran.bingham@ideasonboard.com>
References: <20200918202616.55977-1-kieran.bingham@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The user must be root to be able to perform the unbind/bind cycle.
Skip this test when the user does not have root privilidges.

Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
---
 tests/vsp-unit-test-0026.sh | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tests/vsp-unit-test-0026.sh b/tests/vsp-unit-test-0026.sh
index 0e013cec881b..88038f3fdebf 100755
--- a/tests/vsp-unit-test-0026.sh
+++ b/tests/vsp-unit-test-0026.sh
@@ -41,6 +41,12 @@ test_copy() {
 test_main() {
 	local format
 
+	if [ ! "$(id -u)" = 0 ] ; then
+		# Root is required to run unbind tests
+		test_complete skip
+		return
+	fi
+
 	# Unbind and rebind VSPs individually
 	for v in $vsps; do
 		unbind_vsp $v
-- 
2.25.1

