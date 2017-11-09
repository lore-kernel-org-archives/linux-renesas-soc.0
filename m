Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f67.google.com ([209.85.214.67]:53908 "EHLO
        mail-it0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754559AbdKIMya (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 9 Nov 2017 07:54:30 -0500
Received: by mail-it0-f67.google.com with SMTP id 143so7243787itf.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 09 Nov 2017 04:54:29 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1510223960-14139-1-git-send-email-geert+renesas@glider.be>
References: <1510223960-14139-1-git-send-email-geert+renesas@glider.be>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 9 Nov 2017 13:54:28 +0100
Message-ID: <CACRpkdYhzbRTyjax_A0mF9CW27i26g8OrSZYyepL7zSNgYRLcA@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: rcar: Add r8a77995 (R-Car D3) support
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Nov 9, 2017 at 11:39 AM, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
>
> This patch adds binding for r8a77995 (R-Car D3). This SoC can use
> "renesas,rcar-gen3-gpio" fallback compatibility. So, this patch
> doesn't modify the gpio-rcar driver.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Acked-by: Simon Horman <horms+renesas@verge.net.au>
> Acked-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Linus: it seems this one fell through the cracks, as the later
> f76a2d9d7f9524c5 ("gpio-rcar: document R8A77970 bindings") did get
> applied.
>
> Thx!
>
> v2:
>   - Add Acked-by, rebased.

Oopsie. Maybe my oversight.

Patch applied!

Yours,
Linus Walleij
