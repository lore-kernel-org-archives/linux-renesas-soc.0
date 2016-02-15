Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <5596419.W3vqRvx1Kq@avalon>
References: <20160215120438.24670.15402.sendpatchset@little-apple>
	<5596419.W3vqRvx1Kq@avalon>
Date: Mon, 15 Feb 2016 16:37:23 +0100
Message-ID: <CAMuHMdW7SW2x6WYCjezFZ9M_7sDHTOrSL0XbH6GkrLbatO_Xew@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: sh-pfc: Rework PFC GPIO support
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	Simon Horman <horms@verge.net.au>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Feb 15, 2016 at 1:55 PM, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>> --- 0001/drivers/pinctrl/sh-pfc/Makefile
>> +++ work/drivers/pinctrl/sh-pfc/Makefile      2016-02-15 19:56:50.720513000
> +0900
>> @@ -1,11 +1,8 @@
>>  sh-pfc-objs                  = core.o pinctrl.o
>> -ifeq ($(CONFIG_GPIO_SH_PFC),y)
>> -sh-pfc-objs                  += gpio.o
>> -endif
>>  obj-$(CONFIG_PINCTRL_SH_PFC) += sh-pfc.o
>>  obj-$(CONFIG_PINCTRL_PFC_EMEV2)      += pfc-emev2.o
>> -obj-$(CONFIG_PINCTRL_PFC_R8A73A4)    += pfc-r8a73a4.o
>> -obj-$(CONFIG_PINCTRL_PFC_R8A7740)    += pfc-r8a7740.o
>> +obj-$(CONFIG_PINCTRL_PFC_R8A73A4)    += pfc-r8a73a4.o gpio.o
>> +obj-$(CONFIG_PINCTRL_PFC_R8A7740)    += pfc-r8a7740.o gpio.o
>
> Instead of duplicating gpio.o for every PFC entry that uses it, how about
> keeping it above and just using CONFIG_PINCTRL_SH_PFC_GPIO in the ifeq ?

Or not using the ifeq, but using

     obj-$(CONFIG_PINCTRL_SH_PFC_GPIO) += gpio.o

instead?

Is there any specific reason for the existence of the sh-pfc-objs intermediate?
It's not like we can/want to have a modular pinctrl driver...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
