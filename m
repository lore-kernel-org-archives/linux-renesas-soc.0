Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qk0-f196.google.com ([209.85.220.196]:40309 "EHLO
        mail-qk0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751918AbeDLMuY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 Apr 2018 08:50:24 -0400
Received: by mail-qk0-f196.google.com with SMTP id o64so5819708qkl.7
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Apr 2018 05:50:23 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <3ee22637-a0a9-306a-4e6d-14295d4bcb27@redhat.com>
References: <1518189456-2873-1-git-send-email-geert+renesas@glider.be>
 <1518189456-2873-4-git-send-email-geert+renesas@glider.be> <3ee22637-a0a9-306a-4e6d-14295d4bcb27@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 12 Apr 2018 14:50:22 +0200
Message-ID: <CAMuHMdUKLg2S-cySkN1_6esgt7ZEjqRwxHdB73i6+f9MaGjh6Q@mail.gmail.com>
Subject: Re: [PATCH/RFC 3/5] hw/arm/virt: Allow dynamic sysbus devices again
To: Auger Eric <eric.auger@redhat.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        Peter Maydell <peter.maydell@linaro.org>,
        Alex Williamson <alex.williamson@redhat.com>,
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

Hi Eric,

On Wed, Feb 14, 2018 at 11:37 AM, Auger Eric <eric.auger@redhat.com> wrote:
> On 09/02/18 16:17, Geert Uytterhoeven wrote:
>> Allow the instantation of generic dynamic sysbus devices again, without
>> the need to create a new device-specific vfio type.
>>
>> This is a partial revert of commit  6f2062b9758ebc64 ("hw/arm/virt:
>> Allow only supported dynamic sysbus devices").
>>
>> Not-Yet-Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>> ---
>>  hw/arm/virt.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>> index b334c82edae9fb1f..fa83784fc08ed076 100644
>> --- a/hw/arm/virt.c
>> +++ b/hw/arm/virt.c
>> @@ -1596,6 +1596,7 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
>>      mc->max_cpus = 255;
>>      machine_class_allow_dynamic_sysbus_dev(mc, TYPE_VFIO_CALXEDA_XGMAC);
>>      machine_class_allow_dynamic_sysbus_dev(mc, TYPE_VFIO_AMD_XGBE);
>> +    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_SYS_BUS_DEVICE);
> Couldn't you limit that to TYPE_VFIO_PLATFORM instead?

Yep, that works. Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
