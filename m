Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:46842 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728999AbeJASdT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 1 Oct 2018 14:33:19 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: Souptick Joarder <jrdr.linux@gmail.com>,
        Gustavo Padovan <gustavo@padovan.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        sean@poorly.run, airlied@linux.ie, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Noralf =?ISO-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>
Subject: Re: [PATCH] drm/rcar-du: Convert drm_atomic_helper_suspend/resume()
Date: Mon, 01 Oct 2018 14:56:06 +0300
Message-ID: <26527911.hs5tlrnKDc@avalon>
In-Reply-To: <20181001065220.GE11082@phenom.ffwll.local>
References: <20180918163903.GA11172@jordon-HP-15-Notebook-PC> <20809880.gF2CxujBy3@avalon> <20181001065220.GE11082@phenom.ffwll.local>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Daniel,

On Monday, 1 October 2018 09:52:20 EEST Daniel Vetter wrote:
> On Fri, Sep 28, 2018 at 06:30:35PM +0300, Laurent Pinchart wrote:
> > On Friday, 28 September 2018 18:05:18 EEST Laurent Pinchart wrote:
> > > On Thursday, 27 September 2018 09:34:18 EEST Souptick Joarder wrote:
> > > > On Tue, Sep 18, 2018 at 10:05 PM Souptick Joarder wrote:
> > > >> convert drm_atomic_helper_suspend/resume() to use
> > > >> drm_mode_config_helper_suspend/resume().
> > > >>=20
> > > >> remove suspend_state field from the rcar_du_device
> > > >> structure as it is no more required.
> > > >>=20
> > > >> With this conversion, also drm_fbdev_cma_set_suspend_unlocked()
> > > >> will left with no consumer. So this function can be removed.
> > > >>=20
> > > >> Signed-off-by: Souptick Joarder <jrdr.linux@gmail.com>
> > > >=20
> > > > Laurent, any comment on this patch ??
> > >=20
> > > Sorry for the delay, and thanks for pinging me.
> > >=20
> > > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > >=20
> > > Should I apply this to my tree or do you plan to merge it through
> > > drm-misc
> > > as it touches drm_fb_cma_helper.c ?
> >=20
> > I just realized that the same patch got supplied by Noralf Tr=F8nnes ne=
arly
> > a
> > year ago, and was later superseded by
> > https://patchwork.freedesktop.org/patch/247861/. I think we should thus
> > apply Noralf's patches instead (once he sends v4 out).
>=20
> I don't think Noralf is still actively working on this, he's busy with the
> fbdev emulation stuff. Probably better if you pick up one of the existing
> ones, than waiting another year or so :-)

Isn't https://patchwork.freedesktop.org/patch/247861/ part of the fbdev=20
emulation stuff ? That patch series is from less than a month ago, so I=20
thought it was actively developed.

Let's ask him. Noralf, any comment ? :-)=20

> > > >> ---
> > > >>=20
> > > >>  drivers/gpu/drm/drm_fb_cma_helper.c   | 18 ------------------
> > > >>  drivers/gpu/drm/rcar-du/rcar_du_drv.c | 21 ++-------------------
> > > >>  drivers/gpu/drm/rcar-du/rcar_du_drv.h |  1 -
> > > >>  include/drm/drm_fb_cma_helper.h       |  2 --
> > > >>  4 files changed, 2 insertions(+), 40 deletions(-)
> > > >>=20
> > > >> diff --git a/drivers/gpu/drm/drm_fb_cma_helper.c
> > > >> b/drivers/gpu/drm/drm_fb_cma_helper.c index 47e0e2f..96efc88 100644
> > > >> --- a/drivers/gpu/drm/drm_fb_cma_helper.c
> > > >> +++ b/drivers/gpu/drm/drm_fb_cma_helper.c
> > > >> @@ -224,21 +224,3 @@ void drm_fbdev_cma_hotplug_event(struct
> > > >> drm_fbdev_cma *fbdev_cma)
> > > >>=20
> > > >>                 drm_fb_helper_hotplug_event(&fbdev_cma->fb_helper);
> > > >> =20
> > > >>  }
> > > >>  EXPORT_SYMBOL_GPL(drm_fbdev_cma_hotplug_event);
> > > >>=20
> > > >> -
> > > >> -/**
> > > >> - * drm_fbdev_cma_set_suspend_unlocked - wrapper around
> > > >> - *
> > > >> drm_fb_helper_set_suspend_unlocked
> > > >> - * @fbdev_cma: The drm_fbdev_cma struct, may be NULL
> > > >> - * @state: desired state, zero to resume, non-zero to suspend
> > > >> - *
> > > >> - * Calls drm_fb_helper_set_suspend, which is a wrapper around
> > > >> - * fb_set_suspend implemented by fbdev core.
> > > >> - */
> > > >> -void drm_fbdev_cma_set_suspend_unlocked(struct drm_fbdev_cma
> > > >> *fbdev_cma,
> > > >> -                                       bool state)
> > > >> -{
> > > >> -       if (fbdev_cma)
> > > >> -
> > > >> drm_fb_helper_set_suspend_unlocked(&fbdev_cma->fb_helper,
> > > >> -                                                  state);
> > > >> -}
> > > >> -EXPORT_SYMBOL(drm_fbdev_cma_set_suspend_unlocked);
> > > >> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> > > >> b/drivers/gpu/drm/rcar-du/rcar_du_drv.c index 02aee6c..288220f 100=
644
> > > >> --- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> > > >> +++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> > > >> @@ -357,32 +357,15 @@ static void rcar_du_lastclose(struct drm_dev=
ice
> > > >> *dev)
> > > >>=20
> > > >>  static int rcar_du_pm_suspend(struct device *dev)
> > > >>  {
> > > >> =20
> > > >>         struct rcar_du_device *rcdu =3D dev_get_drvdata(dev);
> > > >>=20
> > > >> -       struct drm_atomic_state *state;
> > > >>=20
> > > >> -       drm_kms_helper_poll_disable(rcdu->ddev);
> > > >> -       drm_fbdev_cma_set_suspend_unlocked(rcdu->fbdev, true);
> > > >> -
> > > >> -       state =3D drm_atomic_helper_suspend(rcdu->ddev);
> > > >> -       if (IS_ERR(state)) {
> > > >> -               drm_fbdev_cma_set_suspend_unlocked(rcdu->fbdev,
> > > >> false);
> > > >> -               drm_kms_helper_poll_enable(rcdu->ddev);
> > > >> -               return PTR_ERR(state);
> > > >> -       }
> > > >> -
> > > >> -       rcdu->suspend_state =3D state;
> > > >> -
> > > >> -       return 0;
> > > >> +       return drm_mode_config_helper_suspend(rcdu->ddev);
> > > >>=20
> > > >>  }
> > > >> =20
> > > >>  static int rcar_du_pm_resume(struct device *dev)
> > > >>  {
> > > >> =20
> > > >>         struct rcar_du_device *rcdu =3D dev_get_drvdata(dev);
> > > >>=20
> > > >> -       drm_atomic_helper_resume(rcdu->ddev, rcdu->suspend_state);
> > > >> -       drm_fbdev_cma_set_suspend_unlocked(rcdu->fbdev, false);
> > > >> -       drm_kms_helper_poll_enable(rcdu->ddev);
> > > >> -
> > > >> -       return 0;
> > > >> +       return drm_mode_config_helper_resume(rcdu->ddev);
> > > >>=20
> > > >>  }
> > > >>  #endif
> > > >>=20
> > > >> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.h
> > > >> b/drivers/gpu/drm/rcar-du/rcar_du_drv.h index b3a25e8..ff25c8d 100=
644
> > > >> --- a/drivers/gpu/drm/rcar-du/rcar_du_drv.h
> > > >> +++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.h
> > > >> @@ -78,7 +78,6 @@ struct rcar_du_device {
> > > >>=20
> > > >>         struct drm_device *ddev;
> > > >>         struct drm_fbdev_cma *fbdev;
> > > >>=20
> > > >> -       struct drm_atomic_state *suspend_state;
> > > >>=20
> > > >>         struct rcar_du_crtc crtcs[RCAR_DU_MAX_CRTCS];
> > > >>         unsigned int num_crtcs;
> > > >>=20
> > > >> diff --git a/include/drm/drm_fb_cma_helper.h
> > > >> b/include/drm/drm_fb_cma_helper.h index 4a65f0d..8dbbe1e 100644
> > > >> --- a/include/drm/drm_fb_cma_helper.h
> > > >> +++ b/include/drm/drm_fb_cma_helper.h
> > > >> @@ -26,8 +26,6 @@ struct drm_fbdev_cma *drm_fbdev_cma_init(struct
> > > >> drm_device *dev,
> > > >>=20
> > > >>  void drm_fbdev_cma_restore_mode(struct drm_fbdev_cma *fbdev_cma);
> > > >>  void drm_fbdev_cma_hotplug_event(struct drm_fbdev_cma *fbdev_cma);
> > > >>=20
> > > >> -void drm_fbdev_cma_set_suspend_unlocked(struct drm_fbdev_cma
> > > >> *fbdev_cma,
> > > >> -                                       bool state);
> > > >>=20
> > > >>  struct drm_gem_cma_object *drm_fb_cma_get_gem_obj(struct
> > > >>  drm_framebuffer *fb,
> > > >> =20
> > > >>         unsigned int plane);

=2D-=20
Regards,

Laurent Pinchart
