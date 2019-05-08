Return-Path: <SRS0=E//N=TI=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC144C04A6B
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  8 May 2019 17:33:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8D64B21726
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  8 May 2019 17:33:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728917AbfEHRdp (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 8 May 2019 13:33:45 -0400
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:48035 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728655AbfEHRdp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 8 May 2019 13:33:45 -0400
X-Originating-IP: 93.56.79.2
Received: from uno.localdomain (unknown [93.56.79.2])
        (Authenticated sender: jacopo@jmondi.org)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id C14371BF20C;
        Wed,  8 May 2019 17:33:42 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     laurent.pinchart@ideasonboard.com,
        linux-renesas-soc@vger.kernel.org
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        VenkataRajesh.Kalakodima@in.bosch.com,
        Harsha.ManjulaMallikarjun@in.bosch.com,
        Jacopo Mondi <jacopo@jmondi.org>
Subject: [RFC 1/9] dt-bindings: display: renesas,cmm: Add R-Car CMM documentation
Date:   Wed,  8 May 2019 19:34:20 +0200
Message-Id: <20190508173428.22054-2-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190508173428.22054-1-jacopo+renesas@jmondi.org>
References: <20190508173428.22054-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add device tree bindings documentation for the Renesas R-Car Display
Unit Color Management Module.

CMM is the image enhancement module available on each R-Car DU video
channel.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 .../bindings/display/renesas,cmm.txt          | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/renesas,cmm.txt

diff --git a/Documentation/devicetree/bindings/display/renesas,cmm.txt b/Documentation/devicetree/bindings/display/renesas,cmm.txt
new file mode 100644
index 000000000000..d7674417edb4
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/renesas,cmm.txt
@@ -0,0 +1,24 @@
+* Renesas R-Car Color Management Unit (CMM)
+
+Renesas R-Car image enhancement module connected to R-Car DU video channels.
+
+Required properties:
+ - compatible: shall be:
+   - "renesas,cmm"
+
+ - reg: the address base and length of the memory area where CMM control
+   registers are mapped to.
+
+ - clocks: phandle and clock-specifier pair to the CMM functional clock
+   supplier.
+
+Example:
+--------
+
+	cmm0: cmm@fea40000 {
+		compatible = "renesas,cmm";
+		reg = <0 0xfea40000 0 0x1000>;
+		power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
+		clocks = <&cpg CPG_MOD 711>;
+		resets = <&cpg 711>;
+	};
-- 
2.21.0

