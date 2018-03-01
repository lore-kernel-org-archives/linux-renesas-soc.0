Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f171.google.com ([209.85.223.171]:39314 "EHLO
        mail-io0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1032725AbeCAQCZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 1 Mar 2018 11:02:25 -0500
Received: by mail-io0-f171.google.com with SMTP id b34so7613089ioj.6
        for <linux-renesas-soc@vger.kernel.org>; Thu, 01 Mar 2018 08:02:25 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAMuHMdUys2DQ9vOGdmXEuyueS40Fn2yHnmwasO0=v8xAdRAnKQ@mail.gmail.com>
References: <20180221233250.14529-1-niklas.soderlund+renesas@ragnatech.se> <CAMuHMdUys2DQ9vOGdmXEuyueS40Fn2yHnmwasO0=v8xAdRAnKQ@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 1 Mar 2018 17:02:23 +0100
Message-ID: <CACRpkdY1yHzdrrNTzBwzmEwTkDYMy696xq=r5F6_4DK61n8=wQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: sh-pfc: r8a7795: remove duplicate of CLKOUT pin
 in pinmux_pins[]
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: =?UTF-8?Q?Niklas_S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Feb 22, 2018 at 10:10 AM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:

>> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech=
.se>
>
> Reviewed-and-tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> Linus: As the offending patch is only in v4.16-rc1 and later, can you ple=
ase
> take it directly as a fix for v4.16?
>
> https://patchwork.kernel.org/patch/10234351/

OK I pulled this out of patchwork and applied for fixes.

Yours,
Linus Walleij
