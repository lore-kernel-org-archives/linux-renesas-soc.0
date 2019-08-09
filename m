Return-Path: <SRS0=ti3X=WF=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB2EBC433FF
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  9 Aug 2019 21:30:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C89D8208C3
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  9 Aug 2019 21:30:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728041AbfHIVav (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 9 Aug 2019 17:30:51 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:40834 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727436AbfHIVav (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 9 Aug 2019 17:30:51 -0400
Received: from penelope.horms.nl (ip4dab7138.direct-adsl.nl [77.171.113.56])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 935D725BE34;
        Sat, 10 Aug 2019 07:30:41 +1000 (AEST)
Received: by penelope.horms.nl (Postfix, from userid 7100)
        id B4DFEE21E15; Fri,  9 Aug 2019 23:30:36 +0200 (CEST)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Chris Brandt <chris.brandt@renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH v2 1/4] dt-bindings: i2c: sh_mobile: Rename bindings documentation file
Date:   Fri,  9 Aug 2019 14:30:01 -0700
Message-Id: <20190809213004.31181-2-horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190809213004.31181-1-horms+renesas@verge.net.au>
References: <20190809213004.31181-1-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Rename the bindings documentation file for sh_mobile I2C controller
from i2c-sh_mobile.txt to renesas,iic.txt.

This is part of an ongoing effort to name bindings documentation files for
Renesas IP blocks consistently, in line with the compat strings they
document.

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2
* Add review tag
---
 .../devicetree/bindings/i2c/{i2c-sh_mobile.txt => renesas,iic.txt}      | 0
 MAINTAINERS                                                             | 2 +-
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename Documentation/devicetree/bindings/i2c/{i2c-sh_mobile.txt => renesas,iic.txt} (100%)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-sh_mobile.txt b/Documentation/devicetree/bindings/i2c/renesas,iic.txt
similarity index 100%
rename from Documentation/devicetree/bindings/i2c/i2c-sh_mobile.txt
rename to Documentation/devicetree/bindings/i2c/renesas,iic.txt
diff --git a/MAINTAINERS b/MAINTAINERS
index 783569e3c4b4..4c8262837da9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13651,7 +13651,7 @@ RENESAS R-CAR I2C DRIVERS
 M:	Wolfram Sang <wsa+renesas@sang-engineering.com>
 S:	Supported
 F:	Documentation/devicetree/bindings/i2c/i2c-rcar.txt
-F:	Documentation/devicetree/bindings/i2c/i2c-sh_mobile.txt
+F:	Documentation/devicetree/bindings/i2c/renesas,iic.txt
 F:	drivers/i2c/busses/i2c-rcar.c
 F:	drivers/i2c/busses/i2c-sh_mobile.c
 
-- 
2.11.0

