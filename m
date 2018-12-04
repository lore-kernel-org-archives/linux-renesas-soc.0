Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vs1-f67.google.com ([209.85.217.67]:38846 "EHLO
        mail-vs1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726084AbeLDRhK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 4 Dec 2018 12:37:10 -0500
Received: by mail-vs1-f67.google.com with SMTP id x64so10324623vsa.5
        for <linux-renesas-soc@vger.kernel.org>; Tue, 04 Dec 2018 09:37:09 -0800 (PST)
MIME-Version: 1.0
References: <20181125144031.4407-1-laurent.pinchart+renesas@ideasonboard.com> <20181125144031.4407-5-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20181125144031.4407-5-laurent.pinchart+renesas@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 4 Dec 2018 18:36:56 +0100
Message-ID: <CAMuHMdXq7vyo6WF1L8JigX_=HKbBSQdoMJB5hpUmyXrE0O1oTw@mail.gmail.com>
Subject: Re: [PATCH 4/5] arm64: dts: renesas: r8a77995: draak: Add backlight
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: DRI Development <dri-devel@lists.freedesktop.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Sun, Nov 25, 2018 at 3:40 PM Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
> Add the backlight device for the LVDS1 output, in preparation for panel
> support.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
