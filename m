Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f195.google.com ([209.85.223.195]:34884 "EHLO
        mail-io0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751054AbdENKDk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 14 May 2017 06:03:40 -0400
Received: by mail-io0-f195.google.com with SMTP id o12so9330048iod.2
        for <linux-renesas-soc@vger.kernel.org>; Sun, 14 May 2017 03:03:39 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170513231618.1715-7-laurent.pinchart+renesas@ideasonboard.com>
References: <20170513231618.1715-1-laurent.pinchart+renesas@ideasonboard.com> <20170513231618.1715-7-laurent.pinchart+renesas@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 14 May 2017 12:03:38 +0200
Message-ID: <CAMuHMdX2Bk0_pmOP7ZeLaGuEBiBZwfqY6A-65=ROgSPCz7TMdw@mail.gmail.com>
Subject: Re: [PATCH v5 6/6] ARM: shmobile: dts: Switch to panel-lvds bindings
 for Mitsubishi panels
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Sun, May 14, 2017 at 1:16 AM, Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
> The aa104xd12 and aa121td01 panels are LVDS panels, not DPI panels.
> Use the correct DT bindings.
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
