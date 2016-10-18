Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f195.google.com ([209.85.223.195]:33753 "EHLO
        mail-io0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752299AbcJRIGr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Oct 2016 04:06:47 -0400
Received: by mail-io0-f195.google.com with SMTP id q192so12225506iod.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 18 Oct 2016 01:06:47 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1476736143-29937-3-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
References: <1476736143-29937-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
 <1476736143-29937-3-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 18 Oct 2016 10:06:45 +0200
Message-ID: <CAMuHMdXvzt1QisdhToTFMwS0dUtrCbXQAnKU+j=jLU3iwpd8rQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: r8a7795: Remove FCP SoC-specific
 compatible strings
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Oct 17, 2016 at 10:29 PM, Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
> The SoC-specific compatible strings have been removed from the FCP DT
> bindings, removed them from the device tree.
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
