Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lj1-f194.google.com ([209.85.208.194]:38798 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727250AbeIZP6X (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 26 Sep 2018 11:58:23 -0400
Received: by mail-lj1-f194.google.com with SMTP id p6-v6so24567913ljc.5
        for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Sep 2018 02:46:15 -0700 (PDT)
Subject: Re: [PATCH v3 2/4] arm64: dts: renesas: r8a77995: Add LVDS support
To: Simon Horman <horms@verge.net.au>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org
References: <20180925163337.31212-1-laurent.pinchart+renesas@ideasonboard.com>
 <20180925163337.31212-3-laurent.pinchart+renesas@ideasonboard.com>
 <cc873c59-fcb3-18b5-5e72-56ddaf9f53ce@cogentembedded.com>
 <20180926091312.ol7eu75775bu4tym@verge.net.au>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <012a3ced-ffd4-46da-7f7d-617f06654516@cogentembedded.com>
Date: Wed, 26 Sep 2018 12:46:12 +0300
MIME-Version: 1.0
In-Reply-To: <20180926091312.ol7eu75775bu4tym@verge.net.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 9/26/2018 12:13 PM, Simon Horman wrote:

>>> From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>>>
>>> The r8a77995 D3 platform has 2 LVDS channels connected to the DU.
>>>
>>> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>>> [uli: moved lvds* into the soc node, added PM domains, resets]
>>> Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>
>>> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>>> Tested-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
>>> ---
>>>    arch/arm64/boot/dts/renesas/r8a77995.dtsi | 56 +++++++++++++++++++++++++++++++
>>>    1 file changed, 56 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/renesas/r8a77995.dtsi b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
>>> index 89a04a4496fd..214f4954b321 100644
>>> --- a/arch/arm64/boot/dts/renesas/r8a77995.dtsi
>>> +++ b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
>>> @@ -972,12 +972,68 @@
>>>    				port@1 {
>>>    					reg = <1>;
>>>    					du_out_lvds0: endpoint {
>>> +						remote-endpoint = <&lvds0_in>;
>>>    					};
>>>    				};
>>>    				port@2 {
>>>    					reg = <2>;
>>>    					du_out_lvds1: endpoint {
>>> +						remote-endpoint = <&lvds1_in>;
>>> +					};
>>> +				};
>>> +			};
>>> +		};
>>> +
>>> +		lvds0: lvds-encoder@feb90000 {
>>> +			compatible = "renesas,r8a77995-lvds";
>>> +			reg = <0 0xfeb90000 0 0x20>;
>>> +			clocks = <&cpg CPG_MOD 727>;
>>> +			power-domains = <&sysc R8A77995_PD_ALWAYS_ON>;
>>> +			resets = <&cpg 727>;
>>> +			status = "disabled";
>>> +
>>> +			ports {
>>> +				#address-cells = <1>;
>>> +				#size-cells = <0>;
>>> +
>>> +				port@0 {
>>> +					reg = <0>;
>>> +					lvds0_in: endpoint {
>>> +						remote-endpoint = <&du_out_lvds0>;
>>> +					};
>>> +				};
>>> +
>>> +				port@1 {
>>> +					reg = <1>;
>>> +					lvds0_out: endpoint {
>>> +					};
>>> +				};
>>> +			};
>>> +		};
>>> +
>>> +		lvds1: lvds-encoder@feb90100 {
>>> +			compatible = "renesas,r8a77995-lvds";
>>> +			reg = <0 0xfeb90100 0 0x20>;
>>> +			clocks = <&cpg CPG_MOD 727>;
>>
>>     Not 726?
>>
>>> +			power-domains = <&sysc R8A77995_PD_ALWAYS_ON>;
>>> +			resets = <&cpg 726>;
>>
>>     ... like here?
> 
> I believe that discussion was already had for v2 of the similar patch
> for r8a77990 and that it is intentional.

    Ah, sorry, missed that. Still looks like a documentation error... :-)

MBR, Sergei
