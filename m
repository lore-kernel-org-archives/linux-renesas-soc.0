Return-Path: <SRS0=uTUX=YA=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61E0CECE58D
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  7 Oct 2019 10:23:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3653F2084D
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  7 Oct 2019 10:23:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727437AbfJGKXp (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 7 Oct 2019 06:23:45 -0400
Received: from laurent.telenet-ops.be ([195.130.137.89]:46890 "EHLO
        laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727307AbfJGKXo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 7 Oct 2019 06:23:44 -0400
Received: from ramsan ([84.194.98.4])
        by laurent.telenet-ops.be with bizsmtp
        id AaPh2100805gfCL01aPhT5; Mon, 07 Oct 2019 12:23:42 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iHQB3-00086f-8A; Mon, 07 Oct 2019 12:23:41 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iHQB3-0003Bs-6r; Mon, 07 Oct 2019 12:23:41 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC 02/19] dt-bindings: arm: renesas: Add Salvator-XS board with R-Car M3-W+
Date:   Mon,  7 Oct 2019 12:23:15 +0200
Message-Id: <20191007102332.12196-3-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191007102332.12196-1-geert+renesas@glider.be>
References: <20191007102332.12196-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add device tree binding documentation for the Renesas Salvator-XS board
equipped with an R-Car M3-W+ (R8A77961) SoC.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 Documentation/devicetree/bindings/arm/renesas.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/renesas.yaml b/Documentation/devicetree/bindings/arm/renesas.yaml
index b78e4e33e7c7ef22..21b2b25093538f5f 100644
--- a/Documentation/devicetree/bindings/arm/renesas.yaml
+++ b/Documentation/devicetree/bindings/arm/renesas.yaml
@@ -207,6 +207,8 @@ properties:
 
       - description: R-Car M3-W+ (R8A77961)
         items:
+          - enum:
+              - renesas,salvator-xs # Salvator-XS (Salvator-X 2nd version, FIXME part number)
           - const: renesas,r8a77961
 
       - description: Kingfisher (SBEV-RCAR-KF-M03)
-- 
2.17.1

