Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f66.google.com ([209.85.214.66]:52166 "EHLO
        mail-it0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727311AbeIJMM0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Sep 2018 08:12:26 -0400
Received: by mail-it0-f66.google.com with SMTP id e14-v6so28241294itf.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Sep 2018 00:19:49 -0700 (PDT)
MIME-Version: 1.0
References: <87ftymqdzh.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87ftymqdzh.wl-kuninori.morimoto.gx@renesas.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 10 Sep 2018 09:19:35 +0200
Message-ID: <CACRpkdbGYt3UaWBgq2R3Ndhu2TchYBr_=LdixJHYCOhvBP1aqw@mail.gmail.com>
Subject: Re: [PATCH resend 0/2] irqchip: convert to SPDX for Renesas drivers
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Jason Cooper <jason@lakedaemon.net>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Sep 7, 2018 at 3:50 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:

> Hi Thomas, Marc, Jason
>
> 2weeks passed. I resend this patch again
>
> Kuninori Morimoto (2):
>   pinctrl: sh-pfc: convert to SPDX identifiers
>   pinctrl: rza1: convert to SPDX identifiers

Send these patches to Geert Uytterhoeven. He picks up pinctrl patches
for Renesas PFC.

Yours,
Linus Walleij
