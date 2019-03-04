Return-Path: <SRS0=YxuQ=RH=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B995C43381
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  4 Mar 2019 09:52:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 52B5C20836
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  4 Mar 2019 09:52:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="Hb35SrX8"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726073AbfCDJw7 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 4 Mar 2019 04:52:59 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:38755 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726034AbfCDJw6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 4 Mar 2019 04:52:58 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id EA57925B74E;
        Mon,  4 Mar 2019 20:52:56 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1551693177; bh=4EVotGWzLoANxaEsI/QERejYmSSj7GtS2TsnqKOUrrk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Hb35SrX8J647yDg1Xk44H4vsqK1L1QIv+rwZR6HSp4rT6asP9rMUle1Fgluk/WRZF
         I8KxWMirSTAbSyPQqTEpfVXtAT93201Z8RWIaxj5iKyzzwqkUadgBc4Bcea6gDoFT2
         rZJLiFGnCCIldYQf1nfJ8KcJ0eIk63ymLbGrOwKQ=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 2FCEA94030D; Mon,  4 Mar 2019 10:52:55 +0100 (CET)
Date:   Mon, 4 Mar 2019 10:52:55 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Andy Gross <andy.gross@linaro.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Marc Gonzalez <marc.w.gonzalez@free.fr>,
        Olof Johansson <olof@lixom.net>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 4/5] arm64: defconfig: enable RX-8581 config option
Message-ID: <20190304095254.m5ihwwex4pm4tplo@verge.net.au>
References: <1550742048-28068-1-git-send-email-biju.das@bp.renesas.com>
 <1550742048-28068-5-git-send-email-biju.das@bp.renesas.com>
 <CAMuHMdVfaHXPWpTHJNMkNX1hEXBbM_zdbkoTj9NPf4cBNfpiWA@mail.gmail.com>
 <OSBPR01MB2103EC5F538696499211DAEBB8760@OSBPR01MB2103.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <OSBPR01MB2103EC5F538696499211DAEBB8760@OSBPR01MB2103.jpnprd01.prod.outlook.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Mar 01, 2019 at 10:46:00AM +0000, Biju Das wrote:
> Hi Geert,
> 
> Thanks for the feedback.
> 
> > Subject: Re: [PATCH 4/5] arm64: defconfig: enable RX-8581 config option
> >
> > On Thu, Feb 21, 2019 at 10:46 AM Biju Das <biju.das@bp.renesas.com>
> > wrote:
> > > Enable support for RX-8571/RX-8581 RTC by turning on
> > > CONFIG_RTC_DRV_RX8581 as module.
> > >
> > > Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> >
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >
> > Probably you want to enable this in (local) renesas_defconfig, too?
> 
> Yes. Will send another patch to enable this in renesas_defconfig as well.

Thanks, I see that.

I have gone ahead and applied this patch for v5.2.
