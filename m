Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:46334 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753079AbdAZKLY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Jan 2017 05:11:24 -0500
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Chris Brandt <chris.brandt@renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 6/7] ARM: dts: rskrza1: add ostm DT support
Date: Thu, 26 Jan 2017 11:11:08 +0100
Message-Id: <37dfe2afc5618d42d3214a61ed017ce4bbc12254.1485425227.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1485425227.git.horms+renesas@verge.net.au>
References: <cover.1485425227.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Chris Brandt <chris.brandt@renesas.com>

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/boot/dts/r7s72100-rskrza1.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/r7s72100-rskrza1.dts b/arch/arm/boot/dts/r7s72100-rskrza1.dts
index dd4418195ca6..02b59c5b3c53 100644
--- a/arch/arm/boot/dts/r7s72100-rskrza1.dts
+++ b/arch/arm/boot/dts/r7s72100-rskrza1.dts
@@ -61,6 +61,14 @@
 	status = "okay";
 };
 
+&ostm0 {
+	status = "okay";
+};
+
+&ostm1 {
+	status = "okay";
+};
+
 &scif2 {
 	status = "okay";
 };
-- 
2.7.0.rc3.207.g0ac5344
