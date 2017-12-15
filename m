Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qk0-f196.google.com ([209.85.220.196]:35826 "EHLO
        mail-qk0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752985AbdLOIFv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 15 Dec 2017 03:05:51 -0500
Received: by mail-qk0-f196.google.com with SMTP id c13so9389935qke.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 15 Dec 2017 00:05:51 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20171214194004.GA74176@lkp-sb05>
References: <201712150350.kjmEdqgF%fengguang.wu@intel.com> <20171214194004.GA74176@lkp-sb05>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 15 Dec 2017 09:05:49 +0100
Message-ID: <CAMuHMdXL1oo8QMo4c0GHsJcbX976dCBKYrq2yn5Lr3CfLG3RLw@mail.gmail.com>
Subject: Re: [RFC PATCH renesas-drivers] of: overlay: overlay_changeset_release()
 can be static
To: kbuild test robot <fengguang.wu@intel.com>
Cc: Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        kbuild-all@01.org,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Dec 14, 2017 at 8:40 PM, kbuild test robot
<fengguang.wu@intel.com> wrote:
> Fixes: 11de0d24be47 ("of: overlay: kobjectify overlay objects")
> Signed-off-by: Fengguang Wu <fengguang.wu@intel.com>

Thank you, will fold in the offending prototype commit.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
