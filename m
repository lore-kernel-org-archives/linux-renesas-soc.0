Return-Path: <SRS0=XP2S=QL=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6199AC282C4
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  4 Feb 2019 18:10:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 337342082E
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  4 Feb 2019 18:10:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="Ns5vrEsy"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728333AbfBDSKj (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 4 Feb 2019 13:10:39 -0500
Received: from mail-lf1-f47.google.com ([209.85.167.47]:46999 "EHLO
        mail-lf1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726585AbfBDSKj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 4 Feb 2019 13:10:39 -0500
Received: by mail-lf1-f47.google.com with SMTP id f5so575344lfc.13
        for <linux-renesas-soc@vger.kernel.org>; Mon, 04 Feb 2019 10:10:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:from:to:cc:references:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=6q4Ogs/xu/BHkdLHpHi3xG9nEcDUkatHU10+VQ6N3JQ=;
        b=Ns5vrEsyfXAQrLHeiooapY5+6QLA6f9DOlWqzIS51gTQQhm4O22ssNr5mOic0XHYL2
         p6gjMrZ00EqPEz8/HfzsV5+5uhIhO493HCi3fYYE4m6Sb9oUUVHDqLBiEcQyaFhdUA4l
         rzEvnm0RTEeg7CkBLbp3tGXwMbMZScYb4hqFwiyQYBQ6YkoCGR/ZhDI3wRhyts5emMY2
         gKxkfKFLGqbn+JN6xJyNzBF0PSjUoErBxaAMt9u60csDnAnHmiO6XMK34JyJtV12sQ3v
         wTjBNmL3Hi9M+udmhAJW3iBquNot6YAWCXpkh0KuiQ4g6zGGZG144GIL6YWCMwxnD7gN
         5tww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=6q4Ogs/xu/BHkdLHpHi3xG9nEcDUkatHU10+VQ6N3JQ=;
        b=GKOLgRvaFPTdRtlkOu4DAjSA2O7JKWQcR/7xtvshrNbxAt6Pv6vDudjf6iPWl0Pff5
         LNX1xmfcexgIOP/fVzAv0/m5uVSG5d20Bt9JPFcZ6KAVtL/DuPkVXBv0Dkff1lCxVWuD
         FG1/KbNLYR+gmiUP5evv4MJ8AO8SfTlqoV/3YYJekZvarIuoFK3U4+LyZx/jGizgAl9l
         nZ0XZcLDoUQNdBR6kcMe70ODKx9xhhaKjb+bFjczY3QMO60BxTHSdZXCCjXY7Wa5M1Nh
         0J27XUjqTAwTb4ROHrrAM+sfwcdx70NNOMWXuxy6Ygp4Ts6tbQ4fU2ZGg5CwqmsIOgul
         Wo2A==
X-Gm-Message-State: AHQUAubCjv6d/Z7Gy1icmQ5iE3gAiUT73iBocaYxn1u8wId7ysyS4Td5
        MHlT5i4FqZno7M/Oxid8xM+gMFEg1oc=
X-Google-Smtp-Source: AHgI3IZV+LleXpMLAzkm3D0oQQGQxCwdO/k0SSiud6ee8C7uq6m0iggH9Nq5OyV49lSg44Jp2JU/nw==
X-Received: by 2002:a19:df41:: with SMTP id q1mr425864lfj.25.1549303837439;
        Mon, 04 Feb 2019 10:10:37 -0800 (PST)
Received: from wasted.cogentembedded.com ([31.173.83.140])
        by smtp.gmail.com with ESMTPSA id h22-v6sm3124606lji.45.2019.02.04.10.10.32
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 04 Feb 2019 10:10:35 -0800 (PST)
Subject: [PATCH v2 5/7] sh_eth: offload RX checksum on R8A77980
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To:     netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>
Cc:     linux-renesas-soc@vger.kernel.org, linux-sh@vger.kernel.org
References: <a21deed1-35dc-f1be-6c7e-7061ebe4b56c@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <8697e411-02ae-3223-3a0c-4a3eb770ae3a@cogentembedded.com>
Date:   Mon, 4 Feb 2019 21:10:32 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <a21deed1-35dc-f1be-6c7e-7061ebe4b56c@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The R-Car V3H (R8A77980) SoC manual describes the Ether MAC's RX checksum
offload the same way as it's implemented in the EtherAVB MAC...

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 drivers/net/ethernet/renesas/sh_eth.c |    1 +
 1 file changed, 1 insertion(+)

Index: renesas/drivers/net/ethernet/renesas/sh_eth.c
===================================================================
--- renesas.orig/drivers/net/ethernet/renesas/sh_eth.c
+++ renesas/drivers/net/ethernet/renesas/sh_eth.c
@@ -796,6 +796,7 @@ static struct sh_eth_cpu_data r8a77980_d
 	.no_ade		= 1,
 	.xdfar_rw	= 1,
 	.csmr		= 1,
+	.rx_csum	= 1,
 	.select_mii	= 1,
 	.magic		= 1,
 	.cexcr		= 1,
