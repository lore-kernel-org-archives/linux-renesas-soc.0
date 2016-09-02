Return-Path: <devicetree-owner@vger.kernel.org>
Subject: Re: [PATCH v3 12/12] arm64: dts: h3ulcb: Sound SSI support
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
References: <1472817881-11860-1-git-send-email-vladimir.barinov@cogentembedded.com>
 <1472817933-12018-1-git-send-email-vladimir.barinov@cogentembedded.com>
 <159bb1fc-aa36-d30f-5064-b61efa34c663@cogentembedded.com>
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
From: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Message-ID: <3d3be452-6330-419c-7e53-19af9e6a7fd4@cogentembedded.com>
Date: Fri, 2 Sep 2016 17:33:27 +0300
MIME-Version: 1.0
In-Reply-To: <159bb1fc-aa36-d30f-5064-b61efa34c663@cogentembedded.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Sergei,

Thank you for the review.
Lemme fix it in v5 patchset.

Regards,
Vladimir

On 02.09.2016 15:38, Sergei Shtylyov wrote:
> Hello.
>
> On 9/2/2016 3:05 PM, Vladimir Barinov wrote:
>
>> This supports SSI sound for H3ULCB board.
>> SSI DMA mode used. CS2000 used as AUDIO_CLK_B.
>>
>> Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
>> Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>> ---
>> Changes in version 3:
>> - initially added
>> Changes in version 4:
>> - added comment for audio_clkout
>>
>>  arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts | 115 
>> +++++++++++++++++++++++++
>>  1 file changed, 115 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts 
>> b/arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts
>> index bbd7928..a254231 100644
>> --- a/arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts
>> +++ b/arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts
>> @@ -45,6 +45,12 @@
>>          };
>>      };
>>
>> +    x12_clk: x12_clk {
>
>    If the crystal name is X12, name the node "x12" too, this way the 
> output clock will be named just "x12".
>
>> +        compatible = "fixed-clock";
>> +        #clock-cells = <0>;
>> +        clock-frequency = <24576000>;
>> +    };
>> +
>>      vcc_sdhi0: regulator-vcc-sdhi0 {
>>          compatible = "regulator-fixed";
>>
> [...]
>> @@ -136,6 +176,73 @@
> [...]
>> +
>> +    cs2000: clk_multiplier@4f {
>
>    Don't use underscores in the node names, use hyphens instead.
>
>> +        #clock-cells = <0>;
>> +        compatible = "cirrus,cs2000-cp";
>> +        reg = <0x4f>;
>> +        clocks = <&audio_clkout>, <&x12_clk>;
>> +        clock-names = "clk_in", "ref_clk";
>> +
>> +        assigned-clocks = <&cs2000>;
>> +        assigned-clock-rates = <24576000>; /* 1/1 divide */
>> +    };
>> +};
> [...]
>
> MBR, Sergei
>

