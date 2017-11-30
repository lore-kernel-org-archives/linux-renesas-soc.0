Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f50.google.com ([209.85.214.50]:44977 "EHLO
        mail-it0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751810AbdK3Niv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 30 Nov 2017 08:38:51 -0500
Received: by mail-it0-f50.google.com with SMTP id b5so8313253itc.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Nov 2017 05:38:51 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20171116201842.006310882@cogentembedded.com>
References: <20171116201842.006310882@cogentembedded.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 30 Nov 2017 14:38:50 +0100
Message-ID: <CACRpkda3+dBT60i0M1Fjaa1sxJuxFpKidCC2M9YxozMNkAVTcg@mail.gmail.com>
Subject: Re: [PATCH] gpio: pca953x: fix vendor prefix for PCA9654
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Rob Herring <robh+dt@kernel.org>, linux-gpio@vger.kernel.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
        <devicetree@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Nov 16, 2017 at 9:18 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:

> Despite commit 55020c8056a8 ("of: Add vendor prefix for ON Semiconductor
> Corp.") was made long ago, the latter commit 9f49f6dd0473 ("gpio: pca953x:
> add onsemi,pca9654 id") made use of another, undocumented vendor prefix.
> Since such prefix doesn't seem to be used in any device trees, I think we
> can just fix the "compatible" string in the driver and the bindings and be
> done with that...
>
> Fixes: 9f49f6dd0473 ("gpio: pca953x: add onsemi,pca9654 id")
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Patch applied with Rob's ACK.

Thanks for spotting this in time.

Yours,
Linus Walleij
