Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f65.google.com ([209.85.214.65]:34237 "EHLO
        mail-it0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751050AbdGMLQV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 13 Jul 2017 07:16:21 -0400
Received: by mail-it0-f65.google.com with SMTP id o202so6663642itc.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Jul 2017 04:16:21 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170713105822.5327-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20170713105822.5327-1-laurent.pinchart+renesas@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 13 Jul 2017 13:16:19 +0200
Message-ID: <CAMuHMdXrpO_oHJESeVSwiN65YWxU2o9c-DNX-yb-NqcjsYHOeQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: renesas: r8a7796: Add resets property to
 FCP devices
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Jul 13, 2017 at 12:58 PM, Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
> The FCP nodes are missing the resets property. Add it.
>
> Fixes: 7153c69fb8e1 ("arm64: dts: renesas: r8a7796: Add FCPF and FCPV instances")
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
