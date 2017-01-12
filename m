Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mx0b-0016f401.pphosted.com ([67.231.156.173]:44333 "EHLO
        mx0b-0016f401.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1750780AbdALQzk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 Jan 2017 11:55:40 -0500
Subject: Re: [EXT] Re: [PATCH/RFC v2 net-next] ravb: unmap descriptors when
 freeing rings
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Simon Horman <horms@verge.net.au>
References: <1483613000-537-1-git-send-email-horms+renesas@verge.net.au>
 <6fcec500-bed6-ffa3-2887-d45b34703682@cogentembedded.com>
 <20170112091116.GC7724@verge.net.au>
 <d840eddd-f6a3-fe8c-dbaa-242c117b5274@marvell.com>
 <08e00682-a8da-1483-b2d8-f58d32587fd6@cogentembedded.com>
CC: David Miller <davem@davemloft.net>,
        Magnus Damm <magnus.damm@gmail.com>, <netdev@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>
From: Lino Sanfilippo <lsanfil@marvell.com>
Message-ID: <4950c7fd-dfe5-ea02-ba23-5477a0ba8e5e@marvell.com>
Date: Thu, 12 Jan 2017 17:55:29 +0100
MIME-Version: 1.0
In-Reply-To: <08e00682-a8da-1483-b2d8-f58d32587fd6@cogentembedded.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi,

On 12.01.2017 17:37, Sergei Shtylyov wrote:
> External Email
>
> ----------------------------------------------------------------------
> On 01/12/2017 04:23 PM, Lino Sanfilippo wrote:
>
>>>>> +
>>>>> +    for (; priv->cur_tx[q] - priv->dirty_tx[q] > 0; priv->dirty_tx[q]++) {
>>
>> BTW: How can this work correctly when cur_tx wraps and dirty_tx is greater?
>
>    {cur|dirty}_tx never wrap.
>

Both values are 32 bit and AFAICS they are only incremented (and never reset or
decremented).
So what prevents them from wrapping every 2^32 processed tx descriptors? Am I missing
something?

Regards,
Lino
