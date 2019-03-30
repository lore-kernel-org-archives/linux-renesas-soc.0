Return-Path: <SRS0=nD3B=SB=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2973FC43381
	for <linux-renesas-soc@archiver.kernel.org>; Sat, 30 Mar 2019 07:08:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E0AD42184C
	for <linux-renesas-soc@archiver.kernel.org>; Sat, 30 Mar 2019 07:08:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="umAj8hVN"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726415AbfC3HIZ (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sat, 30 Mar 2019 03:08:25 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:44562 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726402AbfC3HIZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 30 Mar 2019 03:08:25 -0400
Received: by mail-pl1-f194.google.com with SMTP id g12so2037583pll.11
        for <linux-renesas-soc@vger.kernel.org>; Sat, 30 Mar 2019 00:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=w0oNDRhXba0/YnUeMvcHuekj4wKZVEoP8IzN102hlJM=;
        b=umAj8hVNhD6J4r8ZDb5nRC56TBWtkPcEhXC48/Sh426jk8btiQHa3rK7yDR/oHiU6f
         tbbWLgPj5Td9/ZcMTRqU/E1Xrjre6sCPJ/h2HfD1nqc/O0G8dUQWHjcGOV4qs44yFL2W
         wuZgCeFCAYf7Tb3awlx9TqoyoTfLnxwJNdGSwZ+jPEB8KH6DG7m7dp/N1LJzkyeI2wQt
         p/jLDns3Gf9bjQGTSzJjyYG41s/YgiJ04atrCfqg7f549XrykPoPcTr2uIgxbv6zfGt2
         VxXiAF0iGgkQLlEKcUPmYOs12KXx7AKxtvygVve5MtSpij1eljfq4mpu5TMdmAad/XZO
         nGlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=w0oNDRhXba0/YnUeMvcHuekj4wKZVEoP8IzN102hlJM=;
        b=qyTsi71/bdPyQJdea+aa00tj4AQNZ+GUtE95nhXv351zZPjOO6DeqTxdl6lmIOIdbL
         30s/bww035Bjio71X200lSJsy5JVfTFiWm8G9oWymAKBy2S3HWnE/F15YKPD2lEdQWq4
         EAH586bCfpIx8nQ9IM+jBU+iiKwJ+AJ52iN4uuce5+/CxadfnWnRPBqo66Yes/LDUoOC
         ZCbIVVps+dHOMhGCmzY2FOHv2lXW3mbBXakhwXGQ9SxrEPLCRG2yZOJxpWx3vGTT1Fmj
         T8huEjquwRwykgxttzA6GOSucPaBxXrqZdgGBz6pfCxcVYBmFAA+0tj2LCgqG9O+CK9j
         RAJQ==
X-Gm-Message-State: APjAAAUO/n/mzSsVv+cOKeuzMbw+wM7TJJ0dHR8pr9cGGy+B7hazkTKU
        nGRrxRKGE063W3Vke2lupFE=
X-Google-Smtp-Source: APXvYqxyImtsCi7AfN7C2XwQ1mf8XK38tH2Ncs7niv37S1bHGemJ2RHN5UMIyDZwsHJBb0iiVTmpjA==
X-Received: by 2002:a17:902:29aa:: with SMTP id h39mr53136902plb.190.1553929704650;
        Sat, 30 Mar 2019 00:08:24 -0700 (PDT)
Received: from localhost.localdomain ([1.1.125.121])
        by smtp.gmail.com with ESMTPSA id h10sm6171353pfj.79.2019.03.30.00.08.20
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 30 Mar 2019 00:08:23 -0700 (PDT)
From:   marek.vasut@gmail.com
To:     linux-arm-kernel@lists.infradead.org
Cc:     Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH] ARM: dts: alt: Enable USB support
Date:   Sat, 30 Mar 2019 08:08:11 +0100
Message-Id: <20190330070811.25123-1-marek.vasut@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Marek Vasut <marek.vasut+renesas@gmail.com>

Add nodes enabling internal PCI controllers to which the internal USB
controllers are connected, add USB PHY node and pinmux nodes.

Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Simon Horman <horms+renesas@verge.net.au>
Cc: linux-renesas-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
---
 arch/arm/boot/dts/r8a7794-alt.dts | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm/boot/dts/r8a7794-alt.dts b/arch/arm/boot/dts/r8a7794-alt.dts
index e0500ec81569..0ab3d8d57f6d 100644
--- a/arch/arm/boot/dts/r8a7794-alt.dts
+++ b/arch/arm/boot/dts/r8a7794-alt.dts
@@ -199,6 +199,22 @@
 	};
 };
 
+&pci0 {
+	status = "okay";
+	pinctrl-0 = <&usb0_pins>;
+	pinctrl-names = "default";
+};
+
+&pci1 {
+	status = "okay";
+	pinctrl-0 = <&usb1_pins>;
+	pinctrl-names = "default";
+};
+
+&usbphy {
+	status = "okay";
+};
+
 &du {
 	pinctrl-0 = <&du_pins>;
 	pinctrl-names = "default";
@@ -293,6 +309,16 @@
 		function = "sdhi1";
 		power-source = <1800>;
 	};
+
+	usb0_pins: usb0 {
+		groups = "usb0";
+		function = "usb0";
+	};
+
+	usb1_pins: usb1 {
+		groups = "usb1";
+		function = "usb1";
+	};
 };
 
 &cmt0 {
-- 
2.20.1

