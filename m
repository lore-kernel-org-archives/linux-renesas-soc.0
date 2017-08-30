Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from smtp6-v.fe.bosch.de ([139.15.237.11]:48602 "EHLO
        smtp6-v.fe.bosch.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750998AbdH3G41 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 30 Aug 2017 02:56:27 -0400
Subject: Re: clk: renesas: rcar-gen3: Status of Z* clocks?
To: Simon Horman <horms@verge.net.au>
CC: Geert Uytterhoeven <geert@linux-m68k.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
References: <705d6de1-a037-f1e1-8c61-7b5aa5e0f30a@de.bosch.com>
 <CAMuHMdVuBqSLjMg+r1y7_TRSDL5r1tLhTewfgr5xU9hZup=PLA@mail.gmail.com>
 <1664e732-4e38-06fb-cfef-d42b49a45d62@de.bosch.com>
 <CAMuHMdXzuUzGnUkMfMdMcV5fCcsLn5uP4XQUkh9tfzAsfo0_ww@mail.gmail.com>
 <6cad207c-8f9e-3ed9-36e7-16963a6a3892@de.bosch.com>
 <20170830064802.GD10398@verge.net.au>
From: Dirk Behme <dirk.behme@de.bosch.com>
Message-ID: <d7e1cc11-6985-6bf6-a1bb-4a5fd4b83127@de.bosch.com>
Date: Wed, 30 Aug 2017 08:56:25 +0200
MIME-Version: 1.0
In-Reply-To: <20170830064802.GD10398@verge.net.au>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 30.08.2017 08:48, Simon Horman wrote:
> On Tue, Aug 29, 2017 at 12:36:50PM +0200, Dirk Behme wrote:
>> On 29.08.2017 11:44, Geert Uytterhoeven wrote:
>>> Hi Dirk,
>>>
>>> On Tue, Aug 29, 2017 at 11:15 AM, Dirk Behme <dirk.behme@de.bosch.com> wrote:
>>>> But ZG and with this module clock #112 is still missing, no?
>>>>
>>>> https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas-bsp.git/commit/?h=v4.9/rcar-3.5.8&id=aa7b99b06d280e4151e
>>>>
>>>> https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas-bsp.git/commit/?h=v4.9/rcar-3.5.8&id=a03bfd8abc9572800fb5043
>>>
>>> The ZG bits in the FRQCRB register are documented to exist on R-Car D3
>>> only.
>>
>>
>> ... what contradicts
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas-bsp.git/commit/?h=v4.9/rcar-3.5.8&id=a03bfd8abc9572800fb5043
> 
> Yes, there does seem to be a contradiction there.
> 
>> and the 3DGE module clock in e.g. MSTPSR1 which is documented for H3 and
>> M3-W, too, and Table 8.1a List of Clocks [R-Car H3] ZG -> 3DGE etc.
> 
> Geert may have a different opinion but mine is not to add clocks
> for which we don't have a near-term use in mainline.


In my opinion it would reduce the number of non-mainline patches needed 
and with this ease the use of mainline for nearly no cost.

There is always a discussion like "uh, we can't use mainline because it 
doesn't support xx (add a random number > 0) features and we have to 
apply xx (add a random number > 0) patches to make it work" I'd like to 
improve.

Best regards

Dirk
