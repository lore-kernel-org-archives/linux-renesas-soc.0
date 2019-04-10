Return-Path: <SRS0=jOjt=SM=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9FE3C10F0E
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 10 Apr 2019 00:16:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A98EF20850
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 10 Apr 2019 00:16:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726627AbfDJAQ1 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 9 Apr 2019 20:16:27 -0400
Received: from www3345.sakura.ne.jp ([49.212.235.55]:43351 "EHLO
        www3345.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726592AbfDJAQ1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 9 Apr 2019 20:16:27 -0400
Received: from fsav304.sakura.ne.jp (fsav304.sakura.ne.jp [153.120.85.135])
        by www3345.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id x3A0GGpb088461;
        Wed, 10 Apr 2019 09:16:16 +0900 (JST)
        (envelope-from cv-dong@jinso.co.jp)
Received: from www3345.sakura.ne.jp (49.212.235.55)
 by fsav304.sakura.ne.jp (F-Secure/fsigk_smtp/530/fsav304.sakura.ne.jp);
 Wed, 10 Apr 2019 09:16:16 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/530/fsav304.sakura.ne.jp)
Received: from [192.168.1.225] (p14010-ipadfx41marunouchi.tokyo.ocn.ne.jp [61.118.107.10])
        (authenticated bits=0)
        by www3345.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id x3A0GFFH088456
        (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NO);
        Wed, 10 Apr 2019 09:16:15 +0900 (JST)
        (envelope-from cv-dong@jinso.co.jp)
Subject: Re: [PATCH 01/11] ARM: dts: r8a77470: Add HSCIF support
To:     Simon Horman <horms@verge.net.au>
Cc:     linux-renesas-soc@vger.kernel.org, broonie@kernel.org,
        geert+renesas@glider.be, devicetree@vger.kernel.org,
        yoshihiro.shimoda.uh@renesas.com, kuninori.morimoto.gx@renesas.com,
        h-inayoshi@jinso.co.jp, nv-dung@jinso.co.jp, na-hoan@jinso.co.jp
References: <1554799912-24764-1-git-send-email-cv-dong@jinso.co.jp>
 <1554799912-24764-2-git-send-email-cv-dong@jinso.co.jp>
 <20190409115135.dt4ny3mizmfv3sbd@verge.net.au>
 <20190409121515.kqsog247tpxkybmr@verge.net.au>
From:   Cao Van Dong <cv-dong@jinso.co.jp>
Message-ID: <6dbaba53-ca72-af14-7717-b0814e3a9945@jinso.co.jp>
Date:   Wed, 10 Apr 2019 09:16:15 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190409121515.kqsog247tpxkybmr@verge.net.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Dear Simon-san,

On 2019/04/09 21:15, Simon Horman wrote:
> On Tue, Apr 09, 2019 at 01:51:38PM +0200, Simon Horman wrote:
>> On Tue, Apr 09, 2019 at 05:51:42PM +0900, Cao Van Dong wrote:
>>> Add hscif{0|1|2} nodes to dtsi for HSCIF support on the RZ/G1C (r8a77470) SoC.
>>>
>>> Signed-off-by: Cao Van Dong <cv-dong@jinso.co.jp>
>> Thanks,
>>
>> This looks fine to me but I will wait to see if there are other reviews
>> before applying.
>>
>> Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
> Sorry, I spoke a little too soon.
>
> The following incremental change is required in order
> for this patch to compile.
>
> Please test that each patch in this series compiles and resubmit.

Thanks for your feedback. Very sorry for the trouble!
I will correct and resubmit in version 2.

> diff --git a/arch/arm/boot/dts/r8a77470.dtsi b/arch/arm/boot/dts/r8a77470.dtsi
> index 85f7a6f68720..60bd79fc35f7 100644
> --- a/arch/arm/boot/dts/r8a77470.dtsi
> +++ b/arch/arm/boot/dts/r8a77470.dtsi
> @@ -594,12 +594,12 @@
>   			reg = <0 0xe62c0000 0 0x60>;
>   			interrupts = <GIC_SPI 154 IRQ_TYPE_LEVEL_HIGH>;
>   			clocks = <&cpg CPG_MOD 717>,
> -				 <&cpg CPG_CORE r8a77470_CLK_ZS>, <&scif_clk>;
> +				 <&cpg CPG_CORE R8A77470_CLK_ZS>, <&scif_clk>;
>   			clock-names = "fck", "brg_int", "scif_clk";
>   			dmas = <&dmac0 0x39>, <&dmac0 0x3a>,
>   			       <&dmac1 0x39>, <&dmac1 0x3a>;
>   			dma-names = "tx", "rx", "tx", "rx";
> -			power-domains = <&sysc r8a77470_PD_ALWAYS_ON>;
> +			power-domains = <&sysc R8A77470_PD_ALWAYS_ON>;
>   			resets = <&cpg 717>;
>   			status = "disabled";
>   		};
> @@ -610,12 +610,12 @@
>   			reg = <0 0xe62c8000 0 0x60>;
>   			interrupts = <GIC_SPI 155 IRQ_TYPE_LEVEL_HIGH>;
>   			clocks = <&cpg CPG_MOD 716>,
> -				 <&cpg CPG_CORE r8a77470_CLK_ZS>, <&scif_clk>;
> +				 <&cpg CPG_CORE R8A77470_CLK_ZS>, <&scif_clk>;
>   			clock-names = "fck", "brg_int", "scif_clk";
>   			dmas = <&dmac0 0x4d>, <&dmac0 0x4e>,
>   			       <&dmac1 0x4d>, <&dmac1 0x4e>;
>   			dma-names = "tx", "rx", "tx", "rx";
> -			power-domains = <&sysc r8a77470_PD_ALWAYS_ON>;
> +			power-domains = <&sysc R8A77470_PD_ALWAYS_ON>;
>   			resets = <&cpg 716>;
>   			status = "disabled";
>   		};
> @@ -626,12 +626,12 @@
>   			reg = <0 0xe62d0000 0 0x60>;
>   			interrupts = <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;
>   			clocks = <&cpg CPG_MOD 713>,
> -				 <&cpg CPG_CORE r8a77470_CLK_ZS>, <&scif_clk>;
> +				 <&cpg CPG_CORE R8A77470_CLK_ZS>, <&scif_clk>;
>   			clock-names = "fck", "brg_int", "scif_clk";
>   			dmas = <&dmac0 0x3b>, <&dmac0 0x3c>,
>   			       <&dmac1 0x3b>, <&dmac1 0x3c>;
>   			dma-names = "tx", "rx", "tx", "rx";
> -			power-domains = <&sysc r8a77470_PD_ALWAYS_ON>;
> +			power-domains = <&sysc R8A77470_PD_ALWAYS_ON>;
>   			resets = <&cpg 713>;
>   			status = "disabled";
>   		};
Thank you,
Dong


