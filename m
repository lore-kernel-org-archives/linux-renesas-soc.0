Return-Path: <SRS0=NjMp=ST=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33363C282DA
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 17 Apr 2019 15:11:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EF744205F4
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 17 Apr 2019 15:11:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pyOhGveA"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732424AbfDQPLO (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 17 Apr 2019 11:11:14 -0400
Received: from mail-pg1-f178.google.com ([209.85.215.178]:45697 "EHLO
        mail-pg1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729395AbfDQPLO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 17 Apr 2019 11:11:14 -0400
Received: by mail-pg1-f178.google.com with SMTP id y3so12130163pgk.12
        for <linux-renesas-soc@vger.kernel.org>; Wed, 17 Apr 2019 08:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:date:message-id:in-reply-to:references:subject;
        bh=62unnTQ2vgHJVv+2o+tGJyBqOoG1biWs7hQD3PD/YGI=;
        b=pyOhGveAwjMRlFMCl5qexwHqKxpu1We9ewMSwPwty6jVVG44lGIeVTZHpkNqQTKEUL
         FbOsyoTzhJNdckWaCxenmtZqFLizh04K+mUO2u+XQfgrBUD1Ez/1TPUqGGxAXgOKaQQx
         CULDb0F2ehOCQeZYcU6r4gyVKmsAKgupGuPAvGNPzNFSk7qseY8SVYIY0WngFR/gR28I
         ssy1asbD1AYdxs3llEHl08ub081iGWwa4C0X7rR/UvEjneqGKc/+9H/tel0TM6Ujj7pz
         2IVpNIFvOfFqOwmJlRyWGkMaJ1BC0LZWQj70hEnBitYN8Yq4fxhj42YODART8dNvk5cV
         yapA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:date:message-id:in-reply-to
         :references:subject;
        bh=62unnTQ2vgHJVv+2o+tGJyBqOoG1biWs7hQD3PD/YGI=;
        b=is/zzSfouphgUP3uNu7v2VWICdmDFA/0LUcD8aH7AVziDu9Tv0Ftqw5WpMp1cLi1DB
         SdX68uN5+vY1bQvArFItqff1YQMb1bzUN6fwqpHGTfhdqehwX28JrekfSrIAQhYyqpq5
         8aUCGAg4AMhQk/jfJMwVp0+s485gctwtmZnfqUZum4uzLOcpo/fSKRBCE1O9RFQcI5qq
         iq7xSbIwIe3+voEW89i/ZFw8x7UDJnW1CqcCUskQjbHo2vhsbTFWjazfzDWxEVc7HF2t
         FteMVz/2sckx6VRIHZqkPn3uuT3fQybs+2WFJ3UGX3KnddoI6/UJNsG3hfSpF3Jd2ars
         Iu3Q==
X-Gm-Message-State: APjAAAVbJSe8M/SjI7hDLHvNjDL2Bdjju/aUvYenABcl0Uh5JoD5hQAl
        9wd5y9ooYGewCo4KDAjdO8BgQNT9
X-Google-Smtp-Source: APXvYqwuuQn54pF09bXTafsTmsLxT81igJCTE7ZD4APblY7c60U8hXOc95SOENEuvXisesrFkQOh0A==
X-Received: by 2002:a62:1193:: with SMTP id 19mr88176343pfr.82.1555513873635;
        Wed, 17 Apr 2019 08:11:13 -0700 (PDT)
Received: from [127.0.0.1] (s214090.ppp.asahi-net.or.jp. [220.157.214.90])
        by smtp.gmail.com with ESMTPSA id i15sm46380041pfr.8.2019.04.17.08.11.11
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 17 Apr 2019 08:11:12 -0700 (PDT)
From:   Magnus Damm <magnus.damm@gmail.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Magnus Damm <magnus.damm@gmail.com>
Date:   Thu, 18 Apr 2019 00:12:23 +0900
Message-Id: <155551394312.5261.817240662421793519.sendpatchset@octo>
In-Reply-To: <155551391518.5261.925425188248761120.sendpatchset@octo>
References: <155551391518.5261.925425188248761120.sendpatchset@octo>
Subject: [PATCH 3/4] arm: dts: marzen: Add rw to bootargs and use ip=dhcp
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Magnus Damm <damm+renesas@opensource.se>

Add rw as bootargs parameter and change from ip=on to ip=dhcp to make the
Marzen board bootargs match other boards from Renesas. No need to be special.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 arch/arm/boot/dts/r8a7779-marzen.dts |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- 0001/arch/arm/boot/dts/r8a7779-marzen.dts
+++ work/arch/arm/boot/dts/r8a7779-marzen.dts	2019-04-17 23:39:25.061056610 +0900
@@ -21,7 +21,7 @@
 	};
 
 	chosen {
-		bootargs = "ignore_loglevel root=/dev/nfs ip=on";
+		bootargs = "ignore_loglevel rw root=/dev/nfs ip=dhcp";
 		stdout-path = "serial0:115200n8";
 	};
 
