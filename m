Return-Path: <SRS0=w5fC=RE=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C9CDC43381
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  1 Mar 2019 09:41:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6B9BA2087E
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  1 Mar 2019 09:41:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="jP14hbOR"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387634AbfCAJlD (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 1 Mar 2019 04:41:03 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:60709 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733133AbfCAJk4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 1 Mar 2019 04:40:56 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 1420E25B78D;
        Fri,  1 Mar 2019 20:40:54 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1551433254; bh=t7u77P4UsdRP58k51CrA3S8lPGALoalYvkVg6lRHykU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jP14hbORNQr+97WfuEqRafOlmgNvPqQjfb17NGGSiBH41T0ajnWBZmC2XleAjzQb8
         kcujI2eiW+Bu/XUsgFvY82kd9Q4XA/m9KbjphejMsGoHRMXJpud7QXA0PvXn1QRc6y
         j/el+8bsW/ZjmepCfMcn+/hKSnIHorUAyAZS1cXE=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 41CA9940421; Fri,  1 Mar 2019 10:40:52 +0100 (CET)
Date:   Fri, 1 Mar 2019 10:40:52 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Mark Brown <broonie@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-spi <linux-spi@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>
Subject: Re: [PATCH] spi: sh-msiof: Add reset of registers before starting
 transfer
Message-ID: <20190301094051.dbu4bx6njzole4gd@verge.net.au>
References: <20190228110215.1657-1-geert+renesas@glider.be>
 <20190301092454.elhpld6q2ucaql5v@verge.net.au>
 <CAMuHMdX_LdNnMikRb1osO8ii4Mpi7ZsPpgvavQ6Qu-s9M4goHg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdX_LdNnMikRb1osO8ii4Mpi7ZsPpgvavQ6Qu-s9M4goHg@mail.gmail.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Mar 01, 2019 at 10:28:21AM +0100, Geert Uytterhoeven wrote:
> Hi Simon,
> 
> On Fri, Mar 1, 2019 at 10:25 AM Simon Horman <horms@verge.net.au> wrote:
> > On Thu, Feb 28, 2019 at 12:02:15PM +0100, Geert Uytterhoeven wrote:
> > > From: Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>
> > >
> > > In accordance with hardware specification Ver 1.0, reset register
> > > transmission / reception setting before transfer.
> > >
> > > Signed-off-by: Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>
> > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >
> > Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
> 
> Thanks!
> 
> > > --- a/drivers/spi/spi-sh-msiof.c
> > > +++ b/drivers/spi/spi-sh-msiof.c
> > > @@ -130,6 +130,8 @@ struct sh_msiof_spi_priv {
> > >  #define CTR_TFSE     0x00004000 /* Transmit Frame Sync Signal Output Enable */
> > >  #define CTR_TXE              0x00000200 /* Transmit Enable */
> > >  #define CTR_RXE              0x00000100 /* Receive Enable */
> > > +#define CTR_TXRST    0x00000002 /* Transmit Reset */
> > > +#define CTR_RXRST    0x00000001 /* Receive Reset */
> >
> > nit: can we start using the BIT() macro here?
> 
> Sure, if you want to convert the whole driver... ;-)
> Note that many of them are multi-bit fields.

Yes, my 2c worth is to use BIT() and GENMASK() throughout the driver.
