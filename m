Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f68.google.com ([209.85.214.68]:36010 "EHLO
        mail-it0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751718AbeABNCN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 2 Jan 2018 08:02:13 -0500
Received: by mail-it0-f68.google.com with SMTP id d16so39315876itj.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 02 Jan 2018 05:02:13 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAMuHMdVmqM+WA_EaCRHNojpV6NYmS0-V18MoixyV5UdC3cq+2g@mail.gmail.com>
References: <1514554304-18989-1-git-send-email-ulf.hansson@linaro.org>
 <1514554304-18989-4-git-send-email-ulf.hansson@linaro.org>
 <CAJZ5v0gWtr1bwi7WVeEbTJPu3KC8YfPvfUh5XDmomiK8TFmfyg@mail.gmail.com> <CAMuHMdVmqM+WA_EaCRHNojpV6NYmS0-V18MoixyV5UdC3cq+2g@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 2 Jan 2018 14:02:12 +0100
Message-ID: <CAPDyKFrPTJ84-rBcdPH+Vs_L7Hbmh8G-C8fC1zYqP3H3dxn7vw@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] gpio: rcar: Use WAKEUP_PATH driver PM flag
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux PM <linux-pm@vger.kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Simon Horman <horms@verge.net.au>,
        Niklas Soderlund <niklas.soderlund+renesas@ragnatech.se>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-gpio@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

>>> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>>> [Ulf: Converted to use the WAKEUP_PATH driver PM flag]
>
> Ulf: + killing the DEV_PM_OPS define, increasing kernel size if PM_SUSPEND=n?

Oh, yes - correct!

The code looks nicer, with the penalty of one static struct declared
and not used, in case CONFIG_PM_SLEEP is unset.

Should I revert back to your proposal, I am fine with whatever?

[...]

Kind regards
Uffe
