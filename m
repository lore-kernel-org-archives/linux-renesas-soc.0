Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f68.google.com ([209.85.215.68]:33303 "EHLO
        mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752321AbeEOInl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 May 2018 04:43:41 -0400
Received: by mail-lf0-f68.google.com with SMTP id h9-v6so21145621lfi.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 15 May 2018 01:43:40 -0700 (PDT)
Subject: Re: [PATCH] dt-bindings: net: ravb: Add support for r8a77990 SoC
To: Simon Horman <horms@verge.net.au>,
        David Miller <davem@davemloft.net>
Cc: yoshihiro.shimoda.uh@renesas.com, netdev@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, devicetree@vger.kernel.org
References: <1526008736-26496-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <20180511.155942.16024095909155343.davem@davemloft.net>
 <20180513075803.plrkbwmzksjnz45u@verge.net.au>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <19e43b97-9235-a752-7cf9-56a5e3bb281a@cogentembedded.com>
Date: Tue, 15 May 2018 11:43:39 +0300
MIME-Version: 1.0
In-Reply-To: <20180513075803.plrkbwmzksjnz45u@verge.net.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 5/13/2018 10:58 AM, Simon Horman wrote:

>>> Add documentation for r8a77990 compatible string to renesas ravb device
>>> tree bindings documentation.
>>>
>>> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
>>
>> I'm assuming this isn't targetted at one of my trees.  Just FYI.
> 
> Hi Dave,
> 
> I think this is appropriate for net-next but if not I can take it.

    There's also Rob, and IIRC he has taken alike patch recently...

[...]

MBR, Sergei
