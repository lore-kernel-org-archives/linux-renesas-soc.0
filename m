Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <1505205657-18012-1-git-send-email-geert+renesas@glider.be>
References: <1505205657-18012-1-git-send-email-geert+renesas@glider.be>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 19 Sep 2017 10:19:18 +0200
Message-ID: <CACRpkdYfbUvpLSZnTan+P5pBYKomEK0gEaQor8YjtxE9Y2riSg@mail.gmail.com>
Subject: Re: [PATCH v2 resend 0/4] sh: sh7722/sh7757i/sh7264/sh7269: Fix
 pinctrl registration
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Andrew Morton <akpm@linux-foundation.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Sep 12, 2017 at 10:40 AM, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

>         Hi Andrew,
>
> I'm resending this to you due to unresponsiveness from the SuperH
> maintainers (v2 sent before on May 11, pinged on June 30 and August 14).

I'm happy to take this into the pinctrl tree if need be.

It is pinctrl related so it makes sense to carry it there if SH
maintainers are not responding.

Just send a separate pull request and indicate if it needs to
go in for fixes or devel.

Yours,
Linus Walleij
