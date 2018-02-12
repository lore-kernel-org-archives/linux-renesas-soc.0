Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f65.google.com ([209.85.215.65]:38188 "EHLO
        mail-lf0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752802AbeBLSEJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 12 Feb 2018 13:04:09 -0500
Received: by mail-lf0-f65.google.com with SMTP id g72so21600904lfg.5
        for <linux-renesas-soc@vger.kernel.org>; Mon, 12 Feb 2018 10:04:08 -0800 (PST)
Subject: Re: [PATCH 0/3] Add R8A77970/Eagle PFC support
To: Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Simon Horman <horms@verge.net.au>
Cc: Rob Herring <robh+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org
References: <20171110200218.747996672@cogentembedded.com>
 <20171113075303.zmkmq6bt3lfuttwu@verge.net.au>
 <049b0a0a-b1c2-73e6-c471-ca8342bba6ab@ideasonboard.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <19d23fa2-1205-89a0-786f-f301ca7a0f7b@cogentembedded.com>
Date: Mon, 12 Feb 2018 21:04:06 +0300
MIME-Version: 1.0
In-Reply-To: <049b0a0a-b1c2-73e6-c471-ca8342bba6ab@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 01/19/2018 01:48 PM, Kieran Bingham wrote:

>>> Here's the set of 3 patches against Simon Horman's 'renesas.git' repo's
>>> 'renesas-devel-20171110-v4.14-rc8' tag.  We're adding the R8A77970 PFC node
>>> and then describing the pins for SCIF0 and EtherAVB devices declared earlier.
>>> These patches depend on the R8A77970 PFC suport in order to work properly.
>>>
>>> [1/3] arm64: dts: renesas: r8a77970: add PFC support
>>> [2/3] arm64: dts: renesas: eagle: add SCIF0 pins
>>> [3/3] arm64: dts: renesas: eagle: add EtherAVB pins
>>
>> Hi Sergei,
>>
>> I have marked these patches as deferred pending acceptance of the PFC
>> driver. Please repost or otherwise ping me once that dependency has been
>> accepted.
> 
> Has the dependency blocking this series been resolved yet ?

   Now it is, except for the 3rd patch... Simon, do I need to repost the first two?
The 1st one did apply to 4.16-rc1 here with a fuzz...

> (I have patches for the Eagle-V3M which are blocked waiting for the PFC support)
> 
> --
> Regards
> 
> Kieran

MBR, Sergei
