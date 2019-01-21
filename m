Return-Path: <SRS0=sDbg=P5=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 044ACC7113B
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 21 Jan 2019 12:17:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CB46A20879
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 21 Jan 2019 12:17:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UroQJZ9n"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728216AbfAUMRB (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 21 Jan 2019 07:17:01 -0500
Received: from mail-pg1-f177.google.com ([209.85.215.177]:41603 "EHLO
        mail-pg1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727971AbfAUMRB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Jan 2019 07:17:01 -0500
Received: by mail-pg1-f177.google.com with SMTP id m1so9417030pgq.8
        for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Jan 2019 04:17:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:date:message-id:in-reply-to:references:subject;
        bh=rC6+4NkG9tZh0jm2omlZLzLYx1PZuCangcVLIlahvCk=;
        b=UroQJZ9nYAfzUJpHnnQG0WlDnWWmFYpy9pUsBw8clY0Ofejc//5J50BB88qaxDuLDu
         S9mhEL+8ENjU5eJhKuV+ngA6ZUhz7SRHOYYrShSTMFleiozhzckHup2BUjtCvVfQWIg8
         rvN1/uU+DouJSWePfwnQC6j/KdcY30Q0p4YpBm66aO/yFIfY19IGbRlNhH6dvYoRD6yr
         5b6SzJ2PRlF3PJAp/BoAygYtA/Y/VWTprMaVGRWOzYCcepgwW8S4i8tBMLAjRaILL/Ok
         aqWv9cNIouA9vXF2IqwFdhucNJdzGr4fcqecySXyHKH2vAssum+VPsqfYFzoqPz9VNTc
         Blkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:date:message-id:in-reply-to
         :references:subject;
        bh=rC6+4NkG9tZh0jm2omlZLzLYx1PZuCangcVLIlahvCk=;
        b=mfJSSPT8o+Tue0ORwBayijXVfOeKmzVOPyIJFg2VxSafFGEPnQTDNExMkHTwAkn3DP
         5FVxofsi80vEb0alFLWk0pYJ7pgzg30Cqin0DVTv0yPjl060jj0K2hk5+zMJUAQ1Jhdh
         F+gW5W3hBzoxv1ZQVT1IWTHWcPoxwClrTy+chpxZr3BsyVlhC94FQ1lR8TusjuLCdbbd
         ZQ0IueMeVn+p+Z37XKhYmy4L/qwzsHTOMwZ8g49OFMKJSmALIp6QEr7AVQv7Bgjgpj9a
         zVIISyMwCaruDRzWOq5hHHIbM7P3i3QVRSLT5KMDAjVrAO2k6C2hRgxmL+CAOY4Chvrf
         wlxQ==
X-Gm-Message-State: AJcUukcK+NFr/+H1pFz76qin4HFoZHuReMbAckzzAsN6v4pQh9PL36m2
        bwFj7Kf1JD0J65q4O9K1jHRvvrHw
X-Google-Smtp-Source: ALg8bN45xqdM9Ej1yhg6B/stFf+nKiEdiaFuD37oaO5cg5BXRQNLX51wI151o6blCtD9YyESIu0vXg==
X-Received: by 2002:a62:4181:: with SMTP id g1mr29544562pfd.45.1548073020416;
        Mon, 21 Jan 2019 04:17:00 -0800 (PST)
Received: from [127.0.0.1] (30.net042126252.t-com.ne.jp. [42.126.252.30])
        by smtp.gmail.com with ESMTPSA id h128sm28256881pgc.15.2019.01.21.04.16.58
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 21 Jan 2019 04:16:59 -0800 (PST)
From:   Magnus Damm <magnus.damm@gmail.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Magnus Damm <magnus.damm@gmail.com>
Date:   Mon, 21 Jan 2019 21:17:39 +0900
Message-Id: <154807305950.2406.15821287651991499411.sendpatchset@octo>
In-Reply-To: <154807300302.2406.14245640502137089757.sendpatchset@octo>
References: <154807300302.2406.14245640502137089757.sendpatchset@octo>
Subject: [PATCH/RFC 06/06] arm64: dts: renesas: r8a77980: One IMP-X5 device for R-Car V3H
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Magnus Damm <damm+renesas@opensource.se>

Add an IMP-X5 device node to the r8a77980 device tree source.

Not for upstream merge.

Not-Yet-Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 arch/arm64/boot/dts/renesas/r8a77980.dtsi |    9 +++++++++
 1 file changed, 9 insertions(+)

--- 0001/arch/arm64/boot/dts/renesas/r8a77980.dtsi
+++ work/arch/arm64/boot/dts/renesas/r8a77980.dtsi	2019-01-21 19:48:14.223925104 +0900
@@ -1529,6 +1529,15 @@
 			};
 		};
 
+		imp-x5@ff900000 {
+			compatible = "renesas,imp-x5";
+			reg = <0 0xff900000 0 0x300000>;
+			interrupts = <GIC_SPI 281 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 827>;
+			power-domains = <&sysc R8A77980_PD_A3IR>;
+			resets = <&cpg 827>;
+		};
+		
 		prr: chipid@fff00044 {
 			compatible = "renesas,prr";
 			reg = <0 0xfff00044 0 4>;
