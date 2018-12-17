Return-Path: <SRS0=IwST=O2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3E9FC43387
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 15:28:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C2A5B2133F
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 15:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1545060482;
	bh=F/knoyJl6IfzJKtn/HJtIGHrt2mdmmwvM7pyk7plagI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=0k0VQdsykhZnS+h6HGpnFZnnYmm6ZQWzsy2v4UwdtU5a0C3MF3MqqF6Wu9K51/fAE
	 xOVZHnVKm+Zp437XiFTPaOiidF3nZnIgl5QaHxM1sHXSgURZo5a7snD2Ij2hHByCTd
	 iUzPDWTn9okHxT0ZQjkkS6z1KsnO22Qpex1MEZKc=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387421AbeLQP2C (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 17 Dec 2018 10:28:02 -0500
Received: from mail.kernel.org ([198.145.29.99]:34930 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727817AbeLQP2C (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Dec 2018 10:28:02 -0500
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E1A33214C6;
        Mon, 17 Dec 2018 15:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1545060481;
        bh=F/knoyJl6IfzJKtn/HJtIGHrt2mdmmwvM7pyk7plagI=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=ooxjpGJNPlIP7SH+iCP/aCeipk+GvJBplEuCmQ4DjpDnY8O14ehb+IBc3FC+TKQNT
         qhF2tQ1cZIsumBxgQ9XCrjVjxPQhPo5Qg7B6Hmhre5vyy0QTdrGPPzanmYsOmxKOsx
         joxVHjxMj4S4kVimXBclyXkMZo307n4zo7Df1oSA=
Received: by mail-qt1-f178.google.com with SMTP id l12so12552516qtf.8;
        Mon, 17 Dec 2018 07:28:00 -0800 (PST)
X-Gm-Message-State: AA+aEWbd3jCBXGO1mk0QOG+QZuqrTMza9cNbthJlsG8cUVmDyi87tqVP
        T2Yut5JhEg4cspmKyQLmyLlAGTJHNnDWhDQUUw==
X-Google-Smtp-Source: AFSGD/VUqLQAfJSi0EszS26ZQT4oZ9X1sVAT/7D3vGHf/oLm9j11XEob56AbY5SoqfUrUJ3RUetyUU9LCLgQRt0t+iY=
X-Received: by 2002:ac8:2d2b:: with SMTP id n40mr13316527qta.38.1545060479988;
 Mon, 17 Dec 2018 07:27:59 -0800 (PST)
MIME-Version: 1.0
References: <20181129130559.66732-1-chris.brandt@renesas.com>
 <20181129130559.66732-3-chris.brandt@renesas.com> <20181212021549.GA26333@bogus>
 <TYXPR01MB1568DD386FE18BD1F985E5178AA70@TYXPR01MB1568.jpnprd01.prod.outlook.com>
 <CAL_Jsq+Ah7Xg0VnEaYyn4giFeQme9r9GyRsFDucq78BP+Cw2=A@mail.gmail.com> <TY2SPR01MB0015C0AC923F1CDEC44061D88AA70@TY2SPR01MB0015.jpnprd01.prod.outlook.com>
In-Reply-To: <TY2SPR01MB0015C0AC923F1CDEC44061D88AA70@TY2SPR01MB0015.jpnprd01.prod.outlook.com>
From:   Rob Herring <robh@kernel.org>
Date:   Mon, 17 Dec 2018 09:27:47 -0600
X-Gmail-Original-Message-ID: <CAL_JsqL5rLb+6Qhet0zqpHuqeU42wsFRJ+S48N0KPg43KxOiDg@mail.gmail.com>
Message-ID: <CAL_JsqL5rLb+6Qhet0zqpHuqeU42wsFRJ+S48N0KPg43KxOiDg@mail.gmail.com>
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

On Wed, Dec 12, 2018 at 12:03 PM Chris Brandt <Chris.Brandt@renesas.com> wrote:
>
> On Wednesday, December 12, 2018 1, Rob Herring wrote:
> > > Not really.
> > > The "QSPI" actually works as a memory mapped SPI (as in, the CPU sees
> > > the QSPI flash as a linear read-only address range).
> >
> > Yes, those controllers are becoming pretty standard.
>
> Ya, my SoCs are not so special any more :(
>
> But, XIP_KERNEL does not seem to be mainstream either.

Part of the problem there is XIP_KERNEL doesn't work with
multi-platform. I think that is mainly due to the dependency on
run-time phys2virt patching. We should fix that such that either we
can set a default phys_offset or possibly we could do some offline
patching.

> > > Therefore, there is no need to know anything about the actually
> > > Flash that is connected, because you are never allowed to interact with
> > it
> > > (or even query it on boot).
> >
> > Okay, but these days u-boot uses DT itself. So how does u-boot know
> > how to set things up? It's going to need to know what controller and
> > flash details.
>
> That's all hand coded at the moment. As these Quad-SPI chips came on the
> market, each vendor had their own way to get in (and out) of these
> modes, and even the protocols were not the same. Sometimes even the same
> flash vendor would do things different form chip to chip. At this point,
> (at least for Renesas) I have u-boot code that at least points you in the
> right direction depending on what flash vendor you go with....but I
> can't guarantee you won't need to do some tweaking.

Seems like DT would help you there...

> > Or how does one do a flash update (in the field)?
> Well....for that there's a "special" driver that I wrote. Basically,
> going back to the ways we've done it with MCU for years: Copy code to RAM,
> shut off interrupts, jump to RAM, do your business, jump back to flash.
>
> Again, tweaking is needed depending on what SPI flash you use, so there
> is no magic 'one driver fits all'.
>
>
> > I think it would be better to have a property to say the flash is
> > already setup and just use it. Or maybe it can be done with
> > compatibles:
> >
> > spi@1234 {
> >   compatible = "vendor,soc-quadspi", "mmio-spi";
> >   flash@0 {
> >     compatible = "some-flash-part", "mtd-rom";
> >   };
> > };
> >
> > Now the problem is how to define the address range as SPI flash
> > devices are already defined to use SPI chip-select numbers. The
> > easiest option from a DT standpoint is just look at the parent reg
> > property and figure out the memory range (typically there are 2 and
> > you want the big one). Or you could have some simple driver that knows
> > which reg range to get for specific compatibles.
>
>
> I'm still confused on why I would want to do this as I want the kernel
> to not know nothing about the underlying HW so it never tries to access
> it any way.
> At the end of the day, all I want is for the kernel to do an ioremap of
> this area for me so my file system (XIP cramfs in this case) can access
> it. "mtd-rom" does this for me today.

And partition layout? If it was only what to map, we could add a
property in chosen or perhaps a reserved-memory node. But I doubt it
will remain that simple. What happens when you have clock management
and need to keep the SPI clock enabled for example.

The other option is just have your platform code instantiate an
mtd-rom device. Either describe the h/w with DT or don't use DT.

> Just FYI, early in boot, the kernel already mapped part of my QSPI into
> virtual memory since we're most likely running an XIP_KERNEL.
>
> While these XIP Linux systems seem to function quiet well, I might need
> to continue to hide some of the inner details from mainline because they
> don't always fit into the direction of the kernel systems (ie, monster
> quad core systems with lots of DDR memory).
>
> The other XIP file system that we use more often (AXFS, not in mainline)
> does not require the partitions in DT at all, so it's really only
> needed when using cramfs. So for now, maybe it would be better to just remove
> this confusing portion of the dts.

What does AXFS have that cramfs doesn't making it not need partitions?

Rob
