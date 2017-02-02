Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f45.google.com ([209.85.215.45]:32885 "EHLO
        mail-lf0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751039AbdBBNCn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 2 Feb 2017 08:02:43 -0500
Received: by mail-lf0-f45.google.com with SMTP id x1so8111474lff.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 02 Feb 2017 05:02:42 -0800 (PST)
Subject: Re: [PATCH v2] ARM: dts: r8a7791: link DU to VSPDs
To: Magnus Damm <magnus.damm@gmail.com>
References: <1529351.Fac5N2tKoF@wasted.cogentembedded.com>
 <2492577.tBEnW0tCHD@wasted.cogentembedded.com>
 <4ae454ad-296c-dec9-27e9-fd050333737f@cogentembedded.com>
 <CANqRtoSQTa0fHJSwAHbN3hXSZ=m1kuR2GsUWE5ojN5AN-9i6Bw@mail.gmail.com>
 <4bf0b27c-9641-391d-fc05-8cdc20ce4ec3@cogentembedded.com>
 <CANqRtoTpsMix30+ESO-bEdaBM8H_9eTOLuoWShQABhmgJk23EA@mail.gmail.com>
Cc: "Simon Horman [Horms]" <horms@verge.net.au>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Russell King - ARM Linux <linux@arm.linux.org.uk>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <afeb1f60-e60a-2c5c-4a12-7fda7bda7c50@cogentembedded.com>
Date: Thu, 2 Feb 2017 16:02:39 +0300
MIME-Version: 1.0
In-Reply-To: <CANqRtoTpsMix30+ESO-bEdaBM8H_9eTOLuoWShQABhmgJk23EA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello!

On 02/01/2017 03:01 PM, Magnus Damm wrote:

>>>>> Add the "vsps" property to the DU device node in order to link this node
>>>>> to
>>>>> the VSPD nodes.
>>>>>
>>>>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>>>>>
>>>>> ---
>>>>> Changes in version 2:
>>>>> - rebased the patch.
>>>>>
>>>>> This patch is against the 'renesas-devel-20170125-v4.10-rc5' of Simon
>>>>> Horman's
>>>>> 'renesas.git' repo.  It's  only meaningful if the DRM driver patches
>>>>> I've
>>>>> just
>>>>> posted are applied.
>>>>
>>>>
>>>>
>>>>    Forgot to note that without this patch the DU driver fails to link to
>>>> VSPD and probe correctly, so there's no video signal. So it makes sense
>>>> to
>>>> apply before the DU driver patch (once it's ACKed for merge)...
>>>
>>>
>>> Doesn't that translate to breaking the DT ABI? Is there someway we can
>>> avoid doing that?
>>
>>
>>    It doesn't -- if this patch is merged ahead of the DU patches.
>
> Perhaps I'm misunderstanding, but if you require a DTS patch to be
> merged before a driver change then doesn't this mean that older DTBs
> will stop working with newer kernels and the user is forced to update
> the DTB to avoid breakage?

    Yes, it seems so. :-(

> It would be nice if older DTBs could keep on working as before and the
> DU driver modification would work both with connected VSPs and also
> keep on working as before in case the VSP connection is not present in
> DT.

    I'll try to look into that...

> Cheers,
>
> / magnus

MBR, Sergei
