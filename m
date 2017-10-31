Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f195.google.com ([209.85.223.195]:53745 "EHLO
        mail-io0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751455AbdJaIxS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 31 Oct 2017 04:53:18 -0400
Received: by mail-io0-f195.google.com with SMTP id 189so33361179iow.10
        for <linux-renesas-soc@vger.kernel.org>; Tue, 31 Oct 2017 01:53:18 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20171012210818.806395567@cogentembedded.com>
References: <20171012210818.806395567@cogentembedded.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 31 Oct 2017 09:53:17 +0100
Message-ID: <CACRpkdYnF4Groyqchi--3deyxVcak5uRFegWChF4ANbPAD-0rA@mail.gmail.com>
Subject: Re: [PATCH 1/1] gpio-rcar: use devm_ioremap_resource()
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Oct 12, 2017 at 11:08 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:

> Using devm_ioremap_resource() has several advantages over devm_ioremap():
> - it checks the passed resource's validity;
> - it calls devm_request_mem_region() to check for the resource overlap;
> - it prints an error message in case of error.
>
> We can call devm_ioremap_resource() instead of devm_ioremap_nocache()
> as ioremap() and ioremap_nocache()  are implemented identically on ARM.
> Doing this saves 2 LoCs and 80 bytes (AArch64 gcc 4.8.5).
>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Patch applied with Geert's review tag.

Sorry for delay, too busy as always.

Yours,
Linus Walleij
