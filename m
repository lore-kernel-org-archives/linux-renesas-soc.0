Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f196.google.com ([209.85.223.196]:36134 "EHLO
	mail-io0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752245AbcGAJRl (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Fri, 1 Jul 2016 05:17:41 -0400
Received: by mail-io0-f196.google.com with SMTP id s63so10886854ioi.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 01 Jul 2016 02:17:41 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <577622AA.4060105@jinso.co.jp>
References: <56FE29DC.4060605@jinso.co.jp> <571DE43D.3020308@jinso.co.jp>
 <CACRpkdYMD-XZ3w9n=EaSK12xXhiTvStS61a86RYezew_-HYUvA@mail.gmail.com>
 <57204CDA.6030403@jinso.co.jp> <5771D5DA.1020702@jinso.co.jp>
 <CACRpkda4YZyYvFJZtYndgGjrOve1D7e1=Xay78m9is987VjRcg@mail.gmail.com> <577622AA.4060105@jinso.co.jp>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 1 Jul 2016 10:13:49 +0200
Message-ID: <CAMuHMdXeB1OxWL03KFJ-B1GeFbK_UxoBqzfHM5h_uw7RYMqGeg@mail.gmail.com>
Subject: Re: [Bug]:LAGER: GPIO-KEYS: Warning occurs after unbinding the e6051000.gpio
To: Hiep Cao Minh <cm-hiep@jinso.co.jp>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Sakato Ryusuke <ryusuke.sakato.bx@renesas.com>,
	kuninori morimoto <kuninori.morimoto.gx@renesas.com>,
	Nguyen Viet Dung <nv-dung@jinso.co.jp>,
	LE MINH DUC <lm-duc@jinso.co.jp>,
	=?UTF-8?B?56iy5ZCJ77ya5Lq644K9?= <h-inayoshi@jinso.co.jp>,
	"M.Miura" <m-miura@jinso.co.jp>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Hiep,

On Fri, Jul 1, 2016 at 9:58 AM, Hiep Cao Minh <cm-hiep@jinso.co.jp> wrote:
>>> As I have reported you the issue that related to your released patch.
>>> Could you please consider this issue and tell me how to resolve this
>>> problem?
>>>
>>> This issue still happens on Rcar-H2 and Rcar-M2 (Renesas's SOC) at the
>>> Linux
>>> upstream version v4.7-rc2.
>>
>> I think the patches that Torvalds merged for v4.7-rc3
>> http://lwn.net/Articles/690987/ especially these two:
>>
>> Ricardo Ribalda Delgado (2):
>>        gpiolib: Fix NULL pointer deference
>>        gpiolib: Fix unaligned used of reference counters
>>
>> Solves the issue.
>>
>> Can you verify?
>
>
> I have just verified this on v4.7-rc5, this issue still happens.
> But we find out that the issue had already happened before your following
> patch was released.
> "ff2b1359 gpio: make the gpiochip a real device" (the patch that you have
> created before)
> I mean, your patch helped us to find out the issue.
>
> To Geert-san.
>
> I'd like to divide Unbind-Rebind test  into two cases of Normal Test and
> Abnormal Test.
>
> First, If we try to unbind/rebind the gpio device(ex: key, hdmi..) then
> unbind/rebind the gpio-rcar,
> It works normally without error message. This test case is normal test.
> Refer to (GPIO_Unbind-Rebind_Abnormal-Test_log.txt)
>
> But on the other hand, If we try to unbind/rebind the gpio-rcar without
> unbinding/rebinding gpio device,
> The warning message looks like from kernel will happens. This test case is
> abnormal test.
> (Refer to GPIO_Unbind-Rebind_Normal-Test_logs.txt)
>
> In abnormal Test case, an error message occurs definitely from the driver or
> the core class of the driver.
> But I think we should consider the error or warning message looks like a
> kernel warning message.

Quoting Linus Walleij:
> It is not OK to unbind a driver providing IRQs.

The irqchip subsystem has no protection against removing devices
providing interrupt controllers. Trying to do so anyway while an interrupt
is in use will go boom.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
