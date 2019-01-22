Return-Path: <SRS0=QNR1=P6=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A134C282C5
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 22 Jan 2019 20:01:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0AEBB217D6
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 22 Jan 2019 20:01:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="quXVWZUz"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726095AbfAVUBL (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 22 Jan 2019 15:01:11 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:33227 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726015AbfAVUBL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Jan 2019 15:01:11 -0500
Received: by mail-lj1-f193.google.com with SMTP id v1-v6so21831499ljd.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 22 Jan 2019 12:01:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:from:to:references:organization:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=h3UPvFM7S4Lgw6BJPW9b0tY+/sfdOonED1U8LL8rqps=;
        b=quXVWZUzCvsuLrN6bt3bKhxlyHxDjbp04VHNfle5ocYlHI6/jIjV2EHCzAnP43W0uM
         GXuCRX0vkk+euPFOpugjZ83Y8RNd8FVF277KeaNZ0FcSyE8EE66NyHmDtN4xmQanaFwj
         3Oqw7+BH2eD8q6AzAI9wBOaOqsLU6NI/dv+e/fh7/WxV7Zz+OKt4UcfdiTHz4/3yqwu/
         xSwA2AzMsV/tCEckMko1sXakmJKOKQACh6fMIzkNexWKrJwu3aIKER9d7E1DKbRwlrEL
         wFWiSoo5VRtM8YB2WFA3Iid/pFzp8GZhBu6reKW72uDR5iYzsaO0Q68hvJDl9Bw4jApa
         wY3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:references:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=h3UPvFM7S4Lgw6BJPW9b0tY+/sfdOonED1U8LL8rqps=;
        b=WFATzkn7K1OPTG6m8CaA4/7i65czFQGW99O5kMUzEQurMqfMQnzdMYWIrhVP7wuiZ+
         NND8OcTspQd8PiQXa7CYGvs7w+xi0IE0mxzL9jr+rTpFeYR3FZ3sycqCl0xqIioCmTqW
         R57al8ZPb5yhEPGGMqCIPG3Pa7v7WtKnr+mHl85RsUdiQBBXpvrp7iOCSjclLZC3Krpv
         /BoMzd46Omfe3o0+KpdH7fMnk/8jjCFh0+mHABy6U5xoPP4V/fTLTsAwIsf8mHeQe4GA
         sZiWeXwfAk3BPM6/+5oce25wRlyoSDcUh65GsbNKc03DytZXer6hZme80+0TO8VYCiqB
         IvGw==
X-Gm-Message-State: AJcUukf3oubxySk3a4/8olKpxR4IEsyBSyZwBj2gWPcuyhxqrluExpR1
        hF4ydcvURF5hELAuZ6wQOSDEJw==
X-Google-Smtp-Source: ALg8bN4iiT1k1LmA4F311xp8F9amOfwgkDwIbzUU9EK31KWGsy5ahhqLXVwnO2gf0Cn6NAEvaOkTRw==
X-Received: by 2002:a2e:4942:: with SMTP id b2-v6mr21072372ljd.168.1548187269159;
        Tue, 22 Jan 2019 12:01:09 -0800 (PST)
Received: from wasted.cogentembedded.com ([31.173.82.69])
        by smtp.gmail.com with ESMTPSA id s62sm148972lfg.34.2019.01.22.12.01.07
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 22 Jan 2019 12:01:08 -0800 (PST)
Subject: [PATCH v3 4/4] clk: renesas: r8a77980-cpg-mssr: add RPC clocks
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To:     linux-renesas-soc@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-clk@vger.kernel.org
References: <f1c53dd5-2dc5-9f11-44e3-8e222ed21903@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <be9a6fea-1347-427b-e2e9-69b3ec6787e5@cogentembedded.com>
Date:   Tue, 22 Jan 2019 23:01:07 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <f1c53dd5-2dc5-9f11-44e3-8e222ed21903@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Describe the RPCSRC internal clock and the RPC[D2] clocks derived from it,
as well as the RPC-IF module clock, in the R-Car V3H (R8A77980) CPG/MSSR
driver.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

---
Changes in version 3:
- added Geert's tag.

Changes in version 2:
- moved the RPCSRC clock support to the R-Car gen3 CPG patch adding the RPC
  clocks;
- rewrote the patch description.

 drivers/clk/renesas/r8a77980-cpg-mssr.c |    8 ++++++++
 1 file changed, 8 insertions(+)

Index: renesas-drivers/drivers/clk/renesas/r8a77980-cpg-mssr.c
===================================================================
--- renesas-drivers.orig/drivers/clk/renesas/r8a77980-cpg-mssr.c
+++ renesas-drivers/drivers/clk/renesas/r8a77980-cpg-mssr.c
@@ -41,6 +41,7 @@ enum clk_ids {
 	CLK_S2,
 	CLK_S3,
 	CLK_SDSRC,
+	CLK_RPCSRC,
 	CLK_OCO,
 
 	/* Module Clocks */
@@ -65,8 +66,14 @@ static const struct cpg_core_clk r8a7798
 	DEF_FIXED(".s2",	CLK_S2,		   CLK_PLL1_DIV2,  4, 1),
 	DEF_FIXED(".s3",	CLK_S3,		   CLK_PLL1_DIV2,  6, 1),
 	DEF_FIXED(".sdsrc",	CLK_SDSRC,	   CLK_PLL1_DIV2,  2, 1),
+	DEF_BASE(".rpcsrc",	CLK_RPCSRC, CLK_TYPE_GEN3_RPCSRC, CLK_PLL1),
 	DEF_RATE(".oco",	CLK_OCO,           32768),
 
+	DEF_BASE("rpc",		R8A77980_CLK_RPC, CLK_TYPE_GEN3_RPC,
+		 CLK_RPCSRC),
+	DEF_BASE("rpcd2",	R8A77980_CLK_RPCD2, CLK_TYPE_GEN3_RPCD2,
+		 R8A77980_CLK_RPC),
+
 	/* Core Clock Outputs */
 	DEF_FIXED("ztr",	R8A77980_CLK_ZTR,   CLK_PLL1_DIV2,  6, 1),
 	DEF_FIXED("ztrd2",	R8A77980_CLK_ZTRD2, CLK_PLL1_DIV2, 12, 1),
@@ -164,6 +171,7 @@ static const struct mssr_mod_clk r8a7798
 	DEF_MOD("gpio1",		 911,	R8A77980_CLK_CP),
 	DEF_MOD("gpio0",		 912,	R8A77980_CLK_CP),
 	DEF_MOD("can-fd",		 914,	R8A77980_CLK_S3D2),
+	DEF_MOD("rpc-if",		 917,	R8A77980_CLK_RPC),
 	DEF_MOD("i2c4",			 927,	R8A77980_CLK_S0D6),
 	DEF_MOD("i2c3",			 928,	R8A77980_CLK_S0D6),
 	DEF_MOD("i2c2",			 929,	R8A77980_CLK_S3D2),
