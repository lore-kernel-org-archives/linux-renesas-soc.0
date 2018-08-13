Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:43208 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729891AbeHMWk4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 Aug 2018 18:40:56 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Souptick Joarder <jrdr.linux@gmail.com>
Cc: Liviu Dudau <liviu.dudau@arm.com>,
        Brian Starkey <brian.starkey@arm.com>, malidp@foss.arm.com,
        airlied@linux.ie, Gustavo Padovan <gustavo@padovan.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Sean Paul <seanpaul@chromium.org>,
        Ajit Linux <ajitn.linux@gmail.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] drm: Convert drm_atomic_helper_suspend/resume()
Date: Mon, 13 Aug 2018 22:58:01 +0300
Message-ID: <1727410.cC7tJrXHPR@avalon>
In-Reply-To: <CAFqt6zazAWmRj_SCwTgufiVNzCrRz1K5ePwsfivR2eqKy=-gKA@mail.gmail.com>
References: <20180730190137.GA25420@jordon-HP-15-Notebook-PC> <20180813171611.GE907@e110455-lin.cambridge.arm.com> <CAFqt6zazAWmRj_SCwTgufiVNzCrRz1K5ePwsfivR2eqKy=-gKA@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Souptick,

On Monday, 13 August 2018 21:51:31 EEST Souptick Joarder wrote:
> On Mon, Aug 13, 2018 at 10:46 PM, Liviu Dudau <liviu.dudau@arm.com> wrote:
> > On Thu, Aug 02, 2018 at 03:25:24PM +0530, Souptick Joarder wrote:
> >> On Wed, Aug 1, 2018 at 12:11 AM, Souptick Joarder wrote:
> >>> On Tue, Jul 31, 2018 at 4:04 PM, Liviu Dudau wrote:
> >>>> On Tue, Jul 31, 2018 at 12:31:37AM +0530, Souptick Joarder wrote:
> >>>>> convert drm_atomic_helper_suspend/resume() to use
> >>>>> drm_mode_config_helper_suspend/resume().
> >>>>>=20
> >>>>> With this conversion, drm_fbdev_cma_set_suspend_unlocked()
> >>>>> will left with no consumer. So this function can be removed.
> >>>>>=20
> >>>>> Signed-off-by: Souptick Joarder <jrdr.linux@gmail.com>
> >>>>> Signed-off-by: Ajit Negi <ajitn.linux@gmail.com>
> >>>>> ---
> >>>>>=20
> >>>>>  drivers/gpu/drm/arm/hdlcd_drv.c       | 26 ++---------------------=
=2D--
> >>>>>  drivers/gpu/drm/drm_fb_cma_helper.c   | 18 ------------------
> >>>>>  drivers/gpu/drm/rcar-du/rcar_du_drv.c | 21 ++-------------------
> >>>>>  include/drm/drm_fb_cma_helper.h       |  2 --
> >>>>>  4 files changed, 4 insertions(+), 63 deletions(-)
> >>>>>=20
> >>>>> diff --git a/drivers/gpu/drm/arm/hdlcd_drv.c
> >>>>> b/drivers/gpu/drm/arm/hdlcd_drv.c index feaa8bc..4e617e0 100644
> >>>>> --- a/drivers/gpu/drm/arm/hdlcd_drv.c
> >>>>> +++ b/drivers/gpu/drm/arm/hdlcd_drv.c
> >>>>> @@ -427,37 +427,15 @@ static int hdlcd_remove(struct platform_device
> >>>>> *pdev)
> >>>>>  static int __maybe_unused hdlcd_pm_suspend(struct device *dev)
> >>>>>  {
> >>>>>       struct drm_device *drm =3D dev_get_drvdata(dev);
> >>>>> -     struct hdlcd_drm_private *hdlcd =3D drm ? drm->dev_private :
> >>>>> NULL;
> >>>>>=20
> >>>>> -     if (!hdlcd)
> >>>>> -             return 0;
> >>>>> -
> >>>>> -     drm_kms_helper_poll_disable(drm);
> >>>>> -     drm_fbdev_cma_set_suspend_unlocked(hdlcd->fbdev, 1);
> >>>>> -
> >>>>> -     hdlcd->state =3D drm_atomic_helper_suspend(drm);
> >>>>> -     if (IS_ERR(hdlcd->state)) {
> >>>>> -             drm_fbdev_cma_set_suspend_unlocked(hdlcd->fbdev, 0);
> >>>>> -             drm_kms_helper_poll_enable(drm);
> >>>>> -             return PTR_ERR(hdlcd->state);
> >>>>> -     }
> >>>>> -
> >>>>> -     return 0;
> >>>>> +     return drm_mode_config_helper_suspend(drm);
> >>>>>  }
> >>>>> =20
> >>>>>  static int __maybe_unused hdlcd_pm_resume(struct device *dev)
> >>>>>  {
> >>>>>       struct drm_device *drm =3D dev_get_drvdata(dev);
> >>>>> -     struct hdlcd_drm_private *hdlcd =3D drm ? drm->dev_private :
> >>>>> NULL;
> >>>>> -
> >>>>> -     if (!hdlcd)
> >>>>> -             return 0;
> >>>>>=20
> >>>>> -     drm_atomic_helper_resume(drm, hdlcd->state);
> >>>>> -     drm_fbdev_cma_set_suspend_unlocked(hdlcd->fbdev, 0);
> >>>>> -     drm_kms_helper_poll_enable(drm);
> >>>>> -
> >>>>> -     return 0;
> >>>>> +     return drm_mode_config_helper_resume(drm);
> >>>>>  }
> >>>>=20
> >>>> This patch is similar to the one Noralf Tr=F8nnes submitted, and his=
 is
> >>>> also cleaning up the state variable in hdlcd_drm_private. The patch
> >>>> has been queued as commit f69d9686e5d9 in git://linux-arm.org/
> >>>> linux-ld.git for-upstream/hdlcd and I will send a pull request today
> >>>> for it.
> >>>=20
> >>> unable to clone this repository.
> >>> can you please post the patchwork link ?
> >=20
> > Sorry, I was on holiday until today.
> >=20
> >> Liviu, is commit f69d9686e5d9 in
> >> git://linux-arm.org/linux-ld.gitfor-upstream/hdlcd
> >> contains only changes in drivers/gpu/drm/arm/hdlcd_drv.c driver ??
> >=20
> > That's right, that tree only deals with HDLCD changes. The rest of the
> > patch is up to you to upstream into drm-misc.
>=20
> As Liviu mentioned, drivers/gpu/drm/arm/hdlcd_drv.c is only changed,
> so we left with drivers/gpu/drm/rcar-du/rcar_du_drv.c and remove
> drm_fbdev_cma_set_suspend_unlocked().
>=20
> Would you like to see both rcar_du driver change and removing
> drm_fbdev_cma_set_suspend_unlocked() in a single commit ??
> or 2 different commit ?

I have a slight preference for two patches, but I'm fine with either. If yo=
u=20
decide to go for two patches, please make sure they get upstreamed at the s=
ame=20
time.

Thanks for handling this.

[snip]

=2D-=20
Regards,

Laurent Pinchart
