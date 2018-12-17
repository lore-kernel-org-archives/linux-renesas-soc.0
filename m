Return-Path: <SRS0=IwST=O2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 261B3C43387
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 14:50:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E975021783
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 14:50:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SaiLQxkL"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733151AbeLQOuu (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 17 Dec 2018 09:50:50 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:44001 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733001AbeLQOut (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Dec 2018 09:50:49 -0500
Received: by mail-pg1-f196.google.com with SMTP id v28so6222994pgk.10;
        Mon, 17 Dec 2018 06:50:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=yvgL8zvdUdrLClTmydYduIuUpOYbTV0KPXZsw84MMyQ=;
        b=SaiLQxkLqGA5obEUcgaBMLoHTx+OBDrNk+RZnHpX1ID2WuDDwZavY7a5O0aVFHwpd3
         BccyZ8HyES2yv+JsQ+rsKSuzrCfb6QxI8cIHuXC4N50OLmNQbIIekOZ4yXd/thB3vo7T
         bYoyHhQY0akmXlEUvnW3CpnWjck1IEpE6mHXGUlxI/ma4bAZ0018eCLFuyKIHIfnMklA
         MifdYGfGKiI8vuyt9jZrxxa7NdmHoZTHga1/li8b4vZDt/L7XpDaHLi4h4Etn7CPwn4v
         Uq1WNrwxFIdwRWeZ0jqNQlD5uliBZPNT0eQwy9XevicnnpfHSYxSyWFdye3y5gwzEVAb
         4ZLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=yvgL8zvdUdrLClTmydYduIuUpOYbTV0KPXZsw84MMyQ=;
        b=RTF4mxfHMzsvCFEZ3GWZDxoUjQFpd3NOaOhh6VZrhj4yu7DoeV1RA9iNSdxAjYMN5T
         0kzmljcLLrurq2B8Cu1b1FURooLukkN2Zagr/xBhEFdWaMNoM7V/dDWkJ7inIs6OYINZ
         Jk5TtoRya4Q2kJerk/yUwzK9OtQRBuP9nRm0e7kuo2I7xBWhFvwzmQsCvGiB8VVtcVU9
         yr7oYENZvutCrrY5Aj/HVHJp4PxCc/zVe6+4u+0Ukon5mRB8qUhSw1Yu1ze16p+Y2G/M
         loWYJu+RgtzXOjeygfmUI/l3iweZ07S6/OWS+XZ8hkKIr2bs6QR3fznB86L8XRkOZv7u
         /mQQ==
X-Gm-Message-State: AA+aEWZdfRsv1k+DGOwB8XjUHYpm3AWUjW+LGrXnSDQBt9iBhXNIS/Xl
        VFhQGz5Gpm8rQq+raxzz268tTusL
X-Google-Smtp-Source: AFSGD/Uncu+QC31SEMyjkImHrJ9pyfBDANNkYP8p9nDbuEvEOPle49vDEsw9C8Iu8WxjE5A3W7wQFA==
X-Received: by 2002:a63:6207:: with SMTP id w7mr12048575pgb.90.1545058248320;
        Mon, 17 Dec 2018 06:50:48 -0800 (PST)
Received: from macc.flets-east.jp (p7732116-ipngn36501marunouchi.tokyo.ocn.ne.jp. [114.158.79.116])
        by smtp.gmail.com with ESMTPSA id v191sm33312081pgb.77.2018.12.17.06.50.45
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 17 Dec 2018 06:50:47 -0800 (PST)
From:   Yoshihiro Kaneko <ykaneko0929@gmail.com>
To:     linux-pm@vger.kernel.org
Cc:     Zhang Rui <rui.zhang@intel.com>,
        Eduardo Valentin <edubezval@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: [PATCH/RFT v2 1/2] dt-bindings: thermal: rcar-thermal: add R8A77990 support
Date:   Mon, 17 Dec 2018 23:50:20 +0900
Message-Id: <1545058221-22529-2-git-send-email-ykaneko0929@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1545058221-22529-1-git-send-email-ykaneko0929@gmail.com>
References: <1545058221-22529-1-git-send-email-ykaneko0929@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Document the R-Car E3 (R8A77990) SoC bindings.

Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
---
 Documentation/devicetree/bindings/thermal/rcar-thermal.txt | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/thermal/rcar-thermal.txt b/Documentation/devicetree/bindings/thermal/rcar-thermal.txt
index 73e1613..0520c18 100644
--- a/Documentation/devicetree/bindings/thermal/rcar-thermal.txt
+++ b/Documentation/devicetree/bindings/thermal/rcar-thermal.txt
@@ -4,7 +4,7 @@ Required properties:
 - compatible		: "renesas,thermal-<soctype>",
 			   "renesas,rcar-gen2-thermal" (with thermal-zone) or
 			   "renesas,rcar-thermal" (without thermal-zone) as
-                           fallback except R-Car V3M/D3.
+                           fallback except R-Car V3M/E3/D3.
 			  Examples with soctypes are:
 			    - "renesas,thermal-r8a73a4" (R-Mobile APE6)
 			    - "renesas,thermal-r8a7743" (RZ/G1M)
@@ -15,6 +15,7 @@ Required properties:
 			    - "renesas,thermal-r8a7792" (R-Car V2H)
 			    - "renesas,thermal-r8a7793" (R-Car M2-N)
 			    - "renesas,thermal-r8a77970" (R-Car V3M)
+			    - "renesas,thermal-r8a77990" (R-Car E3)
 			    - "renesas,thermal-r8a77995" (R-Car D3)
 - reg			: Address range of the thermal registers.
 			  The 1st reg will be recognized as common register
@@ -23,7 +24,7 @@ Required properties:
 Option properties:
 
 - interrupts		: If present should contain 3 interrupts for
-                          R-Car V3M/D3 or 1 interrupt otherwise.
+                          R-Car V3M/E3/D3 or 1 interrupt otherwise.
 
 Example (non interrupt support):
 
-- 
1.9.1

