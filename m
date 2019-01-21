Return-Path: <SRS0=sDbg=P5=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 360B2C2F441
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 21 Jan 2019 16:53:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DFC5E20663
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 21 Jan 2019 16:53:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="dY7Z5CJH"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729940AbfAUQx3 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 21 Jan 2019 11:53:29 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:47667 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729643AbfAUQx3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Jan 2019 11:53:29 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 16E3E25B7CB;
        Tue, 22 Jan 2019 03:53:27 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1548089607; bh=FlcjPCB3AYxGCESUVMTy0fcrhZejPF1GYeHzwNz2LzE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=dY7Z5CJHhV/klpPjzMBsfILYkWZGmSjQXb26omVwR1YrzCbnjQx0vtbaI9rDAcMFT
         cEdriWtjYK1ujPlrH6zto2BofI8nsNLS4l4yBL1dBEjO2RV/pdv11WTqQlVHASgkwo
         SJIrTbOXkSwJimfidK/BGBsdozbW31sIGr4vZai8=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 5A224940459; Mon, 21 Jan 2019 17:53:25 +0100 (CET)
Date:   Mon, 21 Jan 2019 17:53:25 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] [LOCAL] arm64: renesas_defconfig: Refresh for v5.0-rc2
Message-ID: <20190121165325.sku4ybloc32qlx7a@verge.net.au>
References: <20190118160012.12244-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190118160012.12244-1-geert+renesas@glider.be>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Jan 18, 2019 at 05:00:12PM +0100, Geert Uytterhoeven wrote:
>   - Move SoC config options (moved in commit fa43948f6736b74c ("arm64:
>     renesas: Move SoC Kconfig symbols to drivers/soc/renesas/")),
>   - Move PCI config options (moved in commit eb01d42a77785ff9 ("PCI:
>     consolidate PCI config entry in drivers/pci")),
>   - Disable CONFIG_ARM64_PTR_AUTH (R-Car Gen3 is not ARMv8.3),
>   - Drop CONFIG_IOSCHED_DEADLINE (removed in commit f382fb0bcef4c37d
>     ("block: remove legacy IO schedulers")),
>   - Drop CONFIG_GPIOLIB=y (auto-enabled since commit 9374eee32b666c92
>     ("arm64: renesas: Enable GPIOLIB to allow GPIO driver selection")).
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>


Thanks,

I have applied this to the topic/renesas-defconfig branch which is included
in the devel branch and tags of the Renesas tree as a convenience to
developers.  The branch is not, however, included in the next branch or
tags nor is it targeted at upstream.
