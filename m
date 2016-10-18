Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <HK2PR06MB05485C89CDD20CA8FBA0DD85D8D30@HK2PR06MB0548.apcprd06.prod.outlook.com>
References: <1476688248-983-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdV8-pJ4+DRGTFJpD+QAVioP6a1aCOMWYuBe2T-vo1+8TQ@mail.gmail.com> <HK2PR06MB05485C89CDD20CA8FBA0DD85D8D30@HK2PR06MB0548.apcprd06.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 18 Oct 2016 09:47:44 +0200
Message-ID: <CAMuHMdWEZawr0MPDBUccQR=SPdvE1Pe5WYyQwFYL5zsmYS9aFQ@mail.gmail.com>
Subject: Re: [PATCH] phy: rcar-gen3-usb2: add sysfs for usb role swap
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: Kishon Vijay Abraham I <kishon@ti.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Shimoda-san,

On Tue, Oct 18, 2016 at 8:19 AM, Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
>> From: geert.uytterhoeven@gmail.com
>> Sent: Monday, October 17, 2016 9:28 PM
>> On Mon, Oct 17, 2016 at 9:10 AM, Yoshihiro Shimoda
>> <yoshihiro.shimoda.uh@renesas.com> wrote:
>> > This patch adds sysfs "otg_inputs" for usb role swap. This parameter
>> > is write-only and if you use them as the following, you can swap
>> > the usb role.
>>
>> Thank you for your patch!
>
> Thank you for the review!
>
>> > For example:
>> >  1) connect a usb cable using 2 salvator-x boards
>> >  2) On A-device (as host), you input the following command:
>> >    # echo a_bus_req/ > /sys/devices/platform/soc/ee080200.usb-phy/otg_inputs
>> >  3) On B-device (as peripheral), you input the following command:
>> >    # echo b_bus_req > /sys/devices/platform/soc/ee080200.usb-phy/otg_inputs
>>
>> At first, I thought the trailing "/" was a typo...
>>
>> > --- /dev/null
>> > +++ b/Documentation/ABI/testing/sysfs-platform-phy-rcar-gen3-usb2
>> > @@ -0,0 +1,11 @@
>> > +What:          /sys/devices/platform/<phy-name>/otg-inputs
>> > +Date:          October 2016
>> > +KernelVersion: 4.10
>> > +Contact:       Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
>> > +Description:
>> > +               This write-only file changes the phy mode for role swap of usb.
>> > +               This file accepts the following strings:
>> > +                "a_bus_req/" - switching from A-Host to A-Peripheral
>> > +                "a_bus_drop" - switching from A-Peripheral to A-Host
>> > +                "b_bus_req"  - switching from B-Peripheral to B-Host
>> > +                "b_bus_req/" - switching from B-Host to B-Peripheral
>>
>> ... until I read the above.
>>
>> What's the rationale of doing it like this? I.e.
>>   1. Why differentiate by trailing "/"?
>
> This usb role swap feature is not compatible with USB OTG though,
> but this strings are from the manual that usb.org released:
> http://www.usb.org/developers/docs/usb20_docs/
>  --> usb_20_091216.zip
>   --> USB OTG and Embedded Host/USB_OTG_and_EH_2-0-version 1_1a.pdf
>    Please refer to the following figures:
>     - Figure 7-1: OTG A-device with HNP State Diagram
>     - Figure 7-4: OTG B-device with HNP State Diagram
>
> So, it seems the "/" means FALSE.
>
>>   2. Why the asymmetry ("a_bus_drop" vs. "a_bus_req")?
>
> This is also related the document.
>  - From "a_host" to "a_suspend" state if "a_bus_req/" event happens.
>  - From "a_suspend" to "a_host" state if "a_bus_req" event happens.
>   (But the driver doesn't support it and we can use "a_bus_drop".)
>  - From "a_peripheral" to "a_wait_vfall" state if "a_bus_drop" event happens.

Thanks for the explanation!

Regardless, I think it would be good to CC the USB maintainer and mailing
list on next submission.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
