Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-oi0-f65.google.com ([209.85.218.65]:44928 "EHLO
        mail-oi0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751034AbeBIPrH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 9 Feb 2018 10:47:07 -0500
Received: by mail-oi0-f65.google.com with SMTP id b3so6404165oib.11
        for <linux-renesas-soc@vger.kernel.org>; Fri, 09 Feb 2018 07:47:07 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAMuHMdX07rESnzAko-Tjp6xvdmPEKsX0djp3sP5HZqzv6jvWMw@mail.gmail.com>
References: <1518189456-2873-1-git-send-email-geert+renesas@glider.be>
 <1518189456-2873-4-git-send-email-geert+renesas@glider.be>
 <CAFEAcA_Z1JH6RXp19g2N3rV3TGOTa7LzFctEScrENBYB8eAf3w@mail.gmail.com> <CAMuHMdX07rESnzAko-Tjp6xvdmPEKsX0djp3sP5HZqzv6jvWMw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 9 Feb 2018 15:46:46 +0000
Message-ID: <CAFEAcA9nUXjORak2TB-RGmLeEax0DZ11FsoPDy09V4w7nAXByw@mail.gmail.com>
Subject: Re: [PATCH/RFC 3/5] hw/arm/virt: Allow dynamic sysbus devices again
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        Alex Williamson <alex.williamson@redhat.com>,
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

On 9 February 2018 at 15:37, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> Hi Peter,
>
> On Fri, Feb 9, 2018 at 4:27 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
>> On 9 February 2018 at 15:17, Geert Uytterhoeven <geert+renesas@glider.be> wrote:
>>> Allow the instantation of generic dynamic sysbus devices again, without
>>> the need to create a new device-specific vfio type.
>>>
>>> This is a partial revert of commit  6f2062b9758ebc64 ("hw/arm/virt:
>>> Allow only supported dynamic sysbus devices").
>>>
>>> Not-Yet-Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>>> ---
>>>  hw/arm/virt.c | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>>> index b334c82edae9fb1f..fa83784fc08ed076 100644
>>> --- a/hw/arm/virt.c
>>> +++ b/hw/arm/virt.c
>>> @@ -1596,6 +1596,7 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
>>>      mc->max_cpus = 255;
>>>      machine_class_allow_dynamic_sysbus_dev(mc, TYPE_VFIO_CALXEDA_XGMAC);
>>>      machine_class_allow_dynamic_sysbus_dev(mc, TYPE_VFIO_AMD_XGBE);
>>> +    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_SYS_BUS_DEVICE);
>>>      mc->block_default_type = IF_VIRTIO;
>>>      mc->no_cdrom = 1;
>>>      mc->pci_allow_0_address = true;
>>
>> This needs a lot of justification. Dynamic sysbus is not supposed
>> to be for plugging any random sysbus device in, it's for vfio,
>> which needs special casing anyway to work right. (Overall it's
>
> Sure. Is there a way to limit this to vfio devices?

That would be the code here which implements the whitelist of
"only allow this for the vfio devices which we have
support for mangling the device tree for and know will work".

>> a terrible hack -- in an ideal world all vfio would use pci
>> or another probeable bus.)
>
> What about vfio-platform, which is my use case?
> On DT-based systems, platform devices are described very well in DT (even
> better than what's provided by probing PCI IDs and BARs ;-)

The TYPE_VFIO_* devices in the whitelist all use DT, yes:
the code to handle creating/mangling the dt nodes for the
passed-through device is in hw/arm/sysbus-fdt.c.

thanks
-- PMM
