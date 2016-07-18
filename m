Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f46.google.com ([209.85.215.46]:33416 "EHLO
	mail-lf0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751722AbcGRONI (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Mon, 18 Jul 2016 10:13:08 -0400
Received: by mail-lf0-f46.google.com with SMTP id b199so132998717lfe.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 18 Jul 2016 07:13:08 -0700 (PDT)
Subject: Re: [PATCH 0/2] Fix DMA channel misreporting for the Renesas Ethernet
 drivers
To: David Miller <davem@davemloft.net>
References: <8592210.gMERdmUlCp@wasted.cogentembedded.com>
 <20160717.232451.295029329698830463.davem@davemloft.net>
Cc: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <3244a329-1b48-4e09-7fe5-96d80b8a3d54@cogentembedded.com>
Date: Mon, 18 Jul 2016 17:13:02 +0300
MIME-Version: 1.0
In-Reply-To: <20160717.232451.295029329698830463.davem@davemloft.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello.

On 07/18/2016 09:24 AM, David Miller wrote:

>>    Here's a set of 2 patches against DaveM's 'net.git' repo fixing
>> up the DMA channel reporting by 'ifconfig'...
>
> Is some fixing some ifconfig output that is effectively meaningless
> appropriate for 'net'?

    I just don't know any more users of SIOCGIFMAP ioctl... ip?
    It seems to  also be used in net/core/rtnetlink.c...

> Sounds like 'net-next' material to me.

    Up to you, of course.

MBR, Sergei
