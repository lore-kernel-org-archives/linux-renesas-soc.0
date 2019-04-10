Return-Path: <SRS0=jOjt=SM=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDAA5C282DE
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 10 Apr 2019 00:51:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C56DC21741
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 10 Apr 2019 00:51:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726755AbfDJAvs (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 9 Apr 2019 20:51:48 -0400
Received: from www3345.sakura.ne.jp ([49.212.235.55]:64109 "EHLO
        www3345.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726907AbfDJAvs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 9 Apr 2019 20:51:48 -0400
Received: from fsav107.sakura.ne.jp (fsav107.sakura.ne.jp [27.133.134.234])
        by www3345.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id x3A0pdc1003709;
        Wed, 10 Apr 2019 09:51:39 +0900 (JST)
        (envelope-from cv-dong@jinso.co.jp)
Received: from www3345.sakura.ne.jp (49.212.235.55)
 by fsav107.sakura.ne.jp (F-Secure/fsigk_smtp/530/fsav107.sakura.ne.jp);
 Wed, 10 Apr 2019 09:51:39 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/530/fsav107.sakura.ne.jp)
Received: from [192.168.1.225] (p14010-ipadfx41marunouchi.tokyo.ocn.ne.jp [61.118.107.10])
        (authenticated bits=0)
        by www3345.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id x3A0pcxG003693
        (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NO);
        Wed, 10 Apr 2019 09:51:38 +0900 (JST)
        (envelope-from cv-dong@jinso.co.jp)
Subject: Re: [PATCH 06/11] ARM: dts: r8a77470: Add Audio support
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     linux-renesas-soc@vger.kernel.org, broonie@kernel.org,
        geert+renesas@glider.be, horms+renesas@verge.net.au,
        devicetree@vger.kernel.org, yoshihiro.shimoda.uh@renesas.com,
        h-inayoshi@jinso.co.jp, nv-dung@jinso.co.jp, na-hoan@jinso.co.jp
References: <1554799912-24764-1-git-send-email-cv-dong@jinso.co.jp>
 <1554799912-24764-7-git-send-email-cv-dong@jinso.co.jp>
 <87o95e7lmp.wl-kuninori.morimoto.gx@renesas.com>
From:   Cao Van Dong <cv-dong@jinso.co.jp>
Message-ID: <73ad4c10-ed8e-7fdc-1c68-837786cfaf6d@jinso.co.jp>
Date:   Wed, 10 Apr 2019 09:51:38 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <87o95e7lmp.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Dear Morimoto-san,

On 2019/04/10 9:37, Kuninori Morimoto wrote:
> Hi Dong-san
>
> Thank you for your patch
>
>> +		rcar_sound: sound@ec500000 {
>> +			/*
>> +			 * #sound-dai-cells is required
>> +			 *
>> +			 * Single DAI : #sound-dai-cells = <0>; <&rcar_sound>;
>> +			 * Multi  DAI : #sound-dai-cells = <1>; <&rcar_sound N>;
>> +			 */
>> +			compatible = "renesas,rcar_sound-r8a77470",
>> +				     "renesas,rcar_sound-gen2";
>> +			reg = <0 0xec500000 0 0x1000>, /* SCU */
>> +			      <0 0xec5a0000 0 0x100>,  /* ADG */
>> +			      <0 0xec540000 0 0x1000>, /* SSIU */
>> +			      <0 0xec541000 0 0x280>,  /* SSI */
>> +			      <0 0xec740000 0 0x200>;  /* Audio DMAC peri peri */
>> +			reg-names = "scu", "adg", "ssiu", "ssi", "audmapp";
> I don't have r8a77470 datasheet, but does it have *extended* Audio DMAC peri peri
> address (= 0xec760000) ? If it has, please use it instead of normal address (= 0xec740000).
>
>> +			rcar_sound,ssi {
>> +				ssi0: ssi-0 {
>> +					interrupts = <GIC_SPI 370 IRQ_TYPE_LEVEL_HIGH>;
>> +					dmas = <&audma0 0x01>, <&audma0 0x02>,
>> +					       <&audma0 0x15>, <&audma0 0x16>;
>> +					dma-names = "rx", "tx", "rxu", "txu";
>> +				};
> Please add ssiu.
> And then, ssi doesn't need "rxu" and "txu" anymore.
> These can be good help for you.
>
> 	0ec8e0a879b8d7eacbfbed9a7face8f97f9493a8
> 	("arm64: dts: renesas: r8a7795: remove BUSIF0 settings from rcar_sound,ssi")
>
> 	da90dd849dc22e920388d18a0f877366bd4d2b7f
> 	("arm64: dts: renesas: r8a7795: add SSIU support for sound")
>
>
> BTW, this patch-set is including SoC only.
> Do you have plan to post board support patch after this ?
> In other words, did you test these ?
Thanks for your feedback and help!
I will create a separate patch (add 
rcar_sound-r8a77470toDocumentation/../sound/renesas,rsnd.txt)
and update this patch in version 2.

Thank you,
Dong
> Thank you for your help !!
>
> Best regards
> ---
> Kuninori Morimoto
