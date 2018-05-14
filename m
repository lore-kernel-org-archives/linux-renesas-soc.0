Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:46498 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751402AbeENNqe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 14 May 2018 09:46:34 -0400
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        "open list:DRM DRIVERS FOR RENESAS"
        <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: Re: [PATCH 0/3] fbdev/drm: sh_mobile: remove unused MERAM support
Date: Mon, 14 May 2018 15:46:25 +0200
Message-id: <1860943.gJ4HIv7g2V@amdc3058>
In-reply-to: <CAKMK7uEJYcxpwJbhvQBF87VOo+zFA73Ro-guGkh4FtOFtr1Ehw@mail.gmail.com>
MIME-version: 1.0
Content-transfer-encoding: 7Bit
Content-type: text/plain; charset="us-ascii"
References: <CGME20180427112213epcas2p3ed6890af75e679b537121f2655aa91d8@epcas2p3.samsung.com>
        <2561366.LzYTbHeMbO@avalon>
        <CAKMK7uEJYcxpwJbhvQBF87VOo+zFA73Ro-guGkh4FtOFtr1Ehw@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Friday, April 27, 2018 02:09:31 PM Daniel Vetter wrote:
> On Fri, Apr 27, 2018 at 1:36 PM, Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
> > Hi Bartlomiej,
> >
> > On Friday, 27 April 2018 14:21:42 EEST Bartlomiej Zolnierkiewicz wrote:
> >> Hi,
> >>
> >> This patchset removes unused MERAM support (last user was removed
> >> 3 years ago) from shmobile fbdev & drm drivers and then removes
> >> MERAM driver itself.
> >>
> >> If it is okay to merge this patches I would like patch #1 to go
> >> through fbdev tree and patch #2 to go through drm tree. Once they
> >> are both upstream (v4.18) I will apply patch #3 to fbdev tree.
> >
> > Or you could merge everything through the fbdev tree in one go, the shmobile
> > driver hardly sees any activity these days.
> >
> > For the whole series,
> >
> > Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> Yeah merging all through fbdev is probably simplest, shmobile is not a
> driver that's actively changed a lot. Ack from me too.

Thanks, I've applied all patches to fbdev-for-next.

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics
