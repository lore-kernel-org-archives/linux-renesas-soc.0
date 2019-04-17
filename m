Return-Path: <SRS0=NjMp=ST=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,UNWANTED_LANGUAGE_BODY,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EAA2C10F13
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 17 Apr 2019 00:40:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C7BC221773
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 17 Apr 2019 00:40:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728959AbfDQAku (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 16 Apr 2019 20:40:50 -0400
Received: from www3345.sakura.ne.jp ([49.212.235.55]:64239 "EHLO
        www3345.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728373AbfDQAku (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 16 Apr 2019 20:40:50 -0400
Received: from fsav106.sakura.ne.jp (fsav106.sakura.ne.jp [27.133.134.233])
        by www3345.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id x3H0ehuO099271;
        Wed, 17 Apr 2019 09:40:43 +0900 (JST)
        (envelope-from na-hoan@jinso.co.jp)
Received: from www3345.sakura.ne.jp (49.212.235.55)
 by fsav106.sakura.ne.jp (F-Secure/fsigk_smtp/530/fsav106.sakura.ne.jp);
 Wed, 17 Apr 2019 09:40:43 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/530/fsav106.sakura.ne.jp)
Received: from [192.168.1.8] (p14010-ipadfx41marunouchi.tokyo.ocn.ne.jp [61.118.107.10])
        (authenticated bits=0)
        by www3345.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id x3H0ehMA099267
        (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NO);
        Wed, 17 Apr 2019 09:40:43 +0900 (JST)
        (envelope-from na-hoan@jinso.co.jp)
Subject: Re: [PATCH 2/4] arm64: dts: r8a77995: Add Audio device nodes
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     linux-renesas-soc@vger.kernel.org, horms+renesas@verge.net.au,
        geert+renesas@glider.be, yoshihiro.shimoda.uh@renesas.com,
        magnus.damm@gmail.com, h-inayoshi@jinso.co.jp, nv-dung@jinso.co.jp,
        cv-dong@jinso.co.jp
References: <1536308743-29573-1-git-send-email-na-hoan@jinso.co.jp>
 <1536308743-29573-3-git-send-email-na-hoan@jinso.co.jp>
 <87o9d9pu3y.wl-kuninori.morimoto.gx@renesas.com>
From:   Hoan <na-hoan@jinso.co.jp>
Message-ID: <8768b6ea-42dd-512b-8794-6df0469c1f55@jinso.co.jp>
Date:   Wed, 17 Apr 2019 09:40:43 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <87o9d9pu3y.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Dear Morimoto-san

Sorry for delay in this:


On 2018/09/07 17:59, Kuninori Morimoto wrote:
> Hi Nguyen
>
> Thank you for your patch
>
>> From: Hoan Nguyen An <na-hoan@jinso.co.jp>
>>
>> This patch adds Audio device nodes for the R8A77995
>>
>> Signed-off-by: Hoan Nguyen An <na-hoan@jinso.co.jp>
>> ---
> (snip)
>> +			clock-names = "ssi-all",
>> +				      "ssi.9", "ssi.8", "ssi.7", "ssi.6",
>> +				      "ssi.5", "ssi.4", "ssi.3", "ssi.2",
>> +				      "ssi.1", "ssi.0",

I understand D3 only has SSI3, SSI4, SRC5, SRC6. But if I omitted the 
attributes that D3 does not support (as SSI0,1,2,5,6,7,8,9),

although the sound-driver can probe but cannot play audio file,

+            clocks = <&cpg CPG_MOD 1005>,
+                 <&cpg CPG_MOD 1011>, <&cpg CPG_MOD 1012>,
+                 <&cpg CPG_MOD 1025>, <&cpg CPG_MOD 1026>,
+                 <&cpg CPG_MOD 1020>, <&cpg CPG_MOD 1021>,
+                 <&cpg CPG_MOD 1020>, <&cpg CPG_MOD 1021>,
+                 <&cpg CPG_MOD 1019>, <&cpg CPG_MOD 1018>,
+                 <&audio_clk_a>, <&audio_clk_b>,
+                 <&cpg CPG_CORE R8A77995_CLK_ZA2>;
+
+            clock-names = "ssi-all",
+                      "ssi.4", "ssi.3",
+                      "src.6", "src.5",
+                      "mix.1", "mix.0",
+                      "ctu.1", "ctu.0",
+                      "dvc.0", "dvc.1",
+                      "clk_a", "clk_b", "clk_i";


And if I stay the same, ssi9,8,7,6,5,2,1,0 D3 does not support so CPG 
will be 1005 (BIT5) corresponding

to SSI (all), similar to SCU (src9, 8,7,4,3,2,1,0) corresponds to 1017 
(BIT17) SCU (all).

I tested and Sound operates in normally as follows


+            clocks = <&cpg CPG_MOD 1005>,
+                 <&cpg CPG_MOD 1005>, <&cpg CPG_MOD 1005>,
+                 <&cpg CPG_MOD 1005>, <&cpg CPG_MOD 1005>,
+                 <&cpg CPG_MOD 1005>, <&cpg CPG_MOD 1011>,
+                 <&cpg CPG_MOD 1012>, <&cpg CPG_MOD 1005>,
+                 <&cpg CPG_MOD 1005>, <&cpg CPG_MOD 1005>,
+                 <&cpg CPG_MOD 1017>, <&cpg CPG_MOD 1017>,
+                 <&cpg CPG_MOD 1017>, <&cpg CPG_MOD 1025>,
+                 <&cpg CPG_MOD 1026>, <&cpg CPG_MOD 1017>,
+                 <&cpg CPG_MOD 1017>, <&cpg CPG_MOD 1017>,
+                 <&cpg CPG_MOD 1017>, <&cpg CPG_MOD 1017>,
+                 <&cpg CPG_MOD 1020>, <&cpg CPG_MOD 1021>,
+                 <&cpg CPG_MOD 1020>, <&cpg CPG_MOD 1021>,
+                 <&cpg CPG_MOD 1019>, <&cpg CPG_MOD 1018>,
+                 <&audio_clk_a>, <&audio_clk_b>,
+                 <&cpg CPG_CORE R8A77995_CLK_ZA2>;
+
+            clock-names = "ssi-all",
+                      "ssi.9", "ssi.8", "ssi.7", "ssi.6",
+                      "ssi.5", "ssi.4", "ssi.3", "ssi.2",
+                      "ssi.1", "ssi.0",
+                      "src.9", "src.8", "src.7", "src.6",
+                      "src.5", "src.4", "src.3", "src.2",
+                      "src.1", "src.0",
+                      "mix.1", "mix.0",
+                      "ctu.1", "ctu.0",
+                      "dvc.0", "dvc.1",
+                      "clk_a", "clk_b", "clk_i";


> (snip)
>> +			reset-names = "ssi-all",
>> +				      "ssi.9", "ssi.8", "ssi.7", "ssi.6",
>> +				      "ssi.5", "ssi.4", "ssi.3", "ssi.2",
>> +				      "ssi.1", "ssi.0";
> These are strange.
> 77995 has SSI3/4 only,right ?
>
I intend to update as follows

+            resets = <&cpg 1005>,
+                 <&cpg 1011>, <&cpg 1012>;
+            reset-names = "ssi-all",
+                      "ssi.4", "ssi.3";
+            status = "disabled";


And finally to declare new node method with ssi, ssiu: I updated as follows.


+            rcar_sound,src {
+                src0: src-0 {
+                    status = "disabled";
+                };
+                src1: src-1 {
+                    status = "disabled";
+                };
+                src2: src-2 {
+                    status = "disabled";
+                };
+                src3: src-3 {
+                    status = "disabled";
+                };
+                src4: src-4 {
+                    status = "disabled";
+                };
+                src5: src-5 {
+                    interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
+                    dmas = <&audma0 0x8f>, <&audma0 0xb2>;
+                    dma-names = "rx", "tx";
+                };
+                src6: src-6 {
+                    interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
+                    dmas = <&audma0 0x91>, <&audma0 0xb4>;
+                    dma-names = "rx", "tx";
+                };
+                src7: src-7 {
+                    status = "disabled";
+                };
+                src8: src-8 {
+                    status = "disabled";
+                };
+                src9: src-9 {
+                    status = "disabled";
+                };
+            };
+
+            rcar_sound,ssiu {
+                ssiu00: ssiu-0 {
+                    status = "disabled";
+                };
+                ssiu01: ssiu-1 {
+                    status = "disabled";
+                };
+                ssiu02: ssiu-2 {
+                    status = "disabled";
+                };
+                ssiu03: ssiu-3 {
+                    status = "disabled";
+                };
+                ssiu04: ssiu-4 {
+                    status = "disabled";
+                };
+                ssiu05: ssiu-5 {
+                    status = "disabled";
+                };
+                ssiu06: ssiu-6 {
+                    status = "disabled";
+                };
+                ssiu07: ssiu-7 {
+                    status = "disabled";
+                };
+                ssiu10: ssiu-8 {
+                    status = "disabled";
+                };
+                ssiu11: ssiu-9 {
+                    status = "disabled";
+                };
+                ssiu12: ssiu-10 {
+                    status = "disabled";
+                };
+                ssiu13: ssiu-11 {
+                    status = "disabled";
+                };
+                ssiu14: ssiu-12 {
+                    status = "disabled";
+                };
+                ssiu15: ssiu-13 {
+                    status = "disabled";
+                };
+                ssiu16: ssiu-14 {
+                    status = "disabled";
+                };
+                ssiu17: ssiu-15 {
+                    status = "disabled";
+                };
+                ssiu20: ssiu-16 {
+                    status = "disabled";
+                };
+                ssiu21: ssiu-17 {
+                    status = "disabled";
+                };
+                ssiu22: ssiu-18 {
+                    status = "disabled";
+                };
+                ssiu23: ssiu-19 {
+                    status = "disabled";
+                };
+                ssiu24: ssiu-20 {
+                    status = "disabled";
+                };
+                ssiu25: ssiu-21 {
+                    status = "disabled";
+                };
+                ssiu26: ssiu-22 {
+                    status = "disabled";
+                };
+                ssiu27: ssiu-23 {
+                    status = "disabled";
+                };
+                ssiu30: ssiu-24 {
+                    dmas = <&audma0 0x6f>, <&audma0 0x70>;
+                    dma-names = "rx", "tx";
+                };
+                ssiu31: ssiu-25 {
+                    status = "disabled";
+                };
+                ssiu32: ssiu-26 {
+                    status = "disabled";
+                };
+                ssiu33: ssiu-27 {
+                    status = "disabled";
+                };
+                ssiu34: ssiu-28 {
+                    status = "disabled";
+                };
+                ssiu35: ssiu-29 {
+                    status = "disabled";
+                };
+                ssiu36: ssiu-30 {
+                    status = "disabled";
+                };
+                ssiu37: ssiu-31 {
+                    status = "disabled";
+                };
+                ssiu40: ssiu-32 {
+                    dmas =    <&audma0 0x71>, <&audma0 0x72>;
+                    dma-names = "rx", "tx";
+                };
+                ssiu41: ssiu-33 {
+                    status = "disabled";
+                };
+                ssiu42: ssiu-34 {
+                    status = "disabled";
+                };
+                ssiu43: ssiu-35 {
+                    status = "disabled";
+                };
+                ssiu44: ssiu-36 {
+                    status = "disabled";
+                };
+                ssiu45: ssiu-37 {
+                    status = "disabled";
+                };
+                ssiu46: ssiu-38 {
+                    status = "disabled";
+                };
+                ssiu47: ssiu-39 {
+                    status = "disabled";
+                };
+                ssiu50: ssiu-40 {
+                    status = "disabled";
+                };
+                ssiu60: ssiu-41 {
+                    status = "disabled";
+                };
+                ssiu70: ssiu-42 {
+                    status = "disabled";
+                };
+                ssiu80: ssiu-43 {
+                    status = "disabled";
+                };
+                ssiu90: ssiu-44 {
+                    status = "disabled";
+                };
+                ssiu91: ssiu-45 {
+                    status = "disabled";
+                };
+                ssiu92: ssiu-46 {
+                    status = "disabled";
+                };
+                ssiu93: ssiu-47 {
+                    status = "disabled";
+                };
+                ssiu94: ssiu-48 {
+                    status = "disabled";
+                };
+                ssiu95: ssiu-49 {
+                    status = "disabled";
+                };
+                ssiu96: ssiu-50 {
+                    status = "disabled";
+                };
+                ssiu97: ssiu-51 {
+                    status = "disabled";
+                };
+            };
+
+            rcar_sound,ssi {
+                ssi0: ssi-0 {
+                    status = "disabled";
+                };
+                ssi1: ssi-1 {
+                    status = "disabled";
+                };
+                ssi2: ssi-2 {
+                    status = "disabled";
+                };
+                ssi3: ssi-3 {
+                    interrupts = <GIC_SPI 373 IRQ_TYPE_LEVEL_HIGH>;
+                    dmas = <&audma0 0x07>, <&audma0 0x08>;
+                    dma-names = "rx", "tx";
+                };
+                ssi4: ssi-4 {
+                    interrupts = <GIC_SPI 374 IRQ_TYPE_LEVEL_HIGH>;
+                    dmas = <&audma0 0x09>, <&audma0 0x0a>;
+                    dma-names = "rx", "tx";
+                };
+                ssi5: ssi-5 {
+                    status = "disabled";
+                };
+                ssi6: ssi-6 {
+                    status = "disabled";
+                };
+                ssi7: ssi-7 {
+                    status = "disabled";
+                };
+                ssi8: ssi-8 {
+                    status = "disabled";
+                };


Although I checked with the testing  Sound-driver.
What do you think and can you give me new suggestions.
I'm sorry for bothering a lot of this place.


Thanks You

Hoan.

