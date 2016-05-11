Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from smtp6-v.fe.bosch.de ([139.15.237.11]:25980 "EHLO
	smtp6-v.fe.bosch.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752455AbcEKL5B (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Wed, 11 May 2016 07:57:01 -0400
Subject: Re: [PATCH v2 09/10] ARM: dts: r8a779x: Add reset module support
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <1462944578-1220-1-git-send-email-dirk.behme@de.bosch.com>
 <1462944578-1220-10-git-send-email-dirk.behme@de.bosch.com>
 <CAMuHMdUnDP55KLwT2XgjjzH4mSRuKRNSNqUmvuvFPVHAOeuTJQ@mail.gmail.com>
CC: Geert Uytterhoeven <geert+renesas@glider.be>,
	Simon Horman <horms+renesas@verge.net.au>,
	<linux-renesas-soc@vger.kernel.org>,
	Dirk Behme <dirk.behme@gmail.com>
From: Dirk Behme <dirk.behme@de.bosch.com>
Message-ID: <dd14821f-9b1c-6ea9-06f8-bc6698f7cba7@de.bosch.com>
Date: Wed, 11 May 2016 13:56:57 +0200
MIME-Version: 1.0
In-Reply-To: <CAMuHMdUnDP55KLwT2XgjjzH4mSRuKRNSNqUmvuvFPVHAOeuTJQ@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

On 11.05.2016 10:06, Geert Uytterhoeven wrote:
> Hi Dirk,
>
> On Wed, May 11, 2016 at 7:29 AM, Dirk Behme <dirk.behme@de.bosch.com> wrote:
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/misc/renesas,rcar-rst.txt
>> @@ -0,0 +1,15 @@
>> +Renesas RCar r8a779x reset module
>> +-----------------------------------------------------
>> +This binding defines the reset module found on Renesas RCar r8a779x
>> +SoCs. The reset module contains several reset related registers,
>> +the meaning of them is implementation dependent.
>> +
>> +Required properties:
>> +- compatible : "renesas,rcar-rst"
>> +- reg : Location and size of the reset module
>> +
>> +Example:
>> +       reset-controller@e6160000 {
>> +               compatible = "renesas,rcar-rst";
>> +               reg = <0 0xe6160000 0 0x200>;
>> +       };
>
> While I understand you want to match on a single comptible value, the RST
> module itself highly depends on the actual SoC.
> Furthermore, R-Car Gen1 doesn't have RST.
>
> Hence I'd go for requiring 2 compatible values:
>   - An SoC-specific one, e.g. "renesas,r8a7795-rst",
>   - A family-specific one, e.g. "renesas,rcar-gen3-rst".
>
> Your driver code can match against the two family-specific compatible values
> using of_find_matching_node().


This way? See below [1].

Best regards

Dirk

[1]

--- a/drivers/misc/boot-mode-reg/rcar.c
+++ b/drivers/misc/boot-mode-reg/rcar.c
@@ -16,24 +16,43 @@
  #include <linux/io.h>
  #include <linux/module.h>
  #include <linux/of.h>
+#include <linux/of_address.h>

  #include <misc/boot-mode-reg.h>

-#define MODEMR 0xe6160060
+#define RCAR_RST_BASE 0xe6160000
+#define RCAR_RST_SIZE 0x200
+#define MODEMR 0x60
+
+static struct of_device_id rcar_rst_ids[] __initdata = {
+	{ .compatible = "renesas,rcar-gen2-rst" },
+	{ .compatible = "renesas,rcar-gen3-rst" },
+	{}
+};

  static int __init rcar_read_mode_pins(void)
  {
-	void __iomem *modemr;
+	void __iomem *reset;
+	struct device_node *np;
  	int err = -ENOMEM;
  	static u32 mode;

-	modemr = ioremap_nocache(MODEMR, 4);
-	if (!modemr) {
-		pr_err("failed to map boot mode register");
+	np = of_find_matching_node(NULL, rcar_rst_ids);
+	if (np)
+		reset = of_iomap(np, 0);
+	else {
+		pr_warn("can't find renesas rcar-rst device node");
+		reset = ioremap_nocache(RCAR_RST_BASE, RCAR_RST_SIZE);
+	}
+
+	if (!reset) {
+		pr_err("failed to map reset registers");
+		of_node_put(np);
  		goto err;
  	}
-	mode = ioread32(modemr);
-	iounmap(modemr);
+	mode = ioread32(reset + MODEMR);
+	iounmap(reset);
+	of_node_put(np);

  	err = boot_mode_reg_set(mode);
  err:
--- /dev/null
+++ b/Documentation/devicetree/bindings/misc/renesas,rcar-rst.txt
@@ -0,0 +1,24 @@
+Renesas RCar r8a779x reset module
+-----------------------------------------------------
+This binding defines the reset module found on Renesas RCar r8a779x
+SoCs. The reset module contains several reset related registers,
+the meaning of them is implementation dependent.
+
+Required properties:
+- compatible : "renesas,rcar-gen2-rst" for RCar Gen2 or
+               "renesas,rcar-gen3-rst" for RCar Gen3
+	       and additionally a SoC specific property like
+	       "renesas,r8a7790-rst" or
+	       "renesas,r8a7791-rst" or
+	       "renesas,r8a7792-rst" or
+	       "renesas,r8a7793-rst" or
+	       "renesas,r8a7794-rst" or
+	       "renesas,r8a7795-rst" or
+	       "renesas,r8a7796-rst"
+- reg : Location and size of the reset module
+
+Example:
+	reset-controller@e6160000 {
+		compatible = "renesas,rcar-gen3-rst", "renesas,r8a7795-rst";
+		reg = <0 0xe6160000 0 0x200>;
+	};
diff --git a/arch/arm/boot/dts/r8a7790.dtsi b/arch/arm/boot/dts/r8a7790.dtsi
index 83cf23c..7102002 100644
--- a/arch/arm/boot/dts/r8a7790.dtsi
+++ b/arch/arm/boot/dts/r8a7790.dtsi
@@ -1102,6 +1102,11 @@
  			#power-domain-cells = <0>;
  		};

+		reset-controller@e6160000 {
+			compatible = "renesas,rcar-gen2-rst", "renesas,r8a7790-rst";
+			reg = <0 0xe6160000 0 0x200>;
+		};
+
  		/* Variable factor clocks */
  		sd2_clk: sd2@e6150078 {
  			compatible = "renesas,r8a7790-div6-clock", "renesas,cpg-div6-clock";
diff --git a/arch/arm/boot/dts/r8a7791.dtsi b/arch/arm/boot/dts/r8a7791.dtsi
index db67e34..d54b58e 100644
--- a/arch/arm/boot/dts/r8a7791.dtsi
+++ b/arch/arm/boot/dts/r8a7791.dtsi
@@ -1122,6 +1122,11 @@
  			#power-domain-cells = <0>;
  		};

+		reset-controller@e6160000 {
+			compatible = "renesas,rcar-gen2-rst", "renesas,r8a7791-rst";
+			reg = <0 0xe6160000 0 0x200>;
+		};
+
  		/* Variable factor clocks */
  		sd2_clk: sd2@e6150078 {
  			compatible = "renesas,r8a7791-div6-clock", "renesas,cpg-div6-clock";
diff --git a/arch/arm/boot/dts/r8a7793.dtsi b/arch/arm/boot/dts/r8a7793.dtsi
index 1dd6d20..9ebe978 100644
--- a/arch/arm/boot/dts/r8a7793.dtsi
+++ b/arch/arm/boot/dts/r8a7793.dtsi
@@ -933,6 +933,11 @@
  			#power-domain-cells = <0>;
  		};

+		reset-controller@e6160000 {
+			compatible = "renesas,rcar-gen2-rst", "renesas,r8a7793-rst";
+			reg = <0 0xe6160000 0 0x200>;
+		};
+
  		/* Variable factor clocks */
  		sd2_clk: sd2@e6150078 {
  			compatible = "renesas,r8a7793-div6-clock",
diff --git a/arch/arm/boot/dts/r8a7794.dtsi b/arch/arm/boot/dts/r8a7794.dtsi
index f334a3a..bd998fd 100644
--- a/arch/arm/boot/dts/r8a7794.dtsi
+++ b/arch/arm/boot/dts/r8a7794.dtsi
@@ -932,6 +932,12 @@
  					     "rcan";
  			#power-domain-cells = <0>;
  		};
+
+		reset-controller@e6160000 {
+			compatible = "renesas,rcar-gen2-rst", "renesas,r8a7794-rst";
+			reg = <0 0xe6160000 0 0x200>;
+		};
+
  		/* Variable factor clocks */
  		sd2_clk: sd2@e6150078 {
  			compatible = "renesas,r8a7794-div6-clock", "renesas,cpg-div6-clock";
diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi 
b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
index 7181db0..b846bca 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
@@ -309,6 +309,11 @@
  			#power-domain-cells = <0>;
  		};

+		reset-controller@e6160000 {
+			compatible = "renesas,rcar-gen3-rst", "renesas,r8a7795-rst";
+			reg = <0 0xe6160000 0 0x200>;
+		};
+
  		sysc: system-controller@e6180000 {
  			compatible = "renesas,r8a7795-sysc";
  			reg = <0 0xe6180000 0 0x0400>;
diff --git a/arch/arm64/boot/dts/renesas/r8a7796.dtsi 
b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
index 1389528..7c65f8a 100644
--- a/arch/arm64/boot/dts/renesas/r8a7796.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
@@ -109,6 +109,11 @@
  			#power-domain-cells = <0>;
  		};

+		reset-controller@e6160000 {
+			compatible = "renesas,rcar-gen3-rst", "renesas,r8a7796-rst";
+			reg = <0 0xe6160000 0 0x200>;
+		};
+
  		sysc: system-controller@e6180000 {
  			compatible = "renesas,r8a7796-sysc";
  			reg = <0 0xe6180000 0 0x0400>;
