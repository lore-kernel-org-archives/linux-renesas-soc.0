Return-Path: <SRS0=FLKL=Q2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0
	tests=HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB392C43381
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 19 Feb 2019 10:56:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 95DFE21917
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 19 Feb 2019 10:56:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727628AbfBSK4f (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 19 Feb 2019 05:56:35 -0500
Received: from mail-vs1-f65.google.com ([209.85.217.65]:42060 "EHLO
        mail-vs1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725763AbfBSK4f (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 19 Feb 2019 05:56:35 -0500
Received: by mail-vs1-f65.google.com with SMTP id b20so11408230vsl.9
        for <linux-renesas-soc@vger.kernel.org>; Tue, 19 Feb 2019 02:56:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aBXD3rWRJfGxs5SbbHGFbAnlRDHOwUWZrbX5iOWsOY4=;
        b=S1PlOmbewNqvwauhr07FnOcC0dkSfqyVYz1fLoWDu9vw8bO2SgtHgU8PCluagquBZo
         ALVCXb5qyPNT/oWjuf/Uv2TWxBvlGmSfFbzVwN2hCntVH0QdyDRaVQ6M7JXYNzZinH5R
         iDdWIB1ZS07TyJlEG20sGhlrHaJf57Dxvn/wB3lgqwn75mT5bW/WRdec0HjJij785waN
         b8bVRTWLgQZ04lot5lIB9/rOdTkpikTe0XDDtjonLPXymZTXN+lnhdYq2KyZegGv+aTP
         vWag4lcjg+14sEZGlOuEECr9M0axjYEINWrrOb1wl8w1t/++NRvz0cihaRyS0NhQK7Pj
         R6Rw==
X-Gm-Message-State: AHQUAuaycg6w1tXx9/Gf9AS76Caj4ofpkabffRP212UsV+tUO0rBMj4x
        GSVfMIvI3H1QkNQmTlDiNETHwr4wELERIWhY5a1qWryG
X-Google-Smtp-Source: AHgI3IYJIrdaAgy3przt1lTfUPDOze5YHtBGIQkX2OCLAP4TJE602pcgeHSFRChELsYPsQUGy887UNsWt2CXIOzw/co=
X-Received: by 2002:a67:78ce:: with SMTP id t197mr13734797vsc.152.1550573794175;
 Tue, 19 Feb 2019 02:56:34 -0800 (PST)
MIME-Version: 1.0
References: <1663509.2FqCFAqz4G@avalon> <CAMuHMdXG7PyN1UOPwNBJ=48NKv=V6bku3ZsQ40TbDZNZmr4UDQ@mail.gmail.com>
In-Reply-To: <CAMuHMdXG7PyN1UOPwNBJ=48NKv=V6bku3ZsQ40TbDZNZmr4UDQ@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 19 Feb 2019 11:56:22 +0100
Message-ID: <CAMuHMdXExtxrDkMTsHvCUBsmH=vatjFEZpEu7QtrLwyUP2Sd6Q@mail.gmail.com>
Subject: Re: [GIT PULL FOR renesas-drivers] R-Car DU IOMMU
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Laurent,

On Tue, Nov 20, 2018 at 1:42 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Wed, Nov 15, 2017 at 8:13 AM Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
> > The following changes since commit d65d31388a23b14df9494135ad6c6549a59a3caa:
> >
> >   Merge tag 'drm-misc-next-fixes-2017-11-07' of git://anongit.freedesktop.org/
> > drm/drm-misc into drm-next (2017-11-08 05:22:49 +1000)
> >
> > are available in the git repository at:
> >
> >   git://linuxtv.org/pinchartl/media.git drm-du-iommu-v1-20171115
> >
> > for you to fetch changes up to 6cb711c0fabae1101bfde1c8dce0dfd992822f6b:
> >
> >   drm: rcar-du: Allow importing non-contiguous dma-buf with VSP (2017-11-15
> > 09:00:43 +0200)
>
> The above branch has been included in renesas-drivers for one year,
> unchanged.  Surprisingly, it still merged in cleanly, without any merge
> conflicts.
>
> Are there any plans to continue development, and/or submit it for
> upstream integration? If not, should it be dropped?

Given this now fails to compile (missing #include <linux/dma-mapping.h>),
I have used that as an excuse to drop this topic branch from today's
renesas-drivers.

Thanks for your understanding ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
