Return-Path: <SRS0=7Xuf=PR=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3A8FC43387
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  9 Jan 2019 08:29:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 88B77214C6
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  9 Jan 2019 08:29:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729590AbfAII3Z (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 9 Jan 2019 03:29:25 -0500
Received: from mail-ua1-f68.google.com ([209.85.222.68]:46844 "EHLO
        mail-ua1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729281AbfAII3Z (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 9 Jan 2019 03:29:25 -0500
Received: by mail-ua1-f68.google.com with SMTP id v24so2139947uap.13;
        Wed, 09 Jan 2019 00:29:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4yVHw07V51oZRhhs+dEL/intCP4kgMH9EIjBaPHroUk=;
        b=sU0WyRqsj8e20cbqeXzq9h7/VCpMgw+eH/POB2OPQBVoB2EFTMMxM5GsjKQlD3/7kd
         T/Zlpf+hSeOkJWXGSn0FjR5FDk5m1iTAS3IhwmsZs8uYtHRxMdIgleARKTZXe4axc5Dj
         MlgQn55b7MNfeJC+6XmuGgj20jHxYDUw+4h9EBt607On7KnH8wuShLxh+HfAU4WM4s+e
         ReUXXBzTYckJHOgTp+/sHo3KMLN1U5Ok+A7wmRXB71K9Xy0q7g05ttfJHrfjPxEVfrLB
         oOxeGk18YaM38cBkq2vVGohAqRAvC60DVQJA3Xc2q3P2K2gNAzXnuYZu/wsw8akIQHx8
         u/qg==
X-Gm-Message-State: AJcUukfxyKsDe/ou7QJ3xDdt1K+LmMXNiq5iOofeIbYNqX/C5BMHyJUQ
        QYmcbkCPGUpg43VKDyyjfmmsBW4gw5772+n7GuI=
X-Google-Smtp-Source: ALg8bN7shN8OknjOaTzX+fm5buCTT45byz2boDDJyfLc9DkkcOJNkEjL4HLXsRedRFa6rtDCG7aQWUx4mZsgoxAt67A=
X-Received: by 2002:ab0:1393:: with SMTP id m19mr1762506uae.75.1547022563820;
 Wed, 09 Jan 2019 00:29:23 -0800 (PST)
MIME-Version: 1.0
References: <038a791d-aa57-9c3d-eaea-09c5704ecb54@cogentembedded.com> <f9c6b067-80ba-c3c6-abcb-57d9524972fc@cogentembedded.com>
In-Reply-To: <f9c6b067-80ba-c3c6-abcb-57d9524972fc@cogentembedded.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 9 Jan 2019 09:29:12 +0100
Message-ID: <CAMuHMdWV92SY2VOXBObr56nf=kA4C4G1jn1QQK7UizcF02v9ig@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: v3msk: specify EtherAVB PHY IRQ
To:     Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc:     Simon Horman <horms@verge.net.au>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Jan 8, 2019 at 8:57 PM Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> Specify EtherAVB PHY IRQ in the V3M Starter Kit board's device tree, now
> that we have the GPIO support (previously phylib had to resort to polling).
>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
