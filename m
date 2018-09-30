Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:48692 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727496AbeI3N3Q (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 30 Sep 2018 09:29:16 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Souptick Joarder <jrdr.linux@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Gustavo Padovan <gustavo@padovan.org>,
        Daniel Vetter <daniel@ffwll.ch>, airlied@linux.ie,
        sean@poorly.run, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/rcar-du: Convert drm_atomic_helper_suspend/resume()
Date: Sun, 30 Sep 2018 09:57:45 +0300
Message-ID: <1998688.b6VzpE9tkn@avalon>
In-Reply-To: <CAFqt6zbx2tSpnE+reNLN4pC7Br5XbgSuYP4-taxyyWraVpHoMg@mail.gmail.com>
References: <20180918163903.GA11172@jordon-HP-15-Notebook-PC> <20809880.gF2CxujBy3@avalon> <CAFqt6zbx2tSpnE+reNLN4pC7Br5XbgSuYP4-taxyyWraVpHoMg@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Souptick,

On Friday, 28 September 2018 23:02:32 EEST Souptick Joarder wrote:
> On 28-Sep-2018 9:00 PM, "Laurent Pinchart" wrote:
> > On Friday, 28 September 2018 18:05:18 EEST Laurent Pinchart wrote:
> >> On Thursday, 27 September 2018 09:34:18 EEST Souptick Joarder wrote:
> >>> On Tue, Sep 18, 2018 at 10:05 PM Souptick Joarder wrote:
> >>>> convert drm_atomic_helper_suspend/resume() to use
> >>>> drm_mode_config_helper_suspend/resume().
> >>>>=20
> >>>> remove suspend_state field from the rcar_du_device
> >>>> structure as it is no more required.
> >>>>=20
> >>>> With this conversion, also drm_fbdev_cma_set_suspend_unlocked()
> >>>> will left with no consumer. So this function can be removed.
> >>>>=20
> >>>> Signed-off-by: Souptick Joarder <jrdr.linux@gmail.com>
> >>>=20
> >>> Laurent, any comment on this patch ??
> >>=20
> >> Sorry for the delay, and thanks for pinging me.
> >>=20
> >> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >>=20
> >> Should I apply this to my tree or do you plan to merge it through
> >> drm-misc as it touches drm_fb_cma_helper.c ?
> >=20
> > I just realized that the same patch got supplied by Noralf Tr=F8nnes ne=
arly
> > a year ago, and was later superseded by https://patchwork.freedesktop.o=
rg/
> > patch/247861/. I think we should thus apply Noralf's patches instead (o=
nce
> > he sends v4 out).
>=20
> Sure, you can go ahead with his patch.
>=20
> Shall I remove drm_fbdev_cma_set_suspend_unlocked in a separate patch once
> all the consumer remove this function ?

Sure, if the function isn't removed as part of Noralf's patch series, pleas=
e=20
send a separate patch to remove it.

=2D-=20
Regards,

Laurent Pinchart
