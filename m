Return-Path: <SRS0=tR/q=R4=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_NEOMUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AEFEC43381
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 25 Mar 2019 11:04:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 05C27206BA
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 25 Mar 2019 11:04:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="MOZVQpYm"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730721AbfCYLED (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 25 Mar 2019 07:04:03 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:36602 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730519AbfCYLED (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 25 Mar 2019 07:04:03 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 26D9B25BEFA;
        Mon, 25 Mar 2019 22:04:01 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1553511841; bh=qvNu80PL+fShax4+VCaaFS8CuVFNI6R8i+EKOPuWxOU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=MOZVQpYm85V7EPB5vjVQUERE5AqDOHbhOpJqBo7Y/AQTOyS4k8dk6YGHRbtlJuVsa
         NyIHwCnw2+lO2Rba5J1I/P4OJVE8X55J3zX8tY9TZEHLEi87+B3Q4LksInmwy1PL2I
         Kl7BAkBEQMSnZQuFCMCEImQ52oTyE4bkOUy7wdGw=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 67EAA940563; Mon, 25 Mar 2019 12:03:59 +0100 (CET)
Date:   Mon, 25 Mar 2019 12:03:59 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Konstantin Kozhevnikov 
        <Konstantin.Kozhevnikov@cogentembedded.com>
Subject: Re: [PATCH/RFC 00/02] Remove undocumented IMR-LX4 device nodes
Message-ID: <20190325110358.tpn6phh45dbyv52k@verge.net.au>
References: <154807139502.25511.1919986589060151108.sendpatchset@octo>
 <CAMuHMdUe+Hjn7cJB19OpEt7=Stcj-=gvA1TxH-fEjDpTx1PG1g@mail.gmail.com>
 <CANqRtoTNk7MQuXmoEZ6aTbEbEEOg7t-B63USvjcxKs-7LWggSA@mail.gmail.com>
 <d9f6abfa-e480-cd85-a1a4-0c2ad219200f@cogentembedded.com>
 <20190128125806.s3kjyjejwmtk6zqj@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190128125806.s3kjyjejwmtk6zqj@verge.net.au>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Jan 28, 2019 at 01:58:11PM +0100, Simon Horman wrote:
> On Wed, Jan 23, 2019 at 09:19:59PM +0300, Sergei Shtylyov wrote:
> > Hello!
> > 
> > On 01/21/2019 03:01 PM, Magnus Damm wrote:
> > 
> > >> On Mon, Jan 21, 2019 at 12:49 PM Magnus Damm <magnus.damm@gmail.com> wrote:
> > >>> Remove undocumented IMR-LX4 device nodes
> > >>>
> > >>> [PATCH/RFC 01/02] arm64: dts: renesas: r8a7795: Remove IMR-LX4 device nodes
> > >>> [PATCH/RFC 02/02] arm64: dts: renesas: r8a7796: Remove IMR-LX4 device nodes
> > >>>
> > >>> These patches take the easy way out and simply remove the undocumented
> > >>> IMR-LX4 device nodes from the upstream tree. Good or bad, let me know!
> > >>>
> > >>> So perhaps this is a bit overly aggressive but since the DT bindings seem
> > >>> undocumented and no driver exists in upstream my gut feeling says these DT
> > >>> nodes were part of an upstreaming attempt that got suspended half-way through.
> > >>>
> > >>> In case DT binding documentation is in-flight and queued up somewhere
> > >>> (ideally together with a driver) then feel free to ignore this series.
> > >>>
> > >>> Instead of removing nodes we could also document the DT bindings for the
> > >>> IMR-LX4 devices. It would also make sense to add device nodes to other
> > >>> more recent SoCs than just H3 and M3-W. But blindly adding more DT nodes
> > >>> with a DT binding but without a driver seems a bit suboptimal compared to
> > >>> testing against an actual driver.
> > >>
> > >> [PATCH v5] media: platform: Renesas IMR driver
> > >> https://lore.kernel.org/linux-renesas-soc/20170309200818.786255823@cogentembedded.com/
> > > 
> > > Thanks, but that seems to be from 2017! =)
> > 
> >    I dropped the ball there, as I was tasked with upstreaming V3x support...
> > The last thing done about the IMR driver was talking to Hans in Prague in
> > 2017.  I'm planning to return to the driver after I'm done with the
> > HyperFlash driver.
> 
> Hi Sergei,
> 
> I appreciate that we are not always in control of our own priorities,
> indeed I sympathise with that predicament. However, we shouldn't really
> be in a situation where DT is making use of undocumented bindings.
> 
> I would like to ask for the bindings to be documented in the upstream
> kernel in the near future. And if that is not possible I believe we
> should consider temporarily removing their use in DT in the upstream kernel.

Hi Sergei,

about two months have passed since Magnus posted this series.
Do you have a timeline to address the problems? If so I believe
that the way forward should be to apply this series. The topic
can always be readdressed in future.
