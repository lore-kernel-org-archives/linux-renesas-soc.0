Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-oi0-f65.google.com ([209.85.218.65]:37921 "EHLO
        mail-oi0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754906AbeDCLAv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 3 Apr 2018 07:00:51 -0400
MIME-Version: 1.0
In-Reply-To: <20180330134946.pa3565f2cbtucgja@verge.net.au>
References: <1522379583-4503-1-git-send-email-ykaneko0929@gmail.com> <20180330134946.pa3565f2cbtucgja@verge.net.au>
From: Yoshihiro Kaneko <ykaneko0929@gmail.com>
Date: Tue, 3 Apr 2018 20:00:50 +0900
Message-ID: <CAH1o70Km=f8merfVUDprJjF84ziKWgnxCPswbKgov9p3Ja-TeA@mail.gmail.com>
Subject: Re: [PATCH/RFT v2 0/3] thermal: add support for r8a77995
To: Simon Horman <horms@verge.net.au>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Eduardo Valentin <edubezval@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux PM list <linux-pm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Simon-san,

2018-03-30 22:49 GMT+09:00 Simon Horman <horms@verge.net.au>:
> On Fri, Mar 30, 2018 at 12:13:00PM +0900, Yoshihiro Kaneko wrote:
>> This series adds thermal support for r8a77995.
>> R-Car D3 (r8a77995) have a thermal sensor module which is similar to Gen2.
>> Therefore this series adds r8a77995 support to rcar_thermal driver not
>> rcar_gen3_thermal driver.
>>
>> This series is based on the next branch of Zhang Rui's linux tree.
>
> I have very lightly tested this as follows after enabling
> CONFIG_RCAR_THERMAL in the kernel .config.
>
> # cat /sys/devices/virtual/thermal/thermal_zone0/temp
> 40000

Thanks for the testing.
Probably 40C is reasonable, is not?


Best regards,
Kaneko
