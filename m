Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vk1-f196.google.com ([209.85.221.196]:35271 "EHLO
        mail-vk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727010AbeIQNCZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Sep 2018 09:02:25 -0400
Received: by mail-vk1-f196.google.com with SMTP id w193-v6so2762725vke.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Sep 2018 00:36:15 -0700 (PDT)
MIME-Version: 1.0
References: <20180914205007.12905-1-kieran.bingham+renesas@ideasonboard.com> <d4feb5d0-7a21-29e6-5761-0ef696d4bc42@ideasonboard.com>
In-Reply-To: <d4feb5d0-7a21-29e6-5761-0ef696d4bc42@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 17 Sep 2018 09:36:03 +0200
Message-ID: <CAMuHMdVKB8+Da4-Zb_wbVGag3id9qv4jQTn2Fbv=U3kKxQHBNQ@mail.gmail.com>
Subject: Re: [GIT PULL FOR renesas-drivers] pinchartl-media/v4l2/vsp1/next
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Kieran,

On Fri, Sep 14, 2018 at 11:04 PM Kieran Bingham
<kieran.bingham@ideasonboard.com> wrote:
> On 14/09/18 21:50, Kieran Bingham wrote:
> > Please consider including this release in renesas-drivers.

> > The following changes since commit 78cf8c842c111df656c63b5d04997ea4e40ef26a:
> >
> >   media: drxj: fix spelling mistake in fall-through annotations (2018-09-12 11:21:52 -0400)
> >
> > are available in the Git repository at:
> >
> >   git://linuxtv.org/pinchartl/media.git pinchartl-media/v4l2/vsp1/next
>
> Sorry - my local reference to laurent's branch snuck in there.
>
> This should of course be:
>
>    git://linuxtv.org/pinchartl/media.git v4l2/vsp1/next

Thanks, merges cleanly into next-20180913.

> > for you to fetch changes up to 4a6fcd855184d0d928bb833f1062bd19a0c9b57a:

However, the above commit hash doesn't match? The diffstat below does.
So far for sending other people's pull requests? ;-)

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
