Return-Path: <SRS0=7Xuf=PR=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 464FAC43387
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  9 Jan 2019 16:30:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1DD2E2054F
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  9 Jan 2019 16:30:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725681AbfAIQab (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 9 Jan 2019 11:30:31 -0500
Received: from mail-vs1-f65.google.com ([209.85.217.65]:46574 "EHLO
        mail-vs1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726297AbfAIQab (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 9 Jan 2019 11:30:31 -0500
Received: by mail-vs1-f65.google.com with SMTP id n10so5088439vso.13
        for <linux-renesas-soc@vger.kernel.org>; Wed, 09 Jan 2019 08:30:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jXg3RV9rboq4joqRbbYJIcCPrGYBg3tnnPQlBKYsoi8=;
        b=PGLCwQBvrRQEk9mbyz0YvSGZYWK7FHxuESmccS7C43Hoxe3/gvSvs1UUNFTIyrtE2p
         eCQefPmv6S39d9GqpJOsxiaeik/Z4F7ghE4qsW1AXSWv87H6ZefhPP91tfzWcAC5fzxi
         yBEuUxvUOe/w/pL5E7NpC+bxTBvltDvE5Ifi2XE3wHthYXOF8XLw3uRbdKc5QwcPNIPw
         bWXTscQtrfeKkDmguq2skvfxaAMfsXzitfrUVIvUCZBiV6t+3vwBgIUFoXyyMhB4aZr3
         LZ410BhWumJEt6muwvDOzeoFGswsBjxooOaLUMVRFHKHB4lN+dRYrb2r2KbJ07Sd1rrd
         y+aw==
X-Gm-Message-State: AJcUukegNEsSufyl8eizhRobGe1mvY4XvgX5unWa5WckVwgYWVZMvldr
        QIM2aZUiErY9nLME9NnMIGuQGm39b5oBMsl1th8=
X-Google-Smtp-Source: ALg8bN7eznlsNQHggk5jnOIyBYr8bSSZbwTR6IViC7FGCGeDpIaLhU+acoYbW45bmtL0a5MM+tlaCU57C66jW4bbzQE=
X-Received: by 2002:a67:c202:: with SMTP id i2mr2533951vsj.11.1547051428903;
 Wed, 09 Jan 2019 08:30:28 -0800 (PST)
MIME-Version: 1.0
References: <20190103094211.28473-1-geert+renesas@glider.be>
 <acd10959-a781-d3bf-dc67-bda878740ec9@redhat.com> <CAFEAcA9jk1ocW8h33-f9mRM52mT96o+bviaRe6MRErkyxBtqYQ@mail.gmail.com>
In-Reply-To: <CAFEAcA9jk1ocW8h33-f9mRM52mT96o+bviaRe6MRErkyxBtqYQ@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 9 Jan 2019 17:30:15 +0100
Message-ID: <CAMuHMdX6gwnw7RYQNik4QQmfWoTmemMgrUaPuW9Rgd56pW+4jQ@mail.gmail.com>
Subject: Re: [PATCH QEMU v5] hw/arm/sysbus-fdt: Add support for instantiating
 generic devices
To:     Peter Maydell <peter.maydell@linaro.org>
Cc:     Auger Eric <eric.auger@redhat.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Alex Williamson <alex.williamson@redhat.com>,
        Magnus Damm <damm+renesas@opensource.se>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        qemu-arm <qemu-arm@nongnu.org>,
        QEMU Developers <qemu-devel@nongnu.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Peter,

Thanks for your comments!

On Wed, Jan 9, 2019 at 5:03 PM Peter Maydell <peter.maydell@linaro.org> wrote:
> On Wed, 9 Jan 2019 at 15:55, Auger Eric <eric.auger@redhat.com> wrote:
> > On 1/3/19 10:42 AM, Geert Uytterhoeven wrote:
> > > Add a fallback for instantiating generic devices without a type-specific
> > > or compatible-specific instantiation method.  This will be used when no
> > > other match is found.
> > >
> > > Generic device instantiation avoids having to write device-specific
> > > instantiation methods for each and every "simple" device using only a
> > > set of generic properties.  Devices that need more specialized handling
> > > can still provide their own instantiation methods.
>
> > > +    /* Ignoring the following may or may not work, hence the warning */
> > > +    { "gpio-ranges",     PROP_WARN },   /* no support for pinctrl yet */
> > > +    { "dmas",            PROP_WARN },   /* no support for external DMACs yet */
> > I would be tempted to simply reject things that may not work.
>
> More generally, this whole feature seems to be "allow things that
> might not work", isn't it? Otherwise we could just have explicit

I can remove the two PROP_WARN properties above from the list, if you prefer.
Exporting rcar-sata still works fine after that.

> whitelists for the devices we want to allow passthrough of and
> that we've tested to work.

In the end, this will become a loooooong list (SoC x devices)...

> I have to say I'm not really very enthusiastic about
> enhancing this to allow random device passthrough,
> because it encourages further use of this. If people
> want hardware that can be passed through they should
> put it behind a bus that can be probed and can go
> behind an IOMMU, ie pci or some equivalent. That
> is a supportable hardware mechanism. All this
> machinery feels very heath-robinson...

As no-iommu suppport is not upstream (in Qemu; it is upstream in Linux,
perhaps it should be removed?), all devices using DMA require being
behind an IOMMU.

Reality is that on embedded, on-SoC devices are usually not on a PCI bus.
But IOMMUs are present, and virtualization is wanted.

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
