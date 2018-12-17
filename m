Return-Path: <SRS0=IwST=O2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 774E9C43387
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 17:01:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4437720874
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 17:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1545066072;
	bh=d7RFdOT+I4+zlnzsZLHSV76vr7cgmyPTr45Jozo+wI0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=qvVLb5X18WykYFSuA+GvmQIseliCLqNHp7HXFp0tv8r28eyYBvytu3mhiMdlMDMXU
	 p/hrdmwlQPDV21Sp3RbcSIFwst2MHmRahoSmwu7NRO5VkLJnehOdDewSrJvSRpmazg
	 +IxZMsIPlFTSkANx3njpePIcUEM0ojCH3eQhc9us=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728051AbeLQRBM (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 17 Dec 2018 12:01:12 -0500
Received: from mail.kernel.org ([198.145.29.99]:57526 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726657AbeLQRBL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Dec 2018 12:01:11 -0500
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E80CB21783;
        Mon, 17 Dec 2018 17:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1545066070;
        bh=d7RFdOT+I4+zlnzsZLHSV76vr7cgmyPTr45Jozo+wI0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=dvDqVv6xCALb3H2BwAQrOwnZQpbglWHYYi3KUS+pFrLwkIu1FUmd60CdkTWtwxyG9
         9yjtBO5g5qmsTR2Sr+D7nW2Xf9IQ9hJidSFE7kkEzC31kpf32nCTgp5ojYaQp9bQy9
         4gNAOZwy0u4EPPq7t1xXch9ocK5LAcNrI58YhoFc=
Received: by mail-qt1-f176.google.com with SMTP id l12so12950994qtf.8;
        Mon, 17 Dec 2018 09:01:09 -0800 (PST)
X-Gm-Message-State: AA+aEWYwrfIEwp7iAy+ngAvgS/R9ZdLgZzluA5BtFLJ5NaWHQDTZcCDL
        vvAkoqdgxtDh+hBNmMVa1h6ndbrfMseOvoRgaQ==
X-Google-Smtp-Source: AFSGD/WzHwQxyxf3PSqMjpD7rqj+Sn2Zbw5lIFMsyz2eIXAgTpbucjkXV2vTaXF8k2y+EX5ilmb3heXRn/JJAeSOiUI=
X-Received: by 2002:ac8:1712:: with SMTP id w18mr14040859qtj.76.1545066069065;
 Mon, 17 Dec 2018 09:01:09 -0800 (PST)
MIME-Version: 1.0
References: <20181129130559.66732-1-chris.brandt@renesas.com>
 <20181129130559.66732-3-chris.brandt@renesas.com> <20181212021549.GA26333@bogus>
 <TYXPR01MB1568DD386FE18BD1F985E5178AA70@TYXPR01MB1568.jpnprd01.prod.outlook.com>
 <CAL_Jsq+Ah7Xg0VnEaYyn4giFeQme9r9GyRsFDucq78BP+Cw2=A@mail.gmail.com>
 <TY2SPR01MB0015C0AC923F1CDEC44061D88AA70@TY2SPR01MB0015.jpnprd01.prod.outlook.com>
 <CAL_JsqL5rLb+6Qhet0zqpHuqeU42wsFRJ+S48N0KPg43KxOiDg@mail.gmail.com> <TYXPR01MB156894C0FEE2A2CF02820A018ABC0@TYXPR01MB1568.jpnprd01.prod.outlook.com>
In-Reply-To: <TYXPR01MB156894C0FEE2A2CF02820A018ABC0@TYXPR01MB1568.jpnprd01.prod.outlook.com>
From:   Rob Herring <robh@kernel.org>
Date:   Mon, 17 Dec 2018 11:00:57 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLkqUTWh7RkG8tdTNhaTOMTOovDstZCqC=croQbAWmJSg@mail.gmail.com>
Message-ID: <CAL_JsqLkqUTWh7RkG8tdTNhaTOMTOovDstZCqC=croQbAWmJSg@mail.gmail.com>
Subject: Re: [PATCH 2/2] ARM: dts: r7s9210-rza2mevb: Add support for RZ/A2M EVB
To:     Chris Brandt <Chris.Brandt@renesas.com>
Cc:     Kumar Gala <kumar.gala@linaro.org>,
        Simon Horman <horms@verge.net.au>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org,
        "open list:MEDIA DRIVERS FOR RENESAS - FCP" 
        <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Dec 17, 2018 at 10:22 AM Chris Brandt <Chris.Brandt@renesas.com> wrote:
>
> On Monday, December 17, 2018 1, Rob Herring wrote:
> > > But, XIP_KERNEL does not seem to be mainstream either.
> >
> > Part of the problem there is XIP_KERNEL doesn't work with
> > multi-platform. I think that is mainly due to the dependency on
> > run-time phys2virt patching. We should fix that such that either we
> > can set a default phys_offset or possibly we could do some offline
> > patching.
>
> Not really. I fixed all of that back in 4.6.
>
> The issue is more of the 'theoretical' kind.
>
> The ARM maintainer defines "multiplatform" as being able to build 1
> binary image that can be run on multiple SoCs.
> But...that won't work when you have to define the ROM/RAM area at
> compile time.
>
> I prefer to think of "multiplatform" as a way of grouping like SoCs
> together (if you need to) and use DT to sort out any differences.

Yes, I'm aware of all that. I did a bunch of the work to enable it.

> Basically, I just need this simple patch in order to build and boot so I
> can test kernel releases:
>
> [arch/arm/Kconfig]
>
> config XIP_KERNEL
>         bool "Kernel Execute-In-Place from ROM"
> -       depends on !ARM_LPAE && !ARCH_MULTIPLATFORM
> +       depends on !ARM_LPAE

Okay, I guess it's not that hard to enable if one wants. Perhaps all

> However...I've given up on trying to get XIP_KERNEL enabled in Kconfig.
> But, of course still keep an eye on all the 'code' in the ARM core to
> make sure no one breaks it.


> > > At the end of the day, all I want is for the kernel to do an ioremap of
> > > this area for me so my file system (XIP cramfs in this case) can access
> > > it. "mtd-rom" does this for me today.
> >
> > And partition layout? If it was only what to map, we could add a
> > property in chosen or perhaps a reserved-memory node. But I doubt it
> > will remain that simple. What happens when you have clock management
> > and need to keep the SPI clock enabled for example.
>
> Yup...there's the killer!
> You'll notice that in mainline RZ/A devices, there is no QSPI driver,
> and also the QSPI clock is left out of the list of HW clocks. Otherwise,
> as you mentioned, that 'unused' clock would get shut off at the end of
> boot...and you're whole system would stop immediately.

If you had a simple driver with the binding as I proposed, then it
could do the ioremap and clock management. And you could also have
specific SPI and flash drivers for when you need to flashing without
changing the DT.

> > The other option is just have your platform code instantiate an
> > mtd-rom device. Either describe the h/w with DT or don't use DT.
>
> You mean in a 'board' file?

Yes.

> BTW, I still use board files for things that are too complicated for DT.

As you should.

> > > The other XIP file system that we use more often (AXFS, not in mainline)
> > > does not require the partitions in DT at all, so it's really only
> > > needed when using cramfs. So for now, maybe it would be better to just
> > remove
> > > this confusing portion of the dts.
> >
> > What does AXFS have that cramfs doesn't making it not need partitions?
>
> For AXFS, you pass in the physical address to your rootfs on the kernel
> command line and then AXFS does the ioreapping itself inside the driver.
>
> When Nicolas Pitre started adding XIP mode to cramfs last year, he also
> started out that way. But, that was rejected (as it was also rejected
> when DAX was first started). The file system people said 'file system
> drives should not have the ability to map physical memory themselves'.

Right, I remember that now.

> Another thing AXFS can do that Cramfs can't do (yet), is AXFS can within
> *each file* select what pages will be XIP, and what ones will be
> compressed. This saves a lot on Flash space when only your executable and
> const pages are left as uncompressed XIP pages.
>
>
> Chris
>
