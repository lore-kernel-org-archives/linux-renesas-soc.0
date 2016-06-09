Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from smtp6-v.fe.bosch.de ([139.15.237.11]:55122 "EHLO
	smtp6-v.fe.bosch.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932099AbcFILMy (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Thu, 9 Jun 2016 07:12:54 -0400
Subject: Re: R-Car3: PFC: Where to do the pinmux/drvctrl?
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <bc98025b-74dd-5b9d-0e0b-9672d4a38afd@de.bosch.com>
 <CAMuHMdU+ec1cpWP04Cw=ntHTjfq0dJQRjvoA6+fJZcBc7_+hqA@mail.gmail.com>
 <fec447b5-b7f6-b8e6-eed1-375e695de970@de.bosch.com>
 <CAMuHMdXQXcsMikNwdZTDWCVPqUzhzm8iQQ-Vsoute6Vuz4gLfw@mail.gmail.com>
CC: <linux-renesas-soc@vger.kernel.org>,
	"Keshavarzi Pooya (CM/ESO1)" <Pooya.Keshavarzi@de.bosch.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
From: Dirk Behme <dirk.behme@de.bosch.com>
Message-ID: <b1fa6e51-5158-5bb5-9b79-a1bc637dbab9@de.bosch.com>
Date: Thu, 9 Jun 2016 13:12:50 +0200
MIME-Version: 1.0
In-Reply-To: <CAMuHMdXQXcsMikNwdZTDWCVPqUzhzm8iQQ-Vsoute6Vuz4gLfw@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

On 09.06.2016 11:20, Geert Uytterhoeven wrote:
> Hi Dirk,
>
> On Thu, Jun 9, 2016 at 10:58 AM, Dirk Behme <dirk.behme@de.bosch.com> wrote:
>> On 09.06.2016 10:22, Geert Uytterhoeven wrote:
>>> On Thu, Jun 9, 2016 at 8:56 AM, Dirk Behme <dirk.behme@de.bosch.com>
>>> wrote:
>>>> with the R-Car3, the pinmux/drvctrl is done at 3 places:
>>>> 1. ARM trusted firmware / IPL:
>>>>
>>>> https://github.com/renesas-rcar/meta-renesas/blob/jethro/meta-rcar-gen3/recipes-bsp/arm-trusted-firmware/arm-trusted-firmware/0001-add-bl2-bl31-R-Car-support.patch#L8428
>>>>
>>>> 2. U-Boot:
>>>>
>>>> https://github.com/renesas-rcar/u-boot/blob/v2015.04/rcar-3.2.x/board/renesas/salvator-x/salvator-x.c#L116
>>>>
>>>> 3. Linux kernel
>>>>
>>>> https://git.kernel.org/cgit/linux/kernel/git/geert/renesas-drivers.git/tree/drivers/pinctrl/sh-pfc/pfc-r8a7795.c?h=topic/gen3-latest
>>>>
>>>> Now, the issue we see is that (of course?) this is not necessarily
>>>> consistent.
>>>>
>>>> Therefore: What's supposed to be the correct place to do this (once)?
>>>
>>> IMHO the kernel should take care of making sure pinctrl is configured
>>> correctly,
>>> independent of earlier stages in the boot process.
>>
>> From previous discussions with kernel people I expected this answer ;)
>>
>> In my opinion, to be able to keep the pinctrl consistent, you have to do it
>> in one place. To avoid issues like discussed below. And to be able to
>> maintain it. The consequence of this "one place" would be that the main
>> place is the boot loader, then. In case of the Salvator-X this would be the
>> ARM trusted firmware (IPL), then.
>>
>> Yes, I know, kernel people see this differently, as the kernel is the only
>> place they have under control. From that point of view only the kernel can
>> "fix" broken or not updated boot loaders.
>>
>> So it depends whether you have only the kernel or everything under your
>> control, including the boot loader.
>>
>>> Note that if the kernel takes care of it, doing it once is not an option,
>>> as
>>> earlier stages may need pinctrl configuration depending on boot method
>>> (e.g. TFTP over Ethernet needs RAVB setup).
>>
>> How will the kernel handle different boards needing different pinctrl
>> configuration?
>>
>> I.e. how is pfc-r8a7795 supposed to cover different boards?
>
> Pinctrl for devices is described in the board's DTS (e.g.
> r8a7795-salvator-x.dts).
>
> Or in a DT overlay, if you use the EXIO connectors.
>
>>>> The example is the RAVB ethernet: We found that on the Salvator-X the
>>>> kernel's ethernet doesn't work without being initialized by U-Boot. I.e.
>>>> without running U-Boot doing the drvctrl [1] ethernet fails in the Linux
>>>> kernel.
>>>
>>> This is a missing/incorrect drive strength configuration?
>>
>> Yes, I think so.
>>
>>> The pfc-r8a7795 does have support for drive strength, but only for pins
>>> that
>>> also have GPIO capabilities. (At least some of) the RAVB pins don't seem
>>> to be handled (e.g. DRVCTRL2).
>>
>> So your proposal would be to fix/correct/extend Linux kernel's pfc-r8a7795
>> to correctly support the drive strength needed for the RAVB on the
>> Salvator-X?
>
> No, you need more steps.
>
> 1. Add non-GPIO drive strength support to pfc-r8a7795,
> 2. Describe correct RAVB pinctrl config in r8a7795-salvator-x.dts.
> 3. Profit!


I think we will go with fixing the boot loader, then :)


Best regards

Dirk
