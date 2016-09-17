Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f50.google.com ([209.85.215.50]:34586 "EHLO
        mail-lf0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756711AbcIQKPs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 17 Sep 2016 06:15:48 -0400
Received: by mail-lf0-f50.google.com with SMTP id y6so5163268lff.1
        for <linux-renesas-soc@vger.kernel.org>; Sat, 17 Sep 2016 03:15:47 -0700 (PDT)
Subject: Re: [PATCH RFC 1/8] ARM: shmobile: r8a7743: add clock index macros
To: horms@verge.net.au, linux-renesas-soc@vger.kernel.org,
        robh+dt@kernel.org, mark.rutland@arm.com,
        devicetree@vger.kernel.org
References: <3533019.Wim1Kuh1ic@wasted.cogentembedded.com>
 <17982632.cAVaBDUq2Q@wasted.cogentembedded.com>
Cc: magnus.damm@gmail.com
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <a3658cea-b31e-0c29-4c4d-2b9cd4644f18@cogentembedded.com>
Date: Sat, 17 Sep 2016 13:15:45 +0300
MIME-Version: 1.0
In-Reply-To: <17982632.cAVaBDUq2Q@wasted.cogentembedded.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 9/16/2016 4:28 PM, Sergei Shtylyov wrote:

> Add macros usable by the device tree sources to reference the R8A7743
> clocks  by index.
>
> Based on the original (and large) patch by Dmitry Shifrin
> <dmitry.shifrin@cogentembedded.com>.
>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>
> ---
>  include/dt-bindings/clock/r8a7743-clock.h |  157 ++++++++++++++++++++++++++++++
>  1 file changed, 157 insertions(+)
>
> Index: renesas/include/dt-bindings/clock/r8a7743-clock.h
> ===================================================================
> --- /dev/null
> +++ renesas/include/dt-bindings/clock/r8a7743-clock.h
> @@ -0,0 +1,157 @@
> +/*
> + * Copyright 2013 Ideas On Board SPRL

    Sorry, stupid copy/paste mistake, should have Cogent's copyright. Will 
re-spin soon...

MBR, Sergei
