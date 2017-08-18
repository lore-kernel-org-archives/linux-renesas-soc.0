Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from smtp6-v.fe.bosch.de ([139.15.237.11]:35075 "EHLO
        smtp6-v.fe.bosch.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750877AbdHRJEP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Aug 2017 05:04:15 -0400
Subject: Re: Status of r8a7795 SDHI support?
To: Wolfram Sang <wsa@the-dreams.de>
CC: <linux-renesas-soc@vger.kernel.org>
References: <513dd4ea-7309-d2a3-7940-b14bc1836c31@de.bosch.com>
 <20170817072921.GB1423@katana>
 <fd4fb97d-9284-f2fa-5719-e28e6cc2fe20@de.bosch.com>
 <20170818090042.z3jx6rufxuc56m2t@ninjato>
From: Dirk Behme <dirk.behme@de.bosch.com>
Message-ID: <32eb505f-b622-2562-e6d0-818c6bbab32a@de.bosch.com>
Date: Fri, 18 Aug 2017 11:04:12 +0200
MIME-Version: 1.0
In-Reply-To: <20170818090042.z3jx6rufxuc56m2t@ninjato>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 18.08.2017 11:00, Wolfram Sang wrote:
> 
>>>> What's the status of SDHI support in mainline and/or renesas-drivers
>>>> (renesas-drivers-2017-08-16-v4.13-rc5)?
>>>
>>> I use it daily here, even with SDR104 enabled.
>>
>> On ES2.0? I wonder how if not even the pinmux is there ;)
> 
> Ah, ES2.0. That's the missing information. Yup, is on the todo-list. I
> will try to test your patch on my Salvator-XS board today.


Ok, thanks :)


>> 	mmc-hs400-1_8v;
> 
> We only have HS200 support upstream. Other than that, I don't see any
> problems in the DTS snipplet.


But even if this is wrong, at least some error messages should be given, no?

As mentioned, there was nothing. So I'd assume a more basic issue, like 
missing clock or compatible or similar.


Best regards

Dirk
