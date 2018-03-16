Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-co1nam03on0122.outbound.protection.outlook.com ([104.47.40.122]:22400
        "EHLO NAM03-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1751714AbeCPBjp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 15 Mar 2018 21:39:45 -0400
From: <Frank.Rowand@sony.com>
To: <arnd@arndb.de>, <laurent.pinchart@ideasonboard.com>
CC: <airlied@linux.ie>, <niklas.soderlund+renesas@ragnatech.se>,
        <dri-devel@lists.freedesktop.org>,
        <linux-renesas-soc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <frowand.list@gmail.com>
Subject: RE: [PATCH] [RFC] drm: rcar-du: keep temporary dtb files around
 during build
Date: Fri, 16 Mar 2018 01:39:39 +0000
Message-ID: <ED290C750E1B324E972B0017C9D4BAB06479C421@USCULXMSG01.am.sony.com>
References: <20180315153730.3798004-1-arnd@arndb.de>
In-Reply-To: <20180315153730.3798004-1-arnd@arndb.de>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thursday, March 15, 2018 8:37 AM, Arnd Bergmann [mailto:arnd@arndb.de]  =
wrote:
>
> The *.dtb and *.dtb.S files get removed by 'make' during the build
> process,
> and later seem to be missed during the 'modpost' stage:
>
> rm drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7795.dtb
> drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7791.dtb
> drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7791.dtb.S
> drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7795.dtb.S
> drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7790.dtb.S
> drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7793.dtb
> drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7796.dtb
> drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7790.dtb
> drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7796.dtb.S
> drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7793.dtb.S
> WARNING: could not open
> drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7790.dtb.S: No such file or
> directory
>
> As a workaround, this adds all those files to the 'extra-y' target list,
> but that's really ugly. Any ideas for a better fix?

Does this work for you (untested, but the way it is done in
drivers/of/unittest-data/Makefile):

.PRECIOUS: \
        $(obj)/%.dtb.S \
        $(obj)/%.dtb


-Frank


>
> Fixes: 81c0e3dd8292 ("drm: rcar-du: Fix legacy DT to create LVDS encoder
> nodes")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/gpu/drm/rcar-du/Makefile | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>
> diff --git a/drivers/gpu/drm/rcar-du/Makefile
> b/drivers/gpu/drm/rcar-du/Makefile
> index 3e58ed93d5b1..e5fc6ec0b8cc 100644
> --- a/drivers/gpu/drm/rcar-du/Makefile
> +++ b/drivers/gpu/drm/rcar-du/Makefile
> @@ -12,6 +12,21 @@ rcar-du-drm-$(CONFIG_DRM_RCAR_LVDS)  +=3D rcar_du_of.o=
 \
>                                            rcar_du_of_lvds_r8a7793.dtb.o
> \
>                                            rcar_du_of_lvds_r8a7795.dtb.o
> \
>                                            rcar_du_of_lvds_r8a7796.dtb.o
> +
> +extra-y                                        +=3D
> rcar_du_of_lvds_r8a7790.dtb \
> +                                          rcar_du_of_lvds_r8a7790.dtb \
> +                                          rcar_du_of_lvds_r8a7791.dtb \
> +                                          rcar_du_of_lvds_r8a7793.dtb \
> +                                          rcar_du_of_lvds_r8a7795.dtb \
> +                                          rcar_du_of_lvds_r8a7796.dtb
> +
> +extra-y                                        +=3D
> rcar_du_of_lvds_r8a7790.dtb.S \
> +                                          rcar_du_of_lvds_r8a7790.dtb.S
> \
> +                                          rcar_du_of_lvds_r8a7791.dtb.S
> \
> +                                          rcar_du_of_lvds_r8a7793.dtb.S
> \
> +                                          rcar_du_of_lvds_r8a7795.dtb.S
> \
> +                                          rcar_du_of_lvds_r8a7796.dtb.S
> +
>  rcar-du-drm-$(CONFIG_DRM_RCAR_VSP)     +=3D rcar_du_vsp.o
>
>  obj-$(CONFIG_DRM_RCAR_DU)              +=3D rcar-du-drm.o
> --
> 2.9.0
