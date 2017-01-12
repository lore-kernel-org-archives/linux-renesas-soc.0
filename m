Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f51.google.com ([209.85.215.51]:34965 "EHLO
        mail-lf0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750779AbdALQO5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 Jan 2017 11:14:57 -0500
Received: by mail-lf0-f51.google.com with SMTP id m78so16457364lfg.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Jan 2017 08:14:56 -0800 (PST)
Subject: Re: [PATCH/RFC net] ravb: do not use zero-length alighment DMA
 request
To: David Miller <davem@davemloft.net>, horms@verge.net.au
References: <1484229217-25585-1-git-send-email-horms+renesas@verge.net.au>
 <20170112.102102.2249793963798495642.davem@davemloft.net>
 <20170112154647.GA2329@verge.net.au>
 <20170112.110402.1123747824643306383.davem@davemloft.net>
Cc: magnus.damm@gmail.com, netdev@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <c99997c5-5c3f-d966-1ce4-e81dc7bfb42d@cogentembedded.com>
Date: Thu, 12 Jan 2017 19:14:52 +0300
MIME-Version: 1.0
In-Reply-To: <20170112.110402.1123747824643306383.davem@davemloft.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 01/12/2017 07:04 PM, David Miller wrote:

>> What I now see is that a few lines further up there is:
>>
>> 	 if (skb_put_padto(skb, ETH_ZLEN))
>> 		goto drop;
>>
>> 	where ETH_ZLEN is 60.
>>
>> So I don't think we need to worry about skb->len being less than 60 and
>> this patch can be simplified to:
>>
>> 	if (len == 0)
>> 		len = 4;
>
> I'd say this might deserve a comment...

    Sure. And the one better than the original "quick fix"... :-)

MBR, Sergei
