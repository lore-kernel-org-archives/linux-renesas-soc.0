Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f49.google.com ([209.85.215.49]:34964 "EHLO
        mail-lf0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753081AbdGKMvo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 11 Jul 2017 08:51:44 -0400
Received: by mail-lf0-f49.google.com with SMTP id b207so83899661lfg.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 11 Jul 2017 05:51:43 -0700 (PDT)
Subject: Re: [PATCH v2] dt-bindings: net: ravb : Add support for r8a7743 SoC
To: Simon Horman <horms@verge.net.au>
References: <20170710012024.j4cso2jyi6canws2@rob-hp-laptop>
 <1499700776-54504-1-git-send-email-biju.das@bp.renesas.com>
 <52eb0b92-5d25-e1f4-df54-e4fcf648c90e@cogentembedded.com>
 <20170711122100.GM4517@verge.net.au>
Cc: Biju Das <biju.das@bp.renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Russell King <linux@armlinux.org.uk>,
        "David S. Miller" <davem@davemloft.net>,
        Magnus Damm <magnus.damm@gmail.com>,
        Chris Paterson <chris.paterson2@renesas.com>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <87b6b38a-ca6b-a0d7-b777-0a4809eaf6fc@cogentembedded.com>
Date: Tue, 11 Jul 2017 15:51:40 +0300
MIME-Version: 1.0
In-Reply-To: <20170711122100.GM4517@verge.net.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 07/11/2017 03:21 PM, Simon Horman wrote:

>>> Add a new compatible string for the RZ/G1M (R8A7743) SoC.
>>>
>>> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
>>> ---
>>> v1->v2
>>> * Changed the subject
>>> * re-formatted the required properties
>>>
>>> .../devicetree/bindings/net/renesas,ravb.txt       | 29 +++++++++++++---------
>>> 1 file changed, 17 insertions(+), 12 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/net/renesas,ravb.txt b/Documentation/devicetree/bindings/net/renesas,ravb.txt
>>> index b519503..4717bc2 100644
>>> --- a/Documentation/devicetree/bindings/net/renesas,ravb.txt
>>> +++ b/Documentation/devicetree/bindings/net/renesas,ravb.txt
>>> @@ -4,19 +4,24 @@ This file provides information on what the device node for the Ethernet AVB
>>> interface contains.
>>>
>>> Required properties:
>>> -- compatible: "renesas,etheravb-r8a7790" if the device is a part of R8A7790 SoC.
>>> -	      "renesas,etheravb-r8a7791" if the device is a part of R8A7791 SoC.
>>> -	      "renesas,etheravb-r8a7792" if the device is a part of R8A7792 SoC.
>>> -	      "renesas,etheravb-r8a7793" if the device is a part of R8A7793 SoC.
>>> -	      "renesas,etheravb-r8a7794" if the device is a part of R8A7794 SoC.
>>> -	      "renesas,etheravb-r8a7795" if the device is a part of R8A7795 SoC.
>>> -	      "renesas,etheravb-r8a7796" if the device is a part of R8A7796 SoC.
>>> -	      "renesas,etheravb-rcar-gen2" for generic R-Car Gen 2 compatible interface.
>>> -	      "renesas,etheravb-rcar-gen3" for generic R-Car Gen 3 compatible interface.
>>> +- compatible: Must contain one or more of the following:
>>
>>    No, it can't contain more than one SoC specific value.
>
> The text above does not say it can unless one is under the delusion
> that, f.e. an r8a7790 SoC is also an r8a7791 SoC.

    Hm, you're right. Sorry about my misunderstanding...

    The only problem I'm still seeing with the current wording is that gen2/3 
fallback
values are declared optional, while you can't get the driver to bind without 
them on
the newer SoCs. But this is probably not a new problem...

> If you would prefer an alternate wording please provide a suggestion.

    Perhaps we should emphasize that the gen2/3 fallback values are mandatory?

>>> +      - "renesas,etheravb-r8a7743" for the R8A7743 SoC.
>>> +      - "renesas,etheravb-r8a7790" for the R8A7790 SoC.
>>> +      - "renesas,etheravb-r8a7791" for the R8A7791 SoC.
>>> +      - "renesas,etheravb-r8a7792" for the R8A7792 SoC.
>>> +      - "renesas,etheravb-r8a7793" for the R8A7793 SoC.
>>> +      - "renesas,etheravb-r8a7794" for the R8A7794 SoC.
>>> +      - "renesas,etheravb-rcar-gen2" as a fallback for the above
>>> +		R-Car Gen2 and RZ/G1 devices.
[...]

WBR, Sergei
