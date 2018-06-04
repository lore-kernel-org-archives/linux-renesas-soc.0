Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:51748 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750950AbeFDPdS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 4 Jun 2018 11:33:18 -0400
MIME-Version: 1.0
In-Reply-To: <19e43b97-9235-a752-7cf9-56a5e3bb281a@cogentembedded.com>
References: <1526008736-26496-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <20180511.155942.16024095909155343.davem@davemloft.net> <20180513075803.plrkbwmzksjnz45u@verge.net.au>
 <19e43b97-9235-a752-7cf9-56a5e3bb281a@cogentembedded.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Mon, 4 Jun 2018 10:32:57 -0500
Message-ID: <CAL_JsqKuFh6-hoaLnkOPcVpHmEaGkN3OaOrFA1WazR-HZeQsOg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: net: ravb: Add support for r8a77990 SoC
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        "Shimoda, Yoshihiro" <yoshihiro.shimoda.uh@renesas.com>
Cc: Simon Horman <horms@verge.net.au>,
        David Miller <davem@davemloft.net>,
        netdev <netdev@vger.kernel.org>,
        "open list:MEDIA DRIVERS FOR RENESAS - FCP"
        <linux-renesas-soc@vger.kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, May 15, 2018 at 3:43 AM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> On 5/13/2018 10:58 AM, Simon Horman wrote:
>
>>>> Add documentation for r8a77990 compatible string to renesas ravb device
>>>> tree bindings documentation.
>>>>
>>>> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
>>>
>>>
>>> I'm assuming this isn't targetted at one of my trees.  Just FYI.
>>
>>
>> Hi Dave,
>>
>> I think this is appropriate for net-next but if not I can take it.
>
>
>    There's also Rob, and IIRC he has taken alike patch recently...

Applied.

Rob
