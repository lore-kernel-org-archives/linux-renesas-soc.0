Return-Path: <SRS0=/KHX=RY=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DF88C4360F
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 21 Mar 2019 09:21:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EB175218B0
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 21 Mar 2019 09:21:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728081AbfCUJVw (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 21 Mar 2019 05:21:52 -0400
Received: from andre.telenet-ops.be ([195.130.132.53]:48490 "EHLO
        andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728079AbfCUJVv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 21 Mar 2019 05:21:51 -0400
Received: from ramsan ([84.194.111.163])
        by andre.telenet-ops.be with bizsmtp
        id qZMl1z00b3XaVaC01ZMlLi; Thu, 21 Mar 2019 10:21:46 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1h6ttR-0005Dc-RP; Thu, 21 Mar 2019 10:21:45 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1h6ttR-0003t3-PZ; Thu, 21 Mar 2019 10:21:45 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Chris Brandt <chris.brandt@renesas.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 1/2] dt-bindings: gpio: pca953x: Document onnn,cat9554
Date:   Thu, 21 Mar 2019 10:21:44 +0100
Message-Id: <20190321092145.14896-2-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190321092145.14896-1-geert+renesas@glider.be>
References: <20190321092145.14896-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The ON Semiconductor CAT9554 is a variant of the PCA953x GPIO expander,
with 8 GPIOs and interrupt functionality.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - Split DT binding doc and driver update in separate patches.
---
 Documentation/devicetree/bindings/gpio/gpio-pca953x.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/gpio/gpio-pca953x.txt b/Documentation/devicetree/bindings/gpio/gpio-pca953x.txt
index fb144e2b65226601..8678df2a5713a9af 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-pca953x.txt
+++ b/Documentation/devicetree/bindings/gpio/gpio-pca953x.txt
@@ -30,6 +30,7 @@ Required properties:
 	ti,tca6424
 	ti,tca9539
 	ti,tca9554
+	onnn,cat9554
 	onnn,pca9654
 	exar,xra1202
  - gpio-controller: if used as gpio expander.
-- 
2.17.1

