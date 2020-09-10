Return-Path: <SRS0=jird=CT=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DE5CC43461
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 10 Sep 2020 09:53:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5737820829
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 10 Sep 2020 09:53:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730463AbgIJJxo (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 10 Sep 2020 05:53:44 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:33374 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730585AbgIJJwT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Sep 2020 05:52:19 -0400
Received: by mail-ot1-f67.google.com with SMTP id m12so4872981otr.0;
        Thu, 10 Sep 2020 02:52:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7+9oH0sYC9uFa4rtOU4xv5EuedXzTFlA2T6c2Xjms4c=;
        b=VNkR5LivdIGoWHbOcMtUvo5s06GIyO8vn/4c9qNBGafa/KxhT3XZ1ya4ZfkThn0fSf
         zKPPaX/lCNXzsugm//P7W+WAw/KQcM1A3Ar7kOJMi9zDJ+ol+7KTv1NcG7q/j/1WpOHp
         a0jtzZ0SjjTfiauSoCv2+JZkmn+KiKNKZ5/x4oldgv19Al0pmo9PDl6zcGKKR7dTuOvK
         R16DuODkluMr0J21vggZ63xGHXa/vrQRptXx7MJ++djh1i69MdepkydM4XpINjDJkQom
         VR9xZ2Rpr+7MB95lxJ1R23CxKoOAPQgCsi90wN+NT2OFQ2IHHkDt9a4KdamvLRcXEJbP
         TtXw==
X-Gm-Message-State: AOAM530ANHIX0f5o0mnH88BZ4X9QVbbDXf3/PEBTYNLtmIhZIXv3ztRg
        BO9z4k6diFi9vFs1bAOJzfbaEHWf85LgTHFeV4c=
X-Google-Smtp-Source: ABdhPJzm8K9YBV4cCFZpYIMaQ6gkxYlG7O3M9AkmIx5/FbwBxVxPhAujFiCDvP12dzPOH5rDjKJZBJ9/24ioqZzdfC4=
X-Received: by 2002:a05:6830:1008:: with SMTP id a8mr3144760otp.107.1599731531860;
 Thu, 10 Sep 2020 02:52:11 -0700 (PDT)
MIME-Version: 1.0
References: <87o8mhrtxo.wl-kuninori.morimoto.gx@renesas.com> <87d02xrtux.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87d02xrtux.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 10 Sep 2020 11:52:00 +0200
Message-ID: <CAMuHMdV=S9jRbGCYRw=p-AcBc7WrYmBCDVFEvrrBeuCCMLbm4Q@mail.gmail.com>
Subject: Re: [PATCH v2 08/10] arm64: dts: renesas: r8a77961: Add HDMI device nodes
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Laurent <laurent.pinchart@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Magnus <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux-DT <devicetree@vger.kernel.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        shimoda <yoshihiro.shimoda.uh@renesas.com>,
        DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Sep 8, 2020 at 2:35 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> This patch adds HDMI device nodes for R-Car M3-W+ (r8a77961) SoC.
> This patch was tested on R-Car M3-W+ Salvator-XS board.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
