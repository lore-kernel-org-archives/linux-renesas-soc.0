Return-Path: <SRS0=mNNB=RL=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3777EC43381
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  8 Mar 2019 12:02:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E519C20684
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  8 Mar 2019 12:02:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="ovmNVO5Q"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726375AbfCHMCh (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 8 Mar 2019 07:02:37 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:47393 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726305AbfCHMCh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 8 Mar 2019 07:02:37 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 0EA4125BEE4;
        Fri,  8 Mar 2019 23:02:35 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1552046555; bh=GUBFn+FTjk+5LtZtbPoQ4+xNbS23zO4zGNrJ/aZK/OI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ovmNVO5Q3igZFhn0poEbc2QJiGPKa2wDuWkpebj2axkxeCLU7QbkqILo7sdn4gLx8
         jeqZt0zyfckTLZi/d0hyBjZqQlJwx4Kp9rYBvjSZw/y04js0xnwoRo8sDiQnI75F1V
         nXaLyxZt1YkkH8NtCqz3nmSbLD3r5r7B/t/X/3iE=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 4B476940270; Fri,  8 Mar 2019 13:02:33 +0100 (CET)
Date:   Fri, 8 Mar 2019 13:02:33 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: renesas: r8a77990: Remove invalid compatible
 value for CSI40
Message-ID: <20190308120232.kueqdbkwoi2b6l6g@verge.net.au>
References: <20190306123926.10064-1-niklas.soderlund+renesas@ragnatech.se>
 <CAMuHMdXV_wNaXq388_r-20yB-+38y4ZDt0w=oOPf1Bz9Xe1arA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdXV_wNaXq388_r-20yB-+38y4ZDt0w=oOPf1Bz9Xe1arA@mail.gmail.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Mar 06, 2019 at 06:45:56PM +0100, Geert Uytterhoeven wrote:
> Hi Niklas,
> 
> On Wed, Mar 6, 2019 at 4:14 PM Niklas Söderlund
> <niklas.soderlund+renesas@ragnatech.se> wrote:
> > The compatible value renesas,rcar-gen3-csi2 was used while prototyping
> > the R-Car CSI-2 driver but was removed before the driver was merged.
> > Remove the only occurrence of the compatible value which manage to make
> 
> Nah, there's a second one, in r8a774c0.dtsi ;-)
> 
> > it upstream.
> >
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks,

should this patch have:

Fixes: ec70407ae7d7 ("arm64: dts: renesas: r8a77990: Add VIN and CSI-2 device nodes")
