Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua1-f68.google.com ([209.85.222.68]:37628 "EHLO
        mail-ua1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726732AbeIQNT7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Sep 2018 09:19:59 -0400
Received: by mail-ua1-f68.google.com with SMTP id y10-v6so10012351uao.4
        for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Sep 2018 00:53:45 -0700 (PDT)
MIME-Version: 1.0
References: <1562156.yf6H1RoyJV@avalon>
In-Reply-To: <1562156.yf6H1RoyJV@avalon>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 17 Sep 2018 09:53:33 +0200
Message-ID: <CAMuHMdV0vqNgbqeX_Wmo+2M=DebrusVeu8CwatDKYK0dpNDLLA@mail.gmail.com>
Subject: Re: [GIT PULL FOR renesas-drivers] D3 and E3 HDMI output support
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Laurent (and Kieran),

On Sat, Sep 15, 2018 at 4:44 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> The following changes since commit 6e1637c91742570ff873433ed27227933b792af4:
>
>   drm: rcar-du: Remove packed VYUY support (2018-09-15 17:28:34 +0300)
>
> are available in the Git repository at:
>
>   git://linuxtv.org/pinchartl/media.git for/renesas-drivers
>
> for you to fetch changes up to d7e0cb47e1d06d3033812281fe98528d1713ec16:
>
>   Merge tag 'drm-du-dt-lvds-pll-v1-20180915' into for/renesas-drivers
> (2018-09-15 17:38:05 +0300)
>
> Please note that the for/renesas-drivers branch is a merge of a code and a DT
> branch (available under the drm-du-lvds-pll-v1-20180915 and drm-du-dt-lvds-
> pll-v1-20180915 tags respectively). Those two branches have different bases
> (drm-next from Dave's tree and devel from Simon's tree respectively), I've
> thus edited the diffstat below manually.

Thanks for your pull request!

This causes merge conflicts with next-20180913 in

    arch/arm64/boot/dts/renesas/r8a774a1.dtsi
    arch/arm64/boot/dts/renesas/r8a77990.dtsi
    arch/arm64/boot/dts/renesas/r8a77995-draak.dts

and with Kieran's du/2018q3 in

    drivers/gpu/drm/rcar-du/rcar_du_crtc.c
    drivers/gpu/drm/rcar-du/rcar_du_drv.h
    drivers/gpu/drm/rcar-du/rcar_lvds.c

While the DT conflicts may not be unavoidedable, please coordinate with
Kieran for the rcar-du conflicts.

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
