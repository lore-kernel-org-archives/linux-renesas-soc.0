Return-Path: <SRS0=XP2S=QL=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12CBEC282C4
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  4 Feb 2019 18:07:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DACC52082E
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  4 Feb 2019 18:07:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="YV8rABnW"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728147AbfBDSH5 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 4 Feb 2019 13:07:57 -0500
Received: from mail-lf1-f49.google.com ([209.85.167.49]:36601 "EHLO
        mail-lf1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728056AbfBDSH5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 4 Feb 2019 13:07:57 -0500
Received: by mail-lf1-f49.google.com with SMTP id a16so630530lfg.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 04 Feb 2019 10:07:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:from:to:cc:references:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=EXKdwmo20YMZC/V88QG3nxEMIZWNmrNm7jkbU1maseQ=;
        b=YV8rABnW+J780n65H9fXRliFm0zCPVpVqzD76d43JkViLK1oKeKi1O5hd/gsZu/e26
         wGFromjkGAImq/5FZbSXPs3qs3IyRHO2HFe4RBp3iXRMMZEOh8N8DRnH+0SxlbFLYOhq
         vdHibW0KQ2Eh0pOXIxR23O2gLWiQ2usYb4oU/QJIMA3KrC4ETYzyL/rB4vODcmL8/SW8
         lgYs7L/U9jJPiOlbNc2rFSGQsdaEiV3IbX7WJ89gMu6TMaOfwfv1S1AIXBPgZ8ngxhYD
         iCH6FfBBW1NfcLkr3m8Low8Je2/TumB+zrnnkM5YtowcKpFIchVJHhoSZ7tJCRmtTe+R
         HbDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=EXKdwmo20YMZC/V88QG3nxEMIZWNmrNm7jkbU1maseQ=;
        b=hckaYx6+xs9jdDAYd5QObYycT8x4rBPaonmC17pnn/UhGw4Jqk9wD57G0YIuNcpPl2
         IqFIjWliPypkDy8qY984zVnRgxeea5J2rrB2XleriYs1JJ0/r+pFpUk3T4U3sSn/uZPg
         FkWMqxzkU5TMhVfHuJzc1mITcCwCT9UPWZ05uTn+y5iSDGwO5vdI89hORb4TKloMsrdP
         P/qpeeDKcZbCjR8X+UNgRcL578j4pl/ZGakOq81xEbsXLam4zhvzxQdA1HWeQUc2Hbze
         wfkbKXgr9ejFE5LI4fj0MbV/VEntxgIQJ8ThkMevdWAVY/kXA6bDKhIFSWnUu3DrWQ0u
         FlpQ==
X-Gm-Message-State: AHQUAuZfoABawc3ImB49uCkWPOsIZF2g+kwTxS88hws0PItbEXIRbSu8
        lr5IcwHweQkFUleT5FlUudZ6fA==
X-Google-Smtp-Source: AHgI3IbHGXSUyRQnUdfo/3lb1oEuJK/VQRBrTKo27lX4XNucODD6rc96Nn1QS2dnKndoQAnsGcbm1A==
X-Received: by 2002:a19:f705:: with SMTP id z5mr425571lfe.158.1549303675231;
        Mon, 04 Feb 2019 10:07:55 -0800 (PST)
Received: from wasted.cogentembedded.com ([31.173.83.140])
        by smtp.gmail.com with ESMTPSA id j12-v6sm2846626ljh.66.2019.02.04.10.07.54
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 04 Feb 2019 10:07:54 -0800 (PST)
Subject: [PATCH v2 3/7] sh_eth: offload RX checksum on R7S72100
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To:     netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>
Cc:     linux-renesas-soc@vger.kernel.org, linux-sh@vger.kernel.org
References: <a21deed1-35dc-f1be-6c7e-7061ebe4b56c@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <5d0f2d2e-4a05-b659-7f95-264335ab66ab@cogentembedded.com>
Date:   Mon, 4 Feb 2019 21:07:53 +0300
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

The RZ/A1H (R7S721000) SoC manual describes the Ether MAC's RX checksum
offload the same way as it's implemented in the EtherAVB MACs...

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 drivers/net/ethernet/renesas/sh_eth.c |    1 +
 1 file changed, 1 insertion(+)

Index: renesas/drivers/net/ethernet/renesas/sh_eth.c
===================================================================
--- renesas.orig/drivers/net/ethernet/renesas/sh_eth.c
+++ renesas/drivers/net/ethernet/renesas/sh_eth.c
@@ -620,6 +620,7 @@ static struct sh_eth_cpu_data r7s72100_d
 	.no_ade		= 1,
 	.xdfar_rw	= 1,
 	.csmr		= 1,
+	.rx_csum	= 1,
 	.tsu		= 1,
 	.no_tx_cntrs	= 1,
 };
