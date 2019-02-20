Return-Path: <SRS0=Daww=Q3=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D16D1C43381
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 20 Feb 2019 19:54:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9DEC72086A
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 20 Feb 2019 19:54:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725806AbfBTTye (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 20 Feb 2019 14:54:34 -0500
Received: from mail-ua1-f66.google.com ([209.85.222.66]:44865 "EHLO
        mail-ua1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725798AbfBTTye (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 20 Feb 2019 14:54:34 -0500
Received: by mail-ua1-f66.google.com with SMTP id v9so8663172uar.11
        for <linux-renesas-soc@vger.kernel.org>; Wed, 20 Feb 2019 11:54:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TUzowNOEMvtJzG78eSaKZiRNXsPark9DdbpYihCbK10=;
        b=LdlW481+WzQNlQV0EK9iB8yfJZePj3RsryRy5bznI/0KcTO/i0f8fQlS2m0r9gsm+I
         pRJ+4JW42AJX3CwaNPzGsPqq3fAeGsPeFLYaB9lu/msxj1d0hkMZFrzXBQhyo48GAbDS
         BKZOwUn39H6hEIMUvtr75nx38TNVgoK6+YRtM3MlaPSIjLKzdm49pfw2CK6/Wgr5DHSc
         lGGiv+FxYiREO9/KETSRxM3yN0h76UvMHjqKYg4IHpW40Ibj3T/07WA0KDc8FFQpL7qV
         jEWi3/lKf03i/Nb5yN/ekbUwRit6C2i5UH82/OmK1v1CH6b3ef6jlXiBn6bXFzX6wked
         14QQ==
X-Gm-Message-State: AHQUAuZHMzGkSN8OAdaOfN91tyQsRgspohv1WJh05Ab65mOPCw5zHwXF
        WuvS5SX0u7wzhTC4Ttl5yqqISWPLsO5blVE5DLA=
X-Google-Smtp-Source: AHgI3IavH6VKZT6jCqqFWVS4oJv2RE2HPYAY990+zjp8ciRSW3ILa4+aXXx3eFjN2Y9q5C3HH/wEmAGyVCD7yLKJI54=
X-Received: by 2002:a9f:30dc:: with SMTP id k28mr11826773uab.75.1550692473183;
 Wed, 20 Feb 2019 11:54:33 -0800 (PST)
MIME-Version: 1.0
References: <155067454871.15971.12157033067057246708.sendpatchset@octo> <155067457726.15971.1787990365004385103.sendpatchset@octo>
In-Reply-To: <155067457726.15971.1787990365004385103.sendpatchset@octo>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 20 Feb 2019 20:54:21 +0100
Message-ID: <CAMuHMdVveNfGae3LghKpzR+X4hUs1YXX_ffkc9sUSMSHZXLGwg@mail.gmail.com>
Subject: Re: [PATCH/RFC 03/09] iommu/ipmmu-vmsa: Introduce keepipmmu boot parameter
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
> Introduce a keepipmmu boot paramenter to let the user override.
>
> Not-Yet-Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
> ---
>
>  drivers/iommu/ipmmu-vmsa.c |   14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
>
> --- 0004/drivers/iommu/ipmmu-vmsa.c
> +++ work/drivers/iommu/ipmmu-vmsa.c     2019-02-20 23:17:54.038850305 +0900
> @@ -759,6 +759,17 @@ static int ipmmu_init_platform_device(st
>         return 0;
>  }
>
> +
> +static int keep_ipmmu;
> +
> +static int __init keepipmmu_setup(char *__unused)
> +{
> +       keep_ipmmu = 1;
> +       return 1;
> +}
> +
> +__setup("keepipmmu", keepipmmu_setup);

Documentation/admin-guide/kernel-parameters.txt shows other IOMMUs
implement binary parameters, which allow to override the default, to
disable or enable the IOMMU.

Perhaps you want the default to be enabled when running in HYP mode,
so the IPMMU can be used for KVM+VFIO device pass-through?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
