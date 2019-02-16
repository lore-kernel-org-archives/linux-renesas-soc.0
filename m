Return-Path: <SRS0=vwki=QX=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20345C43381
	for <linux-renesas-soc@archiver.kernel.org>; Sat, 16 Feb 2019 17:49:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E164F205C9
	for <linux-renesas-soc@archiver.kernel.org>; Sat, 16 Feb 2019 17:49:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LwHwHnXu"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732252AbfBPRtG (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sat, 16 Feb 2019 12:49:06 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:33858 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732151AbfBPRtG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 16 Feb 2019 12:49:06 -0500
Received: by mail-wr1-f68.google.com with SMTP id f14so13672014wrg.1;
        Sat, 16 Feb 2019 09:49:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=D7AYQIE/L5CXCS0+SQyy/lV4YrBcGs/9o+OHxJz4U0s=;
        b=LwHwHnXuGE807zltYl88Mu6wM2GF3+0vnOeLsLYf1hpGJZGWrA8kKaWb74ILbQ79de
         f+nIv1JW21tb9IuEHyTKnepo1oyc6/+Pnr5YGeyfKHmyk4wo+hUCO9HySukOLrofv6MD
         UjARJbQURyBRZ3UCRY7qbc42PzclayBD0sWfflhM/ZCTdwhOulGSr+jkbxYBI8W1dsnL
         3cMnema6cPyYfGGDSeMkkRM+BKiVsigisHtMPH2oAkMJcj0EvAdCjKyC5wM/7eZo8f1N
         WwBjupZMOqaQa2TgZTMQClLOappIlnwnFcrWH4+q9BRPJJPWUE7isIy5WFo0UW2cKG+6
         d8OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=D7AYQIE/L5CXCS0+SQyy/lV4YrBcGs/9o+OHxJz4U0s=;
        b=QWkyhjSkn/gAvjnp7ODpG8HD6VZnIryEnTH/e2uCt79Tru3JCRrfDiSsTQsv93Hks3
         PsfZ08ZsV3dtQIuZkb0Bf6vu799lufuxHrOqyeH7qs+qKUQRoa6A6o9HcE7EW/+cw8yO
         HssQRht96mISihOIZlr3R2qgakMbUWOj6j43C3yUzsjU0bJL4j8HVnIFd5xRjMSmd6pe
         BMmlXIAo65+zk9oa/1IxCIF7i5DaAD3hjeY6xFgTAedKpvhm4Vz432LmkPdITOEFKAC3
         4F7NEwF/5/0PIBV+2yoU9DBmofgD3M5LpG4UIRF2LFQEhDXCt3rnCBdphYavuClNgmxv
         UuKg==
X-Gm-Message-State: AHQUAua+t95LWsESjuW8s3fCR0yEm5FbHXSBMOK6Zh3iqas7JwdcAw2R
        k9xxT8D4W0pPONtQypnJ7UGlUfVA
X-Google-Smtp-Source: AHgI3IZybGjH5vRkjghLSybgFKc0DTR/va17CdvZtrOK5LOiLY1KQiuagFcblzJ1I8UvLAduci6Zqw==
X-Received: by 2002:a5d:6112:: with SMTP id v18mr10634940wrt.207.1550339343309;
        Sat, 16 Feb 2019 09:49:03 -0800 (PST)
Received: from kurokawa.lan (ip-86-49-110-70.net.upcbroadband.cz. [86.49.110.70])
        by smtp.gmail.com with ESMTPSA id s187sm10938764wms.8.2019.02.16.09.49.01
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 16 Feb 2019 09:49:01 -0800 (PST)
From:   marek.vasut@gmail.com
To:     devicetree@vger.kernel.org
Cc:     Marek Vasut <marek.vasut+renesas@gmail.com>,
        Harald Geyer <harald@ccbib.org>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH] regulator: gpio: Reword the binding document
Date:   Sat, 16 Feb 2019 18:48:59 +0100
Message-Id: <20190216174859.15738-1-marek.vasut@gmail.com>
X-Mailer: git-send-email 2.19.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Marek Vasut <marek.vasut+renesas@gmail.com>

Reword the binding document to make it clear how the propeties work
and which properties affect which other properties.

Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
Cc: Harald Geyer <harald@ccbib.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Mark Brown <broonie@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org
To: devicetree@vger.kernel.org
---
Note: The recent gpio-regulator rework caused breakage. While the
      changes in the gpio-regulator code were according to the DT
      binding document, they stopped working with older DTs. Make
      the binding document clearer to prevent such breakage in the
      future.
---
 .../bindings/regulator/gpio-regulator.txt     | 23 +++++++++++++------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/regulator/gpio-regulator.txt b/Documentation/devicetree/bindings/regulator/gpio-regulator.txt
index 1f496159e2bb..acca13c1eaf3 100644
--- a/Documentation/devicetree/bindings/regulator/gpio-regulator.txt
+++ b/Documentation/devicetree/bindings/regulator/gpio-regulator.txt
@@ -4,16 +4,25 @@ Required properties:
 - compatible		: Must be "regulator-gpio".
 - regulator-name	: Defined in regulator.txt as optional, but required
 			  here.
-- states		: Selection of available voltages and GPIO configs.
-                          if there are no states, then use a fixed regulator
+- states		: Selection of available voltages/currents provided by
+			  this regulator and matching GPIO configurations to
+			  achieve them. If there are no states in the "states"
+			  array, use a fixed regulator instead.
 
 Optional properties:
-- enable-gpio		: GPIO to use to enable/disable the regulator.
-- gpios			: GPIO group used to control voltage.
-- gpios-states		: gpios pin's initial states array. 0: LOW, 1: HIGH.
-			  defualt is LOW if nothing is specified.
+- enable-gpio		: GPIO used to enable/disable the regulator.
+			  Warning, the GPIO phandle flags are ignored and the
+			  GPIO polarity is controlled solely by the presence
+			  of "enable-active-high" DT property. This is due to
+			  compatibility with old DTs.
+- enable-active-high	: Polarity of "enable-gpio" GPIO is active HIGH.
+			  Default is active LOW.
+- gpios			: Array of one or more GPIO pins used to select the
+			  regulator voltage/current listed in "states".
+- gpios-states		: Initial state of GPIO pins in "gpios" array.
+			  0: LOW, 1: HIGH.
+			  Default is LOW if nothing else is specified.
 - startup-delay-us	: Startup time in microseconds.
-- enable-active-high	: Polarity of GPIO is active high (default is low).
 - regulator-type	: Specifies what is being regulated, must be either
 			  "voltage" or "current", defaults to voltage.
 
-- 
2.19.2

