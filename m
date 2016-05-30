Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f196.google.com ([209.85.223.196]:35963 "EHLO
	mail-io0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1161249AbcE3R3Y (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Mon, 30 May 2016 13:29:24 -0400
Received: by mail-io0-f196.google.com with SMTP id m17so12031695ioi.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 30 May 2016 10:29:18 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1464624020-27709-1-git-send-email-ulrich.hecht+renesas@gmail.com>
References: <1464624020-27709-1-git-send-email-ulrich.hecht+renesas@gmail.com>
Date: Mon, 30 May 2016 19:29:18 +0200
Message-ID: <CAMuHMdU7TX6=EsDQj=-RsT6zXZh0hh6DG_X18dMgVG7bKrVZNw@mail.gmail.com>
Subject: Re: [RFC 00/21] Renesas r8a7795/Salvator-X HDMI output prototype
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	DRI Development <dri-devel@lists.freedesktop.org>,
	Archit Taneja <architt@codeaurora.org>, vz@mleia.com,
	Koji Matsuoka <koji.matsuoka.xm@renesas.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Uli,

On Mon, May 30, 2016 at 5:59 PM, Ulrich Hecht
<ulrich.hecht+renesas@gmail.com> wrote:
> This is a prototype of HDMI output support for the Renesas r8a7795 SoC and
> Salvator-X board.  It is based on the renesas-devel-20160516-v4.6 tree and
> includes the bridge API conversion patches to the adv7511 and rcar-du
> drivers written by Archit Taneja.
>
> The obvious issue with this series is the awkward binding of the dw-hdmi
> bridge IP, which can be seen in the "drm: rcar-du: Add dw_hdmi driver
> startup" patch.  Any comments on how to implement this interface properly
> are much appreciated.
>
> Functionally, this series works as expected on both connectors, but EDID
> reading is currently broken.

JFTR, I don't think any of these patches should carry my SoB.
Adding them when importing your previous version into a topic branch
was a mistake on my side.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
