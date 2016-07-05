Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f54.google.com ([209.85.215.54]:33017 "EHLO
	mail-lf0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755577AbcGEVx6 (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Tue, 5 Jul 2016 17:53:58 -0400
Received: by mail-lf0-f54.google.com with SMTP id f6so143325738lfg.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 05 Jul 2016 14:53:57 -0700 (PDT)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: linus.walleij@linaro.org, linux-gpio@vger.kernel.org,
	gnurou@gmail.com, robh+dt@kernel.org, pawel.moll@arm.com,
	mark.rutland@arm.com, ijc+devicetree@hellion.org.uk,
	galak@codeaurora.org, devicetree@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
Subject: [PATCH] gpio: rcar: document R8A7792 support
Date: Wed, 06 Jul 2016 00:53:53 +0300
Message-ID: <1977343.FhZjzuj3ub@wasted.cogentembedded.com>
In-Reply-To: <1501145.5ro9yfox2Z@wasted.cogentembedded.com>
References: <1501145.5ro9yfox2Z@wasted.cogentembedded.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Renesas R8A7792 SoC is a member of the R-Car gen2 family that is supported
by  the Renesas R-Car GPIO driver.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
The patch is against the 'devel' branch of Linus Walleij's 'linux-gpio.git'
repo.

 Documentation/devicetree/bindings/gpio/renesas,gpio-rcar.txt |    1 +
 1 file changed, 1 insertion(+)

Index: linux-gpio/Documentation/devicetree/bindings/gpio/renesas,gpio-rcar.txt
===================================================================
--- linux-gpio.orig/Documentation/devicetree/bindings/gpio/renesas,gpio-rcar.txt
+++ linux-gpio/Documentation/devicetree/bindings/gpio/renesas,gpio-rcar.txt
@@ -7,6 +7,7 @@ Required Properties:
     - "renesas,gpio-r8a7779": for R8A7779 (R-Car H1) compatible GPIO controller.
     - "renesas,gpio-r8a7790": for R8A7790 (R-Car H2) compatible GPIO controller.
     - "renesas,gpio-r8a7791": for R8A7791 (R-Car M2-W) compatible GPIO controller.
+    - "renesas,gpio-r8a7792": for R8A7792 (R-Car V2H) compatible GPIO controller.
     - "renesas,gpio-r8a7793": for R8A7793 (R-Car M2-N) compatible GPIO controller.
     - "renesas,gpio-r8a7794": for R8A7794 (R-Car E2) compatible GPIO controller.
     - "renesas,gpio-r8a7795": for R8A7795 (R-Car H3) compatible GPIO controller.
