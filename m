Return-Path: <SRS0=0aVP=RX=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CC99C43381
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 20 Mar 2019 10:34:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6158D2075C
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 20 Mar 2019 10:34:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726692AbfCTKd7 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 20 Mar 2019 06:33:59 -0400
Received: from michel.telenet-ops.be ([195.130.137.88]:53036 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727599AbfCTKd7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 20 Mar 2019 06:33:59 -0400
Received: from ramsan ([84.194.111.163])
        by michel.telenet-ops.be with bizsmtp
        id qAZx1z0063XaVaC06AZx2E; Wed, 20 Mar 2019 11:33:57 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1h6YXl-0005JH-36; Wed, 20 Mar 2019 11:33:57 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1h6YXl-0005N8-1y; Wed, 20 Mar 2019 11:33:57 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Chris Brandt <chris.brandt@renesas.com>, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] dt-bindings: at24: add Renesas R1EX24016
Date:   Wed, 20 Mar 2019 11:33:51 +0100
Message-Id: <20190320103351.20609-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Document the compatible value for the Renesas R1EX24128ASAS0A two-wire
serial interface EEPROM, so it can be used in DTS files without causing
checkpatch warnings.

This is a 2 KiB EEPROM.  The first 1 KiB can always be written, the
second 1 KiB cannot be written if the write-protect line is asserted.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 Documentation/devicetree/bindings/eeprom/at24.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/eeprom/at24.txt b/Documentation/devicetree/bindings/eeprom/at24.txt
index 0e456bbc121399b7..22aead844d0f58d6 100644
--- a/Documentation/devicetree/bindings/eeprom/at24.txt
+++ b/Documentation/devicetree/bindings/eeprom/at24.txt
@@ -50,6 +50,7 @@ Required properties:
 
                 "nxp,se97b" - the fallback is "atmel,24c02",
                 "renesas,r1ex24002" - the fallback is "atmel,24c02"
+                "renesas,r1ex24016" - the fallback is "atmel,24c16"
                 "renesas,r1ex24128" - the fallback is "atmel,24c128"
                 "rohm,br24t01" - the fallback is "atmel,24c01"
 
-- 
2.17.1

