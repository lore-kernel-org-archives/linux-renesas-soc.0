Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f65.google.com ([209.85.215.65]:46241 "EHLO
        mail-lf0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752347AbeFETuA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 Jun 2018 15:50:00 -0400
Received: by mail-lf0-f65.google.com with SMTP id j13-v6so5428208lfb.13
        for <linux-renesas-soc@vger.kernel.org>; Tue, 05 Jun 2018 12:50:00 -0700 (PDT)
Subject: Re: [PATCH] dt-bindings: display: renesas: du: document R8A77980
 bindings
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>
References: <2a775652-604c-6379-b807-19979f164f84@cogentembedded.com>
 <3941727.PNGxG4XCLb@avalon>
 <df4d4207-5343-36c0-7ca8-d431999a3f31@cogentembedded.com>
 <3434502.pBJZTsWR88@avalon>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <50730759-dfda-12c5-a7f3-4e8a9b7b1eb9@cogentembedded.com>
Date: Tue, 5 Jun 2018 22:49:57 +0300
MIME-Version: 1.0
In-Reply-To: <3434502.pBJZTsWR88@avalon>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 06/05/2018 10:16 PM, Laurent Pinchart wrote:

>>>> Document the R-Car V3H (R8A77980) SoC in the R-Car DU bindings; the DU
>>>> hardware seems the same as in the R-Car V3M (R8A77970).
>>>
>>> How about "the DU hardware has the same topology as in the R-Car V3M
>>> (R8A77970)" ? "seems" sounds like we're very unsure :-)
>>
>>    That's probably better, indeed.
>>
>>>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>>>>
>>>> ---
>>>> The patch is against the 'drm-next' branch of David Airlie's 'linux.git'
>>>> repo.
>>>
>>> Then you might want to switch to git://anongit.freedesktop.org/drm/drm :-)
>>
>> No, the corresponding MAINTAINERS records don't include
>> drivers/gpu/drm/rcar-du/ or worse yet, the DU bindings. :-)

   Well, there is still no corresponding record, actually... 

> My point is that Dave's tree has moved.

   How am I supposed to learn about it, from gossips? :-)

>> Seriously, I thought you've done a patch to remove your dead 'fbdev' repo
>> months ago and IO'm still seeing it listed... :-/
> 
> I'll address that now.

   TIA.
 
>>> Apart from that,
>>>
>>> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>>>
>>> If you agree with the small change to the commit message I'll fix the
>>> conflict locally, there's no need to resubmit.
>>
>> I do agree, except I don't know what conflict you mean.
>>
>> [...]
> 
> I mean the conflict with
> 
> commit dc8142901befabea974393d49b803f131243feb4
> Author: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Date:   Thu Apr 26 17:53:31 2018 +0100
> 
>     dt-bindings: display: renesas: du: Document the r8a77965 bindings
> 
> that is present in Dave's new tree.

   Ah... TIA again. :-)

MBR, Sergei
