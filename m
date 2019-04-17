Return-Path: <SRS0=NjMp=ST=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7047BC282DA
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 17 Apr 2019 15:10:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3E109205F4
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 17 Apr 2019 15:10:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UWvYsmrT"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732608AbfDQPK4 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 17 Apr 2019 11:10:56 -0400
Received: from mail-pg1-f174.google.com ([209.85.215.174]:42244 "EHLO
        mail-pg1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729395AbfDQPK4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 17 Apr 2019 11:10:56 -0400
Received: by mail-pg1-f174.google.com with SMTP id p6so12137892pgh.9
        for <linux-renesas-soc@vger.kernel.org>; Wed, 17 Apr 2019 08:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:date:message-id:in-reply-to:references:subject;
        bh=9sl+Z8gcwYyFWacKmVj7wRHxBbRpXJh9pDDzMlFHxTM=;
        b=UWvYsmrTg4zryBFX0ax5NSQHAMV6AbJy6oECkqx2M+O0JGpMAISN1Dbj5X6gKQKB1H
         MPW3v4UqXzn07YUvRvzDM47nX476HwYFufclMJJg8+5wzd/oiXfB8TX3nnh1BshrrPvC
         SMndpUNdvSYpiZCigehC6jLmUAN9tJq3c2LZCaj6Ob5lO9fq5rfCS88e3kU0D2tBK/9I
         7/40Ea00Jna9cE8BM+Y8UONZrkd3KDEFuD2kobj0adcwJEmuw0jB1HxC6zTmK5eBN9D+
         S3lXtBG+BDCt3+Pm7+n0dps+v/LooPLmtHzEfdFWI82RdCz6RMouTnlWSsginJsaeD2W
         Bbnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:date:message-id:in-reply-to
         :references:subject;
        bh=9sl+Z8gcwYyFWacKmVj7wRHxBbRpXJh9pDDzMlFHxTM=;
        b=A8yRGLUMVzIKuBnWQbfu6IJT7Og3SF2luNAVzUif2slY08JJ8bD+ce1BnnNdX/ytEc
         U1YdayVSer9T7c0x06mLuJmvd+fPjhPgud3NLswCEl9tIWb3ixWy3h4jZM9HcEkLFGRf
         IYvCCJGYhqBMx/F941kjkstcaj8JnRbOlI4z/0RZnSRxMB+XjHwmBtgRB0Qd0WmlBagQ
         lMn9YJVfex6l/hp4Vsl2dpsNSXlPvHZIRsDYAs6Z/U5ikLZqBv99KGuop6fIKQMXY4/m
         MnLlNlEIOIegdiIsl97XHaHiJN4vQwlt/HzihPYnmpvLZ/Z44tA0TnGsxJebrJzUMeoH
         prHg==
X-Gm-Message-State: APjAAAWWNip7K4I1hGPacAjJjf1PayOz7RG33Xyz5GVPv7UZQ4mGb2uI
        0+dXXc3vUGopCwNWwDUPdYqRIFTA
X-Google-Smtp-Source: APXvYqzCAByn9TKh0rp3jUE89QJBBijhqsqbNECEWwoF5dyqwADXeZkt6dHmVEyvvS09/lTsUyaZbA==
X-Received: by 2002:a63:5846:: with SMTP id i6mr258727pgm.423.1555513855442;
        Wed, 17 Apr 2019 08:10:55 -0700 (PDT)
Received: from [127.0.0.1] (s214090.ppp.asahi-net.or.jp. [220.157.214.90])
        by smtp.gmail.com with ESMTPSA id r145sm137704144pgr.84.2019.04.17.08.10.53
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 17 Apr 2019 08:10:54 -0700 (PDT)
From:   Magnus Damm <magnus.damm@gmail.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Magnus Damm <magnus.damm@gmail.com>
Date:   Thu, 18 Apr 2019 00:12:04 +0900
Message-Id: <155551392428.5261.39915980402170490.sendpatchset@octo>
In-Reply-To: <155551391518.5261.925425188248761120.sendpatchset@octo>
References: <155551391518.5261.925425188248761120.sendpatchset@octo>
Subject: [PATCH 1/4] arm: dts: kzm9d: Add rw parameter to bootargs
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Magnus Damm <damm+renesas@opensource.se>

Add rw as bootargs parameter to make the KZM9D board bootargs match other
boards from Renesas. No need to be special.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 arch/arm/boot/dts/emev2-kzm9d.dts |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- 0001/arch/arm/boot/dts/emev2-kzm9d.dts
+++ work/arch/arm/boot/dts/emev2-kzm9d.dts	2019-04-17 23:34:18.007958317 +0900
@@ -25,7 +25,7 @@
 	};
 
 	chosen {
-		bootargs = "ignore_loglevel root=/dev/nfs ip=dhcp";
+		bootargs = "ignore_loglevel rw root=/dev/nfs ip=dhcp";
 		stdout-path = "serial1:115200n8";
 	};
 
