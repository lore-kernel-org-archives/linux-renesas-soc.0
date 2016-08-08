Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f53.google.com ([74.125.82.53]:37131 "EHLO
	mail-wm0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752208AbcHHSy7 (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Mon, 8 Aug 2016 14:54:59 -0400
Received: by mail-wm0-f53.google.com with SMTP id i5so158714023wmg.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 08 Aug 2016 11:54:58 -0700 (PDT)
Subject: Re: [PATCH v3 0/6] Add R8A7794/SILK sound DT support
To: Simon Horman <horms@verge.net.au>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
References: <3910788.ckTpUWEs6B@wasted.cogentembedded.com>
 <87y44l2uy1.wl%kuninori.morimoto.gx@renesas.com>
 <20160808105901.GH17838@verge.net.au>
Cc: linux-renesas-soc@vger.kernel.org, robh+dt@kernel.org,
	mark.rutland@arm.com, devicetree@vger.kernel.org,
	magnus.damm@gmail.com, linux@arm.linux.org.uk,
	linux-arm-kernel@lists.infradead.org
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <f2d0ede3-6776-6c50-cdbc-2825295182ce@cogentembedded.com>
Date: Mon, 8 Aug 2016 21:54:54 +0300
MIME-Version: 1.0
In-Reply-To: <20160808105901.GH17838@verge.net.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 08/08/2016 01:59 PM, Simon Horman wrote:

>>>    Here's the set of 6 patches against Simon Horman's 'renesas.git' repo,
>>> 'renesas-devel-20160725-v4.7-rc7' tag. I'm adding the sound device tree support
>>> for the R8A7794 SoC based SILK board.
>>>
>>> [1/6] ARM: dts: r8a7794: add audio clocks
>>> [2/6] ARM: dts: r8a7794: add MSTP5 clocks
>>> [3/6] ARM: dts: r8a7794: add MSTP10 clocks
>>> [4/6] ARM: dts: r8a7794: add Audio-DMAC support
>>> [5/6] ARM: dts: r8a7794: add sound support
>>> [6/6] ARM: dts: silk: add sound support
>>
>> For all patches
>>
>> Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> Thanks, I have queued these up.

    Great, TY!
    However, I noticed that the the latest devel tag is said to be still based 
on v4.7-rc7 while in practice it's based on v4.8-rc1...

MBR, Sergei
