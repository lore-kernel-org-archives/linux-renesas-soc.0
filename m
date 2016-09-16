Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:41446 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1765177AbcIPKov (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 16 Sep 2016 06:44:51 -0400
Date: Fri, 16 Sep 2016 12:44:43 +0200
From: Simon Horman <horms@verge.net.au>
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Magnus Damm <magnus.damm@gmail.com>, linux-mmc@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v7 07/11] ARM: dts: alt: Enable UHS-I SDR-50 and SDR-104
Message-ID: <20160916104443.GA7566@verge.net.au>
References: <1473764228-24768-1-git-send-email-horms+renesas@verge.net.au>
 <1473764228-24768-8-git-send-email-horms+renesas@verge.net.au>
 <20160916102710.GJ1411@katana>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160916102710.GJ1411@katana>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Sep 16, 2016 at 12:27:10PM +0200, Wolfram Sang wrote:
> On Tue, Sep 13, 2016 at 12:57:04PM +0200, Simon Horman wrote:
> > Add the "1v8" pinctrl state and sd-uhs-sdr50 property to SDHI{0,1}.
> > And the sd-uhs-sdr104 property to SDHI0.
> > 
> > Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> 
> If you drop sdr104 here for now as well:
> 
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks, done.

The result is as follows:

From: Simon Horman <horms+renesas@verge.net.au>
Date: Tue, 13 Sep 2016 12:57:04 +0200
Subject: [PATCH] ARM: dts: alt: enable UHS for SDHI 0 & 1

Add the "1v8" pinctrl state and sd-uhs-sdr50 property to SDHI{0,1}.

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/boot/dts/r8a7794-alt.dts | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/r8a7794-alt.dts b/arch/arm/boot/dts/r8a7794-alt.dts
index 8d1b35afaf82..325d3f972c57 100644
--- a/arch/arm/boot/dts/r8a7794-alt.dts
+++ b/arch/arm/boot/dts/r8a7794-alt.dts
@@ -207,11 +207,25 @@
 	sdhi0_pins: sd0 {
 		groups = "sdhi0_data4", "sdhi0_ctrl";
 		function = "sdhi0";
+		power-source = <3300>;
+	};
+
+	sdhi0_pins_uhs: sd0_uhs {
+		groups = "sdhi0_data4", "sdhi0_ctrl";
+		function = "sdhi0";
+		power-source = <1800>;
 	};
 
 	sdhi1_pins: sd1 {
 		groups = "sdhi1_data4", "sdhi1_ctrl";
 		function = "sdhi1";
+		power-source = <3300>;
+	};
+
+	sdhi1_pins_uhs: sd1_uhs {
+		groups = "sdhi1_data4", "sdhi1_ctrl";
+		function = "sdhi1";
+		power-source = <1800>;
 	};
 };
 
@@ -255,23 +269,27 @@
 
 &sdhi0 {
 	pinctrl-0 = <&sdhi0_pins>;
-	pinctrl-names = "default";
+	pinctrl-1 = <&sdhi0_pins_uhs>;
+	pinctrl-names = "default", "state_uhs";
 
 	vmmc-supply = <&vcc_sdhi0>;
 	vqmmc-supply = <&vccq_sdhi0>;
 	cd-gpios = <&gpio6 6 GPIO_ACTIVE_LOW>;
 	wp-gpios = <&gpio6 7 GPIO_ACTIVE_LOW>;
+	sd-uhs-sdr50;
 	status = "okay";
 };
 
 &sdhi1 {
 	pinctrl-0 = <&sdhi1_pins>;
-	pinctrl-names = "default";
+	pinctrl-1 = <&sdhi1_pins_uhs>;
+	pinctrl-names = "default", "state_uhs";
 
 	vmmc-supply = <&vcc_sdhi1>;
 	vqmmc-supply = <&vccq_sdhi1>;
 	cd-gpios = <&gpio6 14 GPIO_ACTIVE_LOW>;
 	wp-gpios = <&gpio6 15 GPIO_ACTIVE_LOW>;
+	sd-uhs-sdr50;
 	status = "okay";
 };
 
-- 
2.7.0.rc3.207.g0ac5344
