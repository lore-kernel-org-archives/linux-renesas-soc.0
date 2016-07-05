Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f54.google.com ([209.85.215.54]:36642 "EHLO
	mail-lf0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752862AbcGERhC (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Tue, 5 Jul 2016 13:37:02 -0400
Received: by mail-lf0-f54.google.com with SMTP id q132so139444707lfe.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 05 Jul 2016 10:36:05 -0700 (PDT)
Subject: Re: [PATCH] gpio: be more careful when forcing IRQ line to input
To: Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
References: <1467728126-26131-1-git-send-email-linus.walleij@linaro.org>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <d16661e9-3a6f-7118-c7d7-d6b501ce4120@cogentembedded.com>
Date: Tue, 5 Jul 2016 20:36:01 +0300
MIME-Version: 1.0
In-Reply-To: <1467728126-26131-1-git-send-email-linus.walleij@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello.

On 07/05/2016 05:15 PM, Linus Walleij wrote:

> We need to convince the IRQ line to become input unless there
> is a reason for. Also fixes up reference counting on the

    For what?

> errorpath.
>
> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> Geert: does this solve the problem you saw in the RCAR
> in "gpio: convince line to become input in irq helper"?
[...]

MBR, Sergei
