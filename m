Return-Path: <SRS0=sDbg=P5=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CC53C7112F
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 21 Jan 2019 12:16:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id F377A20879
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 21 Jan 2019 12:16:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UDEcFWYy"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728281AbfAUMQl (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 21 Jan 2019 07:16:41 -0500
Received: from mail-pl1-f179.google.com ([209.85.214.179]:43969 "EHLO
        mail-pl1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728273AbfAUMQl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Jan 2019 07:16:41 -0500
Received: by mail-pl1-f179.google.com with SMTP id gn14so9761361plb.10
        for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Jan 2019 04:16:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:date:message-id:in-reply-to:references:subject;
        bh=eukN8Mk2ufFTHkODs7L/p9FzDKoUgGio3EqYQhOKQh4=;
        b=UDEcFWYyh9+Jrkupdh26339euvEOkaZGcdMwwaI6cIq/qYgTrtCUdipEQHrTPlueJn
         M5bbcFhogix29/3vMXCnwMOIevZ2a/7ZQZkOQ4xVA9yvnx+8qW2bQDj2Ujtua+YpvSx7
         bxMu/edVfx6R7Ex51+9YbEZME4qC16JF/rltAlfyYiMGuqKvWQWvutp2uSrwVndLVMdB
         K1y5Nmj/gWWKIiFm0NDpBDt71i7C0gOXnT3aHrX7BJoJgXWnYEUjuc58PGGfTPFj7BiC
         hkZexFXp7mo9f9DFHcKzbWKDOrs8njPfd4L4DNVY0XPzUHK8Zv4Gxrh042JyNgmIhU29
         o+Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:date:message-id:in-reply-to
         :references:subject;
        bh=eukN8Mk2ufFTHkODs7L/p9FzDKoUgGio3EqYQhOKQh4=;
        b=Q0/pB0wXgmOdDu8H9cwoK+HI3ARsaWIdnDJgt4uO8605twlWQHUqT2mhjLNqR/a46G
         I0yB+soauvadwwtKXRTPPrdnQC8ALUCPYKoLW0SmuswadOKEvIzw5Uqpj+q0+3jgUXMe
         0v9NFMBDmwIP4opKScQed2vjisFEh5wr/oGAp7IkLdbEGfOjKhjufRlUPja+6m/K6d8w
         /YQea6vvfntqmwrCTktK8H/DWMcMSBQdBZRhMNJk1jRvnr8n/3BCPxhfPCzVmsuDSyZb
         KzUjikdaUSLhPWaXs1acZ+DyvLlpJGYILgYXr4uv3OlrOs20EN8TbI3NO9jCw95Afdfb
         9FpQ==
X-Gm-Message-State: AJcUukc2ByREeXGV/ZQW4av6cI1c3sIE8uu3bOvyk7aYRXfgamklUsb8
        ywuP1CU9xU+i+nhyHaIH547dUMor
X-Google-Smtp-Source: ALg8bN6zYhtZfqMS0DO7j9epoEiO6ExjzK5IG1Z149bmMUhBhGTRoIYHHzdaMVaXXBwUKBhfiDXaNA==
X-Received: by 2002:a17:902:be11:: with SMTP id r17mr8103775pls.308.1548073000849;
        Mon, 21 Jan 2019 04:16:40 -0800 (PST)
Received: from [127.0.0.1] (30.net042126252.t-com.ne.jp. [42.126.252.30])
        by smtp.gmail.com with ESMTPSA id c13sm23377391pfe.93.2019.01.21.04.16.38
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 21 Jan 2019 04:16:39 -0800 (PST)
From:   Magnus Damm <magnus.damm@gmail.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Magnus Damm <magnus.damm@gmail.com>
Date:   Mon, 21 Jan 2019 21:17:20 +0900
Message-Id: <154807304072.2406.16351833254213213580.sendpatchset@octo>
In-Reply-To: <154807300302.2406.14245640502137089757.sendpatchset@octo>
References: <154807300302.2406.14245640502137089757.sendpatchset@octo>
Subject: [PATCH/RFC 04/06] arm64: dts: renesas: r8a77965: One IMP-X5 device for R-Car M3-N
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Magnus Damm <damm+renesas@opensource.se>

Add an IMP-X5 device node to the r8a77965 device tree source.

Not for upstream merge.

Not-Yet-Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 arch/arm64/boot/dts/renesas/r8a77965.dtsi |    9 +++++++++
 1 file changed, 9 insertions(+)

--- 0001/arch/arm64/boot/dts/renesas/r8a77965.dtsi
+++ work/arch/arm64/boot/dts/renesas/r8a77965.dtsi	2019-01-21 19:42:00.129311931 +0900
@@ -2225,6 +2225,15 @@
 			};
 		};
 
+		imp-x5@ff900000 {
+			compatible = "renesas,imp-x5";
+			reg = <0 0xff900000 0 0x300000>;
+			interrupts = <GIC_SPI 439 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 824>;
+			power-domains = <&sysc R8A77965_PD_A3IR>;
+			resets = <&cpg 824>;
+		};
+
 		prr: chipid@fff00044 {
 			compatible = "renesas,prr";
 			reg = <0 0xfff00044 0 4>;
