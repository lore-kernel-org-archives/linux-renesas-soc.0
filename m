Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qt0-f193.google.com ([209.85.216.193]:33536 "EHLO
        mail-qt0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751053AbeBIQGg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 9 Feb 2018 11:06:36 -0500
Received: by mail-qt0-f193.google.com with SMTP id d8so11155656qtm.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 09 Feb 2018 08:06:36 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20180209085024.004b6f9e@w520.home>
References: <1518189456-2873-1-git-send-email-geert+renesas@glider.be>
 <1518189456-2873-5-git-send-email-geert+renesas@glider.be> <20180209085024.004b6f9e@w520.home>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 9 Feb 2018 17:06:34 +0100
Message-ID: <CAMuHMdWaoutP+oFL0Vtw+Z-986_=3wLAu+58N9ZT7t+uZb1ycA@mail.gmail.com>
Subject: Re: [PATCH/RFC 4/5] vfio: No-IOMMU mode support
To: Alex Williamson <alex.williamson@redhat.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        Peter Maydell <peter.maydell@linaro.org>,
        Auger Eric <eric.auger@redhat.com>,
        Xiao Feng Ren <renxiaof@linux.vnet.ibm.com>,
        Arnd Bergmann <arnd@arndb.de>, Alexander Graf <agraf@suse.de>,
        Magnus Damm <magnus.damm@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        qemu-arm <qemu-arm@nongnu.org>,
        QEMU Developers <qemu-devel@nongnu.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Alex,

On Fri, Feb 9, 2018 at 4:50 PM, Alex Williamson
<alex.williamson@redhat.com> wrote:
> On Fri,  9 Feb 2018 16:17:35 +0100
> Geert Uytterhoeven <geert+renesas@glider.be> wrote:
>> From: Xiao Feng Ren <renxiaof@linux.vnet.ibm.com>
>>
>> Add qemu support for the newly introduced VFIO No-IOMMU driver.
>>
>> We need to add special handling for:
>> - Group character device is /dev/vfio/noiommu-$GROUP.
>> - No-IOMMU does not rely on a memory listener.
>> - No IOMMU will be set for its group, so no need to call
>>   vfio_kvm_device_add_group.
>>
>> Signed-off-by: Xiao Feng Ren <renxiaof@linux.vnet.ibm.com>
>> [geert: Rebase]
>> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>> ---
>>  hw/vfio/common.c              | 61 ++++++++++++++++++++++++++++++++++---------
>>  include/hw/vfio/vfio-common.h |  2 ++
>>  2 files changed, 50 insertions(+), 13 deletions(-)
>
> NAK.  I'm opposed to no-iommu support in QEMU in general, but accepting
> vfio devices with no-iommu (which provide no DMA translation!!!)
> transparently as if they might actually work like a regular vfio device
> is absolutely unacceptable.  Without DMA translation and isolation, you
> might want to think about another interface, I'm not keen on the idea

What if the device cannot do DMA?

There are other devices that cannot do DMA, but that can be useful to
access from a guest in an embedded system.
E.g. smart ADC monitor blocks that monitor and average several ADCs in an
automotive environment (drivers/iio/adc/rcar-gyroadc.c).

Should all such devices be paravirtualized?

> of corrupting vfio support in order to blink some LEDs.  Thanks,

This GPIO+LED prototype is just a proof-of-concept. There's no plan to
upstream it.

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
