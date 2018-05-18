Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:33804 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751588AbeERLTO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 May 2018 07:19:14 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 46/69] ARM: dts: lager: Drop unnecessary address properties from port node
Date: Fri, 18 May 2018 13:17:19 +0200
Message-Id: <bedbe61959a803b54350df93a517d98329ec160e.1526641667.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1526641667.git.horms+renesas@verge.net.au>
References: <cover.1526641667.git.horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The vin port node does not have an address and thus does not need
address-cells or address size-properties.

This is flagged by dtc as follows:
 # make dtbs W=1
 arch/arm/boot/dts/r8a7790-lager.dtb: Warning (avoid_unnecessary_addr_size): /soc/video@e6ef1000/port: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 arch/arm/boot/dts/r8a7790-lager.dts | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/arm/boot/dts/r8a7790-lager.dts b/arch/arm/boot/dts/r8a7790-lager.dts
index 3c66366f7c55..d1e582b0ab66 100644
--- a/arch/arm/boot/dts/r8a7790-lager.dts
+++ b/arch/arm/boot/dts/r8a7790-lager.dts
@@ -890,9 +890,6 @@
 	status = "okay";
 
 	port {
-		#address-cells = <1>;
-		#size-cells = <0>;
-
 		vin1ep0: endpoint {
 			remote-endpoint = <&adv7180>;
 			bus-width = <8>;
-- 
2.11.0
