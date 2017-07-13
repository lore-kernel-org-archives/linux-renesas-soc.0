Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f66.google.com ([209.85.214.66]:36122 "EHLO
        mail-it0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750854AbdGMLRM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 13 Jul 2017 07:17:12 -0400
Received: by mail-it0-f66.google.com with SMTP id k3so6667294ita.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Jul 2017 04:17:12 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170713105822.5327-2-laurent.pinchart+renesas@ideasonboard.com>
References: <20170713105822.5327-1-laurent.pinchart+renesas@ideasonboard.com> <20170713105822.5327-2-laurent.pinchart+renesas@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 13 Jul 2017 13:17:10 +0200
Message-ID: <CAMuHMdUPrefMOEELnY8v_Apn8DmBQ+=KHK0P7k4CyhbaXE2SnQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: renesas: r8a7796: Add resets property to
 VSP devices
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Jul 13, 2017 at 12:58 PM, Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
> The VSP nodes are missing the resets property. Add it.
>
> Fixes: 5a89c826745f ("arm64: dts: renesas: r8a7796: Add VSP instances")
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
