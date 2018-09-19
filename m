Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vs1-f67.google.com ([209.85.217.67]:40911 "EHLO
        mail-vs1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731421AbeISSce (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Sep 2018 14:32:34 -0400
MIME-Version: 1.0
References: <20180917163955.19023-1-geert+renesas@glider.be>
 <20180917163955.19023-3-geert+renesas@glider.be> <b7c4f5d1-020b-4a64-d511-b8e89f8c9196@redhat.com>
In-Reply-To: <b7c4f5d1-020b-4a64-d511-b8e89f8c9196@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 19 Sep 2018 14:54:31 +0200
Message-ID: <CAMuHMdXM9eog_+1oV_YCmSbOfBSFWOXy+YXwKGvfJA65rDqtzA@mail.gmail.com>
Subject: Re: [PATCH/RFC v4 2/2] vfio: platform: Add generic reset controller support
To: Auger Eric <eric.auger@redhat.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Alex Williamson <alex.williamson@redhat.com>,
        KVM list <kvm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Eric,

On Wed, Sep 19, 2018 at 2:36 PM Auger Eric <eric.auger@redhat.com> wrote:
> On 9/17/18 6:39 PM, Geert Uytterhoeven wrote:
> > Vfio-platform requires dedicated reset support, provided either by ACPI,
> > or, on DT platforms, by a device-specific reset driver matching against
> > the device's compatible value.
> >
> > On many SoCs, devices are connected to an SoC-internal reset controller.
> > If the reset hierarchy is described in DT using "resets" properties, or
> > in lookup tables in platform code, such devices can be reset in a
> > generic way through the reset controller subsystem.  Hence add support
> > for this, avoiding the need to write device-specific reset drivers for
> > each single device on affected SoCs.
> >
> > Devices that do require a more complex reset procedure can still provide
> > a device-specific reset driver, as that takes precedence.
> >
> > Note that this functionality depends on CONFIG_RESET_CONTROLLER=y, and
> > becomes a no-op (as in: "No reset function found for device") if reset
> > controller support is disabled.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
> > Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

> > --- a/drivers/vfio/platform/vfio_platform_common.c
> > +++ b/drivers/vfio/platform/vfio_platform_common.c

> > @@ -128,8 +131,16 @@ static int vfio_platform_get_reset(struct vfio_platform_device *vdev)
> >               vdev->of_reset = vfio_platform_lookup_reset(vdev->compat,
> >                                                       &vdev->reset_module);
> >       }
> > +     if (vdev->of_reset)
> > +             return 0;
> > +
> > +     rstc = reset_control_get_dedicated(vdev->device, NULL);
> > +     if (!IS_ERR(rstc)) {
> > +             vdev->reset_control = rstc;
> > +             return 0;
> > +     }
> >
> > -     return vdev->of_reset ? 0 : -ENOENT;
> > +     return PTR_ERR(rstc);
> This changes the returned value as seen by the user (probe returned
> valud). Can we keep -ENOENT in case of no reset controller found?

On success, it still returns 0.
On failure, it forwards the error from reset_control_get_dedicated(), which
is IMHO better than replacing it by -ENOENT: we try to propagate error
codes as much as possible.  It could e.g. return -EPROBE_DEFER.

Is there anything that relies on the function returning -ENOENT?

> Otherwise looks good to me with the new "dedicated" reset semantics.

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
