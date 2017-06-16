Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f65.google.com ([209.85.214.65]:36770 "EHLO
        mail-it0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752729AbdFPIEA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 16 Jun 2017 04:04:00 -0400
Received: by mail-it0-f65.google.com with SMTP id 185so4190328itv.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 16 Jun 2017 01:03:59 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <8149481.gNmlvl7hsu@avalon>
References: <8149481.gNmlvl7hsu@avalon>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 16 Jun 2017 10:03:57 +0200
Message-ID: <CAMuHMdXREBCD9w8rkW6vXxh-Ro4waLN08Q1ePiS4uYoOMbGBGQ@mail.gmail.com>
Subject: Re: [GIT PULL FOR renesas-drivers] R-Car H3 ES2.0 display support
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Laurent,

On Thu, Jun 15, 2017 at 8:54 PM, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> The following changes implement display support for the R-Car H3 ES2.0. They
> have been split in three distinct branches:

Thanks for your branches!

> - tags/drm-h3-es2-dt-20170615 contains the DT changes and is based on top of
> topic/r8a7795es2-integration

When merging this into next-20170616, there are lots of conflicts.
Most are due to your tag being based on a one-month old version of
renesas-devel.

As the relevant DT changes in topic/r8a7795es2-integration have been applied
to renesas-devel, you could rebase on top of the latter.

> - tags/drm-h3-es2-pinctrl-20170615 contains the pinctrl changes for the DU and
> is based on top of sh-pfc-for-v4.13-tag1

Merges cleanly into next-20170616.

> - tags/drm-h3-es2-vsp-20170615 contains the VSP changes and is based on top of
> v4.12-rc1

When merging this into next-20170616, there are two conflicts, in
drivers/media/platform/vsp1/vsp1_dl.c and include/media/vsp1.h.

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
