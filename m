Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua0-f196.google.com ([209.85.217.196]:45885 "EHLO
        mail-ua0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727201AbeHGOSj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 7 Aug 2018 10:18:39 -0400
Received: by mail-ua0-f196.google.com with SMTP id k8-v6so15747571uaq.12
        for <linux-renesas-soc@vger.kernel.org>; Tue, 07 Aug 2018 05:04:37 -0700 (PDT)
MIME-Version: 1.0
References: <20180807112508.29152-1-kieran.bingham@ideasonboard.com>
In-Reply-To: <20180807112508.29152-1-kieran.bingham@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 7 Aug 2018 14:04:25 +0200
Message-ID: <CAMuHMdW4xjZDL25obmSBy7FEP7NxshOzMW6ugyOA+VOzmYbdoQ@mail.gmail.com>
Subject: Re: [GIT PULL FOR renesas-drivers] gmsl/for-renesas-drivers
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Kieran,

On Tue, Aug 7, 2018 at 1:25 PM Kieran Bingham
<kieran.bingham@ideasonboard.com> wrote:
> Please consider including this release in renesas-drivers.
>
> This brings in our GMSL developments for inclusion in renesas-drivers, but does
> not by default enable any FAKRA overlays. Anyone wishing to try out the GMSL
> work must manually configure their specific camera configuration.
>
> Please note, this branch is based on a merge commit of linux-media/master and
> Sakari's VC branch, and includes Niklas' conversions for adv748x to support VC
> which are still in development as a pre-requisite.
>
> --
> Regards
>
> Kieran
>
> The following changes since commit 12f336c88090fb8004736fd4329184326a49673b:
>
>   media: sh_mobile_ceu: convert to SPDX identifiers (2018-08-03 16:06:08 -0400)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/kbingham/rcar.git gmsl/for-renesas-drivers
>
> for you to fetch changes up to a6764190f2671dbcf86a59d42957bbcf56bb9301:
>
>   media: i2c: max9286: [POC] Power down GPIO lines to enable the V3M cameras (2018-08-07 12:08:12 +0100)

Thank you, this merges cleanly into today's linux-next.

Let's see how that works out in two weeks ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
