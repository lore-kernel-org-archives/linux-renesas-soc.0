Return-Path: <SRS0=AhbF=PM=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 459ABC43387
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  4 Jan 2019 13:14:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1643921872
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  4 Jan 2019 13:14:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="WAiuLW1s"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726143AbfADNON (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 4 Jan 2019 08:14:13 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:52343 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726069AbfADNON (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 4 Jan 2019 08:14:13 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 4026725B747;
        Sat,  5 Jan 2019 00:14:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1546607651; bh=SBiJW1XDgN8Tf64M6wNQnLnBPfFT6f+CgH0N7/PuC2k=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WAiuLW1sDXoigLFP8cWMyF8/QkTq8nYXFafNecvBQn+ZA/6HO7Fp9UmlFz4FYkG3+
         aLdVdkD2BIuGCUuOAfI0/cAuv3eAIOaWPCBC+ZA6MtuEjyp0V2Z3UmP64I0nHkHxLH
         zhkqVNhIISyOhI01LnWO689cXjqq53beU1U27qh4=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 2BED4940376; Fri,  4 Jan 2019 14:14:09 +0100 (CET)
Date:   Fri, 4 Jan 2019 14:14:09 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: Re: [PATCH v2 4/5] ARM: dts: r8a7743: Remove LVDS encoder from du
 node
Message-ID: <20190104131408.dytwgjhw3ikn7ik3@verge.net.au>
References: <1544000815-28069-1-git-send-email-biju.das@bp.renesas.com>
 <1544000815-28069-5-git-send-email-biju.das@bp.renesas.com>
 <CAMuHMdW+qVJxu0fjC+j8w-neHU8FOHmJqRbHAtp1JvKYJ+RrXQ@mail.gmail.com>
 <OSBPR01MB2103C5C4C2A5B276E80D047AB88D0@OSBPR01MB2103.jpnprd01.prod.outlook.com>
 <20190104090517.bi5et5osmyxmfrwb@verge.net.au>
 <OSBPR01MB2103D40FC38C4A75476EBC39B88E0@OSBPR01MB2103.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <OSBPR01MB2103D40FC38C4A75476EBC39B88E0@OSBPR01MB2103.jpnprd01.prod.outlook.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Jan 04, 2019 at 10:02:02AM +0000, Biju Das wrote:
> Hi Simon,
> 
> Thanks for the feedback.
> 
> > Subject: Re: [PATCH v2 4/5] ARM: dts: r8a7743: Remove LVDS encoder from
> > du node
> >
> > On Thu, Jan 03, 2019 at 02:34:39PM +0000, Biju Das wrote:
> > > Hi Geert,
> > >
> > > Thanks for the feedback.
> > >
> > > > Subject: Re: [PATCH v2 4/5] ARM: dts: r8a7743: Remove LVDS encoder
> > > > from du node
> > > >
> > > > Hi Biju,
> > > >
> > > > On Wed, Dec 5, 2018 at 10:15 AM Biju Das <biju.das@bp.renesas.com>
> > > > wrote:
> > > > > The internal LVDS encoder now has DT bindings separate from the DU.
> > > > > So remove it from du node.
> > > > >
> > > > > Fixes: c6a27fa41fab ("drm: rcar-du: Convert LVDS encoder code to
> > > > > bridge driver")
> > > > >
> > > > > Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> > > >
> > > > Thanks for your patch!
> > > >
> > > > > ---
> > > > > V1-->V2
> > > > >         * Removed LVDS encoder definition from DU node.
> > > >
> > > > Shouldn't you add a new node for the LVDS encoder?
> > >
> > > Yes for Soc Dtsi , I will add the new node for LVDS encoder.
> >
> > Can I clarify that I should wait for a fresh revision of this and the following
> > patch?
> 
> My original plan was to submit LVDS encoder patch as separate one.
> 
> But now we are agreeing for adding  LVDS encoder node as part of the fix (Fixes: c6a27fa41fab ("drm: rcar-du: Convert LVDS encoder code to bridge driver")
> So I will send V3 with this change.

Great, thanks!
