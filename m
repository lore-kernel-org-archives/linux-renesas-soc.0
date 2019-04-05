Return-Path: <SRS0=/r1Q=SH=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24279C4360F
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  5 Apr 2019 06:20:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EF3E221850
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  5 Apr 2019 06:20:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726720AbfDEGUS (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 5 Apr 2019 02:20:18 -0400
Received: from www3345.sakura.ne.jp ([49.212.235.55]:45961 "EHLO
        www3345.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726594AbfDEGUS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 5 Apr 2019 02:20:18 -0400
X-Greylist: delayed 2152 seconds by postgrey-1.27 at vger.kernel.org; Fri, 05 Apr 2019 02:20:15 EDT
Received: from fsav301.sakura.ne.jp (fsav301.sakura.ne.jp [153.120.85.132])
        by www3345.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id x355iXx9074188;
        Fri, 5 Apr 2019 14:44:33 +0900 (JST)
        (envelope-from cv-dong@jinso.co.jp)
Received: from www3345.sakura.ne.jp (49.212.235.55)
 by fsav301.sakura.ne.jp (F-Secure/fsigk_smtp/530/fsav301.sakura.ne.jp);
 Fri, 05 Apr 2019 14:44:32 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/530/fsav301.sakura.ne.jp)
Received: from localhost (p14010-ipadfx41marunouchi.tokyo.ocn.ne.jp [61.118.107.10])
        (authenticated bits=0)
        by www3345.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id x355iUIo074168
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Fri, 5 Apr 2019 14:44:32 +0900 (JST)
        (envelope-from cv-dong@jinso.co.jp)
From:   Cao Van Dong <cv-dong@jinso.co.jp>
To:     broonie@kernel.org, geert+renesas@glider.be,
        horms+renesas@verge.net.au, devicetree@vger.kernel.org
Cc:     yoshihiro.shimoda.uh@renesas.com, kuninori.morimoto.gx@renesas.com,
        linux-renesas-soc@vger.kernel.org, h-inayoshi@jinso.co.jp,
        nv-dung@jinso.co.jp, na-hoan@jinso.co.jp
Subject: [PATCH 4/4] dt-bindings: timer: renesas, cmt: Document r8a779{5|65|90} CMT support
Date:   Fri,  5 Apr 2019 14:44:09 +0900
Message-Id: <1554443049-25127-5-git-send-email-cv-dong@jinso.co.jp>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1554443049-25127-1-git-send-email-cv-dong@jinso.co.jp>
References: <1554443049-25127-1-git-send-email-cv-dong@jinso.co.jp>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Document SoC specific bindings for R-Car H3/M3-N/E3 SoCs.

Signed-off-by: Cao Van Dong <cv-dong@jinso.co.jp>
---
 Documentation/devicetree/bindings/timer/renesas,cmt.txt | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/timer/renesas,cmt.txt b/Documentation/devicetree/bindings/timer/renesas,cmt.txt
index c059445..c5220bc 100644
--- a/Documentation/devicetree/bindings/timer/renesas,cmt.txt
+++ b/Documentation/devicetree/bindings/timer/renesas,cmt.txt
@@ -42,12 +42,18 @@ Required Properties:
     - "renesas,r8a7793-cmt1" for the 48-bit CMT1 device included in r8a7793.
     - "renesas,r8a7794-cmt0" for the 32-bit CMT0 device included in r8a7794.
     - "renesas,r8a7794-cmt1" for the 48-bit CMT1 device included in r8a7794.
+    - "renesas,r8a7795-cmt0" for the 32-bit CMT0 device included in r8a7795.
+    - "renesas,r8a7795-cmt1" for the 48-bit CMT1 device included in r8a7795.
     - "renesas,r8a7796-cmt0" for the 32-bit CMT0 device included in r8a7796.
     - "renesas,r8a7796-cmt1" for the 48-bit CMT1 device included in r8a7796.
+    - "renesas,r8a77965-cmt0" for the 32-bit CMT0 device included in r8a77965.
+    - "renesas,r8a77965-cmt1" for the 48-bit CMT1 device included in r8a77965.
     - "renesas,r8a77970-cmt0" for the 32-bit CMT0 device included in r8a77970.
     - "renesas,r8a77970-cmt1" for the 48-bit CMT1 device included in r8a77970.
     - "renesas,r8a77980-cmt0" for the 32-bit CMT0 device included in r8a77980.
     - "renesas,r8a77980-cmt1" for the 48-bit CMT1 device included in r8a77980.
+    - "renesas,r8a77990-cmt0" for the 32-bit CMT0 device included in r8a77990.
+    - "renesas,r8a77990-cmt1" for the 48-bit CMT1 device included in r8a77990.
 
     - "renesas,rcar-gen2-cmt0" for 32-bit CMT0 devices included in R-Car Gen2
 		and RZ/G1.
-- 
2.7.4

