Return-Path: <SRS0=7Xuf=PR=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF5EFC43387
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  9 Jan 2019 16:03:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9BEEF20660
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  9 Jan 2019 16:03:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=linaro.org header.i=@linaro.org header.b="hoyV3r8D"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731635AbfAIQDZ (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 9 Jan 2019 11:03:25 -0500
Received: from mail-ot1-f68.google.com ([209.85.210.68]:32974 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731192AbfAIQDZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 9 Jan 2019 11:03:25 -0500
Received: by mail-ot1-f68.google.com with SMTP id i20so7150786otl.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 09 Jan 2019 08:03:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qvSihNUV/cz6DfLXn2x2D84aOhJ3bruEHah1YZHAPeE=;
        b=hoyV3r8DvfN7LoZJesdAwRfOTiMxGW9EnzzzLF+ZC6uFc2GaeKU9pqIFMK9UDUoHSY
         8+AB8gyN7SQ4uWhZAry/aWywaBLd9gxsgzoQ8KWSZzhUDgNf4+D5w5Wux1OjUyKufK+f
         gfht1C7EepUZNeWbckBN/eI9mMGG93lDLBJfE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qvSihNUV/cz6DfLXn2x2D84aOhJ3bruEHah1YZHAPeE=;
        b=pszkp+7EfYyQXWxnitz5L74BSvSJXAUnhzzyzIZlV5ngLoELWf0m7MMwUF9rEAijoa
         urn6c1wheFLyvxPcev8mSl+Li/Yr+LRzRZcwYpowwCQ4pQHareCcJ9Yfi0e+nQp6Nro2
         zApg8GqfJg67rIy7Q5aTdPut6Fh2zLk2+qDjf2ngtNveNWUvcMwj6OVXU3C/6lA9YNXW
         abl/I0vEnNR94uTmzKlVEn2qQnd2Tn9PAmtGeXcKdbOni8EZqyHLSm44hGPeo3BcnKBV
         SS5EnnAvIanbhCGLdlWApwVzD9/c3QqC9tlsyL/SUd2YIKaMeHPTI0GJKKqpTaDuRXY+
         P+wQ==
X-Gm-Message-State: AJcUukf/KnKoBrqmbmu+XREb4c19f1g3/hnO5Ob92EgctIE3A7pMzKfQ
        bSjq5Xat+9150MaSrUtE1kjiCU2sisX77xSL9J4V4g==
X-Google-Smtp-Source: ALg8bN7ywL5T2BmuHLikqTSt9cXw1SudeVcWO7rW/Fi15qmcDGKw22I7tSh2AsHwPVSO1FJRBgsndbo18C9ob35Yxok=
X-Received: by 2002:a9d:5617:: with SMTP id e23mr4077758oti.151.1547049804048;
 Wed, 09 Jan 2019 08:03:24 -0800 (PST)
MIME-Version: 1.0
References: <20190103094211.28473-1-geert+renesas@glider.be> <acd10959-a781-d3bf-dc67-bda878740ec9@redhat.com>
In-Reply-To: <acd10959-a781-d3bf-dc67-bda878740ec9@redhat.com>
From:   Peter Maydell <peter.maydell@linaro.org>
Date:   Wed, 9 Jan 2019 16:03:12 +0000
Message-ID: <CAFEAcA9jk1ocW8h33-f9mRM52mT96o+bviaRe6MRErkyxBtqYQ@mail.gmail.com>
Subject: Re: [PATCH QEMU v5] hw/arm/sysbus-fdt: Add support for instantiating
 generic devices
To:     Auger Eric <eric.auger@redhat.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
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

On Wed, 9 Jan 2019 at 15:55, Auger Eric <eric.auger@redhat.com> wrote:
>
> Hi Geert,
>
> On 1/3/19 10:42 AM, Geert Uytterhoeven wrote:
> > Add a fallback for instantiating generic devices without a type-specific
> > or compatible-specific instantiation method.  This will be used when no
> > other match is found.
> >
> > Generic device instantiation avoids having to write device-specific
> > instantiation methods for each and every "simple" device using only a
> > set of generic properties.  Devices that need more specialized handling
> > can still provide their own instantiation methods.

> > +    /* Ignoring the following may or may not work, hence the warning */
> > +    { "gpio-ranges",     PROP_WARN },   /* no support for pinctrl yet */
> > +    { "dmas",            PROP_WARN },   /* no support for external DMACs yet */
> I would be tempted to simply reject things that may not work.

More generally, this whole feature seems to be "allow things that
might not work", isn't it? Otherwise we could just have explicit
whitelists for the devices we want to allow passthrough of and
that we've tested to work.

I have to say I'm not really very enthusiastic about
enhancing this to allow random device passthrough,
because it encourages further use of this. If people
want hardware that can be passed through they should
put it behind a bus that can be probed and can go
behind an IOMMU, ie pci or some equivalent. That
is a supportable hardware mechanism. All this
machinery feels very heath-robinson...

thanks
-- PMM
