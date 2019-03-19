Return-Path: <SRS0=zxXW=RW=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6CD9C43381
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 19 Mar 2019 13:35:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8E0712083D
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 19 Mar 2019 13:35:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726717AbfCSNfA (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 19 Mar 2019 09:35:00 -0400
Received: from mail-vs1-f65.google.com ([209.85.217.65]:39911 "EHLO
        mail-vs1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726573AbfCSNe7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 19 Mar 2019 09:34:59 -0400
Received: by mail-vs1-f65.google.com with SMTP id g127so4617619vsd.6
        for <linux-renesas-soc@vger.kernel.org>; Tue, 19 Mar 2019 06:34:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=54/t2zCCemL7bBHnQLUNoYeHb+cR/8pZd/AO4feAo0I=;
        b=qJq7HXsrnpjQgTF307dLlJceZ4Qv2u8BVP+F0KUVas7z5N6F5aTl5gbkgpJXfRuoKV
         z2kDJDIo6wmTYvsIf+W2mCuwUrBCqaPt5mhO5xJuyqV1yq/nsxca9goNchQ5C+D0TZec
         rBCeIUU+Vh9iOnQ9EYLfg8ZWEa2+0kxAbOKDAc8OA28aZqHdhUdXGef9aJMGXubyQ6KP
         OWJazvHUiQUCtDYG2hwx+uGaic9nR51dcd3B+R9CozNBy7vg8TEyirTxsJLHG/YwN3FC
         7awDONKZ6JwdaaigAXrfxC46A3fI82095+cZFBWbh6Nhg32yt3nuZu2xzAZ36Rr5+228
         SS+g==
X-Gm-Message-State: APjAAAUjDuUKnyNwp/VmLbUdkKNdvFre2vc6+UH5bChP5ANmvEUNoljN
        9XtI7kickZtwt0daHE1yiasomcifCdcyYAg4X6c=
X-Google-Smtp-Source: APXvYqxMpZezXpMoNoV7wEmWfvxR/4tJBs2VemIZA75drZSHVinC3RBfHVVD+RGWQyoBmty5VcKZOdCGvQsioW/sa5o=
X-Received: by 2002:a67:8588:: with SMTP id h130mr1436344vsd.11.1553002498729;
 Tue, 19 Mar 2019 06:34:58 -0700 (PDT)
MIME-Version: 1.0
References: <155300190865.2469.7364392263486575447.sendpatchset@octo>
In-Reply-To: <155300190865.2469.7364392263486575447.sendpatchset@octo>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 19 Mar 2019 14:34:47 +0100
Message-ID: <CAMuHMdWKVc34NGATrJggQgutRbzKhh82S4=6tp6ZOcMz0w5ASA@mail.gmail.com>
Subject: Re: [PATCH/RFC V2] iommu/ipmmu-vmsa: Disable IPMMU when address
 expansion is not needed
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Magnus,

On Tue, Mar 19, 2019 at 2:24 PM Magnus Damm <magnus.damm@gmail.com> wrote:
> From: Magnus Damm <damm+renesas@opensource.se>
>
> Add a memory bank location check to the whitelist handling.
>
> Signed-off-by: Magnus Damm <damm+renesas@opensource.se>

Thanks for your patch!

> --- 0001/drivers/iommu/ipmmu-vmsa.c
> +++ work/drivers/iommu/ipmmu-vmsa.c     2019-03-19 21:04:43.000000000 +0900
> @@ -17,6 +17,7 @@
>  #include <linux/io.h>
>  #include <linux/io-pgtable.h>
>  #include <linux/iommu.h>
> +#include <linux/memblock.h>
>  #include <linux/of.h>
>  #include <linux/of_device.h>
>  #include <linux/of_iommu.h>
> @@ -797,6 +798,12 @@ static bool ipmmu_slave_whitelist(struct
>         if (!soc_device_match(soc_rcar_gen3_whitelist))
>                 return false;
>
> +       /* In case all system memory fits within 32 bits of physical space
> +        * then assume the IPMMU will not be needed for address expansion.
> +        */
> +       if (memblock_end_of_DRAM() <= SZ_4G)
> +               return false;

The IPMMU may still be useful for IO virtualization, with KVM+VFIO.

Perhaps the check can be enhanced to keep it enabled when the CPU cores
are running in HYP mode?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
