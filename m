Return-Path: <SRS0=YxuQ=RH=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1214AC43381
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  4 Mar 2019 19:40:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C1D83206B6
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  4 Mar 2019 19:40:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AQTVFXmD"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726080AbfCDTke (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 4 Mar 2019 14:40:34 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:35564 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726054AbfCDTke (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 4 Mar 2019 14:40:34 -0500
Received: by mail-wm1-f66.google.com with SMTP id y15so348334wma.0;
        Mon, 04 Mar 2019 11:40:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2lct7q7QWXK+Vus3AvCH//oMJEkIXegYcs0c1jlb7Sg=;
        b=AQTVFXmDDHGW6nzSJGaoRq1GTfDus9orGAh6h/BGR/S/Ms2jZvMWokUkBeoqtEVopT
         vAQp5nCMyvNvWX0B9istKIyN9r2QzAV7Q+zU6cYimQa3AkaUxDumN/lbsu/sPYJRiJ02
         gVHdHXkJRuc1aNPkpmqMEqAz8Uk+yryIIm+Gpo0rVHhTueumCz6RwJLiuzAz/l0Mh59F
         xLQ2Xraa+7EBf6By18wQ4UQm2PDTCipiJu4zkRCt0d4DZ+dOdDGeBhUkv1ZFD+NNEth4
         koyGeL+vFFNe7ANPzF2ZSGV496nCY37WN4xwYNifkuMcSMWEql3w6YCCANJScYbGP5MG
         guhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2lct7q7QWXK+Vus3AvCH//oMJEkIXegYcs0c1jlb7Sg=;
        b=dsTx7tvoDuaUTtXxF8yQoLQJYTPeedZI9/sWn2jzNG+Otq2ZFH2/DPji2WSned2z4K
         i3lkjIxxF+Zb8Hv615p9S9+hRpdNzh59OcratlmsFft31TtKZ0PNa0LjBrmj4ILlLfaP
         6o5zFIcBBK14725VO5ayvORVWdZbZ9xkZO+rX0JwjnwbFkzul8KkrBqgZVJKMSJTAVEQ
         X57w7rtufFrN66qZ4ZGk98rKUK4TgypTtMp7jx/VnKJ2w6kmeeT6QZtvSxOrtXTjdLHe
         XmMZMIgway6wV1t6N6LYzj1zuhUA12rQrdTIQz2gktzuM1zVn9737YfRgyGUL+86+dTG
         NFqQ==
X-Gm-Message-State: APjAAAXYywFTuph9sF9snOdO97435cJizv4ecZURWiSfOHZAUHqDHCDS
        NHR7VlXHO3aSz31XAI2TLZXEKyuD
X-Google-Smtp-Source: APXvYqzRX15ugo4UMuokjqkDjv0SeD3wytgERDpKGZwd6d0LG7dnVfX1Wx4OF00cw5PNGMpaNVVi9w==
X-Received: by 2002:a1c:9c04:: with SMTP id f4mr416329wme.149.1551728430114;
        Mon, 04 Mar 2019 11:40:30 -0800 (PST)
Received: from kurokawa.lan (ip-86-49-110-70.net.upcbroadband.cz. [86.49.110.70])
        by smtp.gmail.com with ESMTPSA id o18sm20314106wrg.40.2019.03.04.11.40.28
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 04 Mar 2019 11:40:29 -0800 (PST)
From:   marek.vasut@gmail.com
To:     devicetree@vger.kernel.org
Cc:     Marek Vasut <marek.vasut+renesas@gmail.com>,
        Harald Geyer <harald@ccbib.org>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH V2] regulator: gpio: Reword the binding document
Date:   Mon,  4 Mar 2019 20:40:23 +0100
Message-Id: <20190304194023.10926-1-marek.vasut@gmail.com>
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
V2: - Make "gpios" a mandatory property
    - Reword "gpio-states" property description
    - Change "enable-gpio" to "enable-gpios" to match modern DT rules
Note: The recent gpio-regulator rework caused breakage. While the
      changes in the gpio-regulator code were according to the DT
      binding document, they stopped working with older DTs. Make
      the binding document clearer to prevent such breakage in the
      future.
---
 .../bindings/regulator/gpio-regulator.txt     | 25 +++++++++++++------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/regulator/gpio-regulator.txt b/Documentation/devicetree/bindings/regulator/gpio-regulator.txt
index 1f496159e2bb..d7f8c1b17db6 100644
--- a/Documentation/devicetree/bindings/regulator/gpio-regulator.txt
+++ b/Documentation/devicetree/bindings/regulator/gpio-regulator.txt
@@ -4,16 +4,25 @@ Required properties:
 - compatible		: Must be "regulator-gpio".
 - regulator-name	: Defined in regulator.txt as optional, but required
 			  here.
-- states		: Selection of available voltages and GPIO configs.
-                          if there are no states, then use a fixed regulator
+- gpios			: Array of one or more GPIO pins used to select the
+			  regulator voltage/current listed in "states".
+- states		: Selection of available voltages/currents provided by
+			  this regulator and matching GPIO configurations to
+			  achieve them. If there are no states in the "states"
+			  array, use a fixed regulator instead.
 
 Optional properties:
-- enable-gpio		: GPIO to use to enable/disable the regulator.
-- gpios			: GPIO group used to control voltage.
-- gpios-states		: gpios pin's initial states array. 0: LOW, 1: HIGH.
-			  defualt is LOW if nothing is specified.
+- enable-gpios		: GPIO used to enable/disable the regulator.
+			  Warning, the GPIO phandle flags are ignored and the
+			  GPIO polarity is controlled solely by the presence
+			  of "enable-active-high" DT property. This is due to
+			  compatibility with old DTs.
+- enable-active-high	: Polarity of "enable-gpio" GPIO is active HIGH.
+			  Default is active LOW.
+- gpios-states		: State of GPIO pins in "gpios" array that is set until
+			  changed by the first consumer. 0: LOW, 1: HIGH.
+			  Default is LOW if nothing else is specified.
 - startup-delay-us	: Startup time in microseconds.
-- enable-active-high	: Polarity of GPIO is active high (default is low).
 - regulator-type	: Specifies what is being regulated, must be either
 			  "voltage" or "current", defaults to voltage.
 
@@ -30,7 +39,7 @@ Example:
 		regulator-max-microvolt = <2600000>;
 		regulator-boot-on;
 
-		enable-gpio = <&gpio0 23 0x4>;
+		enable-gpios = <&gpio0 23 0x4>;
 		gpios = <&gpio0 24 0x4
 			 &gpio0 25 0x4>;
 		states = <1800000 0x3
-- 
2.19.2

