Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f43.google.com ([209.85.215.43]:33129 "EHLO
        mail-lf0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751139AbdALQdz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 Jan 2017 11:33:55 -0500
Received: by mail-lf0-f43.google.com with SMTP id k86so17022960lfi.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Jan 2017 08:33:55 -0800 (PST)
Subject: Re: [PATCH/RFC v2 net-next] ravb: unmap descriptors when freeing
 rings
To: Simon Horman <horms@verge.net.au>
References: <1483613000-537-1-git-send-email-horms+renesas@verge.net.au>
 <6fcec500-bed6-ffa3-2887-d45b34703682@cogentembedded.com>
 <20170112091116.GC7724@verge.net.au>
 <3e1d4324-4288-8d65-56fd-8c3e7283020b@cogentembedded.com>
 <20170112131821.GA16060@verge.net.au>
Cc: David Miller <davem@davemloft.net>,
        Magnus Damm <magnus.damm@gmail.com>, netdev@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <dc41bc36-8239-39d7-def1-a60603e3890a@cogentembedded.com>
Date: Thu, 12 Jan 2017 19:33:51 +0300
MIME-Version: 1.0
In-Reply-To: <20170112131821.GA16060@verge.net.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 01/12/2017 04:18 PM, Simon Horman wrote:

> ...
>
>>>>   Here, it stop once an untransmitted buffer is encountered...
>>>
>>> Yes, I see that now.
>>>
>>> I wonder if we should:
>>>
>>> a) paramatise ravb_tx_free() so it may either clear all transmitted buffers
>>>   (current behaviour) or all buffers (new behaviour).
>>> b) provide a different version of this loop in ravb_ring_free()
>>>
>>> What are your thoughts?
>>
>>    I'm voting for (b).
>
> Ok, something like this?
>
> @@ -215,6 +225,30 @@ static void ravb_ring_free(struct net_device *ndev, int q)
>  	}
>
>  	if (priv->tx_ring[q]) {
> +		for (; priv->cur_tx[q] - priv->dirty_tx[q] > 0; priv->dirty_tx[q]++) {

    You're still copying the loop logic from ravb_tx_free() while we (I think) 
need a simple loop over all the descriptor ring.

[...]

MBR, Sergei
