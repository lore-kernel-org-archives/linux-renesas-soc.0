Return-Path: <SRS0=mNNB=RL=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A572C43381
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  8 Mar 2019 13:38:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0341C2087C
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  8 Mar 2019 13:38:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="Usnc8ywX"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726432AbfCHNiw (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 8 Mar 2019 08:38:52 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:48914 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726420AbfCHNiw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 8 Mar 2019 08:38:52 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 4155725BEE2;
        Sat,  9 Mar 2019 00:38:50 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1552052330; bh=RVNMwJTv7fEzJ8IWWhMERJVMiJdCwvOvJPURFLOOuTw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Usnc8ywXfTaCkvtgjbsPohVcqjhIecD/5a/2jdgo6vANv+me8i5bze+HeMJAQ107Y
         Vg/vVxFXxQA6jOuXJbso8jUuexJPE9SAZvjmYe25BMvnZ2r0p6mMvgTEtujMWKKUB3
         eucNAfLjaA1gaiwJnbwvIImQDlyOMVDpocrSoj5c=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 4C080940270; Fri,  8 Mar 2019 14:38:48 +0100 (CET)
Date:   Fri, 8 Mar 2019 14:38:48 +0100
From:   Simon Horman <horms@verge.net.au>
To:     marek.vasut@gmail.com
Cc:     linux-arm-kernel@lists.infradead.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: r8a7792: blanche: Add IIC3 and DA9063 PMIC node
Message-ID: <20190308133848.mf2frwkp3tyuji32@verge.net.au>
References: <20190304195958.8383-1-marek.vasut@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190304195958.8383-1-marek.vasut@gmail.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Mar 04, 2019 at 08:59:58PM +0100, marek.vasut@gmail.com wrote:
> From: Marek Vasut <marek.vasut+renesas@gmail.com>
> 
> Add IIC3 node to R8A7792 SoC device tree and a DA9063 PMIC node
> to V2H Blanche board device tree.
> 
> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Simon Horman <horms+renesas@verge.net.au>
> Cc: linux-renesas-soc@vger.kernel.org
> To: linux-arm-kernel@lists.infradead.org
> ---
> NOTE: R8A7792 Blanche does not share the PMIC IRQ line with other PMICs,
>       hence the regulator-quirk-rcar-gen2.c does not need a new entry.
> ---
>  arch/arm/boot/dts/r8a7792-blanche.dts | 20 ++++++++++++++++++++
>  arch/arm/boot/dts/r8a7792.dtsi        | 18 ++++++++++++++++++
>  2 files changed, 38 insertions(+)

Thanks, applied for v5.2.
