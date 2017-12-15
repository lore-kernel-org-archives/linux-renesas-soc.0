Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qk0-f196.google.com ([209.85.220.196]:33945 "EHLO
        mail-qk0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754363AbdLOIEO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 15 Dec 2017 03:04:14 -0500
Received: by mail-qk0-f196.google.com with SMTP id d66so9394446qkg.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 15 Dec 2017 00:04:14 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20171214234421.GA44958@lkp-sb05>
References: <201712150710.pTXUwb8r%fengguang.wu@intel.com> <20171214234421.GA44958@lkp-sb05>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 15 Dec 2017 09:04:12 +0100
Message-ID: <CAMuHMdVJ7=g4wff8POWoTqrGYeby3fS0OLh9p3kLU79P1xSEBw@mail.gmail.com>
Subject: Re: [RFC PATCH renesas-drivers] [RFC] of: dead_aliases_lookup can be static
To: kbuild test robot <fengguang.wu@intel.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, kbuild-all@01.org,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Fengguang,

On Fri, Dec 15, 2017 at 12:44 AM, kbuild test robot
<fengguang.wu@intel.com> wrote:
> Fixes: 19e0da502da1 ("[RFC] of: Add of_alias_destroy()")
> Signed-off-by: Fengguang Wu <fengguang.wu@intel.com>

Thank you, will fold in the offending prototype commit.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
