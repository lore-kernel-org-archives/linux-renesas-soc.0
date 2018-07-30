Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:34698 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726843AbeG3P7J (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 30 Jul 2018 11:59:09 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Souptick Joarder <jrdr.linux@gmail.com>
Cc: Vaishali Thakkar <vthakkar@vaishalithakkar.in>, airlied@linux.ie,
        Ajit Linux <ajitn.linux@gmail.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm/rcar-du: Convert drm_atomic_helper_suspend/resume()
Date: Mon, 30 Jul 2018 17:24:31 +0300
Message-ID: <2566982.Bc5DNITNHH@avalon>
In-Reply-To: <CAFqt6zaiThFYHRGYqTFYVcYK3Z6vCV4qAU0qMMheY7wGyggVrA@mail.gmail.com>
References: <20180728154007.GA28426@jordon-HP-15-Notebook-PC> <10502231.oSnn9dME1M@avalon> <CAFqt6zaiThFYHRGYqTFYVcYK3Z6vCV4qAU0qMMheY7wGyggVrA@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Souptick,

On Monday, 30 July 2018 16:58:09 EEST Souptick Joarder wrote:
> On Sun, Jul 29, 2018 at 1:50 AM, Laurent Pinchart wrote:
> > On Saturday, 28 July 2018 21:50:58 EEST Souptick Joarder wrote:
> >> On Sat, Jul 28, 2018 at 11:20 PM, Vaishali Thakkar wrote:
> >>> On Sat, Jul 28, 2018 at 9:10 PM, Souptick Joarder wrote:
> >>>> convert drm_atomic_helper_suspend/resume() to use
> >>>> drm_mode_config_helper_suspend/resume().
> >>> 
> >>> Hi Souptick,
> >>> 
> >>> Thanks for your patch.
> >>> 
> >>>> Signed-off-by: Souptick Joarder <jrdr.linux@gmail.com>
> >>>> Signed-off-by: Ajit Negi <ajitn.linux@gmail.com>
> >>>> ---
> >>>> 
> >>>>  drivers/gpu/drm/rcar-du/rcar_du_drv.c | 21 ++-------------------
> >>>>  1 file changed, 2 insertions(+), 19 deletions(-)
> >>>> 
> >>>> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> >>>> b/drivers/gpu/drm/rcar-du/rcar_du_drv.c index 02aee6c..288220f 100644
> >>>> --- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> >>>> +++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> >>>> @@ -357,32 +357,15 @@ static void rcar_du_lastclose(struct drm_device
> >>>> *dev)
> >>>> 
> >>>>  static int rcar_du_pm_suspend(struct device *dev)
> >>>>  {
> >>>>         struct rcar_du_device *rcdu = dev_get_drvdata(dev);
> >>>> -       struct drm_atomic_state *state;
> >>>> 
> >>>> -       drm_kms_helper_poll_disable(rcdu->ddev);
> >>>> -       drm_fbdev_cma_set_suspend_unlocked(rcdu->fbdev, true);
> >>>> -
> >>>> -       state = drm_atomic_helper_suspend(rcdu->ddev);
> >>>> -       if (IS_ERR(state)) {
> >>>> -               drm_fbdev_cma_set_suspend_unlocked(rcdu->fbdev,
> >>>> false);
> >>> 
> >>> I don't think we can use drm_mode_config_helper_(suspend/resume)
> >>> API here as this file uses CMA functions.
> >> 
> >> drm_fbdev_cma_set_suspend_unlocked() is wrapper function which
> >> invokes drm_fb_helper_set_suspend_unlocked().
> >> 
> >> Where the new API drm_mode_config_helper_suspend/resume() directly
> >> invokes
> >> drm_fb_helper_set_suspend_unlocked(). So it is safe to replace exiting
> >> code with API drm_mode_config_helper_suspend/resume().
> > 
> > I agree that they're functionally equivalent for now, but what if
> > drm_fbdev_cma_set_suspend_unlocked() gets extended later ? This change
> > risks introducing a breakage that could could unnoticed at that point.
> 
> No, any extention of drm_fbdev_cma_set_suspend_unlocked() will not have
> any impact on driver because with this patch we will be retaining the
> original suspend/resume logic of the rcar-du driver and further this driver
> is not going to use drm_fbdev_cma_set_suspend_unlocked().

My point is that if the fb cma helpers gets later extended with a feature that 
need special handling and suspend/resume time, with the 
drm_fbdev_cma_set_suspend_unlocked() function properly updated to take that 
feature into account, driver using those helpers but converted to 
drm_atomic_helper_suspend/resume() will break.

> > At the very
> > least you should add a comment in drm_fbdev_cma_set_suspend_unlocked() to
> > explain that any extension of the function should also address all drivers
> > using drm_mode_config_helper_suspend() and
> > drm_mode_config_helper_resume().
> 
> The consumers of drm_fbdev_cma_set_suspend_unlocked() are -
> drivers/gpu/drm/arm/hdlcd_drv.c
> drivers/gpu/drm/drm_fb_cma_helper.c
> 
> and both will be converted to use API
> drm_mode_config_helper_suspend/resume(). As there will be no more consumer
> of drm_fbdev_cma_set_suspend_unlocked() , we can remove this wrapper API
> forever :)

OK, if you remove the function completely then anyone wanting to extend the 
fbdev cma helpers in the way described above will notice that something will 
need to be done, so it's fine. Please thus make sure that you go all the way 
to removing that function.

> >>> And from git grep it seems that there are very few drivers using it at
> >>> the moment, so not sure if introducing new API functions similar to
> >>> drm_mode_config will make sense or not.
> >> 
> >> https://www.kernel.org/doc/html/latest/gpu/todo.html
> >> 
> >> It was picked up from TODO list after discussing with
> >> Daniel.
> >> 
> >> >> -               drm_kms_helper_poll_enable(rcdu->ddev);
> >> >> -               return PTR_ERR(state);
> >> >> -       }
> >> >> -
> >> >> -       rcdu->suspend_state = state;
> > 
> > Additionally, I think you can remove the suspend_state field from the rcdu
> > structure.
> 
> Sure, I will remove it in v2.
> 
> >>>> -       return 0;
> >>>> +       return drm_mode_config_helper_suspend(rcdu->ddev);
> >>>>  }
> >>>>  
> >>>>  static int rcar_du_pm_resume(struct device *dev)
> >>>>  {
> >>>>         struct rcar_du_device *rcdu = dev_get_drvdata(dev);
> >>>> 
> >>>> -       drm_atomic_helper_resume(rcdu->ddev, rcdu->suspend_state);
> >>>> -       drm_fbdev_cma_set_suspend_unlocked(rcdu->fbdev, false);
> >>>> -       drm_kms_helper_poll_enable(rcdu->ddev);
> >>>> -
> >>>> -       return 0;
> >>>> +       return drm_mode_config_helper_resume(rcdu->ddev);
> >>>>  }
> >>>>  #endif

-- 
Regards,

Laurent Pinchart
