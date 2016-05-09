Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from smtp6-v.fe.bosch.de ([139.15.237.11]:58841 "EHLO
	smtp6-v.fe.bosch.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751544AbcEIH5U (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Mon, 9 May 2016 03:57:20 -0400
Subject: Re: [PATCH 09/10] ARM: r8a779x: Add boot mode reg support
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <1462778041-19595-1-git-send-email-dirk.behme@de.bosch.com>
 <1462778041-19595-10-git-send-email-dirk.behme@de.bosch.com>
 <CAMuHMdWHmu0WQSeU8oHwUhm20ZGqzmLGXG1tz8suuGqY=b49Vg@mail.gmail.com>
 <c75e9eda-642d-c1f8-5a10-68e27aa49ae3@de.bosch.com>
 <CAMuHMdVr8r5D72BiF6__gfZOJkNxmPcykB0pNeJq7zcdsVpN-A@mail.gmail.com>
CC: Geert Uytterhoeven <geert+renesas@glider.be>,
	Simon Horman <horms+renesas@verge.net.au>,
	<linux-renesas-soc@vger.kernel.org>,
	Dirk Behme <dirk.behme@gmail.com>
From: Dirk Behme <dirk.behme@de.bosch.com>
Message-ID: <0d331be5-9540-86f6-406e-ec5647551e73@de.bosch.com>
Date: Mon, 9 May 2016 09:57:17 +0200
MIME-Version: 1.0
In-Reply-To: <CAMuHMdVr8r5D72BiF6__gfZOJkNxmPcykB0pNeJq7zcdsVpN-A@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

On 09.05.2016 09:54, Geert Uytterhoeven wrote:
> Hi Dirk,
>
> On Mon, May 9, 2016 at 9:52 AM, Dirk Behme <dirk.behme@de.bosch.com> wrote:
>> On 09.05.2016 09:44, Geert Uytterhoeven wrote:
>>>
>>> On Mon, May 9, 2016 at 9:14 AM, Dirk Behme <dirk.behme@de.bosch.com>
>>> wrote:
>>>>
>>>> --- a/arch/arm/boot/dts/r8a7790.dtsi
>>>> +++ b/arch/arm/boot/dts/r8a7790.dtsi
>>>> @@ -1102,6 +1102,11 @@
>>>>                         #power-domain-cells = <0>;
>>>>                 };
>>>>
>>>> +               modemr: modemr@e6160060 {
>>>> +                       compatible = "renesas,modemr";
>>>> +                       reg = <0 0xe6160060 0 0x4>;
>>>> +               };
>>>> +
>>>
>>>
>>> This should be a node for the complete RST module, not just for the RST
>>> module's
>>> MODEMR register.
>>
>>
>>
>> You mean
>>
>> reset: reset@e6160000 {
>>         compatible = "renesas,reset";
>>         reg = <0 0xe6160000 0 0x200>;
>> };
>>
>> and then use anything like
>>
>> #define MODEMR 0x60
>>
>> in the code?
>
> Yes, more or less:
>
>         reset-controller@e6160000 {
>                 compatible = "renesas,r8a7795-rst";


Hmm, do we really want the r8a7795 here? Then we would need

r8a7790-rst
r8a7791-rst
r8a7792-rst
r8a7793-rst
r8a7794-rst
r8a7795-rst
r8a7796-rst
...

?


Best regards

Dirk
