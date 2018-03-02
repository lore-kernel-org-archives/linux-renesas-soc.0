Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f65.google.com ([209.85.215.65]:41590 "EHLO
        mail-lf0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1946112AbeCBK37 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Mar 2018 05:29:59 -0500
Received: by mail-lf0-f65.google.com with SMTP id m69so12655317lfe.8
        for <linux-renesas-soc@vger.kernel.org>; Fri, 02 Mar 2018 02:29:59 -0800 (PST)
Subject: Re: [PATCH v2 0/5] Add R8A77970/V3MSK LVDS/HDMI support
To: Simon Horman <horms@verge.net.au>
Cc: Rob Herring <robh+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>
References: <23a6ac28-134b-b5dd-69a7-910774c4b8c1@cogentembedded.com>
 <2fd26075-525c-8d86-ef81-f32c73cf3e8b@cogentembedded.com>
 <20180228132707.mgunezg5o4lul7x5@verge.net.au>
 <f9574ea2-d8ee-7c9f-b850-874074eddad2@cogentembedded.com>
 <20180301095451.jvsybu5k6pnahfbi@verge.net.au>
 <5f65b46d-be0f-a1ae-3d97-37f62ecf1657@cogentembedded.com>
 <20180302102106.enyb2ldmylgklqom@verge.net.au>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <4e37c0d9-b619-1b3e-01b2-8cf762efb604@cogentembedded.com>
Date: Fri, 2 Mar 2018 13:29:56 +0300
MIME-Version: 1.0
In-Reply-To: <20180302102106.enyb2ldmylgklqom@verge.net.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 3/2/2018 1:21 PM, Simon Horman wrote:

>>>>>>> Here's the set of 5 patches against Simon Horman's 'renesas.git' repo's
>>>>>>> 'renesas-devel-20180227-v4.16-rc3' tag. We're adding the R8A77970 FCPVD/VSPD/
>>>>>>> DU/LVDS device nodes and then describing the HDMI encoder connected to the LVDS
>>>>>>> output (we're omitting the LVDS decoder for now). These patches depend on
>>>>>>> the recent R8A77970 DU/LVDS rework patches by Laurent in order to work...	
>>>>>>
>>>>>>     Need to mention that the DU driver silently fails to probe now. I do
>>>>>>     hope that this is not due to my updates. :-)
>>>>>
>>>>> Please test that theory.
>>>>
>>>>     Yeah, after sucking in the recent versions of the DU/LVDS patches and uncommenting
>>>> and fixing rejects in a couple patches here, the graphical console works again. :-)
>>>
>>> Ok, but does this patchset cause a regression? If so it seems
>>
>>      Sorry, somehow missed that question. No regression is possible as the display just
>> doesn't work before these patches are applied. It's just that it doesn't start to work
>> until the recent DU/LVDS driver updates are applied.
> 
> Ok, but my question remains: does the display work before these patches?

    No, there are no FCPVD/VSPD/DU/LVDS device nodes in R8A77970 TDs.

MBR, Sergei
