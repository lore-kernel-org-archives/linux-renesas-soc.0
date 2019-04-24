Return-Path: <SRS0=xaBA=S2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62992C10F11
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 24 Apr 2019 08:22:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3C4C2208E4
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 24 Apr 2019 08:22:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730146AbfDXIWp (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 24 Apr 2019 04:22:45 -0400
Received: from www3345.sakura.ne.jp ([49.212.235.55]:28558 "EHLO
        www3345.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726733AbfDXIWp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 24 Apr 2019 04:22:45 -0400
Received: from fsav301.sakura.ne.jp (fsav301.sakura.ne.jp [153.120.85.132])
        by www3345.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id x3O8MCw5013196;
        Wed, 24 Apr 2019 17:22:12 +0900 (JST)
        (envelope-from cv-dong@jinso.co.jp)
Received: from www3345.sakura.ne.jp (49.212.235.55)
 by fsav301.sakura.ne.jp (F-Secure/fsigk_smtp/530/fsav301.sakura.ne.jp);
 Wed, 24 Apr 2019 17:22:12 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/530/fsav301.sakura.ne.jp)
Received: from [192.168.1.225] (p14010-ipadfx41marunouchi.tokyo.ocn.ne.jp [61.118.107.10])
        (authenticated bits=0)
        by www3345.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id x3O8MBn0013182
        (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NO);
        Wed, 24 Apr 2019 17:22:12 +0900 (JST)
        (envelope-from cv-dong@jinso.co.jp)
Subject: Re: [PATCH 0/4] Add TPU support for R-Car H3/M3-W/M3-N
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms+renesas@verge.net.au>,
        Mark Brown <broonie@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Rob Herring <robh@kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        =?UTF-8?B?56iy5ZCJ?= <h-inayoshi@jinso.co.jp>,
        Hoan Nguyen An <na-hoan@jinso.co.jp>
References: <1555379752-5980-1-git-send-email-cv-dong@jinso.co.jp>
 <CAMuHMdV42AY-ihUpfoOYraTWn6Pf=b6W15pq5sp97OdeZSGebw@mail.gmail.com>
From:   Cao Van Dong <cv-dong@jinso.co.jp>
Message-ID: <6f5f130c-9599-fec9-daf9-c047368f4b9c@jinso.co.jp>
Date:   Wed, 24 Apr 2019 17:22:11 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAMuHMdV42AY-ihUpfoOYraTWn6Pf=b6W15pq5sp97OdeZSGebw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Dear Geert-san,

On 2019/04/24 16:49, Geert Uytterhoeven wrote:
> Hi Cao,
>
> On Tue, Apr 16, 2019 at 3:56 AM Cao Van Dong <cv-dong@jinso.co.jp> wrote:
>> This series adds tpu support for r8a7795/r8a7796/r8a77965 SoCs.
>> Based on the renesas-drivers-2019-04-02-v5.1-rc3 tag of renesas-drivers tree.
>>
>> For test: After booting, I found the device was registered in the boot log.
> Thanks for your series!
>
>> Cao Van Dong (4):
>>    arm64: dts: renesas: r8a7795: Add TPU support
>>    arm64: dts: renesas: r8a7796: Add TPU support
>>    arm64: dts: renesas: r8a77965: Add TPU support
>>    dt-bindings: pwm: renesas: tpu: Document R8A779{5|6|65} bindings
>>
>>   Documentation/devicetree/bindings/pwm/renesas,tpu-pwm.txt |  3 +++
>>   arch/arm64/boot/dts/renesas/r8a7795.dtsi                  | 11 +++++++++++
>>   arch/arm64/boot/dts/renesas/r8a7796.dtsi                  | 11 +++++++++++
>>   arch/arm64/boot/dts/renesas/r8a77965.dtsi                 | 11 +++++++++++
>>   drivers/clk/renesas/r8a7795-cpg-mssr.c                    |  1 +
>>   drivers/clk/renesas/r8a7796-cpg-mssr.c                    |  1 +
>>   drivers/clk/renesas/r8a77965-cpg-mssr.c                   |  1 +
>>   7 files changed, 39 insertions(+)
> Please split off the clock driver changes into separate patches, as DTS and
> clock driver changes go in through different subsystem/maintainer paths.
Thanks for your feedback!
I will separate them and re-submit it with the v2 mask.

Thank you,
Dong
> Gr{oetje,eeting}s,
>
>                          Geert
>
