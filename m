Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f65.google.com ([209.85.215.65]:43301 "EHLO
        mail-lf0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933764AbeALOwa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 12 Jan 2018 09:52:30 -0500
Received: by mail-lf0-f65.google.com with SMTP id o89so2101459lfg.10
        for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Jan 2018 06:52:29 -0800 (PST)
Subject: Re: [PATCH 02/10] dt-bindings: display: renesas: Deprecate LVDS
 support in the DU bindings
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20180112005858.26472-1-laurent.pinchart+renesas@ideasonboard.com>
 <20180112005858.26472-3-laurent.pinchart+renesas@ideasonboard.com>
 <c5d423c8-2546-a0a7-2cb1-502cecb25958@mentor.com> <3622701.UmU0kKHARM@avalon>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <21f02d6c-0656-8892-9106-c806f357afe5@cogentembedded.com>
Date: Fri, 12 Jan 2018 17:52:26 +0300
MIME-Version: 1.0
In-Reply-To: <3622701.UmU0kKHARM@avalon>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 01/12/2018 01:43 PM, Laurent Pinchart wrote:

>>> The internal LVDS encoders now have their own DT bindings, representing
>>> them as part of the DU is deprecated.
>>>
>>> Signed-off-by: Laurent Pinchart
>>> <laurent.pinchart+renesas@ideasonboard.com>
>>> ---
>>>
>>>   .../devicetree/bindings/display/renesas,du.txt     | 26
>>>   +++++++++------------- 1 file changed, 11 insertions(+), 15 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/display/renesas,du.txt
>>> b/Documentation/devicetree/bindings/display/renesas,du.txt index
>>> cd48aba3bc8c..8f6e0e118e3e 100644
>>> --- a/Documentation/devicetree/bindings/display/renesas,du.txt
>>> +++ b/Documentation/devicetree/bindings/display/renesas,du.txt
[...]
>>> @@ -71,7 +68,7 @@ Example: R8A7795 (R-Car H3) ES2.0 DU
>>>   		compatible = "renesas,du-r8a7795";
>>>   		reg = <0 0xfeb00000 0 0x80000>,
>>>   		      <0 0xfeb90000 0 0x14>;
>>> -		reg-names = "du", "lvds.0";
>>> +		reg-names = "du";
>>
>> Since "reg-names" list is changed, I believe you'd like to update
>> the "reg" property value as well.
> 
> Good point, I'll fix it.

    Could you also totally drop "reg-names"? Or is that a strong requirement 
now? I mostly dislike how this memory region is named in /proc/iomem... :-)

[...]

MBR, Sergei
