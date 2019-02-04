Return-Path: <SRS0=XP2S=QL=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E0C1C282CB
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  4 Feb 2019 18:06:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 50F372082E
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  4 Feb 2019 18:06:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="wyXKhbNt"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728056AbfBDSGA (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 4 Feb 2019 13:06:00 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:38599 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727880AbfBDSGA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 4 Feb 2019 13:06:00 -0500
Received: by mail-lf1-f66.google.com with SMTP id j15so612511lfh.5
        for <linux-renesas-soc@vger.kernel.org>; Mon, 04 Feb 2019 10:05:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:from:to:cc:references:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=2LikyD00HIeOBZ2NOhi84eobUL86EoR/49Zn2BRPSZk=;
        b=wyXKhbNtzHptE8TP0boExdqrj6j7F/8O2IsDFzNM5KH0uVz9XOEz2W891epYiOapYr
         uOr8SP9Te1QlAYS29cEuz4WL1mPHyfJ8++BUCWEwLfW+EqtW9gd398R1eebj5ti5NUxO
         JI1mKO/wmyj8nnnTi/KB3ujtEpRHgKWh6ILALlr64bBZxYq1qTX9F5jqnhiTfPdkQiL7
         xXmnTnKLOO2RjYvifcuugwzzR7kszcTI+0fkyeL2jQ7ZGcpg9CZpDKQ4lZfu3FKOwYzc
         H/+8BtNZ78IahZ9uzmv2TEEb7SeAuM1dOAh92jZa1SiI+iY67kWi+sVkGILXnDUqHmjj
         OdqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=2LikyD00HIeOBZ2NOhi84eobUL86EoR/49Zn2BRPSZk=;
        b=CN5v7NPnvN5pzxKtGVEKwqh2YISOvSFYrvUwFmDBXzQAok5F0PoF1AoYBEmMLk2xP1
         19FF3/YWU+h+6VdZBtBeMDAqsTzx6RUFN7DYPPfYx6lHiqUSCM9G/CxLh4cuhBKjMJko
         +xNhRPCLXNCj+bc2aCPEXQeieFq5x91Kz6rGMp3aK6yNBTZuunmCcx84Pfgwh5SyMfuI
         BEVjJ83OuQUXas34wEIroDYvWvmfgFqO3l1PgA0ht7kaUU9COA26WxhlnvW9mIN9UKrR
         vEC1fEHWIfOM0yyLMhFop96jqO2zXdMQhdBZUAHeM7L0Ecjt0gTmiUZk47LwP68tClno
         mUvw==
X-Gm-Message-State: AHQUAuZEi4M4cJZ9473OtvGx1fwI+ymOCAKgMFBdvYwr/cKr6dVNSbu+
        S+AmLqRi/XklCCJI4sST28+J+Q==
X-Google-Smtp-Source: AHgI3Ib4LgtrNghCZU2kx0QtFNZ5qxG1dLzDdV61azKZbxksFLKh5AwWWWckm+hMxcxgAxq33wsTkQ==
X-Received: by 2002:a19:660a:: with SMTP id a10mr442792lfc.146.1549303558178;
        Mon, 04 Feb 2019 10:05:58 -0800 (PST)
Received: from wasted.cogentembedded.com ([31.173.83.140])
        by smtp.gmail.com with ESMTPSA id z20sm1474081lfg.53.2019.02.04.10.05.56
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 04 Feb 2019 10:05:57 -0800 (PST)
Subject: [PATCH v2 1/7] sh_eth: rename sh_eth_cpu_data::hw_checksum
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To:     netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>
Cc:     linux-renesas-soc@vger.kernel.org, linux-sh@vger.kernel.org
References: <a21deed1-35dc-f1be-6c7e-7061ebe4b56c@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <49e422f5-08aa-cb39-b39f-7f963c2f15a5@cogentembedded.com>
Date:   Mon, 4 Feb 2019 21:05:55 +0300
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

Commit 62e04b7e0e3c ("sh_eth: rename 'sh_eth_cpu_data::hw_crc'") renamed
the field to 'hw_checksum' for the Ether DMAC "intelligent checksum",
however some Ether MACs implement a simpler checksumming scheme, so that
name now seems misleading. Rename that field to 'csmr' as the "intelligent
checksum" is always controlled by the CSMR register.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

---
Changes in version 2:
- fixed typos in the patch description;
- added Geert's tag.

 drivers/net/ethernet/renesas/sh_eth.c |   14 +++++++-------
 drivers/net/ethernet/renesas/sh_eth.h |    2 +-
 2 files changed, 8 insertions(+), 8 deletions(-)

Index: renesas/drivers/net/ethernet/renesas/sh_eth.c
===================================================================
--- renesas.orig/drivers/net/ethernet/renesas/sh_eth.c
+++ renesas/drivers/net/ethernet/renesas/sh_eth.c
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
Index: renesas/drivers/net/ethernet/renesas/sh_eth.h
===================================================================
--- renesas.orig/drivers/net/ethernet/renesas/sh_eth.h
+++ renesas/drivers/net/ethernet/renesas/sh_eth.h
@@ -499,7 +499,7 @@ struct sh_eth_cpu_data {
 	unsigned no_ade:1;	/* E-DMAC DOES NOT have ADE bit in EESR */
 	unsigned no_xdfar:1;	/* E-DMAC DOES NOT have RDFAR/TDFAR */
 	unsigned xdfar_rw:1;	/* E-DMAC has writeable RDFAR/TDFAR */
-	unsigned hw_checksum:1;	/* E-DMAC has CSMR */
+	unsigned csmr:1;	/* E-DMAC has CSMR */
 	unsigned select_mii:1;	/* EtherC has RMII_MII (MII select register) */
 	unsigned rmiimode:1;	/* EtherC has RMIIMODE register */
 	unsigned rtrate:1;	/* EtherC has RTRATE register */
