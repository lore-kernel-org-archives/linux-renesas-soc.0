Return-Path: <SRS0=XP2S=QL=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B13F3C282C4
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  4 Feb 2019 18:11:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7E7842082E
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  4 Feb 2019 18:11:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="VkLX9B4N"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729235AbfBDSLi (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 4 Feb 2019 13:11:38 -0500
Received: from mail-lf1-f45.google.com ([209.85.167.45]:46087 "EHLO
        mail-lf1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728056AbfBDSLi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 4 Feb 2019 13:11:38 -0500
Received: by mail-lf1-f45.google.com with SMTP id f5so577789lfc.13
        for <linux-renesas-soc@vger.kernel.org>; Mon, 04 Feb 2019 10:11:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:from:to:cc:references:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=WuripNQOWF5h9FMd3FHVu69JYoXkifUIWFtz9+M3z/I=;
        b=VkLX9B4NL2Rrgb7f22C8qNQ45LJ0XtWJO7cmgwyHqCIbjXop6aKTnNbfm5EcmR9wH8
         JiWHMBL87Lj7Cl8QYr8mCxqz8LX7I7WXe/15c3VeEaHlueoJc36H4ALMtZf6qAbQpzJY
         k7K0ckuv29G5AOzvLP4QnXPSBXFFXRYiOjO2cEGTP6QUSNCHG1DRtqpyguwX1ikJRzAF
         u1pB3rs9+a0kxTaWmtWY9KtH4wWdlPFdXBnRvYjHjnTLL6xrOjvyIWnxJWzA4M7A8ePg
         n8nQXMSeMKsEMy0UqicbTVqIykcdEx9xtTLC/pUoUohrTMrf5ise+48okJVAjSXXCh68
         tl6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=WuripNQOWF5h9FMd3FHVu69JYoXkifUIWFtz9+M3z/I=;
        b=cmLGNWt53caP8pOIlYNZ+u2D1DQCwLAn21AvahUQ097F7AuGBr6+aQ3ya2+rUj5+sY
         aGt7QQ+cbyX5YcCVcCrI0j3txftE96Q/jMYSLlna/17acEB9W2IaJ+oDYdYdQWmf7ASk
         wVZ0spVQQDM2z7Ag8KRauOWC/UtxUsSB6cKFN5Daz/67FxfRKbO+m9l0WIZteEbFE+vA
         bID4BNv98dzOWn++5XXSpoxsqvcwZiyBvoLVXslFL6NR/jJwGtYtCbzGpiCx+vQz1vW5
         b2gfMcVpSGBT27N/mL9sstBvwYqw3mymkE3ADHwSitJWdD5gX3byoWiIHNn70bc6p5xN
         Vkcg==
X-Gm-Message-State: AHQUAubkuu6IaqA3eoZfVcofXCD5F72ONkWAL/BnDGbdQpp8orFATrhU
        dmlXM4j9t0vZYo4jGrbd4HNj/w==
X-Google-Smtp-Source: AHgI3IbVLb31o6Vv9gOQeG+rtcpgk6V5HMygrumdB/+B8NXsq/8ZqLMlUIpFbYtl8hD+wD0QUXP7TQ==
X-Received: by 2002:ac2:434f:: with SMTP id o15mr397216lfl.29.1549303896201;
        Mon, 04 Feb 2019 10:11:36 -0800 (PST)
Received: from wasted.cogentembedded.com ([31.173.83.140])
        by smtp.gmail.com with ESMTPSA id t22sm3477710lfb.0.2019.02.04.10.11.33
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 04 Feb 2019 10:11:34 -0800 (PST)
Subject: [PATCH v2 6/7] sh_eth: offload RX checksum on SH7734
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To:     netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>
Cc:     linux-renesas-soc@vger.kernel.org, linux-sh@vger.kernel.org
References: <a21deed1-35dc-f1be-6c7e-7061ebe4b56c@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <a7a02d50-2566-5425-ba05-36e3ad5b4d38@cogentembedded.com>
Date:   Mon, 4 Feb 2019 21:11:32 +0300
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

The SH7734 SoC manual describes the Ether MAC's RX checksum offload
the same way as it's implemented in the EtherAVB MACs...

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 drivers/net/ethernet/renesas/sh_eth.c |    1 +
 1 file changed, 1 insertion(+)

Index: renesas/drivers/net/ethernet/renesas/sh_eth.c
===================================================================
--- renesas.orig/drivers/net/ethernet/renesas/sh_eth.c
+++ renesas/drivers/net/ethernet/renesas/sh_eth.c
@@ -1049,6 +1049,7 @@ static struct sh_eth_cpu_data sh7734_dat
 	.xdfar_rw	= 1,
 	.tsu		= 1,
 	.csmr		= 1,
+	.rx_csum	= 1,
 	.select_mii	= 1,
 	.magic		= 1,
 	.cexcr		= 1,
