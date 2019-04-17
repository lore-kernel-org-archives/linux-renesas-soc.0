Return-Path: <SRS0=NjMp=ST=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E044C282DA
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 17 Apr 2019 15:11:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E8DB3205F4
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 17 Apr 2019 15:11:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KsqBHD9P"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731472AbfDQPLF (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 17 Apr 2019 11:11:05 -0400
Received: from mail-pg1-f173.google.com ([209.85.215.173]:34367 "EHLO
        mail-pg1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729395AbfDQPLF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 17 Apr 2019 11:11:05 -0400
Received: by mail-pg1-f173.google.com with SMTP id v12so12162289pgq.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 17 Apr 2019 08:11:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:date:message-id:in-reply-to:references:subject;
        bh=JUQ+sAQK/YTwVCtROz0dfEynSTQTe51MwEWN2Q4Xn/g=;
        b=KsqBHD9PrABMtIL8EBSUZpfEgA7jeLgWMOvNSM/vfaI6q8dCL4ErGKbBKEjrSUvQ/0
         KRIzq6NZ8S05/or+aGLz3J311Of4QbOHo5dV2zuIJtShziyFFOyY/jD07X0wfLDB5IsC
         P5jkMNoANZ4G4NlhyE3IRabtbkaHWSWW4o/CYnLavoZmz+iVuDxKBsfNwwOVBQDpASs/
         Oz9rdL1JD9gBdcE+2aUSob3BSW2ufJISth54X6KZEXcManeImJzt13zUgs6b5YgdYsx2
         NZNEY8kHN8ri7pKTDBWBLfpQI4lSbf/sGL61hgzWI5yE2Iq7jLdDT7iYbH/TJMWQpVBE
         HHIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:date:message-id:in-reply-to
         :references:subject;
        bh=JUQ+sAQK/YTwVCtROz0dfEynSTQTe51MwEWN2Q4Xn/g=;
        b=M6/sUBnPtxTSR7nFR16k6DPN7pQrYEqs5cyq6mD3ziK+KWkMH5zYtvj9G0qwkLdKzG
         VAUsu8zpbSDIr0nKEtnqRA2ys7t/13XGPZecnZhEFUeta570XoJuliTVeJKEWw+Dlsnz
         KrnIvt6KjieYa04UQeYaShTBYk8fnUEje6EiHvKrpDhDJEaQx+7SLcHia2QglAM44qA+
         z+UuQbeHANqqyePG7gtc5wXc/YMTJpRCWnWoIfM2ZL301ZPwhc4Q/tgGwJ8qULqjYH7C
         4r+tLUDi5UH1QiXQFXbI901xuw8x3erxyKtwZSGkRMX3L1ss5JI1dd8NSjZ8c3RMbT6c
         uVfA==
X-Gm-Message-State: APjAAAU/Wd+SRyqXZDfgnYo+iaULbyOVGkU62nAub7VTaBZDf6b5KBbs
        qLlbtDdzgr/z2yYKoxtkWjyrcVBS
X-Google-Smtp-Source: APXvYqz0V7C5iIhcOHQLleERWFpRqQco6f8cbgozy3QkaBlcBmKUBFRuWhNNZBjqXVp3Bvb4ur7RSg==
X-Received: by 2002:a63:1654:: with SMTP id 20mr84277994pgw.166.1555513864353;
        Wed, 17 Apr 2019 08:11:04 -0700 (PDT)
Received: from [127.0.0.1] (s214090.ppp.asahi-net.or.jp. [220.157.214.90])
        by smtp.gmail.com with ESMTPSA id o14sm2274895pgn.4.2019.04.17.08.11.02
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 17 Apr 2019 08:11:03 -0700 (PDT)
From:   Magnus Damm <magnus.damm@gmail.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Magnus Damm <magnus.damm@gmail.com>
Date:   Thu, 18 Apr 2019 00:12:14 +0900
Message-Id: <155551393412.5261.7849795890132809819.sendpatchset@octo>
In-Reply-To: <155551391518.5261.925425188248761120.sendpatchset@octo>
References: <155551391518.5261.925425188248761120.sendpatchset@octo>
Subject: [PATCH 2/4] arm: dts: bockw: Reorder bootargs
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Magnus Damm <damm+renesas@opensource.se>

Reorder bootargs parameters to make the BockW board bootargs match other
boards from Renesas. No need to be special.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 arch/arm/boot/dts/r8a7778-bockw.dts |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- 0001/arch/arm/boot/dts/r8a7778-bockw.dts
+++ work/arch/arm/boot/dts/r8a7778-bockw.dts	2019-04-17 23:37:02.521583497 +0900
@@ -25,7 +25,7 @@
 	};
 
 	chosen {
-		bootargs = "ignore_loglevel ip=dhcp root=/dev/nfs rw";
+		bootargs = "ignore_loglevel rw root=/dev/nfs ip=dhcp";
 		stdout-path = "serial0:115200n8";
 	};
 
