Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-oi0-f66.google.com ([209.85.218.66]:33983 "EHLO
        mail-oi0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933375AbcJ0HEn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 27 Oct 2016 03:04:43 -0400
Received: by mail-oi0-f66.google.com with SMTP id p136so3010048oic.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Oct 2016 00:04:43 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CANqRtoRvvkr-HPTz9qGgxg6SK=FNZbO1gdxCDuxeUeGBzAhQ1g@mail.gmail.com>
References: <1476740091-7011-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
 <1476740091-7011-4-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
 <CAMuHMdUUeVRwM06+VA8QsqkaT5D4t4xiJML3mgQN9-CPcf4mzQ@mail.gmail.com>
 <2511719.0AnPiuYGPa@avalon> <20161020085602.GJ4612@verge.net.au> <CANqRtoRvvkr-HPTz9qGgxg6SK=FNZbO1gdxCDuxeUeGBzAhQ1g@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 27 Oct 2016 09:04:41 +0200
Message-ID: <CAMuHMdX=pS0NuZTow2=kZAq5jBbXwdPeySSZGbccpruN3mSpKg@mail.gmail.com>
Subject: Re: [PATCH 3/4] arm64: dts: renesas: r8a7796: Add DU device to DT
To: Magnus Damm <magnus.damm@gmail.com>
Cc: Simon Horman <horms@verge.net.au>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Magnus,

On Thu, Oct 27, 2016 at 8:52 AM, Magnus Damm <magnus.damm@gmail.com> wrote:
> In particular, not so much the DU device (this patch) but more the VSP
> instances. The reason for that is that VSP devices can only perform
> 32-bit bus mastering without IOMMU. I believe next step for all this
> would be to enable all on-board memory on r8a7796 Salvator-x, but I
> think Geert is working on that.

Actually 64-bit memory is already enabled on r8a7796/salvator-x, as U-Boot
(all firmware versions I've seen) silently adds the missing memory chunks
to the DTB.

The same is true on r8a7795/salvator-x with recent firmware (e.g. v2.12.0).

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
