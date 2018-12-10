Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vs1-f68.google.com ([209.85.217.68]:40231 "EHLO
        mail-vs1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727654AbeLJMaf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Dec 2018 07:30:35 -0500
Received: by mail-vs1-f68.google.com with SMTP id z3so6495991vsf.7
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Dec 2018 04:30:35 -0800 (PST)
MIME-Version: 1.0
References: <20181125144031.4407-1-laurent.pinchart+renesas@ideasonboard.com>
 <20181125144031.4407-5-laurent.pinchart+renesas@ideasonboard.com> <CAMuHMdXq7vyo6WF1L8JigX_=HKbBSQdoMJB5hpUmyXrE0O1oTw@mail.gmail.com>
In-Reply-To: <CAMuHMdXq7vyo6WF1L8JigX_=HKbBSQdoMJB5hpUmyXrE0O1oTw@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Dec 2018 13:30:22 +0100
Message-ID: <CAMuHMdUKxTVuroRuwQCWp9OZufJKRSM-dN_ee0zKj9OhNy273Q@mail.gmail.com>
Subject: Re: [PATCH 4/5] arm64: dts: renesas: r8a77995: draak: Add backlight
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: DRI Development <dri-devel@lists.freedesktop.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Laurent,

On Tue, Dec 4, 2018 at 6:36 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Sun, Nov 25, 2018 at 3:40 PM Laurent Pinchart
> <laurent.pinchart+renesas@ideasonboard.com> wrote:
> > Add the backlight device for the LVDS1 output, in preparation for panel
> > support.
> >
> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Oops, seems I missed the backlight node should be moved up, to preserve
sort order.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
