Return-Path: <SRS0=AhbF=PM=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 214A9C43387
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  4 Jan 2019 12:53:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D9824208E3
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  4 Jan 2019 12:53:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="MCX+oo8H"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726271AbfADMxd (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 4 Jan 2019 07:53:33 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:46439 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727143AbfADMx2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 4 Jan 2019 07:53:28 -0500
Received: by mail-lf1-f66.google.com with SMTP id y14so6396474lfg.13
        for <linux-renesas-soc@vger.kernel.org>; Fri, 04 Jan 2019 04:53:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=to:cc:from:subject:organization:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=zF4iDaIzxJJZqWHJVdecxj/pcWW0/ZY1vAc81ZpDBJg=;
        b=MCX+oo8HCbsuFVLNYE/ZDz0/AxUmcN9Uk/JjRReenhPjNmZ4wMlEcAhxOK+CYfMAzu
         wLmnPC33VRf0D1rpWFCQC7lBrZyxnQdTWXQr9KctSw64/mXnvKpNJvTFWen6yZYEvJ5f
         p42AGumVKOYJ8y/g/moibKrSupnL2WHjC3OX/vVy6sbuituBM28VLiABvcfDLih8Ig2Z
         dwrTBzPnEWtWzEphl9qXTqExC1wuipdur4RYca/S8paIBn0k9dvMwGSbDvEw++P/6aUO
         I14Bip1vVjoWjuD1rMQrE5BOcJJjmnQV3PnNFAqckZL2+NfwfoHtLMY1IvbjGcRCN24g
         nhJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:from:subject:organization:message-id:date
         :user-agent:mime-version:content-language:content-transfer-encoding;
        bh=zF4iDaIzxJJZqWHJVdecxj/pcWW0/ZY1vAc81ZpDBJg=;
        b=t4dFvUy2XVx9tyOlJne201KE9fkVdO7z/70N/k4U065RoIt/lpGTAMBB4KDw30oN7M
         fVJrLE+Ou9QVzKMEnV/FMefMMytqSyJhnO5UboRnZYUYeseTfjZM61fq4Bbjfimok4eP
         lOAKS+NgaaJX1UvCKzQ/fHi9w+PuzVOQaCoqtV7aUb3yhBpPO11/GVEYqWXdM9XvRkzO
         OE0ERdWTOXRrKXoy0p9FssXmczUwRY1Ngx5poaVZ5YA0tcIhjFc/R4y471Jl4iE09DE6
         rB5a603za/iVO7eYGbbnrQ7RmRL+CV8wCVsBfj2WuPEUPlbTO3PUI3az7ZLSamXwDQhI
         /cNg==
X-Gm-Message-State: AA+aEWZ5JGUbk/6NVAp0qxXJsSJGPColaOdYHrAB8NQwAlD3UkDNLaqd
        zi9oldDDCBU0yad39wVDWBbfdJEgg9U=
X-Google-Smtp-Source: AFSGD/WPL6i1lfE1SXQNc/6yFL+GxJHEOIygggIJxfvNBt8R0TQAJxqgB0akAWi2FL2CV9vhFitu8w==
X-Received: by 2002:a19:5402:: with SMTP id i2mr24636533lfb.128.1546606405973;
        Fri, 04 Jan 2019 04:53:25 -0800 (PST)
Received: from wasted.cogentembedded.com ([31.173.86.82])
        by smtp.gmail.com with ESMTPSA id a11sm11165229lff.68.2019.01.04.04.53.24
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 04 Jan 2019 04:53:25 -0800 (PST)
To:     Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc:     linux-sh@vger.kernel.org, linux-renesas-soc@vger.kernel.org
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH RFT v2] net: sh_eth: add support for SH7786
Organization: Cogent Embedded
Message-ID: <cbc7976d-2376-15d4-0fc1-febdf142887b@cogentembedded.com>
Date:   Fri, 4 Jan 2019 15:53:24 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

This commit adds the sh_eth_cpu_data structure that describes the
SH7786 variant of the IP.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

---
The patch is against DaveM's 'net-next.git' repo.
Not posting it to netdev@vger.kernel.org this time since the 'net-next' repo
is still closed.

Changes in version 2:
- added a comment before 'sh7786_data' initializer;
- added now mandatory soft_reset() method;
- changed the 'register_type' initializer to SH_ETH_REG_FAST_RCAR;
- added the 'ecsr_value' field initializer;
- renamed EESR_RTO to EESR_TRO;
- added the 'fdr_value' field initializer;
- added the 'no_xdfar'  field initializer.

 drivers/net/ethernet/renesas/sh_eth.c |   31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

Index: net-next/drivers/net/ethernet/renesas/sh_eth.c
===================================================================
--- net-next.orig/drivers/net/ethernet/renesas/sh_eth.c
+++ net-next/drivers/net/ethernet/renesas/sh_eth.c
@@ -879,6 +879,36 @@ static struct sh_eth_cpu_data sh7724_dat
 	.rpadir		= 1,
 };
 
+/* SH7786 */
+static struct sh_eth_cpu_data sh7786_data = {
+	.soft_reset	= sh_eth_soft_reset,
+
+	.set_duplex	= sh_eth_set_duplex,
+
+	.register_type	= SH_ETH_REG_FAST_RCAR,
+
+	.edtrr_trns	= EDTRR_TRNS_ETHER,
+	.ecsr_value	= ECSR_PSRTO | ECSR_LCHNG | ECSR_ICD,
+	.ecsipr_value	= ECSIPR_PSRTOIP | ECSIPR_LCHNGIP | ECSIPR_ICDIP,
+	.eesipr_value	= EESIPR_RFCOFIP | EESIPR_ADEIP | EESIPR_ECIIP |
+			  EESIPR_FTCIP | EESIPR_TDEIP | EESIPR_TFUFIP |
+			  EESIPR_FRIP | EESIPR_RDEIP | EESIPR_RFOFIP |
+			  EESIPR_RMAFIP | EESIPR_RRFIP |
+			  EESIPR_RTLFIP | EESIPR_RTSFIP |
+			  EESIPR_PREIP | EESIPR_CERFIP,
+
+	.tx_check	= EESR_FTC | EESR_CND | EESR_DLC | EESR_CD | EESR_TRO,
+	.eesr_err_check	= EESR_TWB | EESR_TABT | EESR_RABT | EESR_RFE |
+			  EESR_RDE | EESR_RFRMER | EESR_TFE | EESR_TDE,
+	.fdr_value	= 0x00000f0f,
+
+	.apr		= 1,
+	.mpr		= 1,
+	.tpauser	= 1,
+	.hw_swap	= 1,
+	.no_xdfar	= 1,
+};
+
 static void sh_eth_set_rate_sh7757(struct net_device *ndev)
 {
 	struct sh_eth_private *mdp = netdev_priv(ndev);
@@ -3476,6 +3506,7 @@ static const struct platform_device_id s
 	{ "sh7757-ether", (kernel_ulong_t)&sh7757_data },
 	{ "sh7757-gether", (kernel_ulong_t)&sh7757_data_giga },
 	{ "sh7763-gether", (kernel_ulong_t)&sh7763_data },
+	{ "sh7786-ether", (kernel_ulong_t)&sh7786_data },
 	{ }
 };
 MODULE_DEVICE_TABLE(platform, sh_eth_id_table);
