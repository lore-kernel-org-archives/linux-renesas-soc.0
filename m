Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from Galois.linutronix.de ([146.0.238.70]:36166 "EHLO
        Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727069AbeIGRZY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 7 Sep 2018 13:25:24 -0400
Date: Fri, 7 Sep 2018 14:44:30 +0200 (CEST)
From: Thomas Gleixner <tglx@linutronix.de>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
cc: Marc Zyngier <marc.zyngier@arm.com>,
        Jason Cooper <jason@lakedaemon.net>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux-Kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH resend 0/2] irqchip: convert to SPDX for Renesas
 drivers
In-Reply-To: <87ftymqdzh.wl-kuninori.morimoto.gx@renesas.com>
Message-ID: <alpine.DEB.2.21.1809071442340.1402@nanos.tec.linutronix.de>
References: <87ftymqdzh.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, 7 Sep 2018, Kuninori Morimoto wrote:

> 
> Hi Thomas, Marc, Jason
> 
> 2weeks passed. I resend this patch again

Unfortunately to the wrong people. pinctrl != irqchip

> Kuninori Morimoto (2):
>   pinctrl: sh-pfc: convert to SPDX identifiers
>   pinctrl: rza1: convert to SPDX identifiers

PIN CONTROL SUBSYSTEM
M:      Linus Walleij <linus.walleij@linaro.org>
L:      linux-gpio@vger.kernel.org

Hope that helps.

Thanks,

	tglx
