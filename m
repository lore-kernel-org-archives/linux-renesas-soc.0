Return-Path: <SRS0=zxXW=RW=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 562BFC43381
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 19 Mar 2019 13:47:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 043872085A
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 19 Mar 2019 13:47:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f6qcGwMa"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726464AbfCSNrv (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 19 Mar 2019 09:47:51 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:33080 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725951AbfCSNrv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 19 Mar 2019 09:47:51 -0400
Received: by mail-wr1-f67.google.com with SMTP id q1so5567178wrp.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 19 Mar 2019 06:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zckDbhFsX2DjwhmNSH/VNtEDRMtmqK/SoBMmg2lIdvM=;
        b=f6qcGwMasVpX5AM9ixQWdtpbYV54hJlSSo2lhJBb+no2lsDbK4T+1KuwrV7tPenLtu
         6sB9Ippf6ZtokeEW3Y0jJzIm8YhZEoZGdOn98wmwph6+yLBBeiO2JX5DzQ/qr4ce6SF7
         3qEMk+31y5+8FR3XaGptSQjGmCYxqtxNoJrZzSU3JHH63R7/C2jlejrcfTi3wLO4oHN5
         CT6S3ZsEV9ofPBcrHyprp/cupoyhRWa8MPskBW290SAvB3lwK54hILlC5bmllli6lqFI
         nImKqnRI0b2CL39QRsy5GXVmHSOGpEu7THgv85vWLGaLKwgcE16NRiSMe2IvwGaybTMx
         dmkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zckDbhFsX2DjwhmNSH/VNtEDRMtmqK/SoBMmg2lIdvM=;
        b=rq10Dxyf0t4cnD2B4rrJ5iPZCALcKFN8LQXD/Uzxz4X2P9B0RY1etrwuOIo8+p+SC9
         9eS0j17ITCBqnQvfBSaBGZiKgD6FjRAeA1lHC8YM+qpDbcao8BlEJrvf+obLtSaVP7tr
         D1L/RWjdkSL6hUQCZRhDkej41R181nPhAoL+y6e44tGtJluJRwFhllos066GxjVPUqlw
         //fR328ZYL5WQkEkFgCaAIQWP5cN1IwjwBo/HakntkFAn0+E5eRJGSG807YUGueqRgYB
         bMMt60qDX+yyyBDuisjG+r5XkuC5fFRJb7oOoKIB2AqMWhwFYPdmIfjj19ELX/BbxC3V
         Ej3w==
X-Gm-Message-State: APjAAAUw/LdKOPa78tVTecg8/VnOqvzxC/fOwbf0DTEeIlxr/Kgoi/yV
        WgqD/vhdTQj/CidallseW/s7BL+CxNw15wlFRHqLodGE
X-Google-Smtp-Source: APXvYqzIxU6Deo25Bxtoa2KVAvHWO0/P2xIpa4hmYgq7HRJy8Dqd7/JW/YQv0YsolzNT2cxoEg6uV+YuYv7zSkqLKrM=
X-Received: by 2002:adf:ce8f:: with SMTP id r15mr6920328wrn.90.1553003269833;
 Tue, 19 Mar 2019 06:47:49 -0700 (PDT)
MIME-Version: 1.0
References: <155300190865.2469.7364392263486575447.sendpatchset@octo> <CAMuHMdWKVc34NGATrJggQgutRbzKhh82S4=6tp6ZOcMz0w5ASA@mail.gmail.com>
In-Reply-To: <CAMuHMdWKVc34NGATrJggQgutRbzKhh82S4=6tp6ZOcMz0w5ASA@mail.gmail.com>
From:   Magnus Damm <magnus.damm@gmail.com>
Date:   Tue, 19 Mar 2019 22:47:38 +0900
Message-ID: <CANqRtoT6pvnMi9sY8Wat1AArpGwc_uEthA8mjNQ9zGvm823JPg@mail.gmail.com>
Subject: Re: [PATCH/RFC V2] iommu/ipmmu-vmsa: Disable IPMMU when address
 expansion is not needed
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

On Tue, Mar 19, 2019 at 10:34 PM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
>
> Hi Magnus,
>
> On Tue, Mar 19, 2019 at 2:24 PM Magnus Damm <magnus.damm@gmail.com> wrote:
> > From: Magnus Damm <damm+renesas@opensource.se>
> >
> > Add a memory bank location check to the whitelist handling.
> >
> > Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
>
> Thanks for your patch!
>
> > --- 0001/drivers/iommu/ipmmu-vmsa.c
> > +++ work/drivers/iommu/ipmmu-vmsa.c     2019-03-19 21:04:43.000000000 +0900
> > @@ -17,6 +17,7 @@
> >  #include <linux/io.h>
> >  #include <linux/io-pgtable.h>
> >  #include <linux/iommu.h>
> > +#include <linux/memblock.h>
> >  #include <linux/of.h>
> >  #include <linux/of_device.h>
> >  #include <linux/of_iommu.h>
> > @@ -797,6 +798,12 @@ static bool ipmmu_slave_whitelist(struct
> >         if (!soc_device_match(soc_rcar_gen3_whitelist))
> >                 return false;
> >
> > +       /* In case all system memory fits within 32 bits of physical space
> > +        * then assume the IPMMU will not be needed for address expansion.
> > +        */
> > +       if (memblock_end_of_DRAM() <= SZ_4G)
> > +               return false;
>
> The IPMMU may still be useful for IO virtualization, with KVM+VFIO.

You're right.

> Perhaps the check can be enhanced to keep it enabled when the CPU cores
> are running in HYP mode?

That might indeed be useful.

Next quarter perhaps you and I can discuss a bit about IO
virtualization with KVM?

Cheers,

/ magnus
