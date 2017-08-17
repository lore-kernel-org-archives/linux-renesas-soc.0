Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from smtp6-v.fe.bosch.de ([139.15.237.11]:42902 "EHLO
        smtp6-v.fe.bosch.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751609AbdHQHy5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 17 Aug 2017 03:54:57 -0400
Subject: Re: Status of r8a7795 SDHI support?
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Wolfram Sang <wsa@the-dreams.de>
References: <513dd4ea-7309-d2a3-7940-b14bc1836c31@de.bosch.com>
 <CAMuHMdXX6tfwyWGXWhT-=4LwoBAqbJxmcwzEe0uQE2uFORLh1A@mail.gmail.com>
 <8ff9f7b5-e967-3b7c-9c27-0c8ef0ec3d8d@de.bosch.com>
 <CAMuHMdXnyRrBU=hLFRpBk5tbWCsTj_BBBG1Yt8dsqFaX2uuGaw@mail.gmail.com>
From: Dirk Behme <dirk.behme@de.bosch.com>
Message-ID: <e83d347e-3a41-229f-f850-b9e6e8cb2b12@de.bosch.com>
Date: Thu, 17 Aug 2017 09:54:55 +0200
MIME-Version: 1.0
In-Reply-To: <CAMuHMdXnyRrBU=hLFRpBk5tbWCsTj_BBBG1Yt8dsqFaX2uuGaw@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 17.08.2017 09:48, Geert Uytterhoeven wrote:
> Hi Dirk,
> 
> On Thu, Aug 17, 2017 at 9:44 AM, Dirk Behme <dirk.behme@de.bosch.com> wrote:
>> On 17.08.2017 09:33, Geert Uytterhoeven wrote:
>>> On Thu, Aug 17, 2017 at 9:23 AM, Dirk Behme <dirk.behme@de.bosch.com>
>>> wrote:
>>>> since ages I tried recent mainline (v4.13-rc5) on a custom r8a7795 board.
>>>
>>> R-Car H3 ES1.x or ES2.0?
>>
>> ES2.0
>>
>>>> I tried with the attachment and picked some patches from
>>>> renesas-drivers-2017-08-16-v4.13-rc5 [1] but it doesn't look like any SD
>>>> card / eMMC is detected at all [2].
>>>
>>> That patch is for ES2.0. There are indeed no SDHI pins in the upstream
>>> pinctrl
>>> driver for ES2.0 yet.
>>
>> So its fine to send the attached patch for integration?
> 
> Yes, iff it works. But you claim it doesn't?


Well, at least it removes the error messages regarding pinctrl [1]. Yes, 
as mentioned, if in the end SD / eMMC work I can't say, yet.


Best regards

Dirk


[1]

sh-pfc e6060000.pin-controller: function 'sdhi0' not supported
sh-pfc e6060000.pin-controller: invalid function sdhi0 in map table
sh-pfc e6060000.pin-controller: does not have pin group sdhi0_data4
sh-pfc e6060000.pin-controller: could not map group config for "sdhi0_data4"
sh-pfc e6060000.pin-controller: function 'sdhi0' not supported
sh-pfc e6060000.pin-controller: invalid function sdhi0 in map table
sh-pfc e6060000.pin-controller: does not have pin group sdhi0_ctrl
sh-pfc e6060000.pin-controller: could not map group config for "sdhi0_ctrl"
sh-pfc e6060000.pin-controller: function 'sdhi0' not supported
sh-pfc e6060000.pin-controller: invalid function sdhi0 in map table
sh-pfc e6060000.pin-controller: does not have pin group sdhi0_data4
sh-pfc e6060000.pin-controller: could not map group config for "sdhi0_data4"
sh-pfc e6060000.pin-controller: function 'sdhi0' not supported
sh-pfc e6060000.pin-controller: invalid function sdhi0 in map table
sh-pfc e6060000.pin-controller: does not have pin group sdhi0_ctrl
sh-pfc e6060000.pin-controller: could not map group config for "sdhi0_ctrl"
sh_mobile_sdhi: probe of ee100000.sd failed with error -22
