Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <1455618171-11719-1-git-send-email-geert+renesas@glider.be>
References: <1455618171-11719-1-git-send-email-geert+renesas@glider.be>
Date: Thu, 18 Feb 2016 20:47:42 +0100
Message-ID: <CACRpkdYdzM_Anfa4UBafC5ASAiBc4BPr_PYc+QMV7-cM9L5zLA@mail.gmail.com>
Subject: Re: [PATCH -next] gpio: Use kzalloc() to allocate struct gpio_device
 to fix crash
From: Linus Walleij <linus.walleij@linaro.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Alexandre Courbot <gnurou@gmail.com>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	linux-renesas-soc@vger.kernel.org,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Feb 16, 2016 at 11:22 AM, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> gpiochip_add_data() allocates the struct gpio_device using kmalloc(),
> which doesn't zero the returned memory.
>
> Hence when calling dev_set_name(), it may try to free a bogus old name,
> causing a crash:

Ooops got two patches to this independently and applied the other one,
I tagged your name onto the Reported-by now. Thanks!

Yours,
Linus Walleij
