Return-Path: <SRS0=rp0x=R6=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4D5AC43381
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 27 Mar 2019 12:08:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B21AC2087C
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 27 Mar 2019 12:08:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="X6Oxmexc"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726598AbfC0MIG (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 27 Mar 2019 08:08:06 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:56273 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726233AbfC0MIF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 27 Mar 2019 08:08:05 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id A0ABD25B7E0;
        Wed, 27 Mar 2019 23:08:03 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1553688483; bh=VoyXsmxWIE5AzfzkK+ebdFAoD2/OAfhr1fD/cGtX8Go=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=X6Oxmexcno067zoHPdDw1gILfPNSu4uet33pt9VwuARxoBLCjC8ypUn//YWv/SWLK
         XG7CZuIQuw5erFAsp1CBvz7nawTJU6H+Ecn8V3uoQbldKmO8RIkcXOYKwi4sOdzLcq
         pSDMFYytNJif6eM29/T7UHQuXqdMuY5CreEAmfks=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id DA9C3940376; Wed, 27 Mar 2019 13:08:01 +0100 (CET)
Date:   Wed, 27 Mar 2019 13:08:01 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Chris Brandt <chris.brandt@renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Subject: Re: [PATCH 1/2] ARM: dts: rskrza1: Add I2C support
Message-ID: <20190327120801.2klhf4wzob57kuik@verge.net.au>
References: <20190320194410.14870-1-geert+renesas@glider.be>
 <20190320194410.14870-2-geert+renesas@glider.be>
 <20190322102324.yxnrwnkyhxrzqdg4@verge.net.au>
 <CAMuHMdWngVfAUZoF7nsZUbZdZYj1zoCNPQoS_eoVh46UzM7OUA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdWngVfAUZoF7nsZUbZdZYj1zoCNPQoS_eoVh46UzM7OUA@mail.gmail.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Mar 25, 2019 at 11:55:50AM +0100, Geert Uytterhoeven wrote:
> Hi Simon,
> 
> On Fri, Mar 22, 2019 at 11:23 AM Simon Horman <horms@verge.net.au> wrote:
> > On Wed, Mar 20, 2019 at 08:44:09PM +0100, Geert Uytterhoeven wrote:
> > > Enable the I2C bus, and add the following devices:
> > >   - Two CAT9554 port expanders (8 GPIOs, interrupt not wired by
> > >     default),
> > >   - R1EX24016ASAS0A EEPROM.
> > >
> > > The bus also contains a MAX9856 Audio Codec, which is not yet supported.
> > >
> > > All devices (incl. the audio codec) are documented to support an I2C bus
> > > running at 400 kHz.
> > >
> > > Pinctrl is based on the RZ/A BSP.
> > >
> > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > ---
> > > Pending acceptance of the DT binding patches documenting the
> > > "onnn,cat9554" and "renesas,r1ex24016" compatible values.
> >
> > Thanks.
> >
> > I'm marking this series as deferred pending acceptance of the bindings.
> > Please repost or ping me once that has happened.
> 
> next-20190325 has:
> 
>     d333bad1f6f3e0df dt-bindings: at24: add Renesas R1EX24016
>     5c9f8cfe3cb67dcb dt-bindings: gpio: pca953x: Document onnn,cat9554

Thanks, applied for v5.2.
