Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f67.google.com ([209.85.214.67]:34079 "EHLO
        mail-it0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751881AbdEVNA3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 May 2017 09:00:29 -0400
Received: by mail-it0-f67.google.com with SMTP id d68so13454522ita.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 May 2017 06:00:29 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <b6e8a637-94af-80f0-c438-816648c2d8fa@ideasonboard.com>
References: <20170516232007.20980-1-laurent.pinchart+renesas@ideasonboard.com>
 <20170516232007.20980-6-laurent.pinchart+renesas@ideasonboard.com>
 <b21c3600-ae8e-f384-08f7-cb4229064259@ideasonboard.com> <9845041.8ItKJssoTO@avalon>
 <b6e8a637-94af-80f0-c438-816648c2d8fa@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 22 May 2017 15:00:27 +0200
Message-ID: <CAMuHMdUxVTrQiROtq_aEaQDsPUVt697FBFTPrO_KKfeQAa+CXg@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] drm: rcar-du: Map memory through the VSP device
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, May 22, 2017 at 2:52 PM, Kieran Bingham
<kieran.bingham@ideasonboard.com> wrote:
> My only distaste there is having to then add the [i-1] index to the sg_tables.
>
> I have just experimented with:
>
> fail:
>         for (; i-- != 0;) {
>                 struct sg_table *sgt = &rstate->sg_tables[i];
>                 ...
>         }
>
> This performs the correct loops, with the correct indexes, but does the
> decrement in the condition offend coding styles ?
>
> If that's disliked even more I'll just apply your suggestion.

You can still use "i-- > 0", which looks a little bit better IMHO.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
