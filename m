Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:58918 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750975AbeERF5K (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 May 2018 01:57:10 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Shawn Lin <shawn.lin@rock-chips.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: rcar-du DRM driver failed to build
Date: Fri, 18 May 2018 08:57:29 +0300
Message-ID: <2324813.OG3S1f9lHg@avalon>
In-Reply-To: <bf0abd12-70aa-4a86-34b5-e6e94eb2f3f4@rock-chips.com>
References: <bf0abd12-70aa-4a86-34b5-e6e94eb2f3f4@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Shawn,

On Friday, 18 May 2018 04:21:48 EEST Shawn Lin wrote:
> Hi,
>=20
> linux-next-20180517 fail to build for arm64 defconfig due to this
> drivers.

This is a known issue due to two bugs, fixed by commits 315852b42297 ("drm:=
=20
rcar-du: Fix build failure") and dd856d924b24 ("drm: rcar-du: Fix=20
rcar_du_of_init() stub") in the DRM tree. They should both make it to the n=
ext=20
linux-next.

The first bug was caused by the merge of two patch series in the DRM tree t=
hat=20
conflicted at build time but not at merge time, and went unnoticed on my si=
de=20
due to a git tree move I wasn't aware of and on Dave's side due to a mistak=
e=20
in his arm64 build environment.

The second bug I should have caught before sending the pull request if I ha=
d=20
tested building the driver as =3Dm instead of =3Dy. I'm sorry for that mist=
ake.

>    CC [M]  drivers/gpu/drm/rcar-du/rcar_du_drv.o
>    CC [M]  drivers/gpu/drm/rcar-du/rcar_du_vsp.o
>    CC [M]  drivers/gpu/drm/rcar-du/rcar_du_of.o
> drivers/gpu/drm/rcar-du/rcar_du_of.c:320:13: error: redefinition of
> =E2=80=98rcar_du_of_init=E2=80=99
>   void __init rcar_du_of_init(const struct of_device_id *of_ids)
>               ^~~~~~~~~~~~~~~
> In file included from drivers/gpu/drm/rcar-du/rcar_du_of.c:21:0:
> drivers/gpu/drm/rcar-du/rcar_du_of.h:17:20: note: previous definition of
> =E2=80=98rcar_du_of_init=E2=80=99 was here
>   static inline void rcar_du_of_init(const struct of_device_id *of_ids) {=
 }
>                      ^~~~~~~~~~~~~~~
> drivers/gpu/drm/rcar-du/rcar_du_vsp.c: In function
> =E2=80=98rcar_du_vsp_plane_atomic_duplicate_state=E2=80=99:
> drivers/gpu/drm/rcar-du/rcar_du_vsp.c:325:6: error: =E2=80=98struct
> rcar_du_vsp_plane_state=E2=80=99 has no member named =E2=80=98alpha=E2=80=
=99
>    copy->alpha =3D to_rcar_vsp_plane_state(plane->state)->alpha;
>        ^~
> drivers/gpu/drm/rcar-du/rcar_du_vsp.c:325:53: error: =E2=80=98struct
> rcar_du_vsp_plane_state=E2=80=99 has no member named =E2=80=98alpha=E2=80=
=99
>    copy->alpha =3D to_rcar_vsp_plane_state(plane->state)->alpha;
>                                                       ^~
> make[4]: *** [drivers/gpu/drm/rcar-du/rcar_du_of.o] Error 1
> make[4]: *** Waiting for unfinished jobs....
> make[4]: *** [drivers/gpu/drm/rcar-du/rcar_du_vsp.o] Error 1
> make[3]: *** [drivers/gpu/drm/rcar-du] Error 2

=2D-=20
Regards,

Laurent Pinchart
