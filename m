Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf1-f68.google.com ([209.85.167.68]:37323 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726917AbeGaHdt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 31 Jul 2018 03:33:49 -0400
MIME-Version: 1.0
In-Reply-To: <3328858.Mu96AcVENO@avalon>
References: <20180730190137.GA25420@jordon-HP-15-Notebook-PC> <3328858.Mu96AcVENO@avalon>
From: Souptick Joarder <jrdr.linux@gmail.com>
Date: Tue, 31 Jul 2018 11:25:13 +0530
Message-ID: <CAFqt6zaJJcfWr2SXkJZXviVsO7K+_=UCF8MUfR2_036Y-ocFsA@mail.gmail.com>
Subject: Re: [PATCH] drm: Convert drm_atomic_helper_suspend/resume()
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: liviu.dudau@arm.com, Brian Starkey <brian.starkey@arm.com>,
        malidp@foss.arm.com, airlied@linux.ie,
        Gustavo Padovan <gustavo@padovan.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Sean Paul <seanpaul@chromium.org>,
        Ajit Linux <ajitn.linux@gmail.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

> If you further remove the suspend_state field from the rcar_du_device
> structure, you'll get my
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>

Sorry, missed it.

>> -
>> -     return 0;
>> +     return drm_mode_config_helper_suspend(rcdu->ddev);
>>  }
>>
>>  static int rcar_du_pm_resume(struct device *dev)
>>  {
>>       struct rcar_du_device *rcdu = dev_get_drvdata(dev);
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
>> diff --git a/include/drm/drm_fb_cma_helper.h
>> b/include/drm/drm_fb_cma_helper.h index d532f88a..15c4569 100644
>> --- a/include/drm/drm_fb_cma_helper.h
>> +++ b/include/drm/drm_fb_cma_helper.h
>> @@ -33,8 +33,6 @@ struct drm_fbdev_cma *drm_fbdev_cma_init(struct drm_device
>> *dev, void drm_fbdev_cma_restore_mode(struct drm_fbdev_cma *fbdev_cma);
>> void drm_fbdev_cma_hotplug_event(struct drm_fbdev_cma *fbdev_cma); void
>> drm_fbdev_cma_set_suspend(struct drm_fbdev_cma *fbdev_cma, bool state);
>> -void drm_fbdev_cma_set_suspend_unlocked(struct drm_fbdev_cma *fbdev_cma,
>> -                                     bool state);
>>
>>  struct drm_gem_cma_object *drm_fb_cma_get_gem_obj(struct drm_framebuffer
>> *fb, unsigned int plane);
>
> --
> Regards,
>
> Laurent Pinchart
>
>
>
