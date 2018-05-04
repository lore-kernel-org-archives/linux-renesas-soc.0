Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-oi0-f51.google.com ([209.85.218.51]:46021 "EHLO
        mail-oi0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751316AbeEDIl2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 4 May 2018 04:41:28 -0400
MIME-Version: 1.0
In-Reply-To: <20180502081415.amyes57huzb5ozlq@ninjato>
References: <1525031296-16512-1-git-send-email-ykaneko0929@gmail.com>
 <1525031296-16512-3-git-send-email-ykaneko0929@gmail.com> <20180501152915.66re3hotavdy2bi6@verge.net.au>
 <20180502053218.2idc2kfzfksuz74b@tetsubishi> <20180502063506.3s4vizhm5aquklrh@verge.net.au>
 <20180502081415.amyes57huzb5ozlq@ninjato>
From: Yoshihiro Kaneko <ykaneko0929@gmail.com>
Date: Fri, 4 May 2018 17:41:27 +0900
Message-ID: <CAH1o70Ko8wz_sYZ9v18q_Jx9iOhVKGRnOVGb0N5j+HKXJZ=BfQ@mail.gmail.com>
Subject: Re: [PATCH/RFT 2/3] mmc: renesas_sdhi: Add r8a77965 support
To: Wolfram Sang <wsa@the-dreams.de>, Simon Horman <horms@verge.net.au>
Cc: linux-mmc <linux-mmc@vger.kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello,

2018-05-02 17:14 GMT+09:00 Wolfram Sang <wsa@the-dreams.de>:
>
>> With the current state of the driver this patch should be fine,
>> modulo the changes suggested above. But once HS400 support is merged
>> some logic will be required to disable that feature for the r8a77965
>> until HS400 support for that SoC is explicitly added.
>>
>> Or conversely, perhaps when HS400 is added it should only be enabled
>> in the driver for SoCs that are known to work: r8a7796 and r8a7795. In the
>> case of the latter perhaps only ES2.0.
>>
>> Wolfram, what do you think?
>
> M3-N (and future SoCs as it seems) has 8 taps while the others have 4.
> Maybe we should have something already in place to distinguish 8 taps
> and 4 taps and leave the 8 taps part for "to be added later"?
>

Thanks for your review.
I will drop .revision = "ES1.0" and renesas,sdhi-r8a77965 in V2.

Best regards,
Kaneko
