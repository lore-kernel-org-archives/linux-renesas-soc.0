Return-Path: <SRS0=HpHr=UR=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8ACDCC31E51
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 18 Jun 2019 12:25:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5B5402082C
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 18 Jun 2019 12:25:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SQUTmMOD"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726640AbfFRMZp (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 18 Jun 2019 08:25:45 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:41683 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725934AbfFRMZo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Jun 2019 08:25:44 -0400
Received: by mail-wr1-f68.google.com with SMTP id c2so13746164wrm.8;
        Tue, 18 Jun 2019 05:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rZ6PrfSwEJOA9ZqfL20S2hfLLfIThwUqcpyh9fQWXRg=;
        b=SQUTmMODElTEAuO517ZeKMpXAUPJBlujj/p0dOIjWcgNcwovPsRVtj0VmjfedIp4nN
         qOdCX/OCZduKHjr6FblWuBEvx3kLl53WJbpGv0C/mpXcCI8NktCCLrno4YH2ycq5bXZk
         iZQTUli+QzAK5oOVJEqVSRet1RCn8V66V7YK/g86R338zswmVKraRL+ZilrGL8IKVp4e
         eOcwAhIdLf8Y0MaXGZ4lN3sSrwfkR0Mg8Q2cecxhQ+xqIkW50LFf22DMPPPCmu56H3jE
         7YXKnyCjyapUmF8u9v1619KIitUtNHDeKgtLtV4NSaIyAZMeQKmtsL2Yh2EBt5BtviFr
         vQpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rZ6PrfSwEJOA9ZqfL20S2hfLLfIThwUqcpyh9fQWXRg=;
        b=W9Pny9lb++ME8+iT6gHX2nY0cz2bEfmN36dnuAi06rtEwdJZpDvBPKMKJGqp+5F7UR
         y1/RtGTYnWOXz3rdBtxwFLA/jxdCw5aKSrKblgQsuLupt/dL+0N1o2lBGu7J7APuzzA6
         bW8c7AGu3xwxoN43UACahw/aBXHS83PwbMb3MeP9C8LbLrsGF7KUhPBiCKz1snZGhgLB
         d3QQ/vz0ynQoiyj35ruor+14W1DkZOrdPUxDvL5IS8Bk1lIxxXqX4Id305eruQWpjk0X
         xZBgQigCbEsOCQVEIH3cyMAGL0oe5yWwmuQ1haLm+geZ1lQgumjRdaOJrz8JqMQJ5GSc
         Y/Ow==
X-Gm-Message-State: APjAAAVK6UohBKQae9GRVnACGQtrdyjclBt2+9NkG7VC6I+M9TLXeO1T
        a6NxJJ5CPzJZyX4KLtXUQcYnFXPYqeuhC9FX9Vk=
X-Google-Smtp-Source: APXvYqxGYCK58kQJaF5oPoS4NLmZqdThmZBexOC8R/AfBM7py9qF0253vQT+bpFQ1Pl7f3xcPKEVSp4RqdDIHEKSO3o=
X-Received: by 2002:adf:f544:: with SMTP id j4mr9860685wrp.150.1560860742611;
 Tue, 18 Jun 2019 05:25:42 -0700 (PDT)
MIME-Version: 1.0
References: <156076216767.4736.16337667537984218274.sendpatchset@octo> <20190618103118.xsgc5fp5d76itdwc@verge.net.au>
In-Reply-To: <20190618103118.xsgc5fp5d76itdwc@verge.net.au>
From:   Magnus Damm <magnus.damm@gmail.com>
Date:   Tue, 18 Jun 2019 21:25:30 +0900
Message-ID: <CANqRtoSVk9hfMFa1EJKO5pa2x5MYfnkYFs4PF-hg8o79ioUS8Q@mail.gmail.com>
Subject: Re: [PATCH 0/8] dt-bindings: timer: renesas, cmt: Various updates
To:     Simon Horman <horms@verge.net.au>
Cc:     devicetree@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Jun 18, 2019 at 7:31 PM Simon Horman <horms@verge.net.au> wrote:
>
> On Mon, Jun 17, 2019 at 06:02:47PM +0900, Magnus Damm wrote:
> > dt-bindings: timer: renesas, cmt: Various updates
> >
> > [PATCH 1/8] dt-bindings: timer: renesas, cmt: Add CMT0234 to sh73a0 and r8a7740
> > [PATCH 2/8] dt-bindings: timer: renesas, cmt: Update CMT1 on sh73a0 and r8a7740
> > [PATCH 3/8] dt-bindings: timer: renesas, cmt: Add CMT0 and CMT1 to r8a7792
> > [PATCH 4/8] dt-bindings: timer: renesas, cmt: Add CMT0 and CMT1 to r8a7795
> > [PATCH 5/8] dt-bindings: timer: renesas, cmt: Add CMT0 and CMT1 to r8a77965
> > [PATCH 6/8] dt-bindings: timer: renesas, cmt: Add CMT0 and CMT1 to r8a77990
> > [PATCH 7/8] dt-bindings: timer: renesas, cmt: Add CMT0 and CMT1 to r8a77995
> > [PATCH 8/8] dt-bindings: timer: renesas, cmt: Update R-Car Gen3 CMT1 usage
> >
> > This series collect the following rather trivial DT binding changes:
> > - Add 32-bit CMT0234 and convert CMT1 DT binding on sh73a0 and r8a7740.
> > - Add documentation for the CMT on the R-Car Gen2 V2H (r8a7792) SoC.
> > - Add missing R-Car Gen3 DT bindings for H3, M3-N, E3 an D3.
> > - Update the R-Car Gen3 description to reflect current usage.
> >
> > Please see each individual patch for more information.
> >
> > Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
>
> Hi Magnus,
>
> I think this series should include the Clocksource maintainers as
> recipients:
>
> Daniel Lezcano <daniel.lezcano@linaro.org>
> Thomas Gleixner <tglx@linutronix.de>
>
> And LKML for good measure.

Will do after a bit more waiting time for potential feedback from
folks with access to Renesas documents. In particular I expected some
opinions about the difference between how the DT compat strings are
handled for CMT1/CMT2/CMT3 on R-Car Gen3 (as described in patch 8)
compared to sh73a0/r8a7740 (as described in patch 1).

I also need to rebase on top of that CMT DT biniding document patch
that covers most of the R-Car Gen3 SoCs.

Cheers,

/ magnus
