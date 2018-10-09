Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vs1-f65.google.com ([209.85.217.65]:34473 "EHLO
        mail-vs1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725892AbeJIP5s (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 9 Oct 2018 11:57:48 -0400
Received: by mail-vs1-f65.google.com with SMTP id v12-v6so726118vsc.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 09 Oct 2018 01:41:59 -0700 (PDT)
MIME-Version: 1.0
References: <1562156.yf6H1RoyJV@avalon>
In-Reply-To: <1562156.yf6H1RoyJV@avalon>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 9 Oct 2018 10:41:46 +0200
Message-ID: <CAMuHMdXvz+UWZ_3QfOHuuXEBjq0_nmsxxhJiiTE=PWX2qMPODQ@mail.gmail.com>
Subject: Re: [GIT PULL FOR renesas-drivers] D3 and E3 HDMI output support
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Laurent,

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
>
> ----------------------------------------------------------------
> Kieran Bingham (1):
>       arm64: dts: renesas: r8a77995: Add LVDS support
>
> Laurent Pinchart (14):
>       arm64: dts: renesas: r8a77990: Add display output support
>       arm64: dts: renesas: r8a77990: ebisu: Enable VGA and HDMI outputs
>       pinctrl: sh-pfc: r8a77990: Add DU pins, groups and function
>       dt-bindings: display: renesas: du: Document r8a77990 bindings
>       dt-bindings: display: renesas: lvds: Document r8a77990 bindings
>       dt-bindings: display: renesas: lvds: Add EXTAL and DU_DOTCLKIN clocks
>       drm: bridge: thc63: Restrict modes based on hardware operating frequency
>       drm: rcar-du: lvds: D3/E3 support
>       drm: rcar-du: Perform the initial CRTC setup from rcar_du_crtc_get()
>       drm: rcar-du: Use LVDS PLL clock as dot clock when possible
>       drm: rcar-du: Enable configurable DPAD0 routing on Gen3
>       drm: rcar-du: Cache DSYSR value to ensure known initial value
>       drm: rcar-du: Don't use TV sync mode when not supported by the hardware
>       Merge tag 'drm-du-dt-lvds-pll-v1-20180915' into for/renesas-drivers
>
> Ulrich Hecht (2):
>       arm64: dts: renesas: r8a77995: draak: Enable HDMI display output
>       drm: rcar-du: Add r8a77990 and r8a77995 device support
>
>  Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt |   13
>  Documentation/devicetree/bindings/display/renesas,du.txt          |    2
>  arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts                    |  166 ++++
>  arch/arm64/boot/dts/renesas/r8a77990.dtsi                         |  167 ++++
>  arch/arm64/boot/dts/renesas/r8a77995-draak.dts                    |   98 ++
>  arch/arm64/boot/dts/renesas/r8a77995.dtsi                         |   56 +
>  drivers/gpu/drm/bridge/thc63lvd1024.c                             |   18
>  drivers/gpu/drm/rcar-du/rcar_du_crtc.c                            |  136 ++-
>  drivers/gpu/drm/rcar-du/rcar_du_crtc.h                            |    5
>  drivers/gpu/drm/rcar-du/rcar_du_drv.c                             |   63 +
>  drivers/gpu/drm/rcar-du/rcar_du_drv.h                             |    3
>  drivers/gpu/drm/rcar-du/rcar_du_group.c                           |   88 +-
>  drivers/gpu/drm/rcar-du/rcar_du_kms.c                             |   12
>  drivers/gpu/drm/rcar-du/rcar_lvds.c                               |  355 +++-
>  drivers/gpu/drm/rcar-du/rcar_lvds_regs.h                          |   43 +
>  drivers/pinctrl/sh-pfc/pfc-r8a77990.c                             |  110 +++
>  16 files changed, 1187 insertions(+), 148 deletions(-)

Dropped, as all (or a newer version) of this seems to have found its way to\
maintainers' for-next branches.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
