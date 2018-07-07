Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:35224 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753586AbeGGPWM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 7 Jul 2018 11:22:12 -0400
Received: by mail-wm0-f66.google.com with SMTP id v3-v6so13257074wmh.0
        for <linux-renesas-soc@vger.kernel.org>; Sat, 07 Jul 2018 08:22:11 -0700 (PDT)
Subject: Re: [PATCH v2 00/14] ravb/sh_eth: fix sleep in atomic by reusing
 shared ethtool handlers
To: David Miller <davem@davemloft.net>, vladimir_zapolskiy@mentor.com
Cc: andrew@lunn.ch, geert@linux-m68k.org, netdev@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
References: <20180704081245.7395-1-vladimir_zapolskiy@mentor.com>
 <20180707.104719.681210882015993840.davem@davemloft.net>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <14b0b5fd-02d1-3b57-ec7c-eacdf8bff091@cogentembedded.com>
Date: Sat, 7 Jul 2018 18:22:08 +0300
MIME-Version: 1.0
In-Reply-To: <20180707.104719.681210882015993840.davem@davemloft.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 7/7/2018 4:47 AM, David Miller wrote:

>> For ages trivial changes to RAVB and SuperH ethernet links by means of
>> standard 'ethtool' trigger a 'sleeping function called from invalid
>> context' bug, to visualize it on r8a7795 ULCB:
>   ...
>> The root cause is that an attempt to modify ECMR and GECMR registers
>> only when RX/TX function is disabled was too overcomplicated in its
>> original implementation, also processing of an optional Link Change
>> interrupt added even more complexity, as a result the implementation
>> was error prone.
>>
>> The new locking scheme is confirmed to be correct by dumping driver
>> specific and generic PHY framework function calls with aid of ftrace
>> while running more or less advanced tests.
>>
>> Please note that sh_eth patches from the series were built-tested only.
>>
>> On purpose I do not add Fixes tags, the reused PHY handlers were added
>> way later than the fixed problems were firstly found in the drivers.
>>
>> Changes from v1 to v2:
>> * the original patches are split to bugfixes and enhancements only,
>>    both v1 and v2 series are absolutely equal in total, thus I omit
>>    description of changes in individual patches,
>> * the latter implies that there should be no strict need for retesting,
>>    but because formally two series are different, I have to drop the tags
>>    given by Geert and Andrew, please send your tags again.
> 
> Series applied with Fixes: tags of patches 8 and 9 fixed up.

    So you applied the whole series to net.git... that was somewhat 
unexpected, at least by me. Care to share your reasoning?

> Thanks.

MBR, Sergei
