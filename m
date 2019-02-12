Return-Path: <SRS0=s4Ke=QT=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B491CC282C4
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 12 Feb 2019 10:03:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 78AAB2186A
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 12 Feb 2019 10:03:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="g19MCneH"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726480AbfBLKDd (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 12 Feb 2019 05:03:33 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:54902 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727768AbfBLKDd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 12 Feb 2019 05:03:33 -0500
Received: by mail-wm1-f67.google.com with SMTP id a62so2234223wmh.4
        for <linux-renesas-soc@vger.kernel.org>; Tue, 12 Feb 2019 02:03:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=2grwhljsSffbLGt83W342UGOBDifsfkLexG8Xca3D9Y=;
        b=g19MCneHSdzFvvGDTJ26WYOmZeQyPvZzntIiNbUpEnjqUJCdklEC0tvMORsU9EvO62
         f1r0J0A1TORTXndvxi7JFfOlmxIACO+sRefEAkcCkvlVmjmJZjZpTvImsaRRzymKWhdO
         QUgEPQcD9zgzwo9GNjQ0E8me+6xhWlaJ+dt68SbhNkRbrxgo9QTNEOhRyy8Wujkl0FuM
         orChO8upjOnZzNNIwv7VvHtK2G7frC+ciZ8q4mbMBSwyzhpXeg9Z+7oD+TNWvsqA7WR9
         Bynjstbukxt5nzwmKKujjRukQN2/LGHQW/m1QQhI30hQ8Amy2xp0y7OWoHTKEmLN5uRP
         U1pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=2grwhljsSffbLGt83W342UGOBDifsfkLexG8Xca3D9Y=;
        b=o5xz2XxZ/ZalCUg6srtRr2D4qrnsvZwHL1bPOcRgVOuYJbucg8klv3LD6MbhBk5o9N
         309xnI/BalU38/ohPIlibczqR+NKYMPrnHUTl438GqR1gumk7CNftLQMtcnCPjvOi877
         a748BaNAWvX/0ZqqlFw4cHqCnq+Q1ctnn8mQR6ThktqQTXnT14rty/yYHeWCzkADtxvI
         +xxz8EpoB+PS8wKb6Xw54sbgRMtRyBZwr7l41kMLUkkwspHcWX8Fz7L8j6hNoAeuX4o4
         Vahm4gqa3ezKUTxB2kOXXO5QbXjCr2Zw5653NrnkXqP/QbnPIHLUKrHFYwkVRfU4mvdw
         xFDw==
X-Gm-Message-State: AHQUAuZ+EsFpJ73/FRu4OH8U1fzpFm9HhXjr693MCx1Pn2N1/pA/DMI1
        WYKgyfguX0GIRFyq5HHHRszkkdxmv90=
X-Google-Smtp-Source: AHgI3IaNA5v9F8QCCayfOOOHl8UssWSopEhquayb5vLGi06QFGXECTrOKATNo1NnW9tMuj4q7CKRAg==
X-Received: by 2002:a1c:400a:: with SMTP id n10mr2186158wma.56.1549965810911;
        Tue, 12 Feb 2019 02:03:30 -0800 (PST)
Received: from [192.168.27.65] (sju31-1-78-210-255-2.fbx.proxad.net. [78.210.255.2])
        by smtp.googlemail.com with ESMTPSA id 2sm34496215wrj.27.2019.02.12.02.03.28
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 12 Feb 2019 02:03:30 -0800 (PST)
Subject: Re: [PATCH v2 0/5] Add CMT/TMU support for RZ/G2E
To:     Biju Das <biju.das@bp.renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Thomas Gleixner <tglx@linutronix.de>, devicetree@vger.kernel.org,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
References: <1549272007-33471-1-git-send-email-biju.das@bp.renesas.com>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <86c16302-8f7e-52b6-d183-5a90c8a0fc85@linaro.org>
Date:   Tue, 12 Feb 2019 11:03:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <1549272007-33471-1-git-send-email-biju.das@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 04/02/2019 10:20, Biju Das wrote:
> This patch series aims to add CMT/TMU timer support for RZ/G2E SoC.
> 
> This patch series is tested against renesas-dev and linux-next.

Do you want me to take the patch 1/5 and 4/5 through my tree ?

> -----
> V1 -->V2 Incoporated Geert's review comment for TMU clock
> 
> Biju Das (5):
>   dt-bindings: timer: renesas, cmt: Document r8a774c0 CMT support
>   arm64: dts: renesas: r8a774c0: Add CMT device nodes
>   clk: renesas: r8a774c0: Add TMU clock
>   dt-bindings: timer: renesas: tmu: Document r8a774c0 bindings
>   arm64: dts: renesas: r8a774c0: Add TMU device nodes
> 
>  .../devicetree/bindings/timer/renesas,cmt.txt      |   2 +
>  .../devicetree/bindings/timer/renesas,tmu.txt      |   1 +
>  arch/arm64/boot/dts/renesas/r8a774c0.dtsi          | 135 +++++++++++++++++++++
>  drivers/clk/renesas/r8a774c0-cpg-mssr.c            |   5 +
>  4 files changed, 143 insertions(+)
> 


-- 
 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

