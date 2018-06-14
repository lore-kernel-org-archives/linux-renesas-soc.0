Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:17555 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1755159AbeFNLEM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 14 Jun 2018 07:04:12 -0400
From: Michel Pollet <michel.pollet@bp.renesas.com>
To: linux-renesas-soc@vger.kernel.org,
        Simon Horman <horms@verge.net.au>
Cc: phil.edworthy@renesas.com,
        Michel Pollet <buserror+upstream@gmail.com>,
        Michel Pollet <michel.pollet@bp.renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Andy Gross <andy.gross@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Carlo Caione <carlo@endlessm.com>,
        Stefan Wahren <stefan.wahren@i2se.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
        Frank Rowand <frank.rowand@sony.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 1/3] dt-bindings: cpu: Add Renesas R9A06G032 SMP enable method.
Date: Thu, 14 Jun 2018 11:58:56 +0100
Message-Id: <1528973943-28132-2-git-send-email-michel.pollet@bp.renesas.com>
In-Reply-To: <1528973943-28132-1-git-send-email-michel.pollet@bp.renesas.com>
References: <1528973943-28132-1-git-send-email-michel.pollet@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add a special enable method for second CA7 of the R9A06G032

Signed-off-by: Michel Pollet <michel.pollet@bp.renesas.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
---
 Documentation/devicetree/bindings/arm/cpus.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/cpus.txt b/Documentation/devicetree/bindings/arm/cpus.txt
index 29e1dc5..b395d107 100644
--- a/Documentation/devicetree/bindings/arm/cpus.txt
+++ b/Documentation/devicetree/bindings/arm/cpus.txt
@@ -219,6 +219,7 @@ described below.
 			    "qcom,kpss-acc-v1"
 			    "qcom,kpss-acc-v2"
 			    "renesas,apmu"
+			    "renesas,r9a06g032-smp"
 			    "rockchip,rk3036-smp"
 			    "rockchip,rk3066-smp"
 			    "ste,dbx500-smp"
-- 
2.7.4
