Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qt0-f196.google.com ([209.85.216.196]:34023 "EHLO
        mail-qt0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752771AbeBZNwh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 26 Feb 2018 08:52:37 -0500
Received: by mail-qt0-f196.google.com with SMTP id l25so8928184qtj.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Feb 2018 05:52:37 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <151904098248.30541.17415579752890048779.sendpatchset@little-apple>
References: <151904097369.30541.12132732484797103163.sendpatchset@little-apple>
 <151904098248.30541.17415579752890048779.sendpatchset@little-apple>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 26 Feb 2018 14:52:36 +0100
Message-ID: <CAMuHMdXw8akNYJTt1ZmUnHhwR7Q-M-GTizqUbU2z9q=hTrbo-Q@mail.gmail.com>
Subject: Re: [PATCH 01/02] ARM: dts: silk: Add r1ex24002 EEPROM to DT
To: Magnus Damm <magnus.damm@gmail.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Feb 19, 2018 at 12:49 PM, Magnus Damm <magnus.damm@gmail.com> wrote:
> From: Magnus Damm <damm+renesas@opensource.se>
>
> Extend the Silk board support to include U14 which is an I2C based EEPROM
> hooked up to the I2C1 bus.
>
> Signed-off-by: Magnus Damm <damm+renesas@opensource.se>

late
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
