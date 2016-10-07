Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f43.google.com ([209.85.215.43]:35251 "EHLO
        mail-lf0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751222AbcJGJ5c (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 7 Oct 2016 05:57:32 -0400
Received: by mail-lf0-f43.google.com with SMTP id l131so36938493lfl.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 07 Oct 2016 02:57:31 -0700 (PDT)
Subject: Re: [PATCH v3 04/11] ARM: dts: r8a7743: initial SoC device tree
To: Simon Horman <horms@verge.net.au>
References: <2056698.ncAHq8vRQ3@wasted.cogentembedded.com>
 <2883940.Oo8sg10L7m@wasted.cogentembedded.com>
 <20161007030932.GH13721@verge.net.au>
Cc: linux-renesas-soc@vger.kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, devicetree@vger.kernel.org,
        magnus.damm@gmail.com, linux@arm.linux.org.uk,
        linux-arm-kernel@lists.infradead.org
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <cd1391d1-d2b5-6315-ee15-0253019d9836@cogentembedded.com>
Date: Fri, 7 Oct 2016 12:57:28 +0300
MIME-Version: 1.0
In-Reply-To: <20161007030932.GH13721@verge.net.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 10/7/2016 6:09 AM, Simon Horman wrote:

>> The  initial R8A7743 SoC device tree including CPU cores, GIC, timer, SYSC,
>> CPG, and the required clock descriptions.
>>
>> Based on the original (and large) patch by Dmitry Shifrin
>> <dmitry.shifrin@cogentembedded.com>.
>>
>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>
> I notice that this patch enables two CPUs. Have you tested SMP and:
> - CPU hotplug
> - Suspend to RAM

    No, not really. I'll remove CPU1. :-<

MBR, Sergei
