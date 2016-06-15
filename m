Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f53.google.com ([209.85.215.53]:33339 "EHLO
	mail-lf0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750882AbcFOKnw (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Wed, 15 Jun 2016 06:43:52 -0400
Received: by mail-lf0-f53.google.com with SMTP id f6so9829759lfg.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Jun 2016 03:43:51 -0700 (PDT)
Subject: Re: [PATCH v5 05/12] ARM: shmobile: r8a7792: add SMP support
To: Simon Horman <horms@verge.net.au>
References: <14666252.G84Ipxe6EL@wasted.cogentembedded.com>
 <8892035.WlgqvXCvaR@wasted.cogentembedded.com>
 <20160615023030.GC19186@verge.net.au>
Cc: linux-renesas-soc@vger.kernel.org, magnus.damm@gmail.com,
	linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <dd2af098-c5ff-66a5-9812-f6b9956f401a@cogentembedded.com>
Date: Wed, 15 Jun 2016 13:43:48 +0300
MIME-Version: 1.0
In-Reply-To: <20160615023030.GC19186@verge.net.au>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 6/15/2016 5:30 AM, Simon Horman wrote:

>> Add R8A7792 SMP support using the shared APMU code. This SoC has 2 ARM
>> Cortex-A15  CPU cores.
>>
>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>
> I apologise for not raising this earlier.
>
> I would like you to remove SMP support from this series as I do
> not wish to merge any more per-SoC C SMP code for Gen-2 SoCs.
>
> Rather, I believe the future is to use generic code to support
> the APMU hardware and then describe it in DT. Something like this:
>
> http://www.spinics.net/lists/linux-sh/msg45229.html

    Sigh...

> As that code is not merged my suggestion is that we merge UP r8a7792 for
> now. This is the same approach that has been taken for the r8a7793.

    It should be enough to drop the SMP patch from the series. Could you do it 
or should I repost again?

> Thanks!

MBR, Sergei
