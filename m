Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:33651 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753947AbeGETNe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 5 Jul 2018 15:13:34 -0400
Received: by mail-wm0-f68.google.com with SMTP id z6-v6so3590165wma.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 05 Jul 2018 12:13:33 -0700 (PDT)
Subject: Re: [PATCH v2 00/14] ravb/sh_eth: fix sleep in atomic by reusing
 shared ethtool handlers
To: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>,
        David Miller <davem@davemloft.net>
Cc: andrew@lunn.ch, geert@linux-m68k.org, netdev@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
References: <20180704081245.7395-1-vladimir_zapolskiy@mentor.com>
 <20180705.095631.647119741817887082.davem@davemloft.net>
 <dfbdaeac-0bb3-0e8a-6a85-a33561a9dcb7@mentor.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <0033a44c-d137-b5f8-2259-33ac11c70d68@cogentembedded.com>
Date: Thu, 5 Jul 2018 22:13:29 +0300
MIME-Version: 1.0
In-Reply-To: <dfbdaeac-0bb3-0e8a-6a85-a33561a9dcb7@mentor.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 07/05/2018 08:59 AM, Vladimir Zapolskiy wrote:

>>> For ages trivial changes to RAVB and SuperH ethernet links by means of
>>> standard 'ethtool' trigger a 'sleeping function called from invalid
>>> context' bug, to visualize it on r8a7795 ULCB:
>>  ...
>>> The root cause is that an attempt to modify ECMR and GECMR registers
>>> only when RX/TX function is disabled was too overcomplicated in its
>>> original implementation, also processing of an optional Link Change
>>> interrupt added even more complexity, as a result the implementation
>>> was error prone.
>>>
>>> The new locking scheme is confirmed to be correct by dumping driver
>>> specific and generic PHY framework function calls with aid of ftrace
>>> while running more or less advanced tests.
>>>
>>> Please note that sh_eth patches from the series were built-tested only.
>>>
>>> On purpose I do not add Fixes tags, the reused PHY handlers were added
>>> way later than the fixed problems were firstly found in the drivers.
>>>
>>> Changes from v1 to v2:
>>> * the original patches are split to bugfixes and enhancements only,
>>>   both v1 and v2 series are absolutely equal in total, thus I omit
>>>   description of changes in individual patches,
>>> * the latter implies that there should be no strict need for retesting,
>>>   but because formally two series are different, I have to drop the tags
>>>   given by Geert and Andrew, please send your tags again.
>>
>> These changes look fine to me but I want to see some reviews and/or
>> testing before I apply them.
>>
> 
> Thanks to Geert for finding time to test v1 series, the sums of changes
> are word for word, https://www.spinics.net/lists/linux-renesas-soc/msg28666.html

   I might find a time to test the sh_eth patches on the R-Car V3H Starter Kit board;
I'm still on vacations, so don't have access to the R-Car gen2 boards at home...

> Andrew also gave a number of Reviewed-by tags, but they are not directly
> applicable to new patches, unfortunately.
> 
> In any case let's wait for scrupulous review completed by Sergei, I believe
> he'd like to contribute to the review process, and Sergei may highlight more
> shortcomings.

   Heh. I'm surprised DaveM haven't lectured you about not mixing fixes and cleanups
in the single series -- they go to his different 2 trees, net.git and net-next.git...
If you need your cleanups based on your fixes, you have to indicate that in the cleanups
patchset...

> --
> Best wishes,
> Vladimir

MBR, Sergei
