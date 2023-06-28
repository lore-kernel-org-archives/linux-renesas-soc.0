Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C0E3EB64DA
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 28 Jun 2023 20:30:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231208AbjF1UaN convert rfc822-to-8bit (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 28 Jun 2023 16:30:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229626AbjF1UaM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 28 Jun 2023 16:30:12 -0400
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF97B1A2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 28 Jun 2023 13:30:11 -0700 (PDT)
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-bff27026cb0so149329276.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 28 Jun 2023 13:30:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687984211; x=1690576211;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JhzJBFDvmWmJROARP95jt+xZCGfCQ3YaHHR+3I/9wTM=;
        b=GIG3baQ7TI3OKPNGCrvVlW2FsjPTnNx13QQuACWQtvyRPNrpTBYZa09JHLTs+fs4lA
         uYEqlp/FgX1HEEz4bLTHM8dcAhZoJ7BvNcdVhjqzaQ3dlOQyJxooQYGrx8Tfg8YHTDJs
         lIA+SxpB2POa/0jMozUg8YpwwmyVEXP6ew1FV3t4hEZVUtVlyAjVNQC7WJ4IEV7wPMT3
         FYfAUGlLf3SBw2T14TOokOq4lfM5uI+1fJAdSKhArrghMfVnrWyOwG+17i8JKCRLjlCS
         xeEDKZXJblbpJ79pyWwdsb+jOhY+q0kVHSmBjNN90jQO0td6YqqW96G66+V2/1NJVGsG
         bKAQ==
X-Gm-Message-State: ABy/qLbRPf7F3j3Ogn34WcOJhAgGD8XyuM45Ds21TDsRqLrw8YsoqNws
        fDTXx+kAChZOB2JYdU6ZMvHnbmfGXItFRCdA
X-Google-Smtp-Source: APBJJlHUJKZ5a+FZGAcahPu9CR9FNxf7BVbqCexk6tIJr8vmBhJ6qJ3X487cYXJN+ptwsENtQXuVPQ==
X-Received: by 2002:a25:5053:0:b0:c38:f12e:f12a with SMTP id e80-20020a255053000000b00c38f12ef12amr1660267ybb.49.1687984210787;
        Wed, 28 Jun 2023 13:30:10 -0700 (PDT)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com. [209.85.219.172])
        by smtp.gmail.com with ESMTPSA id e190-20020a2537c7000000b00be674b1b740sm2242538yba.5.2023.06.28.13.30.09
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jun 2023 13:30:09 -0700 (PDT)
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-bfe6ea01ff5so137393276.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 28 Jun 2023 13:30:09 -0700 (PDT)
X-Received: by 2002:a25:60d5:0:b0:c1b:c138:46f4 with SMTP id
 u204-20020a2560d5000000b00c1bc13846f4mr8732087ybb.27.1687984209602; Wed, 28
 Jun 2023 13:30:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230628174004.63984-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230628174004.63984-1-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 28 Jun 2023 22:29:58 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU39fB0UDtpwT7u_9OpPP_UMT-EB3kjgOdKPeuH7ZH6Vw@mail.gmail.com>
Message-ID: <CAMuHMdU39fB0UDtpwT7u_9OpPP_UMT-EB3kjgOdKPeuH7ZH6Vw@mail.gmail.com>
Subject: Re: [PATCH] regulator: raa215300: Add build dependency with COMMON_CLK
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Jun 28, 2023 at 7:40 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> The COMMON_CLK config is not enabled in some of the architectures.
> This causes build issues. Fix these issues by adding build dependency.
>
> ERROR: modpost: "clk_unregister_fixed_rate" [drivers/regulator/raa215300.ko] undefined!
> ERROR: modpost: "clk_register_fixed_rate" [drivers/regulator/raa215300.ko] undefined!
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202306282012.sPQAuAN7-lkp@intel.com/
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
