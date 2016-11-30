Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pf0-f180.google.com ([209.85.192.180]:35822 "EHLO
        mail-pf0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751606AbcK3Qli (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 30 Nov 2016 11:41:38 -0500
Received: by mail-pf0-f180.google.com with SMTP id i88so39853244pfk.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 30 Nov 2016 08:41:38 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] PM / Domains: Do not print PM domain add error message if EPROBE_DEFER
References: <1480508696-19294-1-git-send-email-geert+renesas@glider.be>
Date: Wed, 30 Nov 2016 08:41:36 -0800
In-Reply-To: <1480508696-19294-1-git-send-email-geert+renesas@glider.be>
        (Geert Uytterhoeven's message of "Wed, 30 Nov 2016 13:24:56 +0100")
Message-ID: <m2k2bkkji7.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Geert Uytterhoeven <geert+renesas@glider.be> writes:

> EPROBE_DEFER is not an error, hence printing an error message like
>
>     renesas_irqc e61c0000.interrupt-controller: failed to add to PM domain always-on: -517
>
> may confuse the user.
>
> Suppress the error message in case of EPROBE_DEFER to fix this.
>
> Reported-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Yes, I had noticed this too but not got around to fixing it.

Acked-by: Kevin Hilman <khilman@baylibre.com>

Kevin
