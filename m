Return-Path: <SRS0=Rjom=QD=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C4F0C282CA
	for <linux-renesas-soc@archiver.kernel.org>; Sun, 27 Jan 2019 17:36:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EDD7F20881
	for <linux-renesas-soc@archiver.kernel.org>; Sun, 27 Jan 2019 17:36:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="oRvSGKEp"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726934AbfA0RgO (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sun, 27 Jan 2019 12:36:14 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:33264 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726895AbfA0RgO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 27 Jan 2019 12:36:14 -0500
Received: by mail-lf1-f67.google.com with SMTP id i26so10230192lfc.0
        for <linux-renesas-soc@vger.kernel.org>; Sun, 27 Jan 2019 09:36:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:from:to:cc:references:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=kd73bZ7AKCEuKOrg+1QczlJBtttkncjpF7aX0xEIksY=;
        b=oRvSGKEpCIGZEdD4P4pmcQGLbtQ3xFhykI2lWVi2VcUp2B5iRkCHPTEI7HtRhmk3VE
         dk2Y8nQmenfpntZUsoD6u3FaqkZSGQjIz/XmKuoQUKB1FaF4uYofIeL+RskrWqMIOk4i
         pC8r9oN+Pny9yC+iEqbiuXNSBjGbooJ4oBaz8pp12UxeUyxemgrP8Da1rtmKgKnDG/H7
         h8QbFtVrsYYUBfTcDbxVabjReklifW1UalT9NzjrlF9SucNOPs3gHaiNWIGeKYvcmEgx
         7i9kNPeQkXLrimYKN+vF+rMSTrOe0nipVnPGHyOXGw1PWbLLN112OUTq4SOqo395PLHu
         p1ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=kd73bZ7AKCEuKOrg+1QczlJBtttkncjpF7aX0xEIksY=;
        b=NELUctmeq9j6DKsoHBt7o7HMEGEIiWHPS9vZu48IG9rjISlTbJdhzgIpvB26lBWQZl
         MQa2aR9uIXlJ6d9LmmC+ZVyWF6AHr5IJhEJASV/aznX+yZYF+gbyULM7AJHxKxuPvafI
         ovXUJyaeoNlxREeq/dzk6hfhHHZxltQjiS7ZxMU6IhIZNoOZJVTm3HUBClXMwx2MpDt0
         8HaJaUe9bPRuvOP518RJt9Vhlv9clZXnDBSeu1Wdkq5ON8UiIW3CKSEJeNUYhVqO1gM8
         7ZL1fAhDd0vp5IstXx/vkdBdiMxL89MgPz0u0c2HFqeh37+XU/WVDcc9Bs9vyx0kHWmP
         dJfw==
X-Gm-Message-State: AJcUukcmjxN8f+GJ5URL9x1aY2Wg3WN6dqviqR2oLW2BmjMel5epKyyW
        257cyyyRIohSvK48jcOzaT6cR76MRzI=
X-Google-Smtp-Source: ALg8bN6wYAy6ZuoyqhdWTjkadRVlZRCC7C0HV7imTtJ533E5mUNGBOkMmYRKtSbopHfbwWKFM4IGeQ==
X-Received: by 2002:a19:ced3:: with SMTP id e202mr15016133lfg.13.1548610572330;
        Sun, 27 Jan 2019 09:36:12 -0800 (PST)
Received: from wasted.cogentembedded.com ([31.173.84.150])
        by smtp.gmail.com with ESMTPSA id u65sm2678360lff.54.2019.01.27.09.36.11
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 27 Jan 2019 09:36:11 -0800 (PST)
Subject: [PATCH 1/7] sh_eth: rename sh_eth_cpu_data::hw_checksum
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To:     netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>
Cc:     linux-renesas-soc@vger.kernel.org, linux-sh@vger.kernel.org
References: <fc43bfa2-4312-b52b-a749-e3e43e242a95@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <b73763ac-5909-c95e-efa5-9d44fba9b9bf@cogentembedded.com>
Date:   Sun, 27 Jan 2019 20:36:10 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <fc43bfa2-4312-b52b-a749-e3e43e242a95@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Commit 62e04b7e0e3c ("sh_eth: rename 'sh_eth_cpu_data::hw_crc'") renamed
the field to 'hw_checksum' for the Ether DMAC "intelligent checksum",
however some Ether MACs implement a simpler checksumming scheme, so that
name now seems misleading. Rename that filed to 'csmr' as the "intelligent
checkmum" is always controlled by the CSMR register.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 drivers/net/ethernet/renesas/sh_eth.c |   14 +++++++-------
 drivers/net/ethernet/renesas/sh_eth.h |    2 +-
 2 files changed, 8 insertions(+), 8 deletions(-)

Index: net-next/drivers/net/ethernet/renesas/sh_eth.c
===================================================================
--- net-next.orig/drivers/net/ethernet/renesas/sh_eth.c
+++ net-next/drivers/net/ethernet/renesas/sh_eth.c
@@ -555,7 +555,7 @@ static int sh_eth_soft_reset_gether(stru
 	sh_eth_write(ndev, 0, RDFFR);
 
 	/* Reset HW CRC register */
-	if (mdp->cd->hw_checksum)
+	if (mdp->cd->csmr)
 		sh_eth_write(ndev, 0, CSMR);
 
 	/* Select MII mode */
@@ -619,7 +619,7 @@ static struct sh_eth_cpu_data r7s72100_d
 	.no_trimd	= 1,
 	.no_ade		= 1,
 	.xdfar_rw	= 1,
-	.hw_checksum	= 1,
+	.csmr		= 1,
 	.tsu		= 1,
 	.no_tx_cntrs	= 1,
 };
@@ -668,7 +668,7 @@ static struct sh_eth_cpu_data r8a7740_da
 	.no_trimd	= 1,
 	.no_ade		= 1,
 	.xdfar_rw	= 1,
-	.hw_checksum	= 1,
+	.csmr		= 1,
 	.tsu		= 1,
 	.select_mii	= 1,
 	.magic		= 1,
@@ -793,7 +793,7 @@ static struct sh_eth_cpu_data r8a77980_d
 	.no_trimd	= 1,
 	.no_ade		= 1,
 	.xdfar_rw	= 1,
-	.hw_checksum	= 1,
+	.csmr		= 1,
 	.select_mii	= 1,
 	.magic		= 1,
 	.cexcr		= 1,
@@ -1045,7 +1045,7 @@ static struct sh_eth_cpu_data sh7734_dat
 	.no_ade		= 1,
 	.xdfar_rw	= 1,
 	.tsu		= 1,
-	.hw_checksum	= 1,
+	.csmr		= 1,
 	.select_mii	= 1,
 	.magic		= 1,
 	.cexcr		= 1,
@@ -1633,7 +1633,7 @@ static int sh_eth_rx(struct net_device *
 		 * the RFS bits are from bit 25 to bit 16. So, the
 		 * driver needs right shifting by 16.
 		 */
-		if (mdp->cd->hw_checksum)
+		if (mdp->cd->csmr)
 			desc_status >>= 16;
 
 		skb = mdp->rx_skbuff[entry];
@@ -2173,7 +2173,7 @@ static size_t __sh_eth_get_regs(struct n
 	add_reg(MAFCR);
 	if (cd->rtrate)
 		add_reg(RTRATE);
-	if (cd->hw_checksum)
+	if (cd->csmr)
 		add_reg(CSMR);
 	if (cd->select_mii)
 		add_reg(RMII_MII);
Index: net-next/drivers/net/ethernet/renesas/sh_eth.h
===================================================================
--- net-next.orig/drivers/net/ethernet/renesas/sh_eth.h
+++ net-next/drivers/net/ethernet/renesas/sh_eth.h
@@ -499,7 +499,7 @@ struct sh_eth_cpu_data {
 	unsigned no_ade:1;	/* E-DMAC DOES NOT have ADE bit in EESR */
 	unsigned no_xdfar:1;	/* E-DMAC DOES NOT have RDFAR/TDFAR */
 	unsigned xdfar_rw:1;	/* E-DMAC has writeable RDFAR/TDFAR */
-	unsigned hw_checksum:1;	/* E-DMAC has CSMR */
+	unsigned csmr:1;	/* E-DMAC has CSMR */
 	unsigned select_mii:1;	/* EtherC has RMII_MII (MII select register) */
 	unsigned rmiimode:1;	/* EtherC has RMIIMODE register */
 	unsigned rtrate:1;	/* EtherC has RTRATE register */
