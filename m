Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <1457968904-22899-1-git-send-email-geert+renesas@glider.be>
References: <1457968904-22899-1-git-send-email-geert+renesas@glider.be>
Date: Tue, 22 Mar 2016 11:52:36 +0100
Message-ID: <CACRpkdZBmYgRewS=JCiDRQznRa6dT+Kjssogkeck7VwFK9Hk3A@mail.gmail.com>
Subject: Re: [PATCH] gpio: rcar: Implement gpiochip.set_multiple()
From: Linus Walleij <linus.walleij@linaro.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Alexandre Courbot <gnurou@gmail.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	linux-renesas-soc@vger.kernel.org,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Mar 14, 2016 at 4:21 PM, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> This allows to set multiple outputs using a single register write.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Patch applied for v4.7.

Yours,
Linus Walleij
