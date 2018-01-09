Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f42.google.com ([209.85.214.42]:36647 "EHLO
        mail-it0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753057AbeAIO3H (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 9 Jan 2018 09:29:07 -0500
Received: by mail-it0-f42.google.com with SMTP id p124so4805727ite.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 09 Jan 2018 06:29:07 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <7e3a88a6-2ea8-1704-b7a0-67f1f4b4f3f6@users.sourceforge.net>
References: <7e3a88a6-2ea8-1704-b7a0-67f1f4b4f3f6@users.sourceforge.net>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 9 Jan 2018 15:29:06 +0100
Message-ID: <CACRpkdb-eGrqequRO_B1__rnT07=FO6yecsxEPEw6YLAU6nyrw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: sh-pfc: Use seq_puts() in sh_pfc_pin_dbg_show()
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-gpio@vger.kernel.org,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        LKML <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Sat, Jan 6, 2018 at 9:56 PM, SF Markus Elfring
<elfring@users.sourceforge.net> wrote:

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sat, 6 Jan 2018 21:50:20 +0100
>
> A string which did not contain a data format specification should be put
> into a sequence. Thus use the corresponding function "seq_puts".
>
> This issue was detected by using the Coccinelle software.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Leaving to Geert to pick this up. (Looks good.)

Yours,
Linus Walleij
