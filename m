Return-Path: <SRS0=mg4H=QH=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF9C0C169C4
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 31 Jan 2019 07:53:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BC3CA20870
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 31 Jan 2019 07:53:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726488AbfAaHxN (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 31 Jan 2019 02:53:13 -0500
Received: from mail-vs1-f49.google.com ([209.85.217.49]:34226 "EHLO
        mail-vs1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725829AbfAaHxN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 31 Jan 2019 02:53:13 -0500
Received: by mail-vs1-f49.google.com with SMTP id y27so1445001vsi.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 30 Jan 2019 23:53:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JytVaOczfE0vXnBkoJsZzzfT4OM2P4NO7DEhw7NXci8=;
        b=N5xFtJxcXFpRx40F83TB+lgOWzlzbKl7WNy1oBtgmHxSpxjKruR/9Wxy1SHGCVL9Ie
         TTaxylHTg6o1cdR5VnDUFFZOtldeyassAOExab3WAN6Zm6U2WI95br7ToQj54M8DCiPn
         /PIiv4ziLdcvzi++BIf6TkDOfeBVCE9bnRWSmRJXvWzvLfsDjplrw+DO3yxhkmgdAfiK
         DSplYcCjk+id6pbr6aFT6dGXXMW2EpFM/nJEcjWuvkCEVYEUdSO9gf7iGMcxcBlQV3Ls
         z7GjcpnP3Ohab21p0OyLN4FUr70kGsEmLkbrip+xV6Wp8zc7t/SafvutiFSD6JjpNt/f
         UDcA==
X-Gm-Message-State: AJcUukfenRIsCMxRn4y55iHOg5lXpLA90puHk2xf9ycvZHjW3kWXJZzd
        nNcwIKgFEI6FThvmjdBkGoaF6FLYEmhyveDyO8k=
X-Google-Smtp-Source: ALg8bN73dTxJMxmD9oq5FyEiSZUba7tJXOcf0w1zMYByra7AYbK+f2Zrquqz/w5WmwVQeqUMrfOJMFAFwuYIgrLXWO8=
X-Received: by 2002:a67:b60d:: with SMTP id d13mr14508152vsm.152.1548921191530;
 Wed, 30 Jan 2019 23:53:11 -0800 (PST)
MIME-Version: 1.0
References: <alpine.DEB.2.21.1901310710350.2693@hadrien>
In-Reply-To: <alpine.DEB.2.21.1901310710350.2693@hadrien>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 31 Jan 2019 08:52:59 +0100
Message-ID: <CAMuHMdXUVy+WROFLx1y0Sp9iO=Xi-AAzQJRjLzFH9TNqp5Mt3w@mail.gmail.com>
Subject: Re: [renesas-drivers:clk-renesas-for-v5.1 6/7] drivers/clk/renesas/rcar-gen3-cpg.c:472:42-45:
 ERROR: reference preceded by free on line 470 (fwd)
To:     Julia Lawall <julia.lawall@lip6.fr>
Cc:     Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        kbuild-all@01.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Julia,

On Thu, Jan 31, 2019 at 7:11 AM Julia Lawall <julia.lawall@lip6.fr> wrote:
> I guess that a return is missing after line 470.

Thank you, indeed.

I will fix it up in clk-renesas-for-v5.1, as no pull request has been sent
for that branch yet.

> ---------- Forwarded message ----------
> Date: Thu, 31 Jan 2019 10:08:10 +0800
> From: kbuild test robot <lkp@intel.com>
> To: kbuild@01.org
> Cc: Julia Lawall <julia.lawall@lip6.fr>
> Subject: [renesas-drivers:clk-renesas-for-v5.1 6/7]
>     drivers/clk/renesas/rcar-gen3-cpg.c:472:42-45: ERROR: reference preceded by
>     free on line 470
>
> CC: kbuild-all@01.org
> CC: linux-renesas-soc@vger.kernel.org
> TO: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> CC: Geert Uytterhoeven <geert+renesas@glider.be>
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git clk-renesas-for-v5.1
> head:   5f8c668738ae4bcfe0656e74127610aabd5d5141
> commit: ac41e5750e7508c170b6a1d9d623c4caa4c0fbf6 [6/7] clk: renesas: rcar-gen3: Add RPC clocks
> :::::: branch date: 6 days ago
> :::::: commit date: 6 days ago
>
> >> drivers/clk/renesas/rcar-gen3-cpg.c:472:42-45: ERROR: reference preceded by free on line 470
>
> # https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git/commit/?id=ac41e5750e7508c170b6a1d9d623c4caa4c0fbf6
> git remote add renesas-drivers https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git
> git remote update renesas-drivers
> git checkout ac41e5750e7508c170b6a1d9d623c4caa4c0fbf6
> vim +472 drivers/clk/renesas/rcar-gen3-cpg.c
>
> ac41e575 Sergei Shtylyov 2019-01-22  442
> ac41e575 Sergei Shtylyov 2019-01-22  443  static struct clk * __init cpg_rpc_clk_register(const char *name,
> ac41e575 Sergei Shtylyov 2019-01-22  444        void __iomem *base, const char *parent_name,
> ac41e575 Sergei Shtylyov 2019-01-22  445        struct raw_notifier_head *notifiers)
> ac41e575 Sergei Shtylyov 2019-01-22  446  {
> ac41e575 Sergei Shtylyov 2019-01-22  447        struct rpc_clock *rpc;
> ac41e575 Sergei Shtylyov 2019-01-22  448        struct clk *clk;
> ac41e575 Sergei Shtylyov 2019-01-22  449
> ac41e575 Sergei Shtylyov 2019-01-22  450        rpc = kzalloc(sizeof(*rpc), GFP_KERNEL);
> ac41e575 Sergei Shtylyov 2019-01-22  451        if (!rpc)
> ac41e575 Sergei Shtylyov 2019-01-22  452                return ERR_PTR(-ENOMEM);
> ac41e575 Sergei Shtylyov 2019-01-22  453
> ac41e575 Sergei Shtylyov 2019-01-22  454        rpc->div.reg = base + CPG_RPCCKCR;
> ac41e575 Sergei Shtylyov 2019-01-22  455        rpc->div.width = 3;
> ac41e575 Sergei Shtylyov 2019-01-22  456        rpc->div.table = cpg_rpc_div_table;
> ac41e575 Sergei Shtylyov 2019-01-22  457        rpc->div.lock = &cpg_lock;
> ac41e575 Sergei Shtylyov 2019-01-22  458
> ac41e575 Sergei Shtylyov 2019-01-22  459        rpc->gate.reg = base + CPG_RPCCKCR;
> ac41e575 Sergei Shtylyov 2019-01-22  460        rpc->gate.bit_idx = 8;
> ac41e575 Sergei Shtylyov 2019-01-22  461        rpc->gate.flags = CLK_GATE_SET_TO_DISABLE;
> ac41e575 Sergei Shtylyov 2019-01-22  462        rpc->gate.lock = &cpg_lock;
> ac41e575 Sergei Shtylyov 2019-01-22  463
> ac41e575 Sergei Shtylyov 2019-01-22  464        rpc->csn.reg = base + CPG_RPCCKCR;
> ac41e575 Sergei Shtylyov 2019-01-22  465
> ac41e575 Sergei Shtylyov 2019-01-22  466        clk = clk_register_composite(NULL, name, &parent_name, 1, NULL, NULL,
> ac41e575 Sergei Shtylyov 2019-01-22  467                                     &rpc->div.hw,  &clk_divider_ops,
> ac41e575 Sergei Shtylyov 2019-01-22  468                                     &rpc->gate.hw, &clk_gate_ops, 0);
> ac41e575 Sergei Shtylyov 2019-01-22  469        if (IS_ERR(clk))
> ac41e575 Sergei Shtylyov 2019-01-22 @470                kfree(rpc);
> ac41e575 Sergei Shtylyov 2019-01-22  471
> ac41e575 Sergei Shtylyov 2019-01-22 @472        cpg_simple_notifier_register(notifiers, &rpc->csn);
> ac41e575 Sergei Shtylyov 2019-01-22  473        return clk;
> ac41e575 Sergei Shtylyov 2019-01-22  474  }
> ac41e575 Sergei Shtylyov 2019-01-22  475

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
