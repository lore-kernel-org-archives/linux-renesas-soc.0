Return-Path: <SRS0=sDbg=P5=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB90FC7113B
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 21 Jan 2019 12:16:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BC63A20879
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 21 Jan 2019 12:16:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qp06ckZ4"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728318AbfAUMQX (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 21 Jan 2019 07:16:23 -0500
Received: from mail-pl1-f169.google.com ([209.85.214.169]:40557 "EHLO
        mail-pl1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728216AbfAUMQX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Jan 2019 07:16:23 -0500
Received: by mail-pl1-f169.google.com with SMTP id u18so9768186plq.7
        for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Jan 2019 04:16:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:date:message-id:in-reply-to:references:subject;
        bh=q5w07PKUD+GXLn9Oet5Etfn7VxU5o5CZ0QOKhyqv+rs=;
        b=qp06ckZ4h7oqsSK9MOUHCd6JVIFg+ZCkeNrQp/0E9p3trfcDXK0NkXUFgxqnROvS7y
         oe6PqNDxHqsyaVKS5FxG3oDWZDPbzPuYqhxTauqlShvtBoMIlaNQKI8yJisz534S5e3S
         Pu1Dr4N4kZawJ0KqMXeG06jhpUD243mzsmZ4EjWKsz+eHaNCuenI27fojCd3n5bXSxrx
         1PqueaodfZOI5Onjqiyatft0jnA+6vVjBj+ihyXCvu+Jk7AKA9qCkh7stelUmNQP/v8T
         FCOyhpq96aD15y0CNZ9C0iYIQex33J/4QH1Y71ph/isRBNDFaqS1uo14WhtIQlr3ukHL
         Crug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:date:message-id:in-reply-to
         :references:subject;
        bh=q5w07PKUD+GXLn9Oet5Etfn7VxU5o5CZ0QOKhyqv+rs=;
        b=D6PWeE4KVCfb21IT1DTzTdUV+5m1dAYU4gC/rZM0VCK0l8ZwN5Vv2DAo6Uf/0VMzuo
         N51oV+QHf5UEX4ELlye6KaEJBW6ib6PhxV/NevaLJH9Ri5Fj58B/ZE7HF+mFgOX4PCL9
         at0AcDZEIci9/xwDgB71JWnq9UTNLDM3HSH/J2wQa+0nsxD6WVVSpUcqV/ElQwGWO7VX
         mfA1RCI3YeBK64J1nj4u9hIJ0qbfaLLeyVSx955kQZNv9PYUftF7JxvHfVzeq1KvbhIT
         JoHoDdBqAhrblbHE5gO/qLqxVXqUhZKdjnc8UvTH09K8OaJbu1dbhXgbtl8skcBdrgZ9
         1rPg==
X-Gm-Message-State: AJcUukePpaGDqlc0CWppJOIwgZO0AViNM2BicFDpaser+pGDRU3v8xnq
        AXXk0H/ThOUsJaOccyKulVO90Z7p
X-Google-Smtp-Source: ALg8bN46j/07d9Zc1+qkzSdx89zGP2jeUIQgiFfxcp5JyMPeNYnTelRIiqk5iSGnvzyTpQglDtDd5w==
X-Received: by 2002:a17:902:28c1:: with SMTP id f59mr29993966plb.37.1548072982477;
        Mon, 21 Jan 2019 04:16:22 -0800 (PST)
Received: from [127.0.0.1] (30.net042126252.t-com.ne.jp. [42.126.252.30])
        by smtp.gmail.com with ESMTPSA id q7sm14521311pgp.40.2019.01.21.04.16.20
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 21 Jan 2019 04:16:21 -0800 (PST)
From:   Magnus Damm <magnus.damm@gmail.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Magnus Damm <magnus.damm@gmail.com>
Date:   Mon, 21 Jan 2019 21:17:02 +0900
Message-Id: <154807302232.2406.722617617564299820.sendpatchset@octo>
In-Reply-To: <154807300302.2406.14245640502137089757.sendpatchset@octo>
References: <154807300302.2406.14245640502137089757.sendpatchset@octo>
Subject: [PATCH/RFC 02/06] arm64: dts: renesas: r8a7795: One IMP-X5 device for R-Car H3
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Magnus Damm <damm+renesas@opensource.se>

Add an IMP-X5 device node to the r8a7795 device tree source.

Not for upstream merge.

Not-Yet-Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 arch/arm64/boot/dts/renesas/r8a7795.dtsi |    9 +++++++++
 1 file changed, 9 insertions(+)

--- 0002/arch/arm64/boot/dts/renesas/r8a7795.dtsi
+++ work/arch/arm64/boot/dts/renesas/r8a7795.dtsi	2019-01-21 19:36:29.978002626 +0900
@@ -3047,6 +3047,15 @@
 			};
 		};
 
+		imp-x5@ff900000 {
+			compatible = "renesas,imp-x5";
+			reg = <0 0xff900000 0 0x300000>;
+			interrupts = <GIC_SPI 439 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 824>;
+			power-domains = <&sysc R8A7795_PD_A3IR>;
+			resets = <&cpg 824>;
+		};
+
 		prr: chipid@fff00044 {
 			compatible = "renesas,prr";
 			reg = <0 0xfff00044 0 4>;
