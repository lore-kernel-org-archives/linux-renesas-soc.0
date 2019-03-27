Return-Path: <SRS0=rp0x=R6=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_NEOMUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EB78C43381
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 27 Mar 2019 12:11:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 58DC82087C
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 27 Mar 2019 12:11:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="e3gOx+Wj"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726319AbfC0MLp (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 27 Mar 2019 08:11:45 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:56353 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726296AbfC0MLp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 27 Mar 2019 08:11:45 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 1BE0725B820;
        Wed, 27 Mar 2019 23:11:43 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1553688703; bh=WyuG0a0DsRV7ux0kObEBxq7kvgveYZ48MlvgXa9XTTs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=e3gOx+Wjc1b/FshiCcgQXHTN9Xeb4qsMotxAD4fSc82P0iarDxdVgM032m+SXb3EM
         O1SIH8dkfhPO0V0Zr5taJhxGDFuJZnxn3qwSEPjs4wPkGOJaIPAV02vdvDtcuJMPb+
         WTkLMeZt0RCDO4CBEqQpOo/umHk/FX8U7Qa3lUPw=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 5E5F9940376; Wed, 27 Mar 2019 13:11:41 +0100 (CET)
Date:   Wed, 27 Mar 2019 13:11:41 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Konstantin Kozhevnikov 
        <Konstantin.Kozhevnikov@cogentembedded.com>
Subject: Re: [PATCH/RFC 00/02] Remove undocumented IMR-LX4 device nodes
Message-ID: <20190327121139.i4ol7nobbbct2ds7@verge.net.au>
References: <154807139502.25511.1919986589060151108.sendpatchset@octo>
 <CAMuHMdUe+Hjn7cJB19OpEt7=Stcj-=gvA1TxH-fEjDpTx1PG1g@mail.gmail.com>
 <CANqRtoTNk7MQuXmoEZ6aTbEbEEOg7t-B63USvjcxKs-7LWggSA@mail.gmail.com>
 <d9f6abfa-e480-cd85-a1a4-0c2ad219200f@cogentembedded.com>
 <20190128125806.s3kjyjejwmtk6zqj@verge.net.au>
 <20190325110358.tpn6phh45dbyv52k@verge.net.au>
 <cf9d67af-4ac2-613e-0e5f-b69f197811ef@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cf9d67af-4ac2-613e-0e5f-b69f197811ef@cogentembedded.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Mar 25, 2019 at 06:53:58PM +0300, Sergei Shtylyov wrote:
> Hello!
> 
> On 03/25/2019 02:03 PM, Simon Horman wrote:
> 
> >>>>> On Mon, Jan 21, 2019 at 12:49 PM Magnus Damm <magnus.damm@gmail.com> wrote:
> >>>>>> Remove undocumented IMR-LX4 device nodes
> >>>>>>
> >>>>>> [PATCH/RFC 01/02] arm64: dts: renesas: r8a7795: Remove IMR-LX4 device nodes
> >>>>>> [PATCH/RFC 02/02] arm64: dts: renesas: r8a7796: Remove IMR-LX4 device nodes
> >>>>>>
> >>>>>> These patches take the easy way out and simply remove the undocumented
> >>>>>> IMR-LX4 device nodes from the upstream tree. Good or bad, let me know!
> >>>>>>
> >>>>>> So perhaps this is a bit overly aggressive but since the DT bindings seem
> >>>>>> undocumented and no driver exists in upstream my gut feeling says these DT
> >>>>>> nodes were part of an upstreaming attempt that got suspended half-way through.
> >>>>>>
> >>>>>> In case DT binding documentation is in-flight and queued up somewhere
> >>>>>> (ideally together with a driver) then feel free to ignore this series.
> >>>>>>
> >>>>>> Instead of removing nodes we could also document the DT bindings for the
> >>>>>> IMR-LX4 devices. It would also make sense to add device nodes to other
> >>>>>> more recent SoCs than just H3 and M3-W. But blindly adding more DT nodes
> >>>>>> with a DT binding but without a driver seems a bit suboptimal compared to
> >>>>>> testing against an actual driver.
> >>>>>
> >>>>> [PATCH v5] media: platform: Renesas IMR driver
> >>>>> https://lore.kernel.org/linux-renesas-soc/20170309200818.786255823@cogentembedded.com/
> >>>>
> >>>> Thanks, but that seems to be from 2017! =)
> >>>
> >>>    I dropped the ball there, as I was tasked with upstreaming V3x support...
> >>> The last thing done about the IMR driver was talking to Hans in Prague in
> >>> 2017.  I'm planning to return to the driver after I'm done with the
> >>> HyperFlash driver.
> >>
> >> Hi Sergei,
> >>
> >> I appreciate that we are not always in control of our own priorities,
> >> indeed I sympathise with that predicament. However, we shouldn't really
> >> be in a situation where DT is making use of undocumented bindings.
> >>
> >> I would like to ask for the bindings to be documented in the upstream
> >> kernel in the near future. And if that is not possible I believe we
> >> should consider temporarily removing their use in DT in the upstream kernel.
> > 
> > Hi Sergei,
> > 
> > about two months have passed since Magnus posted this series.
> 
>    Time flies...
>    Dealing w/ the flash drivers turned into unending nightmare. :-(
> 
> > Do you have a timeline to address the problems?
> 
>    I'm looking into posting the bindings separately right now.
> The patch should be ready today or tomorrow.
> 
> > If so I believe> that the way forward should be to apply this series.
> 
>    Hm, not sure I understood you correctly. You're going to remove
> the device nodes even if I have a timeline?

Sorry, there was a typo in the above. Of course not.
