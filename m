Return-Path: <SRS0=kcdn=SN=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B823AC10F14
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 11 Apr 2019 07:55:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8ECD9217D4
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 11 Apr 2019 07:55:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726736AbfDKHz2 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 11 Apr 2019 03:55:28 -0400
Received: from www3345.sakura.ne.jp ([49.212.235.55]:50500 "EHLO
        www3345.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726965AbfDKHz2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 11 Apr 2019 03:55:28 -0400
Received: from fsav109.sakura.ne.jp (fsav109.sakura.ne.jp [27.133.134.236])
        by www3345.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id x3B7tH1T039753;
        Thu, 11 Apr 2019 16:55:17 +0900 (JST)
        (envelope-from cv-dong@jinso.co.jp)
Received: from www3345.sakura.ne.jp (49.212.235.55)
 by fsav109.sakura.ne.jp (F-Secure/fsigk_smtp/530/fsav109.sakura.ne.jp);
 Thu, 11 Apr 2019 16:55:17 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/530/fsav109.sakura.ne.jp)
Received: from localhost (p14010-ipadfx41marunouchi.tokyo.ocn.ne.jp [61.118.107.10])
        (authenticated bits=0)
        by www3345.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id x3B7tFBM039728
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Thu, 11 Apr 2019 16:55:17 +0900 (JST)
        (envelope-from cv-dong@jinso.co.jp)
From:   Cao Van Dong <cv-dong@jinso.co.jp>
To:     linux-renesas-soc@vger.kernel.org, broonie@kernel.org,
        geert+renesas@glider.be, horms+renesas@verge.net.au,
        devicetree@vger.kernel.org, biju.das@bp.renesas.com
Cc:     yoshihiro.shimoda.uh@renesas.com, kuninori.morimoto.gx@renesas.com,
        h-inayoshi@jinso.co.jp, nv-dung@jinso.co.jp, na-hoan@jinso.co.jp,
        cv-dong@jinso.co.jp
Subject: [PATCH v2 19/20] spi: sh-msiof: Document r8a77470 bindings
Date:   Thu, 11 Apr 2019 16:54:21 +0900
Message-Id: <1554969262-15028-20-git-send-email-cv-dong@jinso.co.jp>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1554969262-15028-1-git-send-email-cv-dong@jinso.co.jp>
References: <1554969262-15028-1-git-send-email-cv-dong@jinso.co.jp>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Document SoC specific bindings for R-Car RZ/G1C(r8a77470) SoC.

Signed-off-by: Cao Van Dong <cv-dong@jinso.co.jp>
---
 Documentation/devicetree/bindings/spi/sh-msiof.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/spi/sh-msiof.txt b/Documentation/devicetree/bindings/spi/sh-msiof.txt
index 37cf695..18e14ee 100644
--- a/Documentation/devicetree/bindings/spi/sh-msiof.txt
+++ b/Documentation/devicetree/bindings/spi/sh-msiof.txt
@@ -4,6 +4,7 @@ Required properties:
 - compatible           : "renesas,msiof-r8a7743" (RZ/G1M)
 			 "renesas,msiof-r8a7744" (RZ/G1N)
 			 "renesas,msiof-r8a7745" (RZ/G1E)
+			 "renesas,msiof-r8a77470" (RZ/G1C)
 			 "renesas,msiof-r8a774a1" (RZ/G2M)
 			 "renesas,msiof-r8a774c0" (RZ/G2E)
 			 "renesas,msiof-r8a7790" (R-Car H2)
-- 
2.7.4

