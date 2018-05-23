Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f195.google.com ([209.85.223.195]:38059 "EHLO
        mail-io0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754141AbeEWIF1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 May 2018 04:05:27 -0400
Received: by mail-io0-f195.google.com with SMTP id z4-v6so21719114iof.5
        for <linux-renesas-soc@vger.kernel.org>; Wed, 23 May 2018 01:05:26 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1526008386-26420-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1526008386-26420-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 23 May 2018 10:05:25 +0200
Message-ID: <CACRpkdb-UcgNgGVvgfGymZU8gKOt_tuaj3RPjBGaZKBZEdgGPQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: gpio: rcar: Add support for r8a77990
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, May 11, 2018 at 5:13 AM, Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:

> Add compatible string for R-Car E3 (r8a77990) in gpio-rcar.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Quite uncontroversial so, patch applied with Simon's
ACK.

Yours,
Linus Walleij
