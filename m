Return-Path: <SRS0=zxXW=RW=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FC5EC43381
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 19 Mar 2019 13:41:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DCF442133D
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 19 Mar 2019 13:41:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LS9DIT2m"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726911AbfCSNlt (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 19 Mar 2019 09:41:49 -0400
Received: from mail-pg1-f170.google.com ([209.85.215.170]:46147 "EHLO
        mail-pg1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726703AbfCSNlt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 19 Mar 2019 09:41:49 -0400
Received: by mail-pg1-f170.google.com with SMTP id a22so13846681pgg.13
        for <linux-renesas-soc@vger.kernel.org>; Tue, 19 Mar 2019 06:41:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:date:message-id:subject;
        bh=9biUCdBhTE10+Q2mgVEw6IsfEYLzumIGDFR5EOKW5nQ=;
        b=LS9DIT2m7fUP0uZCggSwYbFf2/gNBEFpyTge1+P9I8ri1eRbxDxH0bIOaU/4ohHmsy
         HwHAEAoYSzI8A6rcrQm6a5c/uaRGsD3iaQnFe15fVBUSICZ0mCsQafFd8jKmDBkLpIq6
         m7j7UROqNa1bbVDrlht189mkpsi2a2WrD5OlqZscfitwimqBHsrkRrxalkQ3bx50h9f/
         t/QtL90qtp5iQwkWNhtBO7vhTkXzV0NwuAjqP8KmB/zVKhwNn3VynBkuRNDT6d+IBzwa
         MHdZDYhWKg4YNZ92zp0TG7Xv3gLccwzbDWf4Z3wzxU7qL2HvofCwithAfuT5Mzlfdhpr
         Cvsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:date:message-id:subject;
        bh=9biUCdBhTE10+Q2mgVEw6IsfEYLzumIGDFR5EOKW5nQ=;
        b=lsnpkIZXCuHcEkevUms9vpOmsSO+WseDvwNXCFOKJDYfAtJ6tPZQ/MG6s7rVRH0LbE
         FDHVBiSfRYYQEOkZuQhK63IEfUaYjARs9VnBRp/cEFGeV8LowKWUxGLRVMAhLFZWvVjl
         nDXUvAXOw7o4IakJNQLRVGbSupj7awHr0LcbtZtS6WB1g/XzXwKnvj7ihBsTI5+fIVMJ
         EpcotIj4s9zikaBvkzs/zIgw/F8jj+8rXU/HqAcA3FXIkujBeB6ykFmb/VBUXH/UOY6T
         FHs9H30p5nk8W2bJOMpuhAsObwxkFHmLkozQq+dBXaLdML7FhPWWrLbMXDjruiTrp2zI
         oyYQ==
X-Gm-Message-State: APjAAAXwffM1gYMn21sAI9Gt0Ztiq+Pb0fO59Xrgaa3EBBQusd3ZT5KN
        Z9wX480Wn3kIkyCM2GrANXvTVUdRVPg=
X-Google-Smtp-Source: APXvYqwsAGfH78XkXXdg1VIao1Lx3780i6yvKUR5490nYbpYhZmN675/21uNlHzPLnStzXbyWMHhtQ==
X-Received: by 2002:a62:5789:: with SMTP id i9mr24246593pfj.75.1553002908241;
        Tue, 19 Mar 2019 06:41:48 -0700 (PDT)
Received: from [127.0.0.1] (s214090.ppp.asahi-net.or.jp. [220.157.214.90])
        by smtp.gmail.com with ESMTPSA id u11sm16253387pfh.23.2019.03.19.06.41.45
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 19 Mar 2019 06:41:46 -0700 (PDT)
From:   Magnus Damm <magnus.damm@gmail.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Magnus Damm <magnus.damm@gmail.com>
Date:   Tue, 19 Mar 2019 22:42:48 +0900
Message-Id: <155300296860.12646.3763135168702689012.sendpatchset@octo>
Subject: [PATCH] arm64: dts: renesas: Update Ebisu and Draak bootargs
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Magnus Damm <damm+renesas@opensource.se>

Update Ebisu and Draak bootargs to match other boards

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 Developed on top of 5.1-rc1

 arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts |    2 +-
 arch/arm64/boot/dts/renesas/r8a77995-draak.dts |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

--- 0001/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
+++ work/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts	2019-03-19 22:36:32.777708972 +0900
@@ -19,7 +19,7 @@
 	};
 
 	chosen {
-		bootargs = "ignore_loglevel";
+		bootargs = "ignore_loglevel rw root=/dev/nfs ip=dhcp";
 		stdout-path = "serial0:115200n8";
 	};
 
--- 0001/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
+++ work/arch/arm64/boot/dts/renesas/r8a77995-draak.dts	2019-03-19 22:36:40.570117509 +0900
@@ -20,7 +20,7 @@
 	};
 
 	chosen {
-		bootargs = "ignore_loglevel";
+		bootargs = "ignore_loglevel rw root=/dev/nfs ip=dhcp";
 		stdout-path = "serial0:115200n8";
 	};
 
