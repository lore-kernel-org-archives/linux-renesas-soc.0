Return-Path: <SRS0=zxXW=RW=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82422C43381
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 19 Mar 2019 14:08:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 58E472075E
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 19 Mar 2019 14:08:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726703AbfCSOIH (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 19 Mar 2019 10:08:07 -0400
Received: from mail-vs1-f65.google.com ([209.85.217.65]:36097 "EHLO
        mail-vs1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726688AbfCSOIH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 19 Mar 2019 10:08:07 -0400
Received: by mail-vs1-f65.google.com with SMTP id n4so2673237vsm.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 19 Mar 2019 07:08:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Qb8fS2luaBqI3y4wu5JjeCQCXzVJCUgRCzCxaI95jKM=;
        b=RKdCEzfVAm8sRbeHNYuW240QYtKVxMDqc6Z9nb34Hhi9zzIv14FWxeBut2ia+BZWpQ
         HZQXmcLf53jm1IpeJY51ub6nhYmNQLJrWdMKBvgcZxX0GexRU/MJ3UjaWMsmImxz5rji
         PG2/qS/5JmGZSN0/w3B7rjbTqs7EO8LzcbtGULmnL0F8wTQQdRNeZwzJqy9i5S3+vbvO
         wiuutARLrLKf2RnQCnFr7eTvNhWWgEbfSNbsUBK5WkBFC8T/82sahou7aPcFlIfRfS5R
         8m5NmQL88yBb9ZtzoG3HEapFMm+wyxbAgRbxik0zWAmoeIdTbEa3V5rLBUdW3V4PYDqH
         X5VQ==
X-Gm-Message-State: APjAAAVYFsUga/uu2oZMxShB+kdNYtLq8BoXeBBsYJxJGL5bxwRjEPcK
        OMF+Cz+htaU46fqpLIadjgEjJO03vgK1xzSERho=
X-Google-Smtp-Source: APXvYqy/j80Mi5mDguaP7je//e514cMtHjjk0Xl5uWXRMHBs6LXctWc3wPGWAIm55Un1k+tdBZHMHkcGaeSafDz+Zy8=
X-Received: by 2002:a67:8588:: with SMTP id h130mr1531873vsd.11.1553004486504;
 Tue, 19 Mar 2019 07:08:06 -0700 (PDT)
MIME-Version: 1.0
References: <155067454871.15971.12157033067057246708.sendpatchset@octo>
 <155067455863.15971.400236990712480655.sendpatchset@octo> <CAMuHMdU0ncCg7MXS7XTmiDX42bXE0Wj6RLvd0GddNA3R+Bawaw@mail.gmail.com>
 <CANqRtoST3OGJMuYfz5ox79eCtOnBgyXp=P6byGa4tx_aSjKDPA@mail.gmail.com>
In-Reply-To: <CANqRtoST3OGJMuYfz5ox79eCtOnBgyXp=P6byGa4tx_aSjKDPA@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 19 Mar 2019 15:07:54 +0100
Message-ID: <CAMuHMdVx2xHZd5HtZs_Xyy+w+_d4VFHdw6cRUX92yk7tv4EfPg@mail.gmail.com>
Subject: Re: [PATCH/RFC 01/09] iommu/ipmmu-vmsa: Disable IPMMU when address
 expansion is not needed
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Magnus,

On Tue, Mar 19, 2019 at 2:45 PM Magnus Damm <magnus.damm@gmail.com> wrote:
> On Thu, Feb 21, 2019 at 1:10 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Wed, Feb 20, 2019 at 3:55 PM Magnus Damm <magnus.damm@gmail.com> wrote:
> > > --- 0001/drivers/iommu/ipmmu-vmsa.c
> > > +++ work/drivers/iommu/ipmmu-vmsa.c     2019-02-20 22:59:28.589893396 +0900
> >
> > > @@ -797,6 +798,12 @@ static bool ipmmu_slave_whitelist(struct
> > >         if (!soc_device_match(soc_rcar_gen3_whitelist))
> > >                 return false;
> > >
> > > +       /* In case all system memory fits within 32 bits of physical space
> > > +        * then assume the IPMMU will not be needed for address expansion.
> > > +        */
> > > +       if (memblock_end_of_DRAM() <= SZ_4G)
> >
> > Can this give a compiler warning on arm32 when CONFIG_ARM_LPAE=n?
>
> Not sure how, can you elaborate?

SZ_4G is 0x100000000ULL, which is always 64-bit.
memblock_end_of_DRAM() returns a physaddr_t, which is 32-bit if
CONFIG_ARM_LPAE=n, in which case the comparison is always true.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
