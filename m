Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ob0-f176.google.com ([209.85.214.176]:35880 "EHLO
	mail-ob0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751636AbcF2IrV (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Wed, 29 Jun 2016 04:47:21 -0400
Received: by mail-ob0-f176.google.com with SMTP id mu6so16225568obc.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Jun 2016 01:47:20 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <5771D5DA.1020702@jinso.co.jp>
References: <56FE29DC.4060605@jinso.co.jp> <571DE43D.3020308@jinso.co.jp>
 <CACRpkdYMD-XZ3w9n=EaSK12xXhiTvStS61a86RYezew_-HYUvA@mail.gmail.com>
 <57204CDA.6030403@jinso.co.jp> <5771D5DA.1020702@jinso.co.jp>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 29 Jun 2016 10:47:19 +0200
Message-ID: <CACRpkda4YZyYvFJZtYndgGjrOve1D7e1=Xay78m9is987VjRcg@mail.gmail.com>
Subject: Re: [Bug]:LAGER: GPIO-KEYS: Warning occurs after unbinding the e6051000.gpio
To: Hiep Cao Minh <cm-hiep@jinso.co.jp>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
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

On Tue, Jun 28, 2016 at 3:41 AM, Hiep Cao Minh <cm-hiep@jinso.co.jp> wrote:

> As I have reported you the issue that related to your released patch.
> Could you please consider this issue and tell me how to resolve this
> problem?
>
> This issue still happens on Rcar-H2 and Rcar-M2 (Renesas's SOC) at the Linux
> upstream version v4.7-rc2.

I think the patches that Torvalds merged for v4.7-rc3
http://lwn.net/Articles/690987/ especially these two:

Ricardo Ribalda Delgado (2):
      gpiolib: Fix NULL pointer deference
      gpiolib: Fix unaligned used of reference counters

Solves the issue.

Can you verify?

Yours,
Linus Walleij
