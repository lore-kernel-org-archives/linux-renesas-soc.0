Return-Path: <devicetree-owner@vger.kernel.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: timer: renesas, cmt: Document
 r8a774[35] CMT support
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
References: <1513618743-4773-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1513618743-4773-2-git-send-email-fabrizio.castro@bp.renesas.com>
 <SG2PR06MB088625944BCD8F4307315520C0E20@SG2PR06MB0886.apcprd06.prod.outlook.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <1acdad3b-c2fd-df1d-f25b-cf80b79a9842@linaro.org>
Date: Thu, 25 Jan 2018 09:09:59 +0100
MIME-Version: 1.0
In-Reply-To: <SG2PR06MB088625944BCD8F4307315520C0E20@SG2PR06MB0886.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 24/01/2018 17:49, Fabrizio Castro wrote:
> Hello Daniel,
> 
> I am sorry to bother you, just wondering if you think there are any chances for this patch to applied on top of v4.16?

You can take it through the renesas tree.

Acked-by: Daniel Lezcano <daniel.lezcano@linaro.org>


>> Subject: [PATCH v2 1/3] dt-bindings: timer: renesas, cmt: Document r8a774[35] CMT support
>>
>> Document SoC specific compatible strings for r8a7743 and r8a7745.
>> No driver change is needed as the fallback strings will activate
>> the right code.
>>
>> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
>> Reviewed-by: Biju Das <biju.das@bp.renesas.com>
>> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>> Reviewed-by: Rob Herring <robh@kernel.org>
>> Reviewed-by: Simon Horman <horms@verge.net.au>
>> ---
>> v1->v2:
>> * "R-Car Gen2 or RZ/G1." -> "R-Car Gen2 and RZ/G1."
>> * "all the R-Car" -> "R-Car"
>>
>>  Documentation/devicetree/bindings/timer/renesas,cmt.txt | 14 ++++++++++----
>>  1 file changed, 10 insertions(+), 4 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/timer/renesas,cmt.txt b/Documentation/devicetree/bindings/timer/renesas,cmt.txt
>> index d740989..b40add2 100644
>> --- a/Documentation/devicetree/bindings/timer/renesas,cmt.txt
>> +++ b/Documentation/devicetree/bindings/timer/renesas,cmt.txt
>> @@ -22,6 +22,10 @@ Required Properties:
>>
>>      - "renesas,r8a73a4-cmt0" for the 32-bit CMT0 device included in r8a73a4.
>>      - "renesas,r8a73a4-cmt1" for the 48-bit CMT1 device included in r8a73a4.
>> +    - "renesas,r8a7743-cmt0" for the 32-bit CMT0 device included in r8a7743.
>> +    - "renesas,r8a7743-cmt1" for the 48-bit CMT1 device included in r8a7743.
>> +    - "renesas,r8a7745-cmt0" for the 32-bit CMT0 device included in r8a7745.
>> +    - "renesas,r8a7745-cmt1" for the 48-bit CMT1 device included in r8a7745.
>>      - "renesas,r8a7790-cmt0" for the 32-bit CMT0 device included in r8a7790.
>>      - "renesas,r8a7790-cmt1" for the 48-bit CMT1 device included in r8a7790.
>>      - "renesas,r8a7791-cmt0" for the 32-bit CMT0 device included in r8a7791.
>> @@ -31,10 +35,12 @@ Required Properties:
>>      - "renesas,r8a7794-cmt0" for the 32-bit CMT0 device included in r8a7794.
>>      - "renesas,r8a7794-cmt1" for the 48-bit CMT1 device included in r8a7794.
>>
>> -    - "renesas,rcar-gen2-cmt0" for 32-bit CMT0 devices included in R-Car Gen2.
>> -    - "renesas,rcar-gen2-cmt1" for 48-bit CMT1 devices included in R-Car Gen2.
>> -These are fallbacks for r8a73a4 and all the R-Car Gen2
>> -entrieslisted above.
>> +    - "renesas,rcar-gen2-cmt0" for 32-bit CMT0 devices included in R-Car Gen2
>> +and RZ/G1.
>> +    - "renesas,rcar-gen2-cmt1" for 48-bit CMT1 devices included in R-Car Gen2
>> +and RZ/G1.
>> +These are fallbacks for r8a73a4, R-Car Gen2 and RZ/G1 entries
>> +listed above.
>>
>>    - reg: base address and length of the registers block for the timer module.
>>    - interrupts: interrupt-specifier for the timer, one per channel.
>> --
>> 2.7.4
> 
> 
> 
> 
> Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, Buckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered No. 04586709.
> 


-- 
 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

