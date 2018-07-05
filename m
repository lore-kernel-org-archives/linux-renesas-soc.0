Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relay1.mentorg.com ([192.94.38.131]:45388 "EHLO
        relay1.mentorg.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751720AbeGEF72 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 5 Jul 2018 01:59:28 -0400
Subject: Re: [PATCH v2 00/14] ravb/sh_eth: fix sleep in atomic by reusing
 shared ethtool handlers
To: David Miller <davem@davemloft.net>
References: <20180704081245.7395-1-vladimir_zapolskiy@mentor.com>
 <20180705.095631.647119741817887082.davem@davemloft.net>
CC: <sergei.shtylyov@cogentembedded.com>, <andrew@lunn.ch>,
        <geert@linux-m68k.org>, <netdev@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>
From: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
Message-ID: <dfbdaeac-0bb3-0e8a-6a85-a33561a9dcb7@mentor.com>
Date: Thu, 5 Jul 2018 08:59:22 +0300
MIME-Version: 1.0
In-Reply-To: <20180705.095631.647119741817887082.davem@davemloft.net>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi David,

On 07/05/2018 03:56 AM, David Miller wrote:
> From: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
> Date: Wed, 4 Jul 2018 11:12:38 +0300
> 
>> For ages trivial changes to RAVB and SuperH ethernet links by means of
>> standard 'ethtool' trigger a 'sleeping function called from invalid
>> context' bug, to visualize it on r8a7795 ULCB:
>  ...
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
>>   both v1 and v2 series are absolutely equal in total, thus I omit
>>   description of changes in individual patches,
>> * the latter implies that there should be no strict need for retesting,
>>   but because formally two series are different, I have to drop the tags
>>   given by Geert and Andrew, please send your tags again.
> 
> These changes look fine to me but I want to see some reviews and/or
> testing before I apply them.
> 

Thanks to Geert for finding time to test v1 series, the sums of changes
are word for word, https://www.spinics.net/lists/linux-renesas-soc/msg28666.html

Andrew also gave a number of Reviewed-by tags, but they are not directly
applicable to new patches, unfortunately.

In any case let's wait for scrupulous review completed by Sergei, I believe
he'd like to contribute to the review process, and Sergei may highlight more
shortcomings.

--
Best wishes,
Vladimir
