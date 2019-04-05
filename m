Return-Path: <SRS0=/r1Q=SH=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F268CC4360F
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  5 Apr 2019 09:02:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C969521872
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  5 Apr 2019 09:02:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729792AbfDEJCd (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 5 Apr 2019 05:02:33 -0400
Received: from www3345.sakura.ne.jp ([49.212.235.55]:40270 "EHLO
        www3345.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729728AbfDEJCd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 5 Apr 2019 05:02:33 -0400
Received: from fsav105.sakura.ne.jp (fsav105.sakura.ne.jp [27.133.134.232])
        by www3345.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id x3592Vmc080864;
        Fri, 5 Apr 2019 18:02:31 +0900 (JST)
        (envelope-from cv-dong@jinso.co.jp)
Received: from www3345.sakura.ne.jp (49.212.235.55)
 by fsav105.sakura.ne.jp (F-Secure/fsigk_smtp/530/fsav105.sakura.ne.jp);
 Fri, 05 Apr 2019 18:02:31 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/530/fsav105.sakura.ne.jp)
Received: from [192.168.1.225] (p14010-ipadfx41marunouchi.tokyo.ocn.ne.jp [61.118.107.10])
        (authenticated bits=0)
        by www3345.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id x3592UuM080849
        (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NO);
        Fri, 5 Apr 2019 18:02:31 +0900 (JST)
        (envelope-from cv-dong@jinso.co.jp)
Subject: Re: [PATCH 1/4] arm64: dts: renesas: r8a7795: Add CMT device nodes
To:     Simon Horman <horms@verge.net.au>
Cc:     broonie@kernel.org, geert+renesas@glider.be,
        devicetree@vger.kernel.org, yoshihiro.shimoda.uh@renesas.com,
        kuninori.morimoto.gx@renesas.com,
        linux-renesas-soc@vger.kernel.org, h-inayoshi@jinso.co.jp,
        nv-dung@jinso.co.jp, na-hoan@jinso.co.jp
References: <1554443049-25127-1-git-send-email-cv-dong@jinso.co.jp>
 <1554443049-25127-2-git-send-email-cv-dong@jinso.co.jp>
 <20190405081716.s74zbrd47ychcevw@verge.net.au>
From:   Cao Van Dong <cv-dong@jinso.co.jp>
Message-ID: <d666b4d4-4b78-201f-c7a1-f41bd5c1cf71@jinso.co.jp>
Date:   Fri, 5 Apr 2019 18:02:30 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190405081716.s74zbrd47ychcevw@verge.net.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Dear Simon-san,

On 2019/04/05 17:17, Simon Horman wrote:
> On Fri, Apr 05, 2019 at 02:44:06PM +0900, Cao Van Dong wrote:
>> This patch adds CMT{0|1|2|3} device nodes for r8a7795 SoC.
>>
>> Tested-by: Cao Van Dong <cv-dong@jinso.co.jp>
>> Signed-off-by: Cao Van Dong <cv-dong@jinso.co.jp>
> Thanks,
>
> This looks fine to me but I will wait to see if there are other reviews
> before applying.
>
> Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
Thanks you for review!
> I am, however, curious to know how you tested this.
>
> Likewise for patches 2/4 and 3/4.
Always thanks for your curious!
After booting, I checked the existence of the device and the device 
interrupt.

Thanks you,
Dong

