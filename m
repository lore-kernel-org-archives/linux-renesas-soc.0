Return-Path: <SRS0=IwST=O2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB6D3C43387
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 14:37:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8596F206A2
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 14:37:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726574AbeLQOhi (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 17 Dec 2018 09:37:38 -0500
Received: from mail-vs1-f68.google.com ([209.85.217.68]:32922 "EHLO
        mail-vs1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726573AbeLQOhh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Dec 2018 09:37:37 -0500
Received: by mail-vs1-f68.google.com with SMTP id p74so7833759vsc.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Dec 2018 06:37:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dc7j+H3dXQvWJVEO8qa6AU2PYM9o134G+rMUSo/Wz5I=;
        b=YbeHUb+YNCSHrbdYgsoaGTNp0iQ6bgHzrtl11TTtwA5pQSaqZLTbkRECGh/2DSYcup
         zny4xC1puPZB/ybdjUfKpwiiWFJYxQa+wCSHGgDxy+96HrAlD0HvlhS32Nbr9521Lzgf
         49gVBHqCYefW9gA2exHsSS0Vzt4yxrQ59sVBIuvhE5HpI6ijiVMXG6Kphq+eqeeSFP2F
         l7jES7omUZhAiKf6PoduGl4//NFZL65FmACieVe5NotEmhcHVw1+e+YfozGGnwWofNqg
         sUvCggQHb5wKvjT5lce+Mwr1+HM0JHOl4rUioD5SpVn8a5DRSJ2H4NDusPsqOntoH6bS
         yMEw==
X-Gm-Message-State: AA+aEWaDmpLhwxazD6xfhg+QlsVCJZ/JWORuMQlqPw1Y9h4Cseb5WmJo
        OYG46iJeYjQXYxcHCbeVfFNj7sJ2rYsHdB8Nd2AmSJJWAQ0=
X-Google-Smtp-Source: AFSGD/Xa5R3P7XyF76I4xLpnEIOM4KIyTnT58iKty/mmF8XiFE4HukNISROWUduCwlKVk/11VErC6QEqWjv8W1TD2Qw=
X-Received: by 2002:a67:b60d:: with SMTP id d13mr6567116vsm.152.1545057456642;
 Mon, 17 Dec 2018 06:37:36 -0800 (PST)
MIME-Version: 1.0
References: <20181217124053.10918-1-horms+renesas@verge.net.au>
In-Reply-To: <20181217124053.10918-1-horms+renesas@verge.net.au>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 17 Dec 2018 15:37:24 +0100
Message-ID: <CAMuHMdWc=0iafOE4FLVA58zcG3GjZ+e11vX7xwYjNAL45wx65w@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a77990: sort pciec0 node within
 soc node
To:     Simon Horman <horms+renesas@verge.net.au>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Dec 17, 2018 at 1:41 PM Simon Horman <horms+renesas@verge.net.au> wrote:
> Move the pciec0 node so that sub-nodes of the soc node are
> sorted by bus address.
>
> This change has no run-time affect.
>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
