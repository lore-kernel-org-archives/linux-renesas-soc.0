Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f66.google.com ([209.85.214.66]:55342 "EHLO
        mail-it0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1758057AbeD0MJd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 27 Apr 2018 08:09:33 -0400
Received: by mail-it0-f66.google.com with SMTP id 144-v6so1590106iti.5
        for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Apr 2018 05:09:33 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <2561366.LzYTbHeMbO@avalon>
References: <CGME20180427112213epcas2p3ed6890af75e679b537121f2655aa91d8@epcas2p3.samsung.com>
 <1524828105-26585-1-git-send-email-b.zolnierkie@samsung.com> <2561366.LzYTbHeMbO@avalon>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 27 Apr 2018 14:09:31 +0200
Message-ID: <CAKMK7uEJYcxpwJbhvQBF87VOo+zFA73Ro-guGkh4FtOFtr1Ehw@mail.gmail.com>
Subject: Re: [PATCH 0/3] fbdev/drm: sh_mobile: remove unused MERAM support
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        "open list:DRM DRIVERS FOR RENESAS"
        <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms+renesas@verge.net.au>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Apr 27, 2018 at 1:36 PM, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> Hi Bartlomiej,
>
> On Friday, 27 April 2018 14:21:42 EEST Bartlomiej Zolnierkiewicz wrote:
>> Hi,
>>
>> This patchset removes unused MERAM support (last user was removed
>> 3 years ago) from shmobile fbdev & drm drivers and then removes
>> MERAM driver itself.
>>
>> If it is okay to merge this patches I would like patch #1 to go
>> through fbdev tree and patch #2 to go through drm tree. Once they
>> are both upstream (v4.18) I will apply patch #3 to fbdev tree.
>
> Or you could merge everything through the fbdev tree in one go, the shmobile
> driver hardly sees any activity these days.
>
> For the whole series,
>
> Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Yeah merging all through fbdev is probably simplest, shmobile is not a
driver that's actively changed a lot. Ack from me too.
-Daniel

>
>> Bartlomiej Zolnierkiewicz (3):
>>   video: fbdev: sh_mobile_lcdcfb: remove unused MERAM support
>>   drm: shmobile: remove unused MERAM support
>>   video: fbdev: remove unused sh_mobile_meram driver
>>
>>  drivers/gpu/drm/shmobile/Kconfig           |   1 -
>>  drivers/gpu/drm/shmobile/shmob_drm_crtc.c  |  42 --
>>  drivers/gpu/drm/shmobile/shmob_drm_crtc.h  |   1 -
>>  drivers/gpu/drm/shmobile/shmob_drm_drv.h   |   2 -
>>  drivers/gpu/drm/shmobile/shmob_drm_kms.c   |  11 -
>>  drivers/gpu/drm/shmobile/shmob_drm_kms.h   |   1 -
>>  drivers/gpu/drm/shmobile/shmob_drm_plane.c |   2 -
>>  drivers/video/fbdev/Kconfig                |  13 -
>>  drivers/video/fbdev/Makefile               |   1 -
>>  drivers/video/fbdev/sh_mobile_lcdcfb.c     |  63 +--
>>  drivers/video/fbdev/sh_mobile_lcdcfb.h     |   1 -
>>  drivers/video/fbdev/sh_mobile_meram.c      | 754 --------------------------
>>  include/linux/platform_data/shmob_drm.h    |   4 -
>>  include/video/sh_mobile_lcdc.h             |   3 -
>>  include/video/sh_mobile_meram.h            |  95 ----
>>  15 files changed, 1 insertion(+), 993 deletions(-)
>>  delete mode 100644 drivers/video/fbdev/sh_mobile_meram.c
>>  delete mode 100644 include/video/sh_mobile_meram.h
>
> --
> Regards,
>
> Laurent Pinchart
>
>
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel



-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
