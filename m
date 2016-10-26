Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f65.google.com ([209.85.214.65]:33457 "EHLO
        mail-it0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751118AbcJZHbl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 26 Oct 2016 03:31:41 -0400
MIME-Version: 1.0
In-Reply-To: <20161026033143.6617.5834.sendpatchset@little-apple>
References: <20161026033143.6617.5834.sendpatchset@little-apple>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 26 Oct 2016 09:31:20 +0200
Message-ID: <CAMuHMdVfpXHiOw5odMWGX=xKAzEhnEAHGPiGHF19iPF-kMVy4A@mail.gmail.com>
Subject: Re: [PATCH] drm: rcar-du: Fix R-Car Gen3 crash when VSP is disabled
To: Magnus Damm <magnus.damm@gmail.com>
Cc: DRI Development <dri-devel@lists.freedesktop.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        David Airlie <airlied@linux.ie>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Oct 26, 2016 at 5:31 AM, Magnus Damm <magnus.damm@gmail.com> wrote:
> From: Magnus Damm <damm+renesas@opensource.se>
>
> For the DU to operate on R-Car Gen3 hardware a combination of DU
> and VSP devices are required. Since the DU driver also supports
> earlier generations hardware the VSP portion is enabled via Kconfig.
>
> The arm64 defconfig is as of v4.9-rc1 having the DU driver enabled
> as a module, however this is not enough to support R-Car Gen3. In
> the current case of CONFIG_DRM_RCAR_VSP=n then the kernel crashes
> when loading the module. This patch is fixing that particular case.
>
> In more detail, the crash triggers in drm_atomic_get_plane_state()
> when __drm_atomic_helper_set_config() passes NULL as crtc->primary.
>
> This patch corrects this issue by failing to load the DU driver on
> R-Car Gen3 when VSP is not available.
>
> Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
> ---
>
>  drivers/gpu/drm/rcar-du/rcar_du_vsp.h |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> --- 0001/drivers/gpu/drm/rcar-du/rcar_du_vsp.h
> +++ work/drivers/gpu/drm/rcar-du/rcar_du_vsp.h  2016-10-26 00:01:12.920607110 +0900
> @@ -70,7 +70,7 @@ void rcar_du_vsp_disable(struct rcar_du_
>  void rcar_du_vsp_atomic_begin(struct rcar_du_crtc *crtc);
>  void rcar_du_vsp_atomic_flush(struct rcar_du_crtc *crtc);
>  #else
> -static inline int rcar_du_vsp_init(struct rcar_du_vsp *vsp) { return 0; };
> +static inline int rcar_du_vsp_init(struct rcar_du_vsp *vsp) { return -ENXIO; };

-ENODEV sounds more appropriate

>  static inline void rcar_du_vsp_enable(struct rcar_du_crtc *crtc) { };
>  static inline void rcar_du_vsp_disable(struct rcar_du_crtc *crtc) { };
>  static inline void rcar_du_vsp_atomic_begin(struct rcar_du_crtc *crtc) { };

Alternatively,  DRM_RCAR_DU can force DRM_RCAR_VSP to y if ARCH_R8A7795
or ARCH_R8A7796 is enabled.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
