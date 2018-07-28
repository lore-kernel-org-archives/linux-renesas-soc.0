Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lj1-f195.google.com ([209.85.208.195]:40634 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730356AbeG1USZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 28 Jul 2018 16:18:25 -0400
MIME-Version: 1.0
In-Reply-To: <CAK-LDbKqU4Yub5H0_6tRpED4DLN8D+XrsUaNT5SN9Oq0sEpBNg@mail.gmail.com>
References: <20180728154007.GA28426@jordon-HP-15-Notebook-PC> <CAK-LDbKqU4Yub5H0_6tRpED4DLN8D+XrsUaNT5SN9Oq0sEpBNg@mail.gmail.com>
From: Souptick Joarder <jrdr.linux@gmail.com>
Date: Sun, 29 Jul 2018 00:20:58 +0530
Message-ID: <CAFqt6zYy4GfQn0VQ5rfoygY+8M1RQYEv_BH-Jxmv6epoLj3xmw@mail.gmail.com>
Subject: Re: [PATCH] drm/rcar-du: Convert drm_atomic_helper_suspend/resume()
To: Vaishali Thakkar <vthakkar@vaishalithakkar.in>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        airlied@linux.ie, Ajit Linux <ajitn.linux@gmail.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Sat, Jul 28, 2018 at 11:20 PM, Vaishali Thakkar
<vthakkar@vaishalithakkar.in> wrote:
> On Sat, Jul 28, 2018 at 9:10 PM, Souptick Joarder <jrdr.linux@gmail.com> wrote:
>> convert drm_atomic_helper_suspend/resume() to use
>> drm_mode_config_helper_suspend/resume().
>
> Hi Souptick,
>
> Thanks for your patch.
>
>> Signed-off-by: Souptick Joarder <jrdr.linux@gmail.com>
>> Signed-off-by: Ajit Negi <ajitn.linux@gmail.com>
>> ---
>>  drivers/gpu/drm/rcar-du/rcar_du_drv.c | 21 ++-------------------
>>  1 file changed, 2 insertions(+), 19 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
>> index 02aee6c..288220f 100644
>> --- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
>> +++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
>> @@ -357,32 +357,15 @@ static void rcar_du_lastclose(struct drm_device *dev)
>>  static int rcar_du_pm_suspend(struct device *dev)
>>  {
>>         struct rcar_du_device *rcdu = dev_get_drvdata(dev);
>> -       struct drm_atomic_state *state;
>>
>> -       drm_kms_helper_poll_disable(rcdu->ddev);
>> -       drm_fbdev_cma_set_suspend_unlocked(rcdu->fbdev, true);
>> -
>> -       state = drm_atomic_helper_suspend(rcdu->ddev);
>> -       if (IS_ERR(state)) {
>> -               drm_fbdev_cma_set_suspend_unlocked(rcdu->fbdev, false);
>

> I don't think we can use drm_mode_config_helper_(suspend/resume)
> API here as this file uses CMA functions.

drm_fbdev_cma_set_suspend_unlocked() is wrapper function which
invokes drm_fb_helper_set_suspend_unlocked().

Where the new API drm_mode_config_helper_suspend/resume() directly invokes
drm_fb_helper_set_suspend_unlocked(). So it is safe to replace exiting
code with API drm_mode_config_helper_suspend/resume().


> And from git grep it seems that
> there are very few drivers using it at the moment, so not sure if introducing
> new API functions similar to  drm_mode_config will make sense or not.
>

https://www.kernel.org/doc/html/latest/gpu/todo.html

It was picked up from TODO list after discussing with
Daniel.


> Thanks.
>
>> -               drm_kms_helper_poll_enable(rcdu->ddev);
>> -               return PTR_ERR(state);
>> -       }
>> -
>> -       rcdu->suspend_state = state;
>> -
>> -       return 0;
>> +       return drm_mode_config_helper_suspend(rcdu->ddev);
>>  }
>>
>>  static int rcar_du_pm_resume(struct device *dev)
>>  {
>>         struct rcar_du_device *rcdu = dev_get_drvdata(dev);
>>
>> -       drm_atomic_helper_resume(rcdu->ddev, rcdu->suspend_state);
>> -       drm_fbdev_cma_set_suspend_unlocked(rcdu->fbdev, false);
>> -       drm_kms_helper_poll_enable(rcdu->ddev);
>> -
>> -       return 0;
>> +       return drm_mode_config_helper_resume(rcdu->ddev);
>>  }
>>  #endif
>>
>> --
>> 1.9.1
>>
