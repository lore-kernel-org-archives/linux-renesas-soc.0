Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-oi0-f52.google.com ([209.85.218.52]:36794 "EHLO
	mail-oi0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751640AbcGFIez (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Wed, 6 Jul 2016 04:34:55 -0400
Received: by mail-oi0-f52.google.com with SMTP id f189so262278540oig.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 06 Jul 2016 01:34:55 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <d16661e9-3a6f-7118-c7d7-d6b501ce4120@cogentembedded.com>
References: <1467728126-26131-1-git-send-email-linus.walleij@linaro.org> <d16661e9-3a6f-7118-c7d7-d6b501ce4120@cogentembedded.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 6 Jul 2016 10:34:54 +0200
Message-ID: <CACRpkdZpF7fNMULDkMK60xh_=+X8PJ5+fyPoDJtA2vTDwiakhw@mail.gmail.com>
Subject: Re: [PATCH] gpio: be more careful when forcing IRQ line to input
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Jul 5, 2016 at 7:36 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> Hello.
>
> On 07/05/2016 05:15 PM, Linus Walleij wrote:
>
>> We need to convince the IRQ line to become input unless there
>> is a reason for. Also fixes up reference counting on the
>
>
>    For what?

Module refcount in its kobject. I'll update the commitlog.

Yours,
Linus Walleij
