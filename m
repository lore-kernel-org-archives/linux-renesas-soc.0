Return-Path: <SRS0=P06h=RT=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D982C43381
	for <linux-renesas-soc@archiver.kernel.org>; Sat, 16 Mar 2019 20:25:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D9D06218A1
	for <linux-renesas-soc@archiver.kernel.org>; Sat, 16 Mar 2019 20:25:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I5Bj5ROj"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726571AbfCPUZ5 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sat, 16 Mar 2019 16:25:57 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:34842 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726493AbfCPUZ5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 16 Mar 2019 16:25:57 -0400
Received: by mail-wr1-f68.google.com with SMTP id w1so7005643wrp.2;
        Sat, 16 Mar 2019 13:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Xe/fcITd+BQNeYoornI6kfJWpJdYApjGR9t6pBM9LXg=;
        b=I5Bj5ROjXZTv1EIB4TaOzpeRPFGxwl9X1F7vkqx0dTQ8wLIvvdZ51TvytTH1pIV/zH
         HGYHTCgtPD5XSx2HEGVpnA2xFBMJ6r/FmVETIXUCrtZkcvlqKBKU9t8uHAwXdI3fagYB
         +EVOAxpJjY83kF2aod2tCZ5Ka3ER1mJsLC+r6PvZFkoitbrCcGLg5WDNQF/psdUx+RU0
         VVAegfyghUZqU1KQo72ckKJRJmS6CWjdHl4Furw+2/F3m53kUddc133VYxziZ5uKv9iQ
         lHn0yRM3NKG0cp6s1CAaQCdWkrIg9e7SEq/VSg1/ebENtHMPbKLvaHgYKLeQqaVj7KVr
         vB/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Xe/fcITd+BQNeYoornI6kfJWpJdYApjGR9t6pBM9LXg=;
        b=EZwYDcsdvX32CHfcRLXQ0WGhQy7pqw+MjQQG7ocQ4od8Nt2ZiqTIz5hryjHD+u+65S
         iZsl32Qkrp2F2OAyf8nPrKaTOT2KRzfEEm/Y7do0ExvWla1NtX5ZfT2lBJJNhQ2gf3Sp
         vdtD51MVLQoV+d7vWE/EispAk/z8X2LIIi4CXg2GbWVBaMgF7gVgL3HZW772EjL1B4vf
         kyIj7HznF6wnnZP7nDOwqLlCkHE+94KJxbgzMfHUKxePP+pp81+i5MA8wkruEl/g2O0u
         r606MQTXaO10uXK2Mn51lMYDIiBjRCy+E0hsm6TGdt7Q8+1Ki3ZL96QCKN6oVv1urQYo
         Fqgg==
X-Gm-Message-State: APjAAAV4mgDb+IPYv3EdxKm7Q0wcuxQl12QBKZmgaGZK0B9YxyOqszl/
        5Tl6l88jmZ1E07oh+buNdU6Ni4vI
X-Google-Smtp-Source: APXvYqy+4WHGt9f4G+kySK6B5XdRhP8rTcqbklT8N4W3ZlxAEb+H+DyNW/bxMIHjqA5vwhXqsFbPAA==
X-Received: by 2002:a05:6000:1291:: with SMTP id f17mr1947315wrx.201.1552767954878;
        Sat, 16 Mar 2019 13:25:54 -0700 (PDT)
Received: from kurokawa.lan (ip-86-49-110-70.net.upcbroadband.cz. [86.49.110.70])
        by smtp.gmail.com with ESMTPSA id a20sm5635412wmb.17.2019.03.16.13.25.53
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 16 Mar 2019 13:25:53 -0700 (PDT)
From:   marek.vasut@gmail.com
To:     devicetree@vger.kernel.org
Cc:     Marek Vasut <marek.vasut+renesas@gmail.com>,
        Harald Geyer <harald@ccbib.org>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH V3] regulator: gpio: Reword the binding document
Date:   Sat, 16 Mar 2019 21:25:51 +0100
Message-Id: <20190316202552.21525-1-marek.vasut@gmail.com>
X-Mailer: git-send-email 2.20.1
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
V3: - Use gpio-states description from Harald
Note: The recent gpio-regulator rework caused breakage. While the
      changes in the gpio-regulator code were according to the DT
      binding document, they stopped working with older DTs. Make
      the binding document clearer to prevent such breakage in the
      future.
---
 .../bindings/regulator/gpio-regulator.txt     | 30 ++++++++++++++-----
 1 file changed, 22 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/regulator/gpio-regulator.txt b/Documentation/devicetree/bindings/regulator/gpio-regulator.txt
index 1f496159e2bb..dd25e73b5d79 100644
--- a/Documentation/devicetree/bindings/regulator/gpio-regulator.txt
+++ b/Documentation/devicetree/bindings/regulator/gpio-regulator.txt
@@ -4,16 +4,30 @@ Required properties:
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
+- gpios-states		: On operating systems, that don't support reading back
+			  gpio values in output mode (most notably linux), this
+			  array provides the state of GPIO pins set when
+			  requesting them from the gpio controller. Systems,
+			  that are capable of preserving state when requesting
+			  the lines, are free to ignore this property.
+			  0: LOW, 1: HIGH. Default is LOW if nothing else
+			  is specified.
 - startup-delay-us	: Startup time in microseconds.
-- enable-active-high	: Polarity of GPIO is active high (default is low).
 - regulator-type	: Specifies what is being regulated, must be either
 			  "voltage" or "current", defaults to voltage.
 
@@ -30,7 +44,7 @@ Example:
 		regulator-max-microvolt = <2600000>;
 		regulator-boot-on;
 
-		enable-gpio = <&gpio0 23 0x4>;
+		enable-gpios = <&gpio0 23 0x4>;
 		gpios = <&gpio0 24 0x4
 			 &gpio0 25 0x4>;
 		states = <1800000 0x3
-- 
2.20.1

