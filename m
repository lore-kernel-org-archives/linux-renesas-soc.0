Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f51.google.com ([209.85.215.51]:34317 "EHLO
        mail-lf0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750909AbdALQhP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 Jan 2017 11:37:15 -0500
Received: by mail-lf0-f51.google.com with SMTP id v186so17111591lfa.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Jan 2017 08:37:15 -0800 (PST)
Subject: Re: [PATCH/RFC v2 net-next] ravb: unmap descriptors when freeing
 rings
To: Lino Sanfilippo <lsanfil@marvell.com>,
        Simon Horman <horms@verge.net.au>
References: <1483613000-537-1-git-send-email-horms+renesas@verge.net.au>
 <6fcec500-bed6-ffa3-2887-d45b34703682@cogentembedded.com>
 <20170112091116.GC7724@verge.net.au>
 <d840eddd-f6a3-fe8c-dbaa-242c117b5274@marvell.com>
Cc: David Miller <davem@davemloft.net>,
        Magnus Damm <magnus.damm@gmail.com>, netdev@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <08e00682-a8da-1483-b2d8-f58d32587fd6@cogentembedded.com>
Date: Thu, 12 Jan 2017 19:37:06 +0300
MIME-Version: 1.0
In-Reply-To: <d840eddd-f6a3-fe8c-dbaa-242c117b5274@marvell.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 01/12/2017 04:23 PM, Lino Sanfilippo wrote:

>>>> +
>>>> +    for (; priv->cur_tx[q] - priv->dirty_tx[q] > 0; priv->dirty_tx[q]++) {
>
> BTW: How can this work correctly when cur_tx wraps and dirty_tx is greater?

    {cur|dirty}_tx never wrap.

> Regards,
> Lino

MBR, Sergei
