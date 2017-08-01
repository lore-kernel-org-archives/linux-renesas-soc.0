Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f175.google.com ([209.85.223.175]:38073 "EHLO
        mail-io0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751595AbdHAIkI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 1 Aug 2017 04:40:08 -0400
Received: by mail-io0-f175.google.com with SMTP id g13so5501187ioj.5
        for <linux-renesas-soc@vger.kernel.org>; Tue, 01 Aug 2017 01:40:08 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1499855477-20818-1-git-send-email-geert+renesas@glider.be>
References: <1499855477-20818-1-git-send-email-geert+renesas@glider.be>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 1 Aug 2017 10:40:07 +0200
Message-ID: <CACRpkdaXRf_skSYr=pqEFDOv7f2oaGeHqqXo+SeRpZ5dj_jv6w@mail.gmail.com>
Subject: Re: [PATCH 0/5] pinctrl: sh-pfc: r8a7795/r8a7796: MSIOF updates
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Jul 12, 2017 at 12:31 PM, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

>         Hi Linus, Laurent,
>
> This patch series fixes MSIOF-related bugs in the R-Car H3 ES2.0 and M3-W
> pin control drivers, and enables support for MSIOF on R-Car H3 ES2.0.
>
> I plan to queue these up in sh-pfc-for-v4.14.

All look good to me.

Yours,
Linus Walleij
