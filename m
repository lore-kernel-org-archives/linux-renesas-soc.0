Return-Path: <SRS0=Lk/a=PU=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9B79C43387
	for <linux-renesas-soc@archiver.kernel.org>; Sat, 12 Jan 2019 17:45:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8475B2086C
	for <linux-renesas-soc@archiver.kernel.org>; Sat, 12 Jan 2019 17:45:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="nOjb5DYp"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725890AbfALRpx (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sat, 12 Jan 2019 12:45:53 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:33410 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725851AbfALRpx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 12 Jan 2019 12:45:53 -0500
Received: by mail-lj1-f195.google.com with SMTP id v1-v6so15623087ljd.0
        for <linux-renesas-soc@vger.kernel.org>; Sat, 12 Jan 2019 09:45:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:from:to:cc:references:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=mqykqiivvAmS2DNI4B8MR2iGblNpPYlegdF0qxNZ6vM=;
        b=nOjb5DYphUAPUtVz90Cpy+AjvvPgbo4Bd30a+1V9uy51CNrRuWtlk0YpbQSicKp6VL
         rM3MLKB1QR0l4NOqOZqymdQ3gaRAZBic04o1phk7ZAKEitucHAiTflqvEkDK64iB6aU0
         dZw/EnFz9NFGZNDLPT753rfK2G91gUhIsWfMX7aQDFgYccfWVzWWyIAmlPxWKjVQCgHd
         yspcP4qhnas4Ed4qLJowaIIozHsEdZuAvDtvoLBppN+/uzT++r3iJCcckm9sFttQ70pT
         9aMO3r6e8gg1TUu+54VS6fGOl7X9jfTut/7mSPwFBuzkXtpoama26ViVH0kgKJWJ76rJ
         WoAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=mqykqiivvAmS2DNI4B8MR2iGblNpPYlegdF0qxNZ6vM=;
        b=IGHoTp/lCtiqhSJ8wrVLx1Pd9tIg2sZQnzJhq+UXGa9+X1uNLvtjGydNzjYAtWL+YJ
         0PUmoECtsiHH5it4z+k0OvPhyJ5aV9BFkf927Q65A0A2SR7dm8rOwkJrHmcAp8+47Yca
         DeQ7XzMj3HK6X2Fqk0jupf9+a90OG3ffvMi8L46oAaKnPckvzZUjHfRbLOMpvQCclA2k
         s0cIS4Qm+9LBME70deh9IwbV6egCKUicbEeKZZgYPjvYKuUZcxpX7uqjo6xwTj6kTf47
         4MiUNRY/QoZf6+HqWt3nhYZ2zI220bkXDercyMKSRAwjTUnb5y/uQxCHontev3V6rvH2
         VPgQ==
X-Gm-Message-State: AJcUukcpHeKZpfXBOYpH3kZwnEz4Y7/CG96rfCog5+XtuiUGnVhiUv58
        58EMPCDwf3FSo17M6p0v5aVW9g==
X-Google-Smtp-Source: ALg8bN5f8z9GF7ITbO+TdKpT+nFbN3ZRvbr6v5K0AvfkxQ94WJ6Z8TPixN1K36b2pxP1Jd61elTkYw==
X-Received: by 2002:a2e:5418:: with SMTP id i24-v6mr11967913ljb.51.1547315150011;
        Sat, 12 Jan 2019 09:45:50 -0800 (PST)
Received: from wasted.cogentembedded.com ([31.173.81.102])
        by smtp.gmail.com with ESMTPSA id q21-v6sm16293245ljc.5.2019.01.12.09.45.48
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 12 Jan 2019 09:45:49 -0800 (PST)
Subject: [PATCH RFC 3/3] arm64: dts: renesas: r8a77980: condor/v3hsk: add QSPI
 flash support
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To:     Simon Horman <horms@verge.net.au>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>
References: <4b74a2a5-6b3b-9b06-6a8f-fce39124ec59@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <b84e12ee-eb3a-8fdd-a702-b275b609a8e6@cogentembedded.com>
Date:   Sat, 12 Jan 2019 20:45:48 +0300
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

Define the Condor/V3HSK board dependent parts of the RPC-IF device node.
Add device nodes for Spansion S25FS512S SPI flash and MTD partitions on it.

Based on the original patches by Dmitry Shifrin.

Signed-off-by: Dmitry Shifrin <dmitry.shifrin@cogentembedded.com>
Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 arch/arm64/boot/dts/renesas/r8a77980-condor.dts |   68 ++++++++++++++++++++++++
 arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dts  |   68 ++++++++++++++++++++++++
 2 files changed, 136 insertions(+)

Index: renesas/arch/arm64/boot/dts/renesas/r8a77980-condor.dts
===================================================================
--- renesas.orig/arch/arm64/boot/dts/renesas/r8a77980-condor.dts
+++ renesas/arch/arm64/boot/dts/renesas/r8a77980-condor.dts
@@ -264,6 +264,11 @@
 		power-source = <1800>;
 	};
 
+	qspi0_pins: qspi0 {
+		groups = "qspi0_ctrl", "qspi0_data4";
+		function = "qspi0";
+	};
+
 	scif0_pins: scif0 {
 		groups = "scif0_data";
 		function = "scif0";
@@ -275,6 +280,69 @@
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
Index: renesas/arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dts
===================================================================
--- renesas.orig/arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dts
+++ renesas/arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dts
@@ -189,6 +189,11 @@
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
@@ -200,6 +205,69 @@
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
+			cr7@00040000 {
+				reg = <0x00040000 0x080000>;
+				read-only;
+			};
+			cert_header_sa3@000C0000 {
+				reg = <0x000C0000 0x080000>;
+				read-only;
+			};
+			bl2@00140000 {
+				reg = <0x00140000 0x040000>;
+				read-only;
+			};
+			cert_header_sa6@00180000 {
+				reg = <0x00180000 0x040000>;
+				read-only;
+			};
+			bl31@001C0000 {
+				reg = <0x001C0000 0x460000>;
+				read-only;
+			};
+			uboot@00640000 {
+				reg = <0x00640000 0x0C0000>;
+				read-only;
+			};
+			uboot-env@00700000 {
+				reg = <0x00700000 0x040000>;
+				read-only;
+			};
+			dtb@00740000 {
+				reg = <0x00740000 0x080000>;
+			};
+			kernel@007C0000 {
+				reg = <0x007C0000 0x1400000>;
+			};
+			user@01BC0000 {
+				reg = <0x01BC0000 0x2440000>;
+			};
+		};
+	};
+};
+
 &rwdt {
 	timeout-sec = <60>;
 	status = "okay";
