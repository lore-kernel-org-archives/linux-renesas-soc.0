Return-Path: <SRS0=Lk/a=PU=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3358FC43387
	for <linux-renesas-soc@archiver.kernel.org>; Sat, 12 Jan 2019 17:44:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 08C632084C
	for <linux-renesas-soc@archiver.kernel.org>; Sat, 12 Jan 2019 17:44:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="cQ7lznGG"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726094AbfALRog (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sat, 12 Jan 2019 12:44:36 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:43328 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725842AbfALRog (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 12 Jan 2019 12:44:36 -0500
Received: by mail-lj1-f194.google.com with SMTP id q2-v6so15585244lji.10
        for <linux-renesas-soc@vger.kernel.org>; Sat, 12 Jan 2019 09:44:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:from:to:cc:references:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=/syadFbIFTvOVR+PEXjC212Z5c9g+/GsRx+8N/vJtk4=;
        b=cQ7lznGG336yM9W84LuNzumCP8toVtRJXRe6BcJwG1nkD0rXIemBrxGrmG2CPPUxAB
         ZANk/QlkshJd8GcXFzdHSnAMNnBpGYjDxEceCK4T2tdqPfKSrS4rJRUqqOq4ORQeBK4F
         xA38s+yVNpWlrS5VS9CILp22WRWCXhyeP8cW+TPiNfR7f0z8LmLI8p3nCp28TjG56yrL
         LV4J9exMtrhHqK2nyxXJLYuiWUwAQHjZo5Y2FimKFTpaGFXzy70rLilUxFFT1opL4VYC
         1H9hhqzs3wdyURiqAGvl36/4+STMAFBRnk8AzEcigLwLqmUzqTS1J1wu2iCZFTCRIBo9
         QkrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=/syadFbIFTvOVR+PEXjC212Z5c9g+/GsRx+8N/vJtk4=;
        b=kY1EoanQVZK6gmErI332fLEggORUH061YpXP6+t/O0HGoIvLIpE819f5/DDsyC8q7d
         2LywIEl1QtrxKXp4z8gSfG5HU7Zszrp+Z7bw9LYs324zRpexHmGfegsskHQ54IFTtZAW
         lx2Qt4U815aciYlBomv9P0oVRlZ156+3I+3NJx57OyWCF/hTIIwF1GzBqpLJvd1PnaBn
         UV2X7lSLnNXxgm1ngMubTYuoSw+ZSin1BzJIn+gtpMyz7eB3uXRNMj1h+jcq0+SysZ+f
         knqZ4+PelpKta3VTvEEqah+m9Dw1DjMPbvQZ5umqiv7JEDWt97cg0nW4sfRrywF2oX4a
         arGA==
X-Gm-Message-State: AJcUukeXbHcDfdQ6fGLwEhK/upkvA+VU1ATP+fW0LUseent2DAdR3PmZ
        a/xcDv8JdvihWjvKON2ahgrzwA==
X-Google-Smtp-Source: ALg8bN4wuAgiBSZ3zaqZOUO+sj13kIW6sYR+yHIDooX+8SoRL35AGAJYSBy1vKDggT+faQdzPoQd8w==
X-Received: by 2002:a2e:8187:: with SMTP id e7-v6mr12283284ljg.67.1547315073630;
        Sat, 12 Jan 2019 09:44:33 -0800 (PST)
Received: from wasted.cogentembedded.com ([31.173.81.102])
        by smtp.gmail.com with ESMTPSA id l21-v6sm16322509lji.6.2019.01.12.09.44.32
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 12 Jan 2019 09:44:33 -0800 (PST)
Subject: [PATCH RFC 2/3] arm64: dts: renesas: r8a77970: eagle/v3msk: add QSPI
 flash support
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To:     Simon Horman <horms@verge.net.au>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>
References: <4b74a2a5-6b3b-9b06-6a8f-fce39124ec59@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <1e3c7821-1f48-e27b-e3d5-a376b219e590@cogentembedded.com>
Date:   Sat, 12 Jan 2019 20:44:32 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <4b74a2a5-6b3b-9b06-6a8f-fce39124ec59@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Define the Eagle/V3MSK board dependent parts of the RPC-IF device node.
Add device nodes for Spansion S25FS512S SPI flash and MTD partitions on it.

Based on the original patches by Dmitry Shifrin.

Signed-off-by: Dmitry Shifrin <dmitry.shifrin@cogentembedded.com>
Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 arch/arm64/boot/dts/renesas/r8a77970-eagle.dts |   68 +++++++++++++++++++++++++
 arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts |   68 +++++++++++++++++++++++++
 2 files changed, 136 insertions(+)

Index: renesas/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
===================================================================
--- renesas.orig/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
+++ renesas/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
@@ -173,12 +173,80 @@
 		function = "i2c0";
 	};
 
+	qspi0_pins: qspi0 {
+		groups = "qspi0_ctrl", "qspi0_data4";
+		function = "qspi0";
+	};
+
 	scif0_pins: scif0 {
 		groups = "scif0_data";
 		function = "scif0";
 	};
 };
 
+&rpc {
+	pinctrl-0 = <&qspi0_pins>;
+	pinctrl-names = "default";
+
+	renesas,rpc-mode = "spi";
+	status = "okay";
+
+	flash@0 {
+		compatible = "spansion,s25fs512s", "jedec,spi-nor";
+		reg = <0>;
+		spi-max-frequency = <50000000>;
+		spi-rx-bus-width = <4>;
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			bootparam@0 {
+				reg = <0x00000000 0x040000>;
+				read-only;
+			};
+			cr7@40000 {
+				reg = <0x00040000 0x080000>;
+				read-only;
+			};
+			cert_header_sa3@c0000 {
+				reg = <0x000c0000 0x080000>;
+				read-only;
+			};
+			bl2@140000 {
+				reg = <0x00140000 0x040000>;
+				read-only;
+			};
+			cert_header_sa6@180000 {
+				reg = <0x00180000 0x040000>;
+				read-only;
+			};
+			bl31@1c0000 {
+				reg = <0x001c0000 0x460000>;
+				read-only;
+			};
+			uboot@640000 {
+				reg = <0x00640000 0x0c0000>;
+				read-only;
+			};
+			uboot-env@700000 {
+				reg = <0x00700000 0x040000>;
+				read-only;
+			};
+			dtb@740000 {
+				reg = <0x00740000 0x080000>;
+			};
+			kernel@7c0000 {
+				reg = <0x007c0000 0x1400000>;
+			};
+			user@1bc0000 {
+				reg = <0x01bc0000 0x2440000>;
+			};
+		};
+	};
+};
+
 &rwdt {
 	timeout-sec = <60>;
 	status = "okay";
Index: renesas/arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts
===================================================================
--- renesas.orig/arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts
+++ renesas/arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts
@@ -145,6 +145,11 @@
 		power-source = <3300>;
 	};
 
+	qspi0_pins: qspi0 {
+		groups = "qspi0_ctrl", "qspi0_data4";
+		function = "qspi0";
+	};
+
 	scif0_pins: scif0 {
 		groups = "scif0_data";
 		function = "scif0";
@@ -220,6 +225,69 @@
 	status = "okay";
 };
 
+&rpc {
+	pinctrl-0 = <&qspi0_pins>;
+	pinctrl-names = "default";
+
+	renesas,rpc-mode = "spi";
+	status = "okay";
+
+	flash@0 {
+		compatible = "spansion,s25fs512s", "jedec,spi-nor";
+		reg = <0>;
+		spi-max-frequency = <50000000>;
+		spi-rx-bus-width = <4>;
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			bootparam@0 {
+				reg = <0x00000000 0x040000>;
+				read-only;
+			};
+			cr7@40000 {
+				reg = <0x00040000 0x080000>;
+				read-only;
+			};
+			cert_header_sa3@c0000 {
+				reg = <0x000c0000 0x080000>;
+				read-only;
+			};
+			bl2@140000 {
+				reg = <0x00140000 0x040000>;
+				read-only;
+			};
+			cert_header_sa6@180000 {
+				reg = <0x00180000 0x040000>;
+				read-only;
+			};
+			bl31@1c0000 {
+				reg = <0x001c0000 0x460000>;
+				read-only;
+			};
+			uboot@640000 {
+				reg = <0x00640000 0x0c0000>;
+				read-only;
+			};
+			uboot-env@700000 {
+				reg = <0x00700000 0x040000>;
+				read-only;
+			};
+			dtb@740000 {
+				reg = <0x00740000 0x080000>;
+			};
+			kernel@7c0000 {
+				reg = <0x007c0000 0x1400000>;
+			};
+			user@1bc0000 {
+				reg = <0x01bc0000 0x2440000>;
+			};
+		};
+	};
+};
+
 &scif0 {
 	pinctrl-0 = <&scif0_pins>;
 	pinctrl-names = "default";
