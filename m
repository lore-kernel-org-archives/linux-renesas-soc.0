Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf1-f68.google.com ([209.85.167.68]:42561 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729645AbeGaUXA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 31 Jul 2018 16:23:00 -0400
MIME-Version: 1.0
In-Reply-To: <20180731103440.GD17455@e110455-lin.cambridge.arm.com>
References: <20180730190137.GA25420@jordon-HP-15-Notebook-PC> <20180731103440.GD17455@e110455-lin.cambridge.arm.com>
From: Souptick Joarder <jrdr.linux@gmail.com>
Date: Wed, 1 Aug 2018 00:11:21 +0530
Message-ID: <CAFqt6zbEur=h4pRxs-XNZhTbtwQMdbwwOLmiFDQmhNDVx3msJA@mail.gmail.com>
Subject: Re: [PATCH] drm: Convert drm_atomic_helper_suspend/resume()
To: Liviu Dudau <liviu.dudau@arm.com>
Cc: Brian Starkey <brian.starkey@arm.com>, malidp@foss.arm.com,
        airlied@linux.ie, Gustavo Padovan <gustavo@padovan.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Sean Paul <seanpaul@chromium.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Ajit Linux <ajitn.linux@gmail.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Jul 31, 2018 at 4:04 PM, Liviu Dudau <liviu.dudau@arm.com> wrote:
> Hi Souptick,
>
> On Tue, Jul 31, 2018 at 12:31:37AM +0530, Souptick Joarder wrote:
>> convert drm_atomic_helper_suspend/resume() to use
>> drm_mode_config_helper_suspend/resume().
>>
>> With this conversion, drm_fbdev_cma_set_suspend_unlocked()
>> will left with no consumer. So this function can be removed.
>>
>> Signed-off-by: Souptick Joarder <jrdr.linux@gmail.com>
>> Signed-off-by: Ajit Negi <ajitn.linux@gmail.com>
>> ---
>>  drivers/gpu/drm/arm/hdlcd_drv.c       | 26 ++------------------------
>>  drivers/gpu/drm/drm_fb_cma_helper.c   | 18 ------------------
>>  drivers/gpu/drm/rcar-du/rcar_du_drv.c | 21 ++-------------------
>>  include/drm/drm_fb_cma_helper.h       |  2 --
>>  4 files changed, 4 insertions(+), 63 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/arm/hdlcd_drv.c b/drivers/gpu/drm/arm/hdlcd=
_drv.c
>> index feaa8bc..4e617e0 100644
>> --- a/drivers/gpu/drm/arm/hdlcd_drv.c
>> +++ b/drivers/gpu/drm/arm/hdlcd_drv.c
>> @@ -427,37 +427,15 @@ static int hdlcd_remove(struct platform_device *pd=
ev)
>>  static int __maybe_unused hdlcd_pm_suspend(struct device *dev)
>>  {
>>       struct drm_device *drm =3D dev_get_drvdata(dev);
>> -     struct hdlcd_drm_private *hdlcd =3D drm ? drm->dev_private : NULL;
>>
>> -     if (!hdlcd)
>> -             return 0;
>> -
>> -     drm_kms_helper_poll_disable(drm);
>> -     drm_fbdev_cma_set_suspend_unlocked(hdlcd->fbdev, 1);
>> -
>> -     hdlcd->state =3D drm_atomic_helper_suspend(drm);
>> -     if (IS_ERR(hdlcd->state)) {
>> -             drm_fbdev_cma_set_suspend_unlocked(hdlcd->fbdev, 0);
>> -             drm_kms_helper_poll_enable(drm);
>> -             return PTR_ERR(hdlcd->state);
>> -     }
>> -
>> -     return 0;
>> +     return drm_mode_config_helper_suspend(drm);
>>  }
>>
>>  static int __maybe_unused hdlcd_pm_resume(struct device *dev)
>>  {
>>       struct drm_device *drm =3D dev_get_drvdata(dev);
>> -     struct hdlcd_drm_private *hdlcd =3D drm ? drm->dev_private : NULL;
>> -
>> -     if (!hdlcd)
>> -             return 0;
>>
>> -     drm_atomic_helper_resume(drm, hdlcd->state);
>> -     drm_fbdev_cma_set_suspend_unlocked(hdlcd->fbdev, 0);
>> -     drm_kms_helper_poll_enable(drm);
>> -
>> -     return 0;
>> +     return drm_mode_config_helper_resume(drm);
>>  }
>
> This patch is similar to the one Noralf Tr=C3=B8nnes submitted, and his i=
s
> also cleaning up the state variable in hdlcd_drm_private. The patch has
> been queued as commit f69d9686e5d9 in git://linux-arm.org/linux-ld.git
> for-upstream/hdlcd and I will send a pull request today for it.
>
> Best regards,
> Liviu

unable to clone this repository.
can you please post the patchwork link ?

>
>>
>>  static SIMPLE_DEV_PM_OPS(hdlcd_pm_ops, hdlcd_pm_suspend, hdlcd_pm_resum=
e);
>> diff --git a/drivers/gpu/drm/drm_fb_cma_helper.c b/drivers/gpu/drm/drm_f=
b_cma_helper.c
>> index 186d00a..f604a84 100644
>> --- a/drivers/gpu/drm/drm_fb_cma_helper.c
>> +++ b/drivers/gpu/drm/drm_fb_cma_helper.c
>> @@ -529,21 +529,3 @@ void drm_fbdev_cma_set_suspend(struct drm_fbdev_cma=
 *fbdev_cma, bool state)
>>               drm_fb_helper_set_suspend(&fbdev_cma->fb_helper, state);
>>  }
>>  EXPORT_SYMBOL(drm_fbdev_cma_set_suspend);
>> -
>> -/**
>> - * drm_fbdev_cma_set_suspend_unlocked - wrapper around
>> - *                                      drm_fb_helper_set_suspend_unloc=
ked
>> - * @fbdev_cma: The drm_fbdev_cma struct, may be NULL
>> - * @state: desired state, zero to resume, non-zero to suspend
>> - *
>> - * Calls drm_fb_helper_set_suspend, which is a wrapper around
>> - * fb_set_suspend implemented by fbdev core.
>> - */
>> -void drm_fbdev_cma_set_suspend_unlocked(struct drm_fbdev_cma *fbdev_cma=
,
>> -                                     bool state)
>> -{
>> -     if (fbdev_cma)
>> -             drm_fb_helper_set_suspend_unlocked(&fbdev_cma->fb_helper,
>> -                                                state);
>> -}
>> -EXPORT_SYMBOL(drm_fbdev_cma_set_suspend_unlocked);
>> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rca=
r-du/rcar_du_drv.c
>> index 02aee6c..288220f 100644
>> --- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
>> +++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
>> @@ -357,32 +357,15 @@ static void rcar_du_lastclose(struct drm_device *d=
ev)
>>  static int rcar_du_pm_suspend(struct device *dev)
>>  {
>>       struct rcar_du_device *rcdu =3D dev_get_drvdata(dev);
>> -     struct drm_atomic_state *state;
>>
>> -     drm_kms_helper_poll_disable(rcdu->ddev);
>> -     drm_fbdev_cma_set_suspend_unlocked(rcdu->fbdev, true);
>> -
>> -     state =3D drm_atomic_helper_suspend(rcdu->ddev);
>> -     if (IS_ERR(state)) {
>> -             drm_fbdev_cma_set_suspend_unlocked(rcdu->fbdev, false);
>> -             drm_kms_helper_poll_enable(rcdu->ddev);
>> -             return PTR_ERR(state);
>> -     }
>> -
>> -     rcdu->suspend_state =3D state;
>> -
>> -     return 0;
>> +     return drm_mode_config_helper_suspend(rcdu->ddev);
>>  }
>>
>>  static int rcar_du_pm_resume(struct device *dev)
>>  {
>>       struct rcar_du_device *rcdu =3D dev_get_drvdata(dev);
>>
>> -     drm_atomic_helper_resume(rcdu->ddev, rcdu->suspend_state);
>> -     drm_fbdev_cma_set_suspend_unlocked(rcdu->fbdev, false);
>> -     drm_kms_helper_poll_enable(rcdu->ddev);
>> -
>> -     return 0;
>> +     return drm_mode_config_helper_resume(rcdu->ddev);
>>  }
>>  #endif
>>
>> diff --git a/include/drm/drm_fb_cma_helper.h b/include/drm/drm_fb_cma_he=
lper.h
>> index d532f88a..15c4569 100644
>> --- a/include/drm/drm_fb_cma_helper.h
>> +++ b/include/drm/drm_fb_cma_helper.h
>> @@ -33,8 +33,6 @@ struct drm_fbdev_cma *drm_fbdev_cma_init(struct drm_de=
vice *dev,
>>  void drm_fbdev_cma_restore_mode(struct drm_fbdev_cma *fbdev_cma);
>>  void drm_fbdev_cma_hotplug_event(struct drm_fbdev_cma *fbdev_cma);
>>  void drm_fbdev_cma_set_suspend(struct drm_fbdev_cma *fbdev_cma, bool st=
ate);
>> -void drm_fbdev_cma_set_suspend_unlocked(struct drm_fbdev_cma *fbdev_cma=
,
>> -                                     bool state);
>>
>>  struct drm_gem_cma_object *drm_fb_cma_get_gem_obj(struct drm_framebuffe=
r *fb,
>>       unsigned int plane);
>> --
>> 1.9.1
>>
>
> --
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> | I would like to |
> | fix the world,  |
> | but they're not |
> | giving me the   |
>  \ source code!  /
>   ---------------
>     =C2=AF\_(=E3=83=84)_/=C2=AF
