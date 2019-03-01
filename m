Return-Path: <SRS0=w5fC=RE=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5180CC43381
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  1 Mar 2019 13:10:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2776D20851
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  1 Mar 2019 13:10:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727697AbfCANKQ (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 1 Mar 2019 08:10:16 -0500
Received: from mail-vk1-f194.google.com ([209.85.221.194]:44499 "EHLO
        mail-vk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725978AbfCANKQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 1 Mar 2019 08:10:16 -0500
Received: by mail-vk1-f194.google.com with SMTP id w85so3714980vkw.11;
        Fri, 01 Mar 2019 05:10:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AthhFp0Vl1pf5f5O9kQE8SwVXmS59GIWzABALFfk/c4=;
        b=fqthHrHZISKfAKMNAwsKY5y8tZXrVwGE52eSH49kBS89c1//UG0WP6etpfY8sYK474
         iZ4FRtmkCMWqsjm351YENKfdD2kJV9kN+FduoKEXw7V3VqBaK25ZX8DRd2eMGJZgecw6
         XuEFmD60TmEPgMjGx3YHryR1X1sywh9k3UloKaSCmVm3WafebKvoRvDhxAcu/ecCk3uy
         kseSjWNecIvQlZ153JRukbaRqkL02h9WtQowbmBo4/Xl5AyFV5woEPT9eFmTatLOrjBr
         1tozEz6NCnz14g+DcFmTKCA8BiZw2clE/dHs9qL9BdFr0+qcxPvvrhGQVLX3zngFT4Xb
         ljBg==
X-Gm-Message-State: APjAAAVeFC6JoSYD175dEXo7u1CEanzkQX6FiMQNfu1JOseaR7fpR721
        aYTtYef8QwWYwei1OIsEvQZIgZ+QlnIltqASXW0EesH+
X-Google-Smtp-Source: APXvYqyo06Q1YHuEAwTXT3LAaKzlqD93Ov6IezVR3tcBrrWqOLPLRhRot+gaYKjanuWh+yKCVn8XXj41hQo+iTnd+QE=
X-Received: by 2002:a1f:5e96:: with SMTP id s144mr2705224vkb.74.1551445815442;
 Fri, 01 Mar 2019 05:10:15 -0800 (PST)
MIME-Version: 1.0
References: <1551438157-21916-1-git-send-email-fabrizio.castro@bp.renesas.com>
In-Reply-To: <1551438157-21916-1-git-send-email-fabrizio.castro@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 1 Mar 2019 14:10:03 +0100
Message-ID: <CAMuHMdUxQKhXuQqfqbkQ+uZtH3nV5kU9jba+TC16YQAYZH9STA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: cat875: Add CAN support
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc:     Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>, ebiharaml@si-linux.co.jp
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Mar 1, 2019 at 12:03 PM Fabrizio Castro
<fabrizio.castro@bp.renesas.com> wrote:
> Add CAN support to the CAT875 sub board.
>
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
