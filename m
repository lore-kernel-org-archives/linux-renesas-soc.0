Return-Path: <SRS0=Daww=Q3=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD542C43381
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 20 Feb 2019 16:10:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B22EF2084D
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 20 Feb 2019 16:10:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726152AbfBTQKI (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 20 Feb 2019 11:10:08 -0500
Received: from mail-vs1-f66.google.com ([209.85.217.66]:39015 "EHLO
        mail-vs1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725842AbfBTQKI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 20 Feb 2019 11:10:08 -0500
Received: by mail-vs1-f66.google.com with SMTP id w14so7291163vso.6
        for <linux-renesas-soc@vger.kernel.org>; Wed, 20 Feb 2019 08:10:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Y55sBTf4+cdPCQk24jN+l3bbM+pSdGPL658thckHnDo=;
        b=G82dNzvitZTJmupUezDZNiHLtFYsNZ1edO7ah4naZAd89kmrGfik6WUnRPXX0DVsMk
         pASxkUn2Tn0v7SgKtESyHWWWg4K98MxmV/mK/qduAOBRdx6HvaePM9mwj9GWTDaaiwAr
         pqFd6BrtZR4lXg/DlS1V5KfsAF8g60Harjovd9fu+y8GXCwDwQtMAvRDrA1EzHY9KQAP
         eQ5iF0kgRQjqlPoEwqrp7XQc5/XHTZjzKQr99jN8PEngzNHRPQpoqccp3QAuIy5fyr3v
         EFdM4INzUh7Lw4jWtxkXo2sf7uS4fcQ+DDIQmVKy/b1soaegci5i7KtcZh1VhiSWPWGS
         zecw==
X-Gm-Message-State: AHQUAuZF9bCB5gqMMVGDxTw6Dkx+IHmjYb90SYj2LVPp4txaJ2KyLaq0
        O8bidAsa5RxBHOiLPUzg10Q8SxPOpMLHFC0eec8k6Q==
X-Google-Smtp-Source: AHgI3IY0J/8f/VLmw9FH8U0gPkj0U+GkbtTcgbrsTTz7kqji1b3hWy/JMbcV+eOJL4Rejk268u1wXHlp/8F/DorJl9I=
X-Received: by 2002:a67:fc9a:: with SMTP id x26mr894070vsp.166.1550679007277;
 Wed, 20 Feb 2019 08:10:07 -0800 (PST)
MIME-Version: 1.0
References: <155067454871.15971.12157033067057246708.sendpatchset@octo> <155067455863.15971.400236990712480655.sendpatchset@octo>
In-Reply-To: <155067455863.15971.400236990712480655.sendpatchset@octo>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 20 Feb 2019 17:09:54 +0100
Message-ID: <CAMuHMdU0ncCg7MXS7XTmiDX42bXE0Wj6RLvd0GddNA3R+Bawaw@mail.gmail.com>
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

On Wed, Feb 20, 2019 at 3:55 PM Magnus Damm <magnus.damm@gmail.com> wrote:
> From: Magnus Damm <damm+renesas@opensource.se>
>
> Add a memory bank location check to the whitelist handling.
>
> Signed-off-by: Magnus Damm <damm+renesas@opensource.se>

Thanks for your patch!

> --- 0001/drivers/iommu/ipmmu-vmsa.c
> +++ work/drivers/iommu/ipmmu-vmsa.c     2019-02-20 22:59:28.589893396 +0900

> @@ -797,6 +798,12 @@ static bool ipmmu_slave_whitelist(struct
>         if (!soc_device_match(soc_rcar_gen3_whitelist))
>                 return false;
>
> +       /* In case all system memory fits within 32 bits of physical space
> +        * then assume the IPMMU will not be needed for address expansion.
> +        */
> +       if (memblock_end_of_DRAM() <= SZ_4G)

Can this give a compiler warning on arm32 when CONFIG_ARM_LPAE=n?

> +               return false;
> +
>         /* Check whether this slave device can work with the IPMMU */
>         for (i = 0; i < ARRAY_SIZE(rcar_gen3_slave_whitelist); i++) {
>                 if (!strcmp(dev_name(dev), rcar_gen3_slave_whitelist[i]))

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
