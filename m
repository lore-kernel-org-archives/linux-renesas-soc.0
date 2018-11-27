Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm1-f67.google.com ([209.85.128.67]:40727 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726448AbeK0LKV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 27 Nov 2018 06:10:21 -0500
Subject: Re: [PATCH 4/4] pinctrl: sh-pfc: r8a77990: Add CAN FD pins, groups
 and functions
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>,
        Wolfram Sang <wsa@the-dreams.de>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
References: <20181118172903.4481-1-marek.vasut+renesas@gmail.com>
 <20181118172903.4481-4-marek.vasut+renesas@gmail.com>
 <CAMuHMdXjFguUO1QJXDrfjbOBY7ZHy2PM41vAKx4oppqoY0RviA@mail.gmail.com>
 <CAMuHMdWBgEXHS1tfbysindPyfjm54Qrtf3o+gEzN1N4gOzzydQ@mail.gmail.com>
 <e89dbb42-2c43-0201-ad26-b2f3ae8bc8cf@gmail.com>
 <CAMuHMdWueA-rmyc5FSkW6uQzPzdBm_kBdUthnwsghBvZKL5EVQ@mail.gmail.com>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <08f03977-0658-b138-3010-94f43de292f3@gmail.com>
Date: Tue, 27 Nov 2018 01:14:22 +0100
MIME-Version: 1.0
In-Reply-To: <CAMuHMdWueA-rmyc5FSkW6uQzPzdBm_kBdUthnwsghBvZKL5EVQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 11/21/2018 08:39 AM, Geert Uytterhoeven wrote:
> Hi Marek,

Hi,

> On Wed, Nov 21, 2018 at 12:33 AM Marek Vasut <marek.vasut@gmail.com> wrote:
>> On 11/19/2018 10:47 AM, Geert Uytterhoeven wrote:
>>> On Mon, Nov 19, 2018 at 10:06 AM Geert Uytterhoeven
>>> <geert@linux-m68k.org> wrote:
>>>> On Sun, Nov 18, 2018 at 6:29 PM Marek Vasut <marek.vasut@gmail.com> wrote:
>>>>> From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
>>>>>
>>>>> This patch adds CAN FD{0,1} pins, groups and functions to the R8A77990
>>>>> SoC.
>>>>>
>>>>> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
>>>>> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
>>>>
>>>> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>>>> i.e. will queue in sh-pfc-for-v4.21.
>>>
>>> Upon second look, the canfd groups and functions should be moved from
>>> the common to the automotive section, as RZ/G2E does not have them.
>>> As I have to update the array sizes anyway (my branch already has more
>>> patches applied), I moved them while applying.
>>>
>>> Please check the result later today, after I have pushed.
>>
>> Looks OK to me. Incrementing the array sizes in the driver is kinda icky
> 
> Thanks!
> 
>> though.
> 
> Unfortunately I see no way to avoid that, as both arrays need to be consecutive
> in memory.  Do you see a better solution?

U-Boot uses linker-generated lists , but I think this might be an
overkill here.

-- 
Best regards,
Marek Vasut
