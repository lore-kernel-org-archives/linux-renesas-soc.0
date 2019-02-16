Return-Path: <SRS0=vwki=QX=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC5AEC43381
	for <linux-renesas-soc@archiver.kernel.org>; Sat, 16 Feb 2019 13:46:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 94D03218A6
	for <linux-renesas-soc@archiver.kernel.org>; Sat, 16 Feb 2019 13:46:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="irZHAErS"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725813AbfBPNqd (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sat, 16 Feb 2019 08:46:33 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:39746 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725769AbfBPNqd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 16 Feb 2019 08:46:33 -0500
Received: by mail-wr1-f68.google.com with SMTP id l5so12113382wrw.6;
        Sat, 16 Feb 2019 05:46:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IW57k7NZVqY7vEPhptee37TYpc/NCU+BoaYwMB7+MAY=;
        b=irZHAErS1bHER5Da+x0WrFCCKZvuW7R1VluDxnDZr74JXE2zNl7PPgQGEulYEn9hpc
         ifjR2CqxIWcSqYZpYgNwElFA+V5NswvwTJRVRUdqWBclUDQdD6dVUfh3ZmZwOSVHnDyL
         Q5/+e8H7dH0KJWTfDJ+AYBrGszLuz9Tp/il4B0AjTS3CfbAE14+wBoiUiXpXJxwWUc9O
         +A2oHMu7BzSFa+d23JHuiBQTl667K4EnAjSQtzFlpctAJG513pxkARqZUx9XnGSqwKAC
         ninLb1+XQqUGNDFd9fiBdj2nFB/XiZk6MvhhTrony2NJiHkP5Bst5msLd9vqdmem3s+K
         cezA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IW57k7NZVqY7vEPhptee37TYpc/NCU+BoaYwMB7+MAY=;
        b=PwrSh0gNZ99pM98p0XYk5KbmIhV8l5cObHuUb4kASnB0DHMSXgLH68OV4U4E2vL4wn
         QHZC65XsmKB0cSlaY3KNNAw9FmYE6k+iEFAuOOlbxe3uKye6hCkH92/Qhn45yxqmYs7q
         GE+TnSMMe/cZYhTAft4ZKx1iXiS6uk3SmXelDiFwc7ZSslj5JmNSzi4YiprRuDFeCK3S
         Y3SSeTTdWxszr33PqBZcWcr9jgB8lxZnA+z8hEJVKX2/W9Fr3ems2SxKgA60hkFZ432f
         62wQTc8Ti72AtpTX/tQ9ajz6u3kiBRtMMEDZuQz40L/Orm6yIx+gjyhyKWlgO2hcX7cI
         DErw==
X-Gm-Message-State: AHQUAuaUe+dFFGYRno48Sel663IHf759whKAN5jgOh0yEHemJNN00TsQ
        XnJ/p9D1Y1SHTx1TilJDQpoiNKfn
X-Google-Smtp-Source: AHgI3IZh+Im9rcrPY3dqlHWcgWgdC8fi3+rsm+LZkPzoiwjjbW85HNQEd2JIEJLgrTEoFhWGbw8ylw==
X-Received: by 2002:a5d:4412:: with SMTP id z18mr10304957wrq.111.1550324791013;
        Sat, 16 Feb 2019 05:46:31 -0800 (PST)
Received: from kurokawa.lan (ip-86-49-110-70.net.upcbroadband.cz. [86.49.110.70])
        by smtp.gmail.com with ESMTPSA id n3sm10327714wrs.10.2019.02.16.05.46.29
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 16 Feb 2019 05:46:29 -0800 (PST)
From:   marek.vasut@gmail.com
To:     linux-gpio@vger.kernel.org
Cc:     Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Jan Kotas <jank@cadence.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH] gpio: of: Apply regulator-gpio quirk only to enable-gpios
Date:   Sat, 16 Feb 2019 14:46:27 +0100
Message-Id: <20190216134627.1601-1-marek.vasut@gmail.com>
X-Mailer: git-send-email 2.19.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Marek Vasut <marek.vasut+renesas@gmail.com>

Since commit d6cd33ad7102 ("regulator: gpio: Convert to use descriptors")
the GPIO regulator had inverted the polarity of the control GPIO. This
problem manifested itself on systems with DT containing the following
description (snippet from salvator-common.dtsi):

	gpios = <&gpio5 1 GPIO_ACTIVE_HIGH>;
	gpios-states = <1>;
	states = <3300000 1
		  1800000 0>;

Prior to the aforementioned commit, the gpio-regulator code used
gpio_request_array() to claim the GPIO(s) specified in the "gpios"
DT node, while the commit changed that to devm_gpiod_get_index().

The legacy gpio_request_array() calls gpio_request_one() and then
gpiod_request(), which parses the DT flags of the "gpios" node and
populates the GPIO descriptor flags field accordingly.

The new devm_gpiod_get_index() calls gpiod_get_index(), then
of_find_gpio(), of_get_named_gpiod_flags() with flags != NULL,
and then of_gpio_flags_quirks(). Since commit a603a2b8d86e
("gpio: of: Add special quirk to parse regulator flags"),
of_gpio_flags_quirks() contains a quirk for regulator-gpio
which was never triggered by the legacy gpio_request_array()
code path, but is triggered by devm_gpiod_get_index() code
path.

This quirk checks whether a GPIO is associated with a fixed
or gpio-regulator and if so, checks two additional conditions.
First, whether such GPIO is active-low, and if so, ignores the
active-low flag. Second, whether the regulator DT node does
have an "enable-active-high" property and if the property is
NOT present, sets the GPIO flags as active-low.

The second check triggers a problem, since it is applied to all
GPIOs associated with a gpio-regulator, rather than only on the
"enable" GPIOs, as the old code did. This changes the way the
gpio-regulator interprets the DT description of the control
GPIOs.

The old code using gpio_request_array() explicitly parsed the
"enable-active-high" DT property and only applied it to the
GPIOs described in the "enable-gpios" DT node, and only if
those were present.

This patch fixes the quirk code by only applying the quirk
to "enable-gpios", thus restoring the old behavior.

Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Jan Kotas <jank@cadence.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Mark Brown <broonie@kernel.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org
To: linux-gpio@vger.kernel.org
---
 drivers/gpio/gpiolib-of.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index 03ec3ddaba60..1b4c741e0635 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -84,6 +84,7 @@ static void of_gpio_flags_quirks(struct device_node *np,
 	 * Note that active low is the default.
 	 */
 	if (IS_ENABLED(CONFIG_REGULATOR) &&
+	    !strcmp(propname, "enable-gpio") &&
 	    (of_device_is_compatible(np, "regulator-fixed") ||
 	     of_device_is_compatible(np, "reg-fixed-voltage") ||
 	     of_device_is_compatible(np, "regulator-gpio"))) {
-- 
2.19.2

