Return-Path: <SRS0=xQI0=RO=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E534EC43381
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 11 Mar 2019 19:10:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BAF3620643
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 11 Mar 2019 19:10:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="jXg9ybgv"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728096AbfCKTK1 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 11 Mar 2019 15:10:27 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:32836 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726675AbfCKTK1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 11 Mar 2019 15:10:27 -0400
Received: by mail-lj1-f195.google.com with SMTP id z7so128940lji.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 11 Mar 2019 12:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:from:to:cc:references:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=YczbOIkJjnyOhE8i2q5XcBo6cUbwyvzdRTSxex0tgjI=;
        b=jXg9ybgv5sS2NxUSyul7eJFcPH75NhRjt3iWwtWkaCNfftV7TK5c0IeUDi618XBLTv
         EjUssXBmrxtvWbndJBVkqrn+ViRaWX24ye/JYToFMx26wUdL3WiRkwshpqbkBPURKOzM
         8fgwOmBdi21maRL6u5AHPqAQ2SNnU/lkuV85BFgEX05Yghu0YlbWNHB1OWku6VG7lQFL
         xl4JnmoQfaMSALhAnQuidYeXkyC8Hs3xird9Skxlu9ybD/OjvW9FJVphnfUD+4RyX0Ke
         SemFr8VWOrsUyhWkzoYrv8z7LzGIUWJWe2A4aZOusBAxN+C0MqDrvFOYspBgKn0xGhdl
         fJBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=YczbOIkJjnyOhE8i2q5XcBo6cUbwyvzdRTSxex0tgjI=;
        b=BxYejDwmOUAFqVg8E0lc79Jn6gjq8MPV9hnauOpVn+r8Biei4KQ603DGNdEF0saWqL
         n7an/AnETfGUJp+NIFvpGD/mIE/gNe8/b+rnPgoDH0NvEXfMdWgo118e7g8ZF78AsFdo
         YS6jPOfgL70+MMRyGhJsTFhW5vAcb5VizZCJCdybK8KN+NlvJOOt2mrGSwaivekVpOsz
         OecxdEm9BMXijECzmWR1p/93Qn4nlVdTIuOj8i6NAJsfap6EsP4MRFXPVmN0LcDTHGhe
         +7KenydYIovCLr/REX4lFanlw7PKPdhA1smEjKrWN+pMHPeWITZDxOPgvGRG4ntIBoKy
         uI/Q==
X-Gm-Message-State: APjAAAXAszAg1tRi0DJa8RlYthYP013mCW7X0ipunKxp3jzSG/09tZFQ
        wOHPXp14amMzg9DpFDSB7nTvshYrgIE=
X-Google-Smtp-Source: APXvYqyUrtGqclO4nC1PTW62XVcet3koA1FjLtqaGSKdaGWAzyGEU7WmgPaQ9Mo8qwmYbAwnUcUPJQ==
X-Received: by 2002:a2e:9cda:: with SMTP id g26mr16719406ljj.48.1552331425121;
        Mon, 11 Mar 2019 12:10:25 -0700 (PDT)
Received: from wasted.cogentembedded.com ([31.173.87.168])
        by smtp.gmail.com with ESMTPSA id i15sm1052339ljb.48.2019.03.11.12.10.23
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 11 Mar 2019 12:10:23 -0700 (PDT)
Subject: Re: [PATCH] clk: renesas: r8a77980-cpg-mssr: fix RPC-IF module
 clock's parent
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-clk <linux-clk@vger.kernel.org>
References: <f1c53dd5-2dc5-9f11-44e3-8e222ed21903@cogentembedded.com>
 <ebc41558-2a0a-bf6d-05df-077e3c769344@cogentembedded.com>
 <CAMuHMdWxkM2YbLqyz3BemcVJphWYSZi4ejuLiG+fpfDdnuU4Uw@mail.gmail.com>
 <981d0e06-76b8-fe69-1a8e-91661ad0faba@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <0bc9b0ee-61cb-1834-59ad-632fe289f9ab@cogentembedded.com>
Date:   Mon, 11 Mar 2019 22:10:22 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <981d0e06-76b8-fe69-1a8e-91661ad0faba@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 03/11/2019 08:14 PM, Sergei Shtylyov wrote:

[...]

>    No hangs were seen on V3M, despite the RPCD2 clock remained disabled.
> The RPC clocks on both V3H and V3M suffer from a lack of clear documentation...
> 
>> See also section 62.4.7 (Frequency change), which does not have a
>> subsection for V3H, but it may be impacted (changing RPCD2 causes
>> an additional read of RPCCKR, satisfying the read-after-write requirement
>> documented there).
> 
>    Hmm, haven't seen this item before; it looks like we can't use the standard
> divider component. BTW, this section in the 1.50 manual tells to use the soft
> reset on V3MOK. OK, I'll investigate this...

   Now I have: the frequency change didn't seem to  happen, and without RPCD2 enabled
the CMNCR read still hangs, even when I added readl() call into clk_writel(). So I
think my patch was correct.

>>> Fixes:  94e3935b5756 ("clk: renesas: r8a77980: Add RPC clocks")
>>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> [...]

MBR, Sergei
