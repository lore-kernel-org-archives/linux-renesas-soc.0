Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pf0-f181.google.com ([209.85.192.181]:35859 "EHLO
        mail-pf0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751934AbcKIIGg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 9 Nov 2016 03:06:36 -0500
Received: by mail-pf0-f181.google.com with SMTP id 189so123341222pfz.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 09 Nov 2016 00:06:35 -0800 (PST)
Subject: Re: [PATCH 6/9 v2] arm64: dts: m3ulcb: enable SDHI0
To: Simon Horman <horms@verge.net.au>
References: <1478196375-1131-1-git-send-email-vladimir.barinov@cogentembedded.com>
 <1478614461-9918-1-git-send-email-vladimir.barinov@cogentembedded.com>
 <20161109074418.GC30093@verge.net.au>
Cc: Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
From: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Message-ID: <2532ccaa-fbf5-914d-40cb-e27eabdca70f@cogentembedded.com>
Date: Wed, 9 Nov 2016 11:06:33 +0300
MIME-Version: 1.0
In-Reply-To: <20161109074418.GC30093@verge.net.au>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Simon,

On 09.11.2016 10:44, Simon Horman wrote:
> On Tue, Nov 08, 2016 at 05:14:21PM +0300, Vladimir Barinov wrote:
>> This supports SDHI0 on M3ULCB board SD card slot
>>
>> Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
>> Reviewed-off-by: Simon Horman <horms+renesas@verge.net.au>
> Thanks Vladimir,
>
> I have queued up the following patches:
>
> arm64: dts: h3ulcb: rename SDHI0 pins
> arm64: dts: h3ulcb: enable SDHI2
> arm64: dts: m3ulcb: enable SDHI2
> arm64: dts: m3ulcb: enable SDHI0
>
> For reference I would, however, like to make some comments regarding the
> way you have submitted these:
>
> 1. I did not provide a Reviewed-off-by tag or any other tag as far as I
>     recall. So its not appropriate for you to add one when posting patches.
>     I have removed it.
>
> 2. Not withstanding the above, Reviewed-off-by is an invalid tag.
>     Perhaps you mean Reviewed-by.
>
> 3. When you repost patches I have a slight preference for you to repost
>     them in a fresh thread. And if the patchset has more than one patch then
>     with a fresh cover letter. This makes it a little easier for me
>     to see what is going on. And gives a more natural place for
>     me to respond to a patchset.

Thank you for these valuable comments!

I will follow them for further work.


Regards,

Vladimir
