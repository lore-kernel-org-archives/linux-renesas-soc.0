Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua1-f66.google.com ([209.85.222.66]:36590 "EHLO
        mail-ua1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725843AbeKTXLp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 20 Nov 2018 18:11:45 -0500
Received: by mail-ua1-f66.google.com with SMTP id j3so584681uap.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Nov 2018 04:42:48 -0800 (PST)
MIME-Version: 1.0
References: <1663509.2FqCFAqz4G@avalon>
In-Reply-To: <1663509.2FqCFAqz4G@avalon>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 20 Nov 2018 13:42:36 +0100
Message-ID: <CAMuHMdXG7PyN1UOPwNBJ=48NKv=V6bku3ZsQ40TbDZNZmr4UDQ@mail.gmail.com>
Subject: Re: [GIT PULL FOR renesas-drivers] R-Car DU IOMMU
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Laurent,

Congratulations! ;-)

On Wed, Nov 15, 2017 at 8:13 AM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> The following changes since commit d65d31388a23b14df9494135ad6c6549a59a3caa:
>
>   Merge tag 'drm-misc-next-fixes-2017-11-07' of git://anongit.freedesktop.org/
> drm/drm-misc into drm-next (2017-11-08 05:22:49 +1000)
>
> are available in the git repository at:
>
>   git://linuxtv.org/pinchartl/media.git drm-du-iommu-v1-20171115
>
> for you to fetch changes up to 6cb711c0fabae1101bfde1c8dce0dfd992822f6b:
>
>   drm: rcar-du: Allow importing non-contiguous dma-buf with VSP (2017-11-15
> 09:00:43 +0200)

The above branch has been included in renesas-drivers for one year,
unchanged.  Surprisingly, it still merged in cleanly, without any merge
conflicts.

Are there any plans to continue development, and/or submit it for
upstream integration? If not, should it be dropped?

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
