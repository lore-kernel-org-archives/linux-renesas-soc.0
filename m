Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f49.google.com ([209.85.215.49]:36155 "EHLO
        mail-lf0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751437AbcHVMKO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 Aug 2016 08:10:14 -0400
Received: by mail-lf0-f49.google.com with SMTP id g62so75986032lfe.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Aug 2016 05:10:14 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAMuHMdVJ6fN1ak1zMYXKPe6h1aEmhHjWdCQLPw5EsGZq61w99A@mail.gmail.com>
References: <1470993268-11590-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
 <CAMuHMdVJ6fN1ak1zMYXKPe6h1aEmhHjWdCQLPw5EsGZq61w99A@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 22 Aug 2016 14:10:12 +0200
Message-ID: <CACRpkdZjsHCxTQ00Dfe94sHEMeFP3VUUkZfhGFO+oiQVsmkXXA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: sh-pfc: r8a7795: Add DU support
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Aug 16, 2016 at 10:23 AM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> On Fri, Aug 12, 2016 at 11:14 AM, Laurent Pinchart
> <laurent.pinchart+renesas@ideasonboard.com> wrote:
>> Only the DU parallel RGB output signals are included, HDMI and TCON pins
>> will be added in separate groups.
>>
>> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Geert, I assume you will queue this?

Yours,
Linus Walleij
